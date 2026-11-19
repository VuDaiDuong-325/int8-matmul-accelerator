// =============================================================================
// kr260_npu_driver.h - Driver C cho INT8 GEMM Accelerator v8 tren KR260 (-DNPU_DMAHEAP: bo nho NPU cap tu CMA heap)
// (doi ten tu npu_driver.h de KHONG dung ten voi file npu_driver.h co san cua nguoi dung tren board)
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
#ifndef KR260_NPU_DRIVER_H
#define KR260_NPU_DRIVER_H

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/time.h>
#include <time.h>

// =============================================================================
// BAN VA KR260 (backend DMA-BUF CMA heap).  Bien dich voi  -DNPU_DMAHEAP  de bat.
//   Ly do: tren KR260 khong co vung no-map duoi 4 GiB (0x70000000 nam trong CMA cua kernel) nen KHONG duoc mmap /dev/mem
//   vao dia chi co dinh. Thay vao do xin kernel 1 buffer vat ly LIEN TUC tu /dev/dma_heap/reserved (CMA heap), lay dia chi
//   vat ly tu /proc/self/pagemap (can root) va dua cho DMA cua NPU. /dev/mem CHI con dung cho thanh ghi AXI-Lite 0xA0000000.
//   - Buffer la bo nho thuong, CACHEABLE => dung memcpy/memset binh thuong, nhung cong PL la S_AXI_HP0_FPD (KHONG coherent)
//     nen driver tu bao tri cache: dc cvac (clean) A/B/params truoc START, dc civac (clean+invalidate) C truoc/sau khi chay.
//   - Khong chinh device-tree, kernel, bitstream. Buffer tu tra lai khi tien trinh thoat.
//   - Tuy chon:  -DNPU_COHERENT (bo bao tri cache, neu cong PL la HPC coherent);  moi truong NPU_DDR_MB (mac dinh 64);
//                moi truong NPU_PL_OK=1 BAT BUOC (xac nhan bitstream NPU DA duoc nap; chua nap ma doc 0xA0000000 co the treo board).
//   - Neu khong khai bao -DNPU_DMAHEAP, file nay hanh xu NHU BAN GOC (KV260, /dev/mem 0x70000000).
// =============================================================================
#ifdef NPU_DMAHEAP
#include <errno.h>
#include <sys/ioctl.h>
#include <linux/types.h>
struct npu_heap_alloc { __u64 len; __u32 fd; __u32 fd_flags; __u64 heap_flags; };      // = struct dma_heap_allocation_data
#define NPU_HEAP_IOCTL_ALLOC _IOWR('H', 0x0, struct npu_heap_alloc)
#ifndef NPU_HEAP_DEV
#define NPU_HEAP_DEV "/dev/dma_heap/reserved"
#endif
#endif

// Bao tri cache tu EL0 (Linux arm64 bat SCTLR_EL1.UCI; da kiem tra tren KR260-01 bang dmaheap_probe).
// Khong dinh nghia NPU_DMAHEAP (hoac co NPU_COHERENT, hoac x86/softsim) => khong lam gi.
#if defined(NPU_DMAHEAP) && !defined(NPU_COHERENT) && defined(__aarch64__)
static inline size_t npu_dcline(void) { uint64_t ctr; __asm__ volatile("mrs %0, ctr_el0" : "=r"(ctr)); return (size_t)4 << ((ctr >> 16) & 0xf); }
static inline void npu_cache_clean(const void *p, size_t n) {        // dc cvac: day du lieu CPU xuong DDR (de NPU doc dung)
    if (!n) return;
    size_t ls = npu_dcline(); uintptr_t a = (uintptr_t)p & ~(uintptr_t)(ls - 1), e = (uintptr_t)p + n;
    for (; a < e; a += ls) __asm__ volatile("dc cvac, %0" :: "r"(a) : "memory");
    __asm__ volatile("dsb sy" ::: "memory");
}
static inline void npu_cache_flush_inv(const void *p, size_t n) {    // dc civac: bo dong cache cu (de CPU doc ket qua moi cua NPU)
    if (!n) return;
    size_t ls = npu_dcline(); uintptr_t a = (uintptr_t)p & ~(uintptr_t)(ls - 1), e = (uintptr_t)p + n;
    for (; a < e; a += ls) __asm__ volatile("dc civac, %0" :: "r"(a) : "memory");
    __asm__ volatile("dsb sy" ::: "memory");
}
#else
static inline void npu_cache_clean(const void *p, size_t n) { (void)p; (void)n; }
static inline void npu_cache_flush_inv(const void *p, size_t n) { (void)p; (void)n; }
#endif

// ---- Dia chi phan cung (sua theo Vivado Address Editor / device-tree cua ban) ----
#ifndef NPU_CTRL_BASE
#define NPU_CTRL_BASE   0xA0000000UL
#endif
#ifndef NPU_DDR_PA
// CHU Y: 0x63800000-0x6FFFFFFF NAM TRONG CMA (cma=256M @0x60000000) va 0x74000000-0x777FFFFF la RAM kernel dung binh thuong
// -> KHONG duoc dung (ghi de vao la kernel hong/treo/reboot). Vung no-map that tren board nay: apbwe_dma@70000000, 64 MB.
// (kiem tra: cat /proc/iomem ; hexdump /proc/device-tree/reserved-memory/*/reg). Doi bang -DNPU_DDR_PA=... neu device-tree khac.
#define NPU_DDR_PA      0x70000000UL    // vung reserved no-map 0x70000000-0x73FFFFFF
#endif
#ifndef NPU_DDR_SIZE
#define NPU_DDR_SIZE    0x04000000UL    // 64 MB
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
#define NPU_KDIM_DEFAULT 128
#define NPU_KDIM_AUTO    0      // truyen 0 cho kdim => driver tu chon theo K (npu_pick_kdim)

// Tham so requant 1 kenh (16 byte, little-endian, dung layout phan cung)
typedef struct { int32_t bias; int32_t mult; int32_t shift; int32_t zp; } npu_qparam_t;

typedef struct {
    int fd;
    volatile uint32_t *regs;
    uint8_t *ddr;             // anh xa vung DDR reserved
    uint64_t ddr_pa;
    size_t   ddr_size;
    double   last_hw_ms;      // thoi gian phan cung (start -> done) cua lan chay gan nhat
    int      buf_fd;          // (NPU_DMAHEAP) fd cua dma-buf giu buffer; dong fd = tra buffer
    int      skip_clean_b;    // 1: npu_run KHONG 'dc cvac' vung B (trong so da duoc clean 1 lan bang npu_clean_B va khong bi CPU ghi lai)
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

// Chon k_dim theo K. Moi chunk k_dim chay it nhat max(k_dim,48) chu ky (v8: MIN_PERIOD=48), K duoc pad len boi k_dim
// => chi phi 1 tile ~ ceil(K/kd) * max(kd,48) chu ky. Chon kd trong {32,64,128} co chi phi nho nhat;
// hoa thi lay kd LON hon (128 la gia tri da do bit-true tren board). 256 khong bao gio tot hon 128 nen khong xet.
//   K=64 -> 64 (gap doi so voi 128) | K=192 -> 64 | K=1280,5120 -> 128 | K=772 -> 64 | K=1500 -> 64/128 (hoa -> 128)
// Ham Python tuong ung: qffn_common.pick_kdim (phai cho ket qua giong het).
static inline uint32_t npu_pick_kdim(uint32_t K) {
    static const uint32_t cand[3] = {32, 64, 128};
    uint32_t best = 128;
    uint64_t best_cost = ~0ULL;
    for (int i = 0; i < 3; i++) {
        uint64_t chunks = ((uint64_t)K + cand[i] - 1) / cand[i];
        uint64_t cost = chunks * (cand[i] < 48 ? 48 : cand[i]);
        if (cost <= best_cost) { best_cost = cost; best = cand[i]; }   // <= : hoa thi lay kd lon hon
    }
    return best;
}
static inline uint64_t npu_align4k(uint64_t x) { return (x + 4095) & ~4095ULL; }

#ifndef NPU_DMAHEAP
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
#else   // ---------------- NPU_DMAHEAP: buffer DDR cua NPU cap tu CMA heap cua kernel ----------------
static inline void npu_close(npu_t *d) {
    if (d->regs && d->regs != (volatile uint32_t *)MAP_FAILED) munmap((void *)d->regs, 0x1000);
    if (d->ddr && d->ddr != (uint8_t *)MAP_FAILED) munmap(d->ddr, d->ddr_size);
    if (d->buf_fd > 0) close(d->buf_fd);           // dong dma-buf => kernel thu hoi buffer
    if (d->fd > 0) close(d->fd);
    d->regs = NULL; d->ddr = NULL; d->buf_fd = 0; d->fd = 0;
}
static inline int npu_open(npu_t *d) {
    memset(d, 0, sizeof(*d));
    const char *ok = getenv("NPU_PL_OK");
    if (!ok || strcmp(ok, "1") != 0) {
        fprintf(stderr, "[npu] DUNG LAI: chua xac nhan bitstream NPU da nap. Doc/ghi 0xA0000000 khi PL chua co thiet ke NPU co the "
                        "treo/lam sap board dung chung. Chi khi chac chan roi chay lai voi:  sudo env NPU_PL_OK=1 ...\n");
        return -1;
    }
    size_t mb = NPU_DDR_SIZE >> 20;
    const char *e = getenv("NPU_DDR_MB");
    if (e && atol(e) > 0) mb = (size_t)atol(e);
    size_t len = mb << 20;

    // 1) xin buffer lien tuc tu CMA heap
    int hfd = open(NPU_HEAP_DEV, O_RDWR | O_CLOEXEC);
    if (hfd < 0) { fprintf(stderr, "[npu] open %s: %s\n", NPU_HEAP_DEV, strerror(errno)); return -1; }
    // CMA thuong that bai TAM THOI (trang page-cache/dirty dang bi giu, vua duoc tra lai boi tien trinh truoc) -> thu lai co backoff.
    // NPU_ALLOC_RETRY (mac dinh 40 lan, tong cho toi da ~12 s); chi thu lai voi ENOMEM/EBUSY/EAGAIN.
    int tries = 40;
    { const char *er = getenv("NPU_ALLOC_RETRY"); if (er && atoi(er) >= 0) tries = atoi(er) + 1; }
    int rc = -1, att;
    struct npu_heap_alloc a;
    for (att = 0; att < tries; att++) {
        memset(&a, 0, sizeof a); a.len = len; a.fd_flags = O_RDWR | O_CLOEXEC;
        rc = ioctl(hfd, NPU_HEAP_IOCTL_ALLOC, &a);
        if (rc >= 0) break;
        if (errno != ENOMEM && errno != EBUSY && errno != EAGAIN) break;
        if (att == 1) sync();                                // day dirty page xuong de CMA di chuyen duoc
        usleep(att < 10 ? 100000 : 300000);
    }
    close(hfd);
    if (rc < 0) {
        fprintf(stderr, "[npu] cap %zu MB tu CMA that bai sau %d lan: %s (CMA phan manh/dang bi giu; thu NPU_DDR_MB nho hon, vd 32)\n",
                mb, att < tries ? att + 1 : tries, strerror(errno));
        return -1;
    }
    if (att > 0) fprintf(stderr, "[npu] cap CMA thanh cong sau %d lan thu lai\n", att);
    d->buf_fd = (int)a.fd;
    d->ddr = (uint8_t *)mmap(NULL, len, PROT_READ | PROT_WRITE, MAP_SHARED, d->buf_fd, 0);
    if (d->ddr == MAP_FAILED) { perror("[npu] mmap dma-buf"); d->ddr = NULL; npu_close(d); return -1; }
    d->ddr_size = len;
    memset(d->ddr, 0, len);                              // cham het cac trang (de pagemap hop le) + zero

    // 2) dia chi vat ly tu pagemap; bat buoc lien tuc va < 4 GiB (thanh ghi DMA cua NPU chi 32 bit)
    int pm = open("/proc/self/pagemap", O_RDONLY);
    if (pm < 0) { perror("[npu] open /proc/self/pagemap"); npu_close(d); return -1; }
    size_t np = len >> 12;
    uint64_t *ent = (uint64_t *)malloc(np * 8);
    ssize_t got = ent ? pread(pm, ent, np * 8, (off_t)(((uintptr_t)d->ddr >> 12) * 8)) : -1;
    close(pm);
    if (got != (ssize_t)(np * 8)) { fprintf(stderr, "[npu] doc pagemap that bai\n"); free(ent); npu_close(d); return -1; }
    uint64_t pfn0 = ent[0] & ((1ULL << 55) - 1);
    int good = (ent[0] >> 63) && pfn0;
    for (size_t i = 1; good && i < np; i++) {
        uint64_t pfn = ent[i] & ((1ULL << 55) - 1);
        if (!(ent[i] >> 63) || pfn != pfn0 + i) good = 0;
    }
    free(ent);
    if (!good) { fprintf(stderr, "[npu] buffer KHONG lien tuc hoac pagemap khong cho PFN (phai chay bang root)\n"); npu_close(d); return -1; }
    d->ddr_pa = pfn0 << 12;
    if (d->ddr_pa + len > (1ULL << 32)) {
        fprintf(stderr, "[npu] buffer o 0x%llx vuot 4 GiB: thanh ghi DMA 32 bit khong toi duoc\n", (unsigned long long)d->ddr_pa);
        npu_close(d); return -1;
    }
    npu_cache_flush_inv(d->ddr, len);                    // dam bao khong con dong cache ban nao cua buffer (do memset o tren)

    // 3) thanh ghi AXI-Lite qua /dev/mem (chi 4 KB)
    d->fd = open("/dev/mem", O_RDWR | O_SYNC);
    if (d->fd < 0) { perror("[npu] open /dev/mem (can sudo)"); npu_close(d); return -1; }
    d->regs = (volatile uint32_t *)mmap(NULL, 0x1000, PROT_READ | PROT_WRITE, MAP_SHARED, d->fd, NPU_CTRL_BASE);
    if (d->regs == (volatile uint32_t *)MAP_FAILED) { perror("[npu] mmap regs"); d->regs = NULL; npu_close(d); return -1; }
    fprintf(stderr, "[npu] dmaheap: %zu MB tai PA 0x%llx-0x%llx (lien tuc, <4GiB)%s\n", mb, (unsigned long long)d->ddr_pa,
            (unsigned long long)(d->ddr_pa + len - 1),
#ifdef NPU_COHERENT
            ", coherent: khong bao tri cache"
#else
            ", bao tri cache bang dc cvac/civac"
#endif
            );
    return 0;
}
#endif

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

#ifdef NPU_DMAHEAP
// Buffer dma-buf la bo nho thuong (Normal, cacheable) => memcpy/memset binh thuong, khong rang buoc can chinh.
static inline void npu_dev_write(void *dst, const void *src, size_t n) { memcpy(dst, src, n); }
static inline void npu_dev_fill(void *dst, uint8_t val, size_t n)      { memset(dst, val, n); }
static inline void npu_dev_read(void *dst, const void *src, size_t n)  { memcpy(dst, src, n); }
#else
// ---------------------------------------------------------------------------------------------
// Truy cap vung DDR reserved NO-MAP (0x70000000): /dev/mem anh xa no thanh Device memory => moi truy cap phai CAN CHINH
// (memcpy/memset cua glibc dung truy cap lech/DC ZVA -> "Bus error"). Cac ham duoi day chi dung truy cap byte, 8 hoac 16 byte
// da can chinh vao vung DDR. Tren RAM thuong (softsim, x86) van dung duoc.
// ---------------------------------------------------------------------------------------------
static inline void npu_dev_write(void *dst, const void *src, size_t n) {
    volatile uint8_t *d = (volatile uint8_t *)dst; const uint8_t *s = (const uint8_t *)src;
    while (n && ((uintptr_t)d & 15)) { *d++ = *s++; n--; }
#if defined(__aarch64__)
    while (n >= 32) {
        uint64_t a, b, c, e; memcpy(&a, s, 8); memcpy(&b, s + 8, 8); memcpy(&c, s + 16, 8); memcpy(&e, s + 24, 8);
        __asm__ volatile("stp %1, %2, [%0]\n\tstp %3, %4, [%0, #16]" :: "r"(d), "r"(a), "r"(b), "r"(c), "r"(e) : "memory");
        d += 32; s += 32; n -= 32;
    }
#endif
    while (n >= 8) { uint64_t v; memcpy(&v, s, 8); *(volatile uint64_t *)d = v; d += 8; s += 8; n -= 8; }
    while (n) { *d++ = *s++; n--; }
}
static inline void npu_dev_fill(void *dst, uint8_t val, size_t n) {
    volatile uint8_t *d = (volatile uint8_t *)dst;
    uint64_t v = 0x0101010101010101ULL * val;
    while (n && ((uintptr_t)d & 7)) { *d++ = val; n--; }
    while (n >= 8) { *(volatile uint64_t *)d = v; d += 8; n -= 8; }
    while (n) { *d++ = val; n--; }
}
static inline void npu_dev_read(void *dst, const void *src, size_t n) {
    uint8_t *d = (uint8_t *)dst; volatile const uint8_t *s = (volatile const uint8_t *)src;
    while (n && ((uintptr_t)s & 15)) { *d++ = *s++; n--; }
#if defined(__aarch64__)
    while (n >= 32) {
        uint64_t a, b, c, e;
        __asm__ volatile("ldp %0, %1, [%4]\n\tldp %2, %3, [%4, #16]" : "=&r"(a), "=&r"(b), "=&r"(c), "=&r"(e) : "r"(s) : "memory");
        memcpy(d, &a, 8); memcpy(d + 8, &b, 8); memcpy(d + 16, &c, 8); memcpy(d + 24, &e, 8);
        d += 32; s += 32; n -= 32;
    }
#endif
    while (n >= 8) { uint64_t v = *(volatile const uint64_t *)s; memcpy(d, &v, 8); d += 8; s += 8; n -= 8; }
    while (n) { *d++ = *s++; n--; }
}
#endif   // NPU_DMAHEAP

// Copy ma tran vao DDR (them padding 0). Co the goi RIENG cho B (trong so) 1 lan roi dung lai.
static inline void npu_load_A(npu_t *d, const npu_layout_t *l, const int8_t *A, uint32_t M, uint32_t K) {
    for (uint32_t m = 0; m < M; m++) {
        uint8_t *row = d->ddr + l->off_a + (uint64_t)m * l->lda;
        npu_dev_write(row, A + (uint64_t)m * K, K);
        npu_dev_fill(row + K, 0, l->lda - K);
    }
}
static inline void npu_load_B(npu_t *d, const npu_layout_t *l, const int8_t *B, uint32_t K, uint32_t N) {
    for (uint32_t k = 0; k < K; k++) {
        uint8_t *row = d->ddr + l->off_b + (uint64_t)k * l->ldb;
        npu_dev_write(row, B + (uint64_t)k * N, N);
        npu_dev_fill(row + N, 0, l->ldb - N);
    }
}
static inline void npu_load_params(npu_t *d, const npu_layout_t *l, const npu_qparam_t *qp, uint32_t N) {
    npu_dev_write(d->ddr + l->off_p, qp, (size_t)N * sizeof(npu_qparam_t));
}

// Chay 1 phep GEMM da load du lieu. Tra ve 0 neu OK, <0 neu loi.
//   mode: NPU_OUT_INT8 | NPU_OUT_INT32 (hoac ca hai)
static inline int npu_run(npu_t *d, const npu_layout_t *l, uint32_t M, uint32_t K, uint32_t N,
                          uint32_t kdim, uint32_t mode, double timeout_s) {
    uint64_t pa = d->ddr_pa;
    if (kdim == NPU_KDIM_AUTO) kdim = npu_pick_kdim(K);
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
    // Bao tri cache (chi co tac dung khi -DNPU_DMAHEAP): dua A/B/params xuong DDR, bo dong cache cu cua vung C truoc khi NPU ghi.
    npu_cache_clean(d->ddr + l->off_a, (size_t)M * l->lda);
    if (!d->skip_clean_b) npu_cache_clean(d->ddr + l->off_b, (size_t)K * l->ldb);
    npu_cache_clean(d->ddr + l->off_p, (size_t)N * sizeof(npu_qparam_t));
    if (mode & NPU_OUT_INT8)  npu_cache_flush_inv(d->ddr + l->off_c,   (size_t)M * l->ldc);
    if (mode & NPU_OUT_INT32) npu_cache_flush_inv(d->ddr + l->off_c32, (size_t)M * l->ldc32);
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
    // NPU da ghi C xuong DDR: bo cac dong cache cu (co the do doc/prefetch truoc do) de CPU doc dung du lieu moi.
    if (mode & NPU_OUT_INT8)  npu_cache_flush_inv(d->ddr + l->off_c,   (size_t)M * l->ldc);
    if (mode & NPU_OUT_INT32) npu_cache_flush_inv(d->ddr + l->off_c32, (size_t)M * l->ldc32);

    if (st & NPU_ST_ERR) {
        fprintf(stderr, "[npu] ERR: cau hinh khong hop le (stride/base khong boi 16, k_dim khong phai luy thua 2 <= 256, "
                        "out_mode=0, hoac stride nho hon kich thuoc dong)\n");
        return -1;
    }
    return 0;
}

// Doc ket qua (copy bo padding) ra mang lien tuc M x N
static inline void npu_read_C8(npu_t *d, const npu_layout_t *l, int8_t *C, uint32_t M, uint32_t N) {
    for (uint32_t m = 0; m < M; m++) npu_dev_read(C + (uint64_t)m * N, d->ddr + l->off_c + (uint64_t)m * l->ldc, N);
}
static inline void npu_read_C32(npu_t *d, const npu_layout_t *l, int32_t *C, uint32_t M, uint32_t N) {
    for (uint32_t m = 0; m < M; m++)
        npu_dev_read(C + (uint64_t)m * N, d->ddr + l->off_c32 + (uint64_t)m * l->ldc32, (size_t)N * 4);
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
    int r = npu_run(d, &l, M, K, N, NPU_KDIM_AUTO, mode, 600.0);
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
