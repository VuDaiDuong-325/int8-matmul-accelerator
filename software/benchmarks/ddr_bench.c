// =============================================================================
// ddr_bench.c - do bang thong DOC/GHI vung DDR reserved (Device memory) qua /dev/mem, so sanh cac cach doc:
//   mode 0 = ldp x (16 B/lenh), 1 = ldp q (32 B), 2 = ld1 {v0-v3} (64 B)  x  1/2/4 luong (can -fopenmp)
// Moi bien the deu duoc KIEM TRA DUNG (doc lai == du lieu da ghi) truoc khi do toc do.
// KHONG dong vao PL / thanh ghi => chay duoc ca khi chua nap bitstream.
//   gcc -O3 -fopenmp -mcpu=native -Wall -o ddr_bench ddr_bench.c
//   sudo ./ddr_bench [--mb 32] [--pa 0x70000000] [--size 64M]
// Ket qua dung de chon NPU_READ_MODE / NPU_READ_THREADS cho npu_run_case, run_all_functions.py (xem kv260_check.sh ddr).
// =============================================================================
#include "npu_driver.h"
#ifdef _OPENMP
#include <omp.h>
#endif

static uint64_t xs = 88172645463325252ULL;
static inline uint64_t rnd(void) { xs ^= xs << 13; xs ^= xs >> 7; xs ^= xs << 17; return xs; }

typedef struct { const char *name; int mode; int thr; } variant_t;

static double bench_read(uint8_t *ddr, uint8_t *dst, size_t chunk, size_t total, int mode, int thr) {
    npu_set_read_mode(mode);
    size_t nchunk = total / chunk; if (nchunk < 1) nchunk = 1;
    double best = 1e30;
    for (int r = 0; r < 3; r++) {
        double t0 = npu_now();
        for (size_t i = 0; i < nchunk; i++) npu_dev_read_mt(dst + i * chunk, ddr + i * chunk, chunk, thr);
        double t = npu_now() - t0; if (t < best) best = t;
    }
    return (double)(nchunk * chunk) / best / 1e6;   // MB/s
}

int main(int argc, char **argv) {
    size_t mb = 32; uint64_t pa = NPU_DDR_PA, size = NPU_DDR_SIZE; int do_cma = 0;
    for (int i = 1; i < argc; i++) {
        if (!strcmp(argv[i], "--mb") && i + 1 < argc) mb = (size_t)atoi(argv[++i]);
        else if (!strcmp(argv[i], "--pa") && i + 1 < argc) pa = npu_parse_size(argv[++i]);
        else if (!strcmp(argv[i], "--size") && i + 1 < argc) size = npu_parse_size(argv[++i]);
        else if (!strcmp(argv[i], "--cma")) do_cma = 1;
        else { fprintf(stderr, "dung: %s [--mb 32] [--pa 0x70000000] [--size 64M] [--cma]\n", argv[0]); return 2; }
    }
    if (mb * 1048576ULL > size) mb = (size_t)(size >> 20);
    const char *memdev = getenv("NPU_MEMDEV");   // chi de thu logic tren may khac (file thuong); tren board bo trong
    int fd = open(memdev && *memdev ? memdev : "/dev/mem", O_RDWR | O_SYNC);
    if (fd < 0) { perror("open /dev/mem (can sudo)"); return 2; }
    uint8_t *ddr = (uint8_t *)mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, pa);
    if (ddr == MAP_FAILED) { perror("mmap"); return 2; }
    size_t total = mb * 1048576ULL;
    printf("== ddr_bench: PA=0x%llx, vung %llu MB, thu %zu MB ==\n", (unsigned long long)pa, (unsigned long long)(size >> 20), mb);
#ifdef _OPENMP
    printf("OpenMP: toi da %d luong\n", omp_get_max_threads());
#else
    printf("Khong build -fopenmp => chi do 1 luong\n");
#endif

    uint8_t *src = (uint8_t *)malloc(total), *dst = (uint8_t *)malloc(total);
    if (!src || !dst) { fprintf(stderr, "het RAM\n"); return 2; }
    for (size_t i = 0; i < total; i += 8) { uint64_t v = rnd(); memcpy(src + i, &v, 8); }

    // ---- GHI ----
    printf("\n[GHI] (CPU -> DDR reserved)\n");
    double best = 0;
    for (int r = 0; r < 3; r++) { double t0 = npu_now(); npu_dev_write(ddr, src, total); double t = npu_now() - t0; if (total / t / 1e6 > best) best = total / t / 1e6; }
    printf("  npu_dev_write (stp, 32 B/lenh)  %8.1f MB/s\n", best);
    best = 0;
    for (int r = 0; r < 3; r++) { double t0 = npu_now(); npu_dev_fill(ddr + total / 2, 0, total / 2); double t = npu_now() - t0; if (total / 2 / t / 1e6 > best) best = total / 2 / t / 1e6; }
    printf("  npu_dev_fill  (8 B/lenh)        %8.1f MB/s\n", best);
#ifdef _OPENMP
    for (int th = 2; th <= 4; th++) {      // ghi nhieu luong (moi luong 1 khoang lien tiep)
        best = 0;
        for (int r = 0; r < 3; r++) {
            double t0 = npu_now();
            #pragma omp parallel num_threads(th)
            { size_t t = (size_t)omp_get_thread_num(), nt = (size_t)omp_get_num_threads(), a = (total * t / nt) & ~(size_t)63, b = (total * (t + 1) / nt) & ~(size_t)63;
              if (t + 1 == nt) { b = total; }
              npu_dev_write(ddr + a, src + a, b - a); }
            double t = npu_now() - t0; if (total / t / 1e6 > best) best = total / t / 1e6;
        }
        printf("  npu_dev_write %d luong            %8.1f MB/s\n", th, best);
    }
#endif
    npu_dev_write(ddr, src, total);           // khoi phuc du lieu sau fill

    // ---- DOC: kiem tra dung ----
    static const variant_t V[] = {
        {"ldp x (16B) 1 luong", 0, 1}, {"ldp q (32B) 1 luong", 1, 1}, {"ld1 x4 (64B) 1 luong", 2, 1},
#ifdef _OPENMP
        {"ldp x (16B) 2 luong", 0, 2}, {"ldp x (16B) 4 luong", 0, 4},
        {"ldp q (32B) 4 luong", 1, 4}, {"ld1 x4 (64B) 2 luong", 2, 2}, {"ld1 x4 (64B) 4 luong", 2, 4},
#endif
    };
    int nv = (int)(sizeof(V) / sizeof(V[0])), ok[16];
    printf("\n[DOC] kiem tra dung (doc lai %zu MB == du lieu da ghi)\n", mb);
    for (int v = 0; v < nv; v++) {
        memset(dst, 0xA5, total);
        npu_set_read_mode(V[v].mode);
        npu_dev_read_mt(dst, ddr, total, V[v].thr);
        ok[v] = memcmp(dst, src, total) == 0;
        printf("  %-24s %s\n", V[v].name, ok[v] ? "DUNG" : "SAI !!! (khong dung bien the nay)");
    }
    // doc lech dia chi / do dai le
    {
        int ok2 = 1;
        for (int mode = 0; mode < 3; mode++) {
            npu_set_read_mode(mode);
            for (int off = 0; off < 17; off++) for (size_t len = 1; len < 300; len += 37) {
                memset(dst, 0, 512); npu_dev_read(dst, ddr + off, len);
                if (memcmp(dst, src + off, len)) ok2 = 0;
            }
        }
        printf("  dia chi/do dai le (off 0..16, len 1..300, 3 mode): %s\n", ok2 ? "DUNG" : "SAI !!!");
    }

    // ---- DOC: toc do theo kich thuoc doan lien tuc ----
    static const size_t CH[] = {256, 4096, 65536, 4u << 20};
    printf("\n[DOC] MB/s theo kich thuoc 1 lan doc (hang lien tiep trong vung; hang C cua fc1 = 5120 B, lm_head chunk = 16384 B)\n");
    printf("  %-24s", "bien the");
    for (size_t c = 0; c < 4; c++) { char b[16]; snprintf(b, sizeof b, c < 2 ? "%zu B" : (c == 2 ? "64 KB" : "4 MB"), CH[c]); printf("%10s", b); }
    printf("\n");
    int best_v = 0; double best_bw = 0;
    for (int v = 0; v < nv; v++) {
        if (!ok[v]) continue;
        printf("  %-24s", V[v].name);
        for (size_t c = 0; c < 4; c++) {
            double bw = bench_read(ddr, dst, CH[c], total, V[v].mode, V[v].thr);
            printf("%10.1f", bw);
            if (CH[c] == 65536 && bw > best_bw) { best_bw = bw; best_v = v; }
        }
        printf("\n");
    }
    if (best_bw > 0)
        printf("\n=> NHANH NHAT (doan 64 KB): %s = %.1f MB/s  ->  dat NPU_READ_MODE=%d NPU_READ_THREADS=%d\n", V[best_v].name, best_bw, V[best_v].mode, V[best_v].thr);
    int all_ok = 1; for (int v = 0; v < nv; v++) all_ok &= ok[v];
    printf("%s\n", all_ok ? "TAT CA bien the doc DUNG." : "CO bien the doc SAI - chi dung bien the 'DUNG'.");

    // ---- Backend CMA cacheable: dung DUNG cach driver nap B / doc C de tim vi sao nap trong so khong nhanh hon ----
    if (do_cma) {
        size_t cmb = 32; { const char *e = getenv("NPU_CMA_MB"); if (e && *e) cmb = (size_t)atoi(e); if (cmb < 24) cmb = 24; }   // bai do chi can ~15 MB
        printf("\n[CMA] mo vung CMA cacheable %zu MB (npu_open_cma)\n", cmb);
        { FILE *f = fopen("/proc/meminfo", "r"); char l[200]; while (f && fgets(l, sizeof l, f)) if (strstr(l, "Cma")) printf("  %s", l); if (f) fclose(f); }
        npu_t cd; memset(&cd, 0, sizeof cd); cd.fd = -1;
        double t0 = npu_now(); int r = npu_open_cma(&cd, cmb); double tc = (npu_now() - t0) * 1e3;
        if (r) { printf("  npu_open_cma that bai (can sudo / CmaFree)\n"); } else {
            printf("  npu_open_cma: %.1f ms / process (cap phat + MAP_POPULATE + dc civac %zu MB)  PA=0x%llx\n", tc, cmb, (unsigned long long)cd.ddr_pa);
            const uint32_t K = 896, N = 16384; size_t bytes = (size_t)K * N;           // 1 manh lm_head: 14.7 MB
            uint8_t *dstc = cd.ddr; double bw;
            #define TIMEIT(label, stmt) do { double _b = 1e30; for (int _r = 0; _r < 3; _r++) { double _t = npu_now(); stmt; double _d = npu_now() - _t; if (_d < _b) _b = _d; } \
                bw = (double)bytes / _b / 1e6; printf("  %-52s %8.1f ms  %7.1f MB/s\n", label, _b * 1e3, bw); } while (0)
            printf("  --- GHI nap B %ux%u (%.1f MB), moi dong 16 KB ---\n", K, N, bytes / 1048576.0);
            if (size >= bytes) TIMEIT("devmem: npu_dev_write tung dong (hien tai, backend cu)", for (uint32_t k = 0; k < K; k++) npu_dev_write(ddr + (size_t)k * N, src + (size_t)k * N, N));
            TIMEIT("CMA: memcpy tung dong, KHONG flush (can duoi)", for (uint32_t k = 0; k < K; k++) memcpy(dstc + (size_t)k * N, src + (size_t)k * N, N));
            TIMEIT("CMA: memcpy tat ca + 1 lan dc cvac cuoi (driver hien tai)", { for (uint32_t k = 0; k < K; k++) memcpy(dstc + (size_t)k * N, src + (size_t)k * N, N); npu_cache_clean(&cd, dstc, bytes); });
            TIMEIT("CMA: memcpy + dc cvac NGAY tung dong", for (uint32_t k = 0; k < K; k++) { memcpy(dstc + (size_t)k * N, src + (size_t)k * N, N); npu_cache_clean(&cd, dstc + (size_t)k * N, N); });
            TIMEIT("CMA: chi dc cvac 14.7 MB (dong da sach/khong co trong cache)", npu_cache_clean(&cd, dstc, bytes));
            printf("  --- DOC ket qua C 1500x5120 (7.7 MB INT8) ---\n");
            size_t cb = (size_t)1500 * 5120; bytes = cb;
            if (size >= cb) TIMEIT("devmem: npu_dev_read mode/luong mac dinh (4 luong)", { npu_t dd; memset(&dd, 0, sizeof dd); dd.ddr = ddr; dd.read_threads = 4; npu_layout_t l; memset(&l, 0, sizeof l); l.off_c = 0; l.ldc = 5120; npu_read_C8(&dd, &l, (int8_t *)dst, 1500, 5120); });
            TIMEIT("CMA: dc civac + memcpy (driver hien tai)", { npu_layout_t l; memset(&l, 0, sizeof l); l.off_c = 0; l.ldc = 5120; npu_read_C8(&cd, &l, (int8_t *)dst, 1500, 5120); });
            munmap(cd.ddr, cd.ddr_size); close(cd.dmabuf_fd);
        }
    }
    munmap(ddr, size); close(fd);
    return all_ok ? 0 : 1;
}
