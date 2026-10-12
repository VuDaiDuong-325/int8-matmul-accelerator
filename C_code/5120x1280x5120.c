#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <time.h>
#include <sys/time.h>

// =========================================================================
// HARDWARE ADDRESS DEFINITIONS
// =========================================================================
#define GEMM_CTRL_BASE   0xA0000000
#define MAP_SIZE_REG     0x1000

// ─────────────────────────────────────────────────────────────────────────
// DDR layout cho KV260 board có ~2 GB DDR (MemTotal ~1.9 GB).
//
// Vùng 0x60000000 (1.5 GB offset) nằm xa vùng Linux heap thông thường
// và thường được PetaLinux device tree dùng cho PL/CMA.
//
// Nếu vẫn treo: chạy lệnh sau trên board để tìm vùng reserved chính xác:
//   sudo cat /proc/iomem | grep -v "System RAM\|Kernel\|reserved"
//   sudo xxd /proc/device-tree/reserved-memory/ 2>/dev/null | head
// ─────────────────────────────────────────────────────────────────────────
#define MEM_TX_A_ADDR    0x63800000   // reserved region (0x63800000-0x777FFFFF, 320 MB)
#define MEM_TX_B_ADDR    0x64000000   // +8 MB
#define MEM_RX_C_ADDR    0x64800000   // +8 MB (C needs 25 MB, mapped 32 MB)
#define MAP_SIZE_A       0x00800000   // 8 MB
#define MAP_SIZE_B       0x00800000   // 8 MB
#define MAP_SIZE_C       0x02000000   // 32 MB

// =========================================================================
// MATRIX DIMENSIONS
// =========================================================================
#define M_TOTAL          5120
#define K_TOTAL          1280
#define N_TOTAL          5120

#define K_BLK            256
#define K_DIM            32
#define NUM_K_TILES      (K_BLK / K_DIM)   // = 8

#define SCALE_SHIFT      8
#define ZERO_POINT       0

#define REG_M_TOTAL      0
#define REG_N_TOTAL      1
#define REG_K_TOTAL      2
#define REG_K_DIM        3
#define REG_NUM_KT       4
#define REG_BASE_A       5
#define REG_BASE_B       6
#define REG_BASE_C       7
#define REG_N_STRIDE     8
#define REG_SCALE_SH     9
#define REG_ZERO_PT      10
#define REG_CTRL_STAT    11

double get_time() {
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return (double)tv.tv_sec + (double)tv.tv_usec / 1000000.0;
}

int main()
{
    printf("==============================================================\n");
    printf("  INT8 GEMM BENCHMARK: CPU vs NPU (KV260 Zynq UltraScale+)\n");
    printf("  A[%dx%d] x B[%dx%d] = C[%dx%d]\n",
           M_TOTAL, K_TOTAL, K_TOTAL, N_TOTAL, M_TOTAL, N_TOTAL);
    printf("==============================================================\n\n");

    double ops_total = 2.0 * (double)M_TOTAL * K_TOTAL * N_TOTAL;
    printf("  Total MACs = 2 x %d x %d x %d = %.4e ops\n\n",
           M_TOTAL, K_TOTAL, N_TOTAL, ops_total);

    // ─────────────────────────────────────────────────────────────────────
    // PRE-CHECK: Verify DDR regions trước khi dùng
    // ─────────────────────────────────────────────────────────────────────
    printf("[PRE-CHECK] System memory & DDR regions...\n");
    FILE *mf = fopen("/proc/meminfo","r");
    if (mf) {
        char line[256];
        while (fgets(line,sizeof(line),mf))
            if (!strncmp(line,"MemTotal",8)||!strncmp(line,"MemFree",7))
                printf("  %s", line);
        fclose(mf);
    }

    int fd = open("/dev/mem", O_RDWR | O_SYNC);
    if (fd < 0) { perror("[ERR] /dev/mem"); return -1; }

    // Test từng vùng: mmap → ghi nhiều bytes → đọc lại → unmap
    printf("  DDR region test (4KB probe each):\n");
    uint32_t regions[][2] = {
        {MEM_TX_A_ADDR, MAP_SIZE_A},
        {MEM_TX_B_ADDR, MAP_SIZE_B},
        {MEM_RX_C_ADDR, MAP_SIZE_C},
    };
    const char *rnames[] = {"A-buf","B-buf","C-buf"};
    for (int r = 0; r < 3; r++) {
        uint32_t base = regions[r][0];
        uint32_t sz   = regions[r][1];
        void *p = mmap(NULL, sz, PROT_READ|PROT_WRITE, MAP_SHARED, fd, base);
        if (p == MAP_FAILED) {
            printf("  [ERR] %-6s 0x%08X mmap failed: %s\n",
                   rnames[r], base, strerror(errno));
            printf("\n  => Địa chỉ DDR không hợp lệ! Sửa MEM_TX_*_ADDR.\n");
            return -1;
        }
        // Ghi và đọc lại 4KB để đảm bảo vùng thực sự writable (không chỉ 1 byte)
        volatile uint8_t *vp = (volatile uint8_t *)p;
        for (int i = 0; i < 4096; i++) vp[i] = (uint8_t)(i & 0xFF);
        __sync_synchronize();
        int ok = 1;
        for (int i = 0; i < 4096; i++)
            if (vp[i] != (uint8_t)(i & 0xFF)) { ok = 0; break; }
        memset(p, 0, sz);  // Clear vùng
        munmap(p, sz);
        if (!ok) {
            printf("  [ERR] %-6s 0x%08X readback mismatch!\n", rnames[r], base);
            return -1;
        }
        printf("  [OK]  %-6s 0x%08X – 0x%08X (%2d MB) r/w verified\n",
               rnames[r], base, base+sz, sz>>20);
    }
    printf("  All DDR regions OK.\n\n");

    // ─────────────────────────────────────────────────────────────────────
    // PHÂN BỔ BỘ NHỚ
    // ─────────────────────────────────────────────────────────────────────
    printf("[INIT] Allocating CPU buffers (A=%.1f MB, B=%.1f MB, C×2=%.1f MB)...\n",
           (double)M_TOTAL*K_TOTAL/1024/1024,
           (double)K_TOTAL*N_TOTAL/1024/1024,
           (double)M_TOTAL*N_TOTAL*2/1024/1024);

    int8_t *A     = (int8_t*)malloc((size_t)M_TOTAL * K_TOTAL);
    int8_t *B     = (int8_t*)malloc((size_t)K_TOTAL * N_TOTAL);
    // [FIX CPU] B_T: transpose của B để inner loop access theo hàng (cache-friendly)
    int8_t *B_T   = (int8_t*)malloc((size_t)N_TOTAL * K_TOTAL);
    int8_t *C_cpu = (int8_t*)malloc((size_t)M_TOTAL * N_TOTAL);
    int8_t *C_npu = (int8_t*)malloc((size_t)M_TOTAL * N_TOTAL);
    if (!A||!B||!B_T||!C_cpu||!C_npu) {
        printf("[ERR] malloc failed\n"); return -1;
    }

    // Khởi tạo A, B với seed cố định
    srand(42);
    for (int i = 0; i < M_TOTAL * K_TOTAL; i++) A[i] = (int8_t)((rand()%15)-7);
    for (int i = 0; i < K_TOTAL * N_TOTAL; i++) B[i] = (int8_t)((rand()%15)-7);

    // [FIX CPU] Transpose B: B[k][n] → B_T[n][k]
    // B_T layout: B_T[n * K_TOTAL + k] = B[k * N_TOTAL + n]
    // Inner loop sẽ đọc B_T[n*K_TOTAL + k] liên tục → sequential → cache hit
    for (int k = 0; k < K_TOTAL; k++)
        for (int n = 0; n < N_TOTAL; n++)
            B_T[n * K_TOTAL + k] = B[k * N_TOTAL + n];

    memset(C_cpu, 0, (size_t)M_TOTAL * N_TOTAL);
    memset(C_npu, 0, (size_t)M_TOTAL * N_TOTAL);
    printf("[INIT] Done.\n\n");

    // =========================================================================
    // PHASE 1: CPU BENCHMARK (với B đã transpose → cache-friendly)
    // =========================================================================
    printf("------------------------------------------------------------\n");
    printf("PHASE 1: CPU  (ARM Cortex-A53 @ 1.333 GHz, 1 thread, -O2)\n");
    printf("         [Optimized: B transposed for cache-friendly access]\n");
    printf("------------------------------------------------------------\n");
    printf("  Running full %dx%dx%d GEMM + rescale...\n",
           M_TOTAL, K_TOTAL, N_TOTAL);
    printf("  (Expected ~60-180 seconds)\n\n");
    fflush(stdout);

    double t_cpu_start = get_time();
    int bar = 50;

    for (int m = 0; m < M_TOTAL; m++) {
        if (m % 64 == 0 || m == M_TOTAL-1) {
            float prog = (float)(m+1)/M_TOTAL;
            int pos = (int)(bar*prog);
            printf("  [CPU] [");
            for (int i=0;i<bar;i++)
                printf("%c", i<pos?'=':(i==pos?'>':' '));
            printf("] %5.1f%% | %.0f s\r",
                   prog*100.0f, get_time()-t_cpu_start);
            fflush(stdout);
        }

        const int8_t *row_A = &A[m * K_TOTAL];
        for (int n = 0; n < N_TOTAL; n++) {
            // [FIX] Dùng B_T: cả row_A và row_BT đều sequential → L1 cache hit
            const int8_t *row_BT = &B_T[n * K_TOTAL];
            int32_t sum = 0;
            for (int k = 0; k < K_TOTAL; k++)
                sum += (int32_t)row_A[k] * (int32_t)row_BT[k];

            int64_t rnd = (int64_t)sum + (1LL << (SCALE_SHIFT-1));
            int64_t shr = rnd >> SCALE_SHIFT;
            int64_t zp  = shr + ZERO_POINT;
            C_cpu[m*N_TOTAL+n] = (zp>127)?127:(zp<-128)?-128:(int8_t)zp;
        }
    }

    printf("\n");
    double t_cpu_ms = (get_time()-t_cpu_start)*1000.0;
    double cpu_gops = ops_total/(t_cpu_ms/1000.0)/1e9;
    printf("  [v] CPU Done.\n");
    printf("    Time       : %.2f ms  (%.2f s)\n", t_cpu_ms, t_cpu_ms/1000.0);
    printf("    Throughput : %.4f GOPS\n\n", cpu_gops);

    // =========================================================================
    // PHASE 2: NPU BENCHMARK
    // =========================================================================
    printf("------------------------------------------------------------\n");
    printf("PHASE 2: NPU  (FPGA PL - INT8 Systolic Array 16x16, AXI DMA)\n");
    printf("------------------------------------------------------------\n");

    // Map registers và DDR buffers (mmap thực sự, giữ đến khi xong)
    volatile uint32_t *gemm_regs =
        (volatile uint32_t*)mmap(NULL,MAP_SIZE_REG,
            PROT_READ|PROT_WRITE,MAP_SHARED,fd,GEMM_CTRL_BASE);
    int8_t *v_A = (int8_t*)mmap(NULL,MAP_SIZE_A,
        PROT_READ|PROT_WRITE,MAP_SHARED,fd,MEM_TX_A_ADDR);
    int8_t *v_B = (int8_t*)mmap(NULL,MAP_SIZE_B,
        PROT_READ|PROT_WRITE,MAP_SHARED,fd,MEM_TX_B_ADDR);
    int8_t *v_C = (int8_t*)mmap(NULL,MAP_SIZE_C,
        PROT_READ|PROT_WRITE,MAP_SHARED,fd,MEM_RX_C_ADDR);

    if (gemm_regs==MAP_FAILED||v_A==MAP_FAILED||
        v_B==MAP_FAILED||v_C==MAP_FAILED) {
        perror("[ERR] mmap phase2"); return -1;
    }

    // Copy A, B (layout gốc, không transpose) vào DDR — dùng cho NPU
    printf("  Copying A (%.1f MB) → DDR 0x%08X ...\n",
           (double)M_TOTAL*K_TOTAL/1024/1024, MEM_TX_A_ADDR);
    memcpy(v_A, A, (size_t)M_TOTAL*K_TOTAL);

    printf("  Copying B (%.1f MB) → DDR 0x%08X ...\n",
           (double)K_TOTAL*N_TOTAL/1024/1024, MEM_TX_B_ADDR);
    memcpy(v_B, B, (size_t)K_TOTAL*N_TOTAL);

    memset(v_C, 0, (size_t)M_TOTAL*N_TOTAL);
    __sync_synchronize();
    printf("  Copy done.\n");

    // Configure NPU registers
    gemm_regs[REG_M_TOTAL]  = M_TOTAL;
    gemm_regs[REG_N_TOTAL]  = N_TOTAL;
    gemm_regs[REG_K_TOTAL]  = K_TOTAL;
    gemm_regs[REG_K_DIM]    = K_DIM;
    gemm_regs[REG_NUM_KT]   = NUM_K_TILES;
    gemm_regs[REG_BASE_A]   = MEM_TX_A_ADDR;
    gemm_regs[REG_BASE_B]   = MEM_TX_B_ADDR;
    gemm_regs[REG_BASE_C]   = MEM_RX_C_ADDR;
    gemm_regs[REG_N_STRIDE] = N_TOTAL;
    gemm_regs[REG_SCALE_SH] = SCALE_SHIFT;
    gemm_regs[REG_ZERO_PT]  = ZERO_POINT;
    __sync_synchronize();

    printf("  Starting NPU...\n\n");
    fflush(stdout);

    double t_npu_start = get_time();
    gemm_regs[REG_CTRL_STAT] = 0x1;

    uint32_t ctrl_stat;
    int poll_cnt = 0;
    do {
        ctrl_stat = gemm_regs[REG_CTRL_STAT];
        if (++poll_cnt % 5000000 == 0) {
            printf("  [NPU] Running... %.1f s\r", get_time()-t_npu_start);
            fflush(stdout);
        }
    } while (ctrl_stat & 0x2);
    __sync_synchronize();

    double t_npu_ms = (get_time()-t_npu_start)*1000.0;
    double npu_gops = ops_total/(t_npu_ms/1000.0)/1e9;
    printf("  [NPU] Done!                              \n\n");
    printf("  [v] NPU Done.\n");
    printf("    Time       : %.2f ms  (%.3f s)\n", t_npu_ms, t_npu_ms/1000.0);
    printf("    Throughput : %.4f GOPS\n\n", npu_gops);

    memcpy(C_npu, v_C, (size_t)M_TOTAL*N_TOTAL);
    __sync_synchronize();

    // =========================================================================
    // ACCURACY CHECK — Full matrix
    // =========================================================================
    printf("------------------------------------------------------------\n");
    printf("ACCURACY CHECK: C_npu vs C_cpu (full %dx%d = %lld elements)\n",
           M_TOTAL, N_TOTAL, (long long)M_TOTAL*N_TOTAL);
    printf("------------------------------------------------------------\n");

    long long errors = 0;
    int max_diff = 0;
    for (long long i = 0; i < (long long)M_TOTAL*N_TOTAL; i++) {
        int diff = abs((int)C_npu[i]-(int)C_cpu[i]);
        if (diff > 0) errors++;
        if (diff > max_diff) max_diff = diff;
    }
    double error_rate = 100.0*errors/((long long)M_TOTAL*N_TOTAL);
    printf("  Total elements : %lld\n", (long long)M_TOTAL*N_TOTAL);
    printf("  Mismatches     : %lld  (%.4f%%)\n", errors, error_rate);
    printf("  Max diff       : %d\n", max_diff);
    printf("  Result         : %s\n\n",
           errors==0?"[PASS] NPU matches CPU exactly!":
                     "[FAIL] Mismatch detected!");

    // =========================================================================
    // PERFORMANCE SUMMARY
    // =========================================================================
    double speedup = t_cpu_ms / t_npu_ms;

    printf("\n");
    printf("+----------------------------------------------------------+\n");
    printf("|        PERFORMANCE COMPARISON - %dx%dx%d         |\n",
           M_TOTAL, K_TOTAL, N_TOTAL);
    printf("+--------------------------+---------------+---------------+\n");
    printf("| Metric                   |      CPU      |      NPU      |\n");
    printf("|                          |  (A53 scalar) | (FPGA PL INT8)|\n");
    printf("+--------------------------+---------------+---------------+\n");
    printf("| Execution Time (ms)      | %13.2f | %13.2f |\n",
           t_cpu_ms, t_npu_ms);
    printf("| Execution Time (s)       | %13.2f | %13.3f |\n",
           t_cpu_ms/1000.0, t_npu_ms/1000.0);
    printf("| Throughput (GOPS)        | %13.4f | %13.4f |\n",
           cpu_gops, npu_gops);
    printf("+--------------------------+---------------+---------------+\n");
    printf("| Speedup  (NPU / CPU)     |         %.2fx               |\n",
           speedup);
    printf("| Accuracy                 | %-31s |\n",
           errors==0?"PASSED (exact match)":"FAILED");
    printf("+--------------------------+-------------------------------+\n");
    printf("\n");
    printf("  Platform : KV260 (Zynq UltraScale+ ZU5EV, 2 GB DDR)\n");
    printf("  CPU      : ARM Cortex-A53 @ 1.333 GHz, 1 thread, -O2\n");
    printf("             B transposed in memory for cache efficiency\n");
    printf("  NPU      : 16x16 INT8 Systolic Array, AXI DMA\n");
    printf("             K_BLK=%d, K_DIM=%d, %d K-blocks/tile\n",
           K_BLK, K_DIM, K_TOTAL/K_BLK);
    printf("  DDR PL   : A@0x%08X  B@0x%08X  C@0x%08X\n",
           MEM_TX_A_ADDR, MEM_TX_B_ADDR, MEM_RX_C_ADDR);
    printf("  Total ops: %.4e  (2 x M x K x N)\n\n", ops_total);

    // Export binaries
    FILE *fc = fopen("output_C_cpu.bin","wb");
    FILE *fn = fopen("output_C_npu.bin","wb");
    if (fc) { fwrite(C_cpu,1,(size_t)M_TOTAL*N_TOTAL,fc); fclose(fc); }
    if (fn) { fwrite(C_npu,1,(size_t)M_TOTAL*N_TOTAL,fn); fclose(fn); }
    printf("  Binary outputs: output_C_cpu.bin  output_C_npu.bin\n");

    munmap((void*)gemm_regs,MAP_SIZE_REG);
    munmap(v_A,MAP_SIZE_A); munmap(v_B,MAP_SIZE_B); munmap(v_C,MAP_SIZE_C);
    free(A); free(B); free(B_T); free(C_cpu); free(C_npu);
    close(fd);
    return 0;
}