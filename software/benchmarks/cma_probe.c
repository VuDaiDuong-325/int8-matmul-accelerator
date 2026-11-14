// =============================================================================
// cma_probe.c - tim cach lay vung DDR >= 160 MB, LIEN TUC VAT LY, CACHEABLE (doc nhanh) cho PL, KHONG sua device-tree.
//   Thu: (1) /dev/dma_heap/* (linux,cma / system) + cap phat N MB + doi ra dia chi vat ly (can root)
//        (2) kiem tra lien tuc, nam duoi 4 GB (thanh ghi dia chi cua RTL la 32-bit)
//        (3) do toc do ghi/doc qua anh xa cacheable (doc: dc civac tung dong cache = vo hieu hoa cache truoc khi doc ket qua PL)
//        (4) liet ke udmabuf, CmaTotal/CmaFree, cac vung reserved
// KHONG dong vao PL. Chi DOC/GHI vung moi cap phat (khong cham vung 0x70000000).
//   gcc -O2 -Wall -o cma_probe cma_probe.c      sudo ./cma_probe [--mb 256] [--heap linux,cma]
// =============================================================================
#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <time.h>
#include <dirent.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/stat.h>

#if defined(__has_include)
#  if __has_include(<linux/dma-heap.h>)
#    include <linux/dma-heap.h>
#    define HAVE_DMA_HEAP_H 1
#  endif
#endif
#ifndef HAVE_DMA_HEAP_H
#include <linux/types.h>
#include <linux/ioctl.h>
struct dma_heap_allocation_data { __u64 len; __u32 fd; __u32 fd_flags; __u64 heap_flags; };
#define DMA_HEAP_IOC_MAGIC 'H'
#define DMA_HEAP_IOCTL_ALLOC _IOWR(DMA_HEAP_IOC_MAGIC, 0x0, struct dma_heap_allocation_data)
#endif

static double now(void) { struct timespec t; clock_gettime(CLOCK_MONOTONIC, &t); return t.tv_sec + t.tv_nsec / 1e9; }

#if defined(__aarch64__)
static size_t cl_size(void) { uint64_t c; __asm__ volatile("mrs %0, ctr_el0" : "=r"(c)); return (size_t)4 << ((c >> 16) & 0xf); }
static void cache_flush(void *p, size_t n) {          // ghi: dc cvac (day du lieu CPU xuong DDR de PL doc)
    size_t cl = cl_size(); uintptr_t a = (uintptr_t)p & ~(cl - 1);
    for (; a < (uintptr_t)p + n; a += cl) __asm__ volatile("dc cvac, %0" :: "r"(a) : "memory");
    __asm__ volatile("dsb sy" ::: "memory");
}
static void cache_inval(void *p, size_t n) {          // doc: dc civac (clean+invalidate; dc ivac khong dung duoc o EL0)
    size_t cl = cl_size(); uintptr_t a = (uintptr_t)p & ~(cl - 1);
    for (; a < (uintptr_t)p + n; a += cl) __asm__ volatile("dc civac, %0" :: "r"(a) : "memory");
    __asm__ volatile("dsb sy" ::: "memory");
}
#else
static void cache_flush(void *p, size_t n) { (void)p; (void)n; }
static void cache_inval(void *p, size_t n) { (void)p; (void)n; }
#endif

static uint64_t va_to_pfn(int pm, void *va) {
    uint64_t e; off_t off = (off_t)((uintptr_t)va / 4096) * 8;
    if (pread(pm, &e, 8, off) != 8) return 0;
    return (e >> 63) ? (e & ((1ULL << 55) - 1)) : 0;
}

static void show_file(const char *path, const char *grep) {
    FILE *f = fopen(path, "r"); if (!f) { printf("  (khong doc duoc %s)\n", path); return; }
    char l[512];
    while (fgets(l, sizeof l, f)) if (!grep || strstr(l, grep)) printf("  %s", l);
    fclose(f);
}

int main(int argc, char **argv) {
    size_t mb = 256; const char *want = NULL;
    for (int i = 1; i < argc; i++) {
        if (!strcmp(argv[i], "--mb") && i + 1 < argc) mb = (size_t)atoi(argv[++i]);
        else if (!strcmp(argv[i], "--heap") && i + 1 < argc) want = argv[++i];
        else { fprintf(stderr, "dung: %s [--mb 256] [--heap linux,cma]\n", argv[0]); return 2; }
    }
    printf("== cma_probe: thu cap phat %zu MB ==\n", mb);
    printf("\n[1] /proc/meminfo (CMA) va cac vung reserved trong /proc/iomem:\n");
    show_file("/proc/meminfo", "Cma");
    show_file("/proc/iomem", "eserved");
    show_file("/proc/iomem", "apbwe");

    printf("\n[2] /dev/dma_heap:\n");
    DIR *dd = opendir("/dev/dma_heap"); char heaps[16][64]; int nh = 0;
    if (!dd) printf("  KHONG co /dev/dma_heap (kernel khong bat CONFIG_DMABUF_HEAPS) -> thu udmabuf (muc 4) hoac device-tree reserved-memory\n");
    else { struct dirent *e; while ((e = readdir(dd))) if (e->d_name[0] != '.' && nh < 16 && strlen(e->d_name) < sizeof heaps[0]) { strcpy(heaps[nh], e->d_name); printf("  /dev/dma_heap/%s\n", heaps[nh]); nh++; } closedir(dd); }

    int rc_any = 1;
    for (int h = 0; h < nh; h++) {
        if (want ? strcmp(heaps[h], want) != 0 : (!strstr(heaps[h], "cma") && !strstr(heaps[h], "reserved"))) continue;
        char path[128]; snprintf(path, sizeof path, "/dev/dma_heap/%.64s", heaps[h]);
        printf("\n[3] Thu heap '%s' (%zu MB)\n", heaps[h], mb);
        int hf = open(path, O_RDWR | O_CLOEXEC); if (hf < 0) { printf("  open loi: %s\n", strerror(errno)); continue; }
        struct dma_heap_allocation_data a; memset(&a, 0, sizeof a); a.len = mb << 20; a.fd_flags = O_RDWR | O_CLOEXEC;
        if (ioctl(hf, DMA_HEAP_IOCTL_ALLOC, &a) < 0) { printf("  cap phat THAT BAI: %s (CMA het cho/phan manh? thu --mb nho hon)\n", strerror(errno)); close(hf); continue; }
        close(hf);
        size_t len = (size_t)a.len;
        uint8_t *p = (uint8_t *)mmap(NULL, len, PROT_READ | PROT_WRITE, MAP_SHARED, (int)a.fd, 0);
        if (p == MAP_FAILED) { printf("  mmap loi: %s\n", strerror(errno)); close((int)a.fd); continue; }
        memset(p, 0, len);                                     // cham het trang de chac chan da co mat
        int pm = open("/proc/self/pagemap", O_RDONLY);
        uint64_t pfn0 = pm >= 0 ? va_to_pfn(pm, p) : 0; int contig = 1; size_t pages = len / 4096;
        if (pfn0 == 0) printf("  khong doi duoc PA (can sudo; pagemap tra ve PFN=0)\n");
        else {
            for (size_t i = 1; i < pages; i++) if (va_to_pfn(pm, p + i * 4096) != pfn0 + i) { contig = 0; printf("  GAP tai trang %zu\n", i); break; }
            uint64_t pa = pfn0 << 12;
            printf("  PA bat dau = 0x%llx, ket thuc = 0x%llx, %s, %s 4 GB\n", (unsigned long long)pa, (unsigned long long)(pa + len),
                   contig ? "LIEN TUC vat ly" : "KHONG lien tuc", (pa + len <= 0x100000000ULL) ? "nam DUOI" : "VUOT");
            if (contig && pa + len <= 0x100000000ULL) { rc_any = 0; printf("  => DUNG DUOC cho RTL 32-bit dia chi. DMA-BUF fd=%d; ket noi vao driver o buoc nang cap tiep theo.\n", (int)a.fd); }
        }
        // toc do cacheable
        printf("  Toc do qua anh xa CACHEABLE (CPU, %zu MB):\n", len >> 20);
        double t0 = now(); for (size_t i = 0; i < len; i += 8) *(volatile uint64_t *)(p + i) = i; cache_flush(p, len); double tw = now() - t0;
        printf("    ghi + dc cvac        : %8.1f MB/s\n", (double)len / tw / 1e6);
        double t1 = now(); cache_inval(p, len); uint64_t sum = 0;
        for (size_t i = 0; i < len; i += 8) sum += *(volatile uint64_t *)(p + i);
        double tr = now() - t1;
        printf("    dc civac + doc       : %8.1f MB/s  (so voi ~125 MB/s qua /dev/mem Device memory)  [sum=%llu]\n", (double)len / tr / 1e6, (unsigned long long)sum);
        uint64_t bad = 0; for (size_t i = 0; i < len; i += 8) if (*(volatile uint64_t *)(p + i) != i) bad++;
        printf("    kiem tra du lieu doc lai: %s\n", bad ? "SAI" : "DUNG");
        if (pm >= 0) close(pm);
        munmap(p, len); close((int)a.fd);
        break;
    }
    printf("\n[4] udmabuf (neu da cai driver u-dma-buf):\n");
    int found = 0; { DIR *d2 = opendir("/dev"); struct dirent *e; if (d2) { while ((e = readdir(d2))) if (!strncmp(e->d_name, "udmabuf", 7)) { printf("  /dev/%s\n", e->d_name); found = 1; } closedir(d2); } }
    if (!found) printf("  khong co /dev/udmabuf*\n");

    printf("\nKET LUAN: %s\n", rc_any == 0 ?
           "CO cach lay vung CMA cacheable lien tuc <4 GB bang dma-heap - co the nang cap driver dung vung nay (khong can sua device-tree)." :
           "dma-heap KHONG dung duoc -> huong con lai: them reserved-memory (khong no-map) vao device-tree, hoac udmabuf. Gui lai log nay.");
    return rc_any;
}
