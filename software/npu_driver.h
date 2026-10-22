// =============================================================================
// npu_driver.h - Driver C cho INT8 GEMM Accelerator v6 (KV260, qua /dev/mem)
//
//   C[M][N] = requant( A[M][K] x B[K][N] )   (A, B: int8, row-major)
//
// Ho tro M, K, N BAT KY (1 .. 1,048,575). Padding stride 16 byte do driver tu lam
// khi copy vao vung DDR reserved; phan cung tu xu ly tile bien.
//
// Requant theo tung kenh (cot cua C), moi kenh 1 muc npu_qparam_t:
//     t = acc + bias ; q = (t*mult + (shift ? 1<<(shift-1) : 0)) >> shift ;
//     out = clamp(q + zp, -128, 127)
// (mult=1, bias=0, shift=SCALE_SHIFT, zp=ZERO_POINT cho ket qua giong thiet ke cu.)
//
// Ket qua INT32 tho (A*B, chua bias/requant) dung de debug sai so: flag NPU_OUT_INT32.
// =============================================================================
#ifndef NPU_DRIVER_H
#define NPU_DRIVER_H

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/time.h>
#include <time.h>

// ---- Dia chi phan cung (sua theo Vivado Address Editor / device-tree cua ban) ----
#ifndef NPU_CTRL_BASE
#define NPU_CTRL_BASE   0xA0000000UL
#endif
#ifndef NPU_DDR_PA
#define NPU_DDR_PA      0x63800000UL    // vung reserved (0x63800000-0x777FFFFF)
#endif
#ifndef NPU_DDR_SIZE
#define NPU_DDR_SIZE    0x14000000UL    // 320 MB
#endif

// ---- Register map (chi so word = offset/4) ----
enum {
    NPU_REG_M = 0x00 / 4, NPU_REG_N = 0x04 / 4, NPU_REG_K = 0x08 / 4, NPU_REG_KDIM = 0x0C / 4,
    NPU_REG_BASE_A = 0x14 / 4, NPU_REG_BASE_B = 0x18 / 4, NPU_REG_BASE_C = 0x1C / 4,
    NPU_REG_LDC = 0x20 / 4, NPU_REG_OUT_MODE = 0x24 / 4, NPU_REG_BASE_P = 0x28 / 4,
    NPU_REG_CTRL = 0x2C / 4,
    NPU_REG_LDA = 0x30 / 4, NPU_REG_LDB = 0x34 / 4, NPU_REG_BASE_C32 = 0x38 / 4,
    NPU_REG_LDC32 = 0x3C / 4, NPU_REG_VERSION = 0x40 / 4
};
#define NPU_CTRL_START  0x1u
#define NPU_ST_BUSY     0x2u
#define NPU_ST_DONE     0x4u    // sticky, doc la xoa
#define NPU_ST_ERR      0x8u

#define NPU_OUT_INT8    1
#define NPU_OUT_INT32   2
#define NPU_KDIM_DEFAULT 32

// Tham so requant 1 kenh (16 byte, little-endian, dung layout phan cung)
typedef struct { int32_t bias; int32_t mult; int32_t shift; int32_t zp; } npu_qparam_t;

typedef struct {
    int fd;
    volatile uint32_t *regs;
    uint8_t *ddr;             // anh xa vung DDR reserved
    uint64_t ddr_pa;
    size_t   ddr_size;
    double   last_hw_ms;      // thoi gian phan cung (start -> done) cua lan chay gan nhat
} npu_t;

// Monotonic wall-clock seconds for stable benchmark timings.
static inline double npu_now(void) {
    struct timespec ts;
    if (clock_gettime(CLOCK_MONOTONIC, &ts) == 0)
        return (double)ts.tv_sec + (double)ts.tv_nsec / 1e9;

    // Fallback for systems without a working monotonic clock.
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return (double)tv.tv_sec + (double)tv.tv_usec / 1e6;
}
static inline uint64_t npu_ceil16(uint64_t x) { return (x + 15) & ~15ULL; }
static inline uint64_t npu_align4k(uint64_t x) { return (x + 4095) & ~4095ULL; }

static inline int npu_open(npu_t *d) {
    memset(d, 0, sizeof(*d));
    d->fd = open("/dev/mem", O_RDWR | O_SYNC);
    if (d->fd < 0) { perror("[npu] open /dev/mem (can sudo)"); return -1; }
    d->regs = (volatile uint32_t *)mmap(NULL, 0x1000, PROT_READ | PROT_WRITE, MAP_SHARED, d->fd, NPU_CTRL_BASE);
    d->ddr  = (uint8_t *)mmap(NULL, NPU_DDR_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, d->fd, NPU_DDR_PA);
    if (d->regs == MAP_FAILED || d->ddr == MAP_FAILED) { perror("[npu] mmap"); return -1; }
    d->ddr_pa = NPU_DDR_PA; d->ddr_size = NPU_DDR_SIZE;
    return 0;
}
static inline void npu_close(npu_t *d) {
    munmap((void *)d->regs, 0x1000); munmap(d->ddr, d->ddr_size); close(d->fd);
}

// Bo cuc DDR cho 1 phep GEMM: tat ca bat dau o bien 4 KB, stride bat boi 16 byte.
typedef struct {
    uint64_t lda, ldb, ldc, ldc32;
    uint64_t off_a, off_b, off_c, off_c32, off_p, total;
} npu_layout_t;

static inline npu_layout_t npu_layout(uint32_t M, uint32_t K, uint32_t N) {
    npu_layout_t l;
    l.lda = npu_ceil16(K); l.ldb = npu_ceil16(N); l.ldc = npu_ceil16(N); l.ldc32 = 4 * npu_ceil16(N);
    l.off_a   = 0;
    l.off_b   = npu_align4k(l.off_a   + (uint64_t)M * l.lda);
    l.off_c   = npu_align4k(l.off_b   + (uint64_t)K * l.ldb);
    l.off_c32 = npu_align4k(l.off_c   + (uint64_t)M * l.ldc);
    l.off_p   = npu_align4k(l.off_c32 + (uint64_t)M * l.ldc32);
    l.total   = npu_align4k(l.off_p   + (uint64_t)N * sizeof(npu_qparam_t));
    return l;
}

// Copy ma tran vao DDR (them padding 0). Co the goi RIENG cho B (trong so) 1 lan roi dung lai.
static inline void npu_load_A(npu_t *d, const npu_layout_t *l, const int8_t *A, uint32_t M, uint32_t K) {
    for (uint32_t m = 0; m < M; m++) {
        uint8_t *row = d->ddr + l->off_a + (uint64_t)m * l->lda;
        memcpy(row, A + (uint64_t)m * K, K);
        memset(row + K, 0, l->lda - K);
    }
}
static inline void npu_load_B(npu_t *d, const npu_layout_t *l, const int8_t *B, uint32_t K, uint32_t N) {
    for (uint32_t k = 0; k < K; k++) {
        uint8_t *row = d->ddr + l->off_b + (uint64_t)k * l->ldb;
        memcpy(row, B + (uint64_t)k * N, N);
        memset(row + N, 0, l->ldb - N);
    }
}
static inline void npu_load_params(npu_t *d, const npu_layout_t *l, const npu_qparam_t *qp, uint32_t N) {
    memcpy(d->ddr + l->off_p, qp, (size_t)N * sizeof(npu_qparam_t));
}

// Chay 1 phep GEMM da load du lieu. Tra ve 0 neu OK, <0 neu loi.
//   mode: NPU_OUT_INT8 | NPU_OUT_INT32 (hoac ca hai)
static inline int npu_run(npu_t *d, const npu_layout_t *l, uint32_t M, uint32_t K, uint32_t N,
                          uint32_t kdim, uint32_t mode, double timeout_s) {
    uint64_t pa = d->ddr_pa;
    d->regs[NPU_REG_M] = M;   d->regs[NPU_REG_N] = N;   d->regs[NPU_REG_K] = K;
    d->regs[NPU_REG_KDIM] = kdim;
    d->regs[NPU_REG_BASE_A]   = (uint32_t)(pa + l->off_a);
    d->regs[NPU_REG_BASE_B]   = (uint32_t)(pa + l->off_b);
    d->regs[NPU_REG_BASE_C]   = (uint32_t)(pa + l->off_c);
    d->regs[NPU_REG_BASE_C32] = (uint32_t)(pa + l->off_c32);
    d->regs[NPU_REG_BASE_P]   = (uint32_t)(pa + l->off_p);
    d->regs[NPU_REG_LDA] = (uint32_t)l->lda;     d->regs[NPU_REG_LDB] = (uint32_t)l->ldb;
    d->regs[NPU_REG_LDC] = (uint32_t)l->ldc;     d->regs[NPU_REG_LDC32] = (uint32_t)l->ldc32;
    d->regs[NPU_REG_OUT_MODE] = mode;
    __sync_synchronize();

    double t0 = npu_now();
    d->regs[NPU_REG_CTRL] = NPU_CTRL_START;

    // done_sticky la READ-CLEAR: giu lai gia tri doc duoc, khong doc 2 lan.
    uint32_t st;
    do {
        st = d->regs[NPU_REG_CTRL];
        if (npu_now() - t0 > timeout_s) { fprintf(stderr, "[npu] TIMEOUT (status=0x%x)\n", st); return -2; }
    } while (!(st & (NPU_ST_DONE | NPU_ST_ERR)));
    __sync_synchronize();
    d->last_hw_ms = (npu_now() - t0) * 1e3;

    if (st & NPU_ST_ERR) {
        fprintf(stderr, "[npu] ERR: cau hinh khong hop le (stride/base khong boi 16, k_dim khong phai luy thua 2 <= 256, "
                        "out_mode=0, hoac stride nho hon kich thuoc dong)\n");
        return -1;
    }
    return 0;
}

// Doc ket qua (copy bo padding) ra mang lien tuc M x N
static inline void npu_read_C8(npu_t *d, const npu_layout_t *l, int8_t *C, uint32_t M, uint32_t N) {
    for (uint32_t m = 0; m < M; m++) memcpy(C + (uint64_t)m * N, d->ddr + l->off_c + (uint64_t)m * l->ldc, N);
}
static inline void npu_read_C32(npu_t *d, const npu_layout_t *l, int32_t *C, uint32_t M, uint32_t N) {
    for (uint32_t m = 0; m < M; m++)
        memcpy(C + (uint64_t)m * N, d->ddr + l->off_c32 + (uint64_t)m * l->ldc32, (size_t)N * 4);
}

// Ham tien loi: load + chay + doc ket qua. qp co the NULL neu chi lay INT32.
static inline int npu_gemm(npu_t *d, const int8_t *A, const int8_t *B, uint32_t M, uint32_t K, uint32_t N,
                           const npu_qparam_t *qp, int8_t *C8, int32_t *C32) {
    uint32_t mode = (C8 ? NPU_OUT_INT8 : 0) | (C32 ? NPU_OUT_INT32 : 0);
    if (!mode) return -3;
    if (C8 && !qp) return -4;
    npu_layout_t l = npu_layout(M, K, N);
    if (l.total > d->ddr_size) { fprintf(stderr, "[npu] can %llu byte DDR, chi co %zu\n",
                                         (unsigned long long)l.total, d->ddr_size); return -5; }
    npu_load_A(d, &l, A, M, K);
    npu_load_B(d, &l, B, K, N);
    if (qp) npu_load_params(d, &l, qp, N);
    int r = npu_run(d, &l, M, K, N, NPU_KDIM_DEFAULT, mode, 600.0);
    if (r) return r;
    if (C8)  npu_read_C8(d, &l, C8, M, N);
    if (C32) npu_read_C32(d, &l, C32, M, N);
    return 0;
}

// ---- Tham chieu CPU (chinh xac nhu phan cung) ----
static inline int8_t npu_requant_ref(int32_t acc, npu_qparam_t p) {
    __int128 t = (__int128)acc + p.bias;
    __int128 v = t * (__int128)p.mult;
    if (p.shift > 0) v += ((__int128)1 << (p.shift - 1));
    v >>= p.shift;                  // dich so hoc (floor)
    v += p.zp;
    if (v > 127) return 127;
    if (v < -128) return -128;
    return (int8_t)v;
}

#endif
