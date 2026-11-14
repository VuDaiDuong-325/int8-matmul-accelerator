// dmaheap_probe.c - THU NGHIEM AN TOAN cho viec cap bo nho NPU tren KR260 bang DMA-BUF CMA heap.
//   * KHONG dong vao /dev/mem, KHONG dong vao thanh ghi PL (0xA0000000), KHONG can bitstream.
//   * Chi xin kernel cap 1 buffer lien tuc (nhu moi chuong trinh xin bo nho DMA), kiem tra, roi tra lai.
//   Build : gcc -O2 -Wall -o dmaheap_probe dmaheap_probe.c
//   Run   : sudo ./dmaheap_probe            (mac dinh thu 64, 128, 256 MB)
//           sudo ./dmaheap_probe 64 512     (tuy chon: danh sach MB)
//           sudo ./dmaheap_probe -g 16 400  (xin lien tiep cac manh 16 MB cho den khi het hoac du 400 MB, in tong; roi tra het)
// Kiem tra: (1) /dev/dma_heap/reserved cap duoc buffer, (2) mmap duoc, (3) /proc/self/pagemap cho dia chi vat ly (can root),
//           (4) buffer LIEN TUC (pfn tang dan 1), (5) toan bo nam duoi 4 GiB (thanh ghi DMA cua NPU chi 32 bit),
//           (6) lenh bao tri cache o EL0 (dc cvac / dc civac) chay duoc, va do thoi gian.
#define _GNU_SOURCE
#include <errno.h>
#include <fcntl.h>
#include <setjmp.h>
#include <signal.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <linux/types.h>

// Tu dinh nghia (giong <linux/dma-heap.h>) de khong phu thuoc phien ban linux-libc-dev
struct heap_alloc { __u64 len; __u32 fd; __u32 fd_flags; __u64 heap_flags; };
#define HEAP_IOCTL_ALLOC _IOWR('H', 0x0, struct heap_alloc)

static double now(void) { struct timespec t; clock_gettime(CLOCK_MONOTONIC, &t); return t.tv_sec + 1e-9 * t.tv_nsec; }
static long cma_free_kb(void) {
    FILE *f = fopen("/proc/meminfo", "r"); char l[256]; long v = -1; if (!f) return -1;
    while (fgets(l, sizeof l, f)) if (sscanf(l, "CmaFree: %ld kB", &v) == 1) break;
    fclose(f); return v;
}

static sigjmp_buf jb;
static void on_sig(int s) { (void)s; siglongjmp(jb, 1); }

#if defined(__aarch64__)
static size_t dline(void) { uint64_t ctr; __asm__ volatile("mrs %0, ctr_el0" : "=r"(ctr)); return (size_t)4 << ((ctr >> 16) & 0xf); }
static void dc_range(void *p, size_t n, int inv) {   // inv=0: clean (dc cvac) ; inv=1: clean+invalidate (dc civac)
    size_t ls = dline(); uintptr_t a = (uintptr_t)p & ~(uintptr_t)(ls - 1), e = (uintptr_t)p + n;
    if (inv) for (; a < e; a += ls) __asm__ volatile("dc civac, %0" :: "r"(a) : "memory");
    else     for (; a < e; a += ls) __asm__ volatile("dc cvac, %0"  :: "r"(a) : "memory");
    __asm__ volatile("dsb sy" ::: "memory");
}
#else
static size_t dline(void) { return 64; }
static void dc_range(void *p, size_t n, int inv) { (void)p; (void)n; (void)inv; }
#endif

static int probe(int hfd, size_t mb, int pmfd) {
    size_t len = mb << 20;
    printf("\n--- %zu MB ---\n", mb);
    long f0 = cma_free_kb();
    struct heap_alloc a; memset(&a, 0, sizeof a); a.len = len; a.fd_flags = O_RDWR | O_CLOEXEC;
    double t0 = now();
    if (ioctl(hfd, HEAP_IOCTL_ALLOC, &a) < 0) { printf("[1] ALLOC THAT BAI: %s (errno=%d)\n", strerror(errno), errno); return -1; }
    printf("[1] alloc OK (fd=%u) trong %.1f ms; CmaFree %ld -> %ld kB\n", a.fd, 1e3 * (now() - t0), f0, cma_free_kb());
    uint8_t *va = mmap(NULL, len, PROT_READ | PROT_WRITE, MAP_SHARED, (int)a.fd, 0);
    if (va == MAP_FAILED) { printf("[2] MMAP THAT BAI: %s\n", strerror(errno)); close((int)a.fd); return -1; }
    memset(va, 0xA5, len);                                  // cham tung trang de pagemap co du lieu
    printf("[2] mmap + ghi het buffer OK, va=%p\n", (void *)va);

    uint64_t pfn0 = 0, bad = 0, nz = 0; size_t np = len >> 12;
    for (size_t i = 0; i < np; i++) {
        uint64_t e = 0; off_t off = (off_t)(((uintptr_t)va >> 12) + i) * 8;
        if (pread(pmfd, &e, 8, off) != 8) { bad++; continue; }
        uint64_t pfn = e & ((1ULL << 55) - 1), present = e >> 63;
        if (!present || !pfn) { nz++; continue; }
        if (i == 0) pfn0 = pfn; else if (pfn != pfn0 + i) bad++;
    }
    if (nz) { printf("[3] pagemap khong cho PFN (%zu trang) -> chua chay bang root? \n", (size_t)nz); munmap(va, len); close((int)a.fd); return -1; }
    uint64_t pa = pfn0 << 12, pe = pa + len - 1;
    printf("[3] PA = 0x%llx - 0x%llx\n", (unsigned long long)pa, (unsigned long long)pe);
    printf("[4] LIEN TUC (pfn tang dan)  : %s (%llu trang le)\n", bad ? "KHONG" : "CO", (unsigned long long)bad);
    printf("[5] nam duoi 4 GiB (32-bit)  : %s\n", pe < (1ULL << 32) ? "CO" : "KHONG  <-- NPU KHONG toi duoc");
    printf("    nam trong 0x70000000-0x73FFFFFF (vung mac dinh cua driver cu): %s\n",
           (pa <= 0x73FFFFFFULL && pe >= 0x70000000ULL) ? "co giao nhau (binh thuong: day la CMA, chi hop le khi xin tu kernel)" : "khong");

    struct sigaction sa, old_i, old_s; memset(&sa, 0, sizeof sa); sa.sa_handler = on_sig;
    sigaction(SIGILL, &sa, &old_i); sigaction(SIGSEGV, &sa, &old_s);
    if (sigsetjmp(jb, 1) == 0) {
        double t1 = now(); dc_range(va, len, 0); double t2 = now(); dc_range(va, len, 1); double t3 = now();
        printf("[6] dc cvac / dc civac o EL0 chay duoc (dong cache %zu B). Thoi gian: clean %.1f ms, clean+inv %.1f ms (%.0f MB/s)\n",
               dline(), 1e3 * (t2 - t1), 1e3 * (t3 - t2), mb / (t3 - t2));
        int ok = 1; for (size_t i = 0; i < len; i += 4096) if (va[i] != 0xA5) { ok = 0; break; }
        printf("    du lieu sau bao tri cache: %s\n", ok ? "con nguyen" : "SAI");
    } else printf("[6] LENH BAO TRI CACHE BI CHAN o EL0 (SIGILL/SIGSEGV) -> can cach khac\n");
    sigaction(SIGILL, &old_i, NULL); sigaction(SIGSEGV, &old_s, NULL);

    munmap(va, len); close((int)a.fd);
    printf("[7] da tra buffer; CmaFree = %ld kB\n", cma_free_kb());
    return bad ? -1 : 0;
}

static int greedy(int hfd, size_t chunk_mb, size_t cap_mb) {
    size_t len = chunk_mb << 20, n = 0; int fds[512];
    printf("xin cac manh %zu MB (toi da %zu MB)...  CmaFree ban dau = %ld kB\n", chunk_mb, cap_mb, cma_free_kb());
    while (n < 512 && ((n + 1) * chunk_mb) <= cap_mb) {
        struct heap_alloc a; memset(&a, 0, sizeof a); a.len = len; a.fd_flags = O_RDWR | O_CLOEXEC;
        if (ioctl(hfd, HEAP_IOCTL_ALLOC, &a) < 0) { printf("  het o manh thu %zu: %s\n", n + 1, strerror(errno)); break; }
        fds[n++] = (int)a.fd;
    }
    printf("TONG cap duoc: %zu manh x %zu MB = %zu MB   (CmaFree luc dang giu = %ld kB)\n", n, chunk_mb, n * chunk_mb, cma_free_kb());
    for (size_t i = 0; i < n; i++) close(fds[i]);
    printf("da tra het; CmaFree = %ld kB\n", cma_free_kb());
    return 0;
}

int main(int argc, char **argv) {
    if (argc == 4 && !strcmp(argv[1], "-g")) {
        int h = open("/dev/dma_heap/reserved", O_RDWR | O_CLOEXEC);
        if (h < 0) { perror("open /dev/dma_heap/reserved"); return 2; }
        return greedy(h, (size_t)atol(argv[2]), (size_t)atol(argv[3]));
    }
    size_t sizes[16]; int ns = 0;
    for (int i = 1; i < argc && ns < 16; i++) { long v = atol(argv[i]); if (v > 0) sizes[ns++] = (size_t)v; }
    if (!ns) { sizes[0] = 64; sizes[1] = 128; sizes[2] = 256; ns = 3; }
    printf("uid=%d  CmaFree ban dau = %ld kB\n", (int)getuid(), cma_free_kb());
    if (getuid() != 0) printf("CANH BAO: khong phai root -> pagemap se khong cho dia chi vat ly\n");
    int hfd = open("/dev/dma_heap/reserved", O_RDWR | O_CLOEXEC);
    if (hfd < 0) { perror("open /dev/dma_heap/reserved"); return 2; }
    int pmfd = open("/proc/self/pagemap", O_RDONLY);
    if (pmfd < 0) { perror("open /proc/self/pagemap"); return 2; }
    int fails = 0, first_ok = -1;
    for (int i = 0; i < ns; i++) { if (probe(hfd, sizes[i], pmfd) < 0) fails++; else if (first_ok < 0) first_ok = (int)sizes[i]; }
    if (!fails) printf("\nKET LUAN: DMA-BUF CMA heap dung duoc cho NPU (lien tuc, <4GiB, bao tri cache OK)\n");
    else if (first_ok > 0) printf("\nKET LUAN: dung duoc buffer lien tuc toi %d MB (kich thuoc lon hon bi tu choi, thuong do CMA phan manh) - du cho GEMM test (can <= 60 MB)\n", first_ok);
    else printf("\nKET LUAN: KHONG cap duoc buffer nao - gui toan bo ket qua cho Claude\n");
    return first_ok > 0 ? 0 : 1;
}
