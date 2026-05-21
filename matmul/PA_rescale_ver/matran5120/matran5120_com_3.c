#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <time.h>
#include <sys/time.h>

// ==========================================
// 1. HARDWARE ADDRESS DEFINITIONS
// ==========================================
#define DMA0_BASE_ADDR 0xB0000000
#define DMA1_BASE_ADDR 0xB0010000
#define GPIO0_BASE     0xA0000000
#define GPIO1_BASE     0xA0010000

#define MEM_TX_A_ADDR  0x1E000000
#define MEM_TX_B_ADDR  0x1E100000
#define MEM_RX_C_ADDR  0x1E200000

#define MAP_SIZE 0x10000UL
#define MAP_MASK (MAP_SIZE - 1)

// ==========================================
// 2. MATRIX DIMENSIONS (5120 x 1280 x 5120)
// ==========================================
#define M_TOTAL 5120
#define K_TOTAL 1280
#define N_TOTAL 5120
#define M_TILE  16
#define N_TILE  16

#define K_DIM        32
#define NUM_K_TILES  (K_TOTAL / K_DIM)   // = 1280 / 32 = 40 tiles

#define SCALE_SHIFT  10
#define ZERO_POINT   0

// ==========================================
// 3. DMA REGISTER OFFSETS (Xilinx AXI DMA)
// ==========================================
#define MM2S_CR     0x00
#define MM2S_SR     0x04
#define MM2S_SA     0x18
#define MM2S_LENGTH 0x28
#define S2MM_CR     0x30
#define S2MM_SR     0x34
#define S2MM_DA     0x48
#define S2MM_LENGTH 0x58

#define GPIO_CH1    0x00
#define GPIO_CH2    0x08

#define POLL_TIMEOUT 10000000

#define POLL_WAIT(base, off, bit, label)                              \
    do {                                                               \
        volatile int _to = POLL_TIMEOUT;                              \
        while (!(reg_read((base), (off)) & (bit)) && _to-- > 0);     \
        if (_to <= 0) {                                               \
            printf("\n[ERR] DMA TIMEOUT at %s:%d\n", __FILE__, __LINE__); \
            goto label;                                               \
        }                                                             \
    } while (0)

static inline void reg_write(void *base, int off, uint32_t v) {
    *((volatile uint32_t *)((char *)base + off)) = v;
}
static inline uint32_t reg_read(void *base, int off) {
    return *((volatile uint32_t *)((char *)base + off));
}

// ==========================================
// 4. FILE EXPORT
// ==========================================
static void dump_int8(const char *fname, const int8_t *mat, int rows, int cols) {
    FILE *f = fopen(fname, "w");
    if (!f) { printf("Cannot open %s\n", fname); return; }
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++)
            fprintf(f, "%d ", mat[i * cols + j]);
        fprintf(f, "\n");
    }
    fclose(f);
}

// Hàm hiển thị thanh tiến độ cho CPU
static void print_progress(int current, int total) {
    int width = 50; 
    float progress = (float)current / total;
    int filled = width * progress;
    printf("\r[CPU Baseline Progress] [");
    for (int i = 0; i < width; i++) {
        if (i < filled) printf("=");
        else if (i == filled) printf(">");
        else printf(" ");
    }
    printf("] %d%%", (int)(progress * 100));
    fflush(stdout);
}

// ==========================================
// 5. MAIN
// ==========================================
int main(void) {
    int fd = open("/dev/mem", O_RDWR | O_SYNC);
    if (fd < 0) { perror("Cannot open /dev/mem"); return -1; }

    // Cấp phát tĩnh trong vùng nhớ BSS để tránh tràn Stack của Linux
    static int8_t master_A[M_TOTAL][K_TOTAL];
    static int8_t master_B[K_TOTAL][N_TOTAL];
    static int8_t cpu_C[M_TOTAL][N_TOTAL];  
    static int8_t hw_C[M_TOTAL][N_TOTAL];   

    struct timeval sys_start, sys_end, hw_start, hw_end;
    struct timeval cpu_start, cpu_end; 
    double hw_pure_us = 0.0, sys_total_ms = 0.0, cpu_total_ms = 0.0;

    srand(time(NULL));
    printf("[1/4] Generating random INT8 data (A: %dx%d, B: %dx%d)... ", M_TOTAL, K_TOTAL, K_TOTAL, N_TOTAL);
    fflush(stdout);
    for (int i = 0; i < M_TOTAL; i++)
        for (int j = 0; j < K_TOTAL; j++)
            master_A[i][j] = (int8_t)((rand() % 256) - 128);
    for (int i = 0; i < K_TOTAL; i++)
        for (int j = 0; j < N_TOTAL; j++)
            master_B[i][j] = (int8_t)((rand() % 256) - 128);
    printf("Done.\n");

    // ──────────────────────────────────────────────────────────────
    // ĐÃ ĐẢO LÊN TRƯỚC: CHẠY TRÊN NPU (GIỮ NGUYÊN KIẾN TRÚC TILING)
    // ──────────────────────────────────────────────────────────────
    void *dma0  = mmap(0, MAP_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd, DMA0_BASE_ADDR & ~MAP_MASK);
    void *dma1  = mmap(0, MAP_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd, DMA1_BASE_ADDR & ~MAP_MASK);
    void *gpio0 = mmap(0, MAP_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd, GPIO0_BASE     & ~MAP_MASK);
    void *gpio1 = mmap(0, MAP_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd, GPIO1_BASE     & ~MAP_MASK);

    int8_t *tx_a = (int8_t *)mmap(0, MAP_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd, MEM_TX_A_ADDR & ~MAP_MASK);
    int8_t *tx_b = (int8_t *)mmap(0, MAP_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd, MEM_TX_B_ADDR & ~MAP_MASK);
    int8_t *rx_c = (int8_t *)mmap(0, MAP_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd, MEM_RX_C_ADDR & ~MAP_MASK);

    // Reset DMA
    reg_write(dma0, MM2S_CR, 4); reg_write(dma1, MM2S_CR, 4); reg_write(dma1, S2MM_CR, 4);
    usleep(1000);
    reg_write(dma0, MM2S_CR, 1); reg_write(dma1, MM2S_CR, 1); reg_write(dma1, S2MM_CR, 1);

    // Config NPU qua GPIO
    reg_write(gpio0, GPIO_CH1, (uint32_t)K_DIM);
    reg_write(gpio0, GPIO_CH2, (uint32_t)NUM_K_TILES);
    reg_write(gpio1, GPIO_CH1, (uint32_t)SCALE_SHIFT);
    reg_write(gpio1, GPIO_CH2, (uint32_t)(uint8_t)ZERO_POINT);

    const uint32_t bytes_a = (uint32_t)(M_TILE * K_DIM  * sizeof(int8_t));
    const uint32_t bytes_b = (uint32_t)(K_DIM  * N_TILE * sizeof(int8_t));
    const uint32_t bytes_c = (uint32_t)(M_TILE * N_TILE * sizeof(int8_t));

    int8_t buf_a[M_TILE * K_DIM];
    int8_t buf_b[K_DIM  * N_TILE];
    int8_t buf_c[M_TILE * N_TILE];

    printf("[2/4] Running NPU: Tiling execution | K_DIM=%d | TILES=%d | SHIFT=%d\n",
           K_DIM, NUM_K_TILES, SCALE_SHIFT);

    gettimeofday(&sys_start, NULL);

    for (int m = 0; m < M_TOTAL; m += M_TILE) {
        for (int n = 0; n < N_TOTAL; n += N_TILE) {

            reg_write(dma1, S2MM_SR,     0x1000);           
            reg_write(dma1, S2MM_DA,     (uint32_t)MEM_RX_C_ADDR);
            reg_write(dma1, S2MM_LENGTH, bytes_c);          

            for (int t = 0; t < NUM_K_TILES; t++) {
                int k_off = t * K_DIM;

                int idx = 0;
                for (int k = k_off; k < k_off + K_DIM; k++)
                    for (int i = 0; i < M_TILE; i++)
                        buf_a[idx++] = master_A[m + i][k];

                idx = 0;
                for (int k = k_off; k < k_off + K_DIM; k++) {
                    memcpy(&buf_b[idx], &master_B[k][n], N_TILE);
                    idx += N_TILE;
                }

                memcpy(tx_a, buf_a, bytes_a);
                memcpy(tx_b, buf_b, bytes_b);

                gettimeofday(&hw_start, NULL);

                reg_write(dma1, MM2S_SR,     0x1000);
                reg_write(dma0, MM2S_SR,     0x1000);
                reg_write(dma1, MM2S_SA,     (uint32_t)MEM_TX_A_ADDR);
                reg_write(dma0, MM2S_SA,     (uint32_t)MEM_TX_B_ADDR);
                reg_write(dma1, MM2S_LENGTH, bytes_a);  
                reg_write(dma0, MM2S_LENGTH, bytes_b);  

                POLL_WAIT(dma1, MM2S_SR, 0x1000, dma_error);
                POLL_WAIT(dma0, MM2S_SR, 0x1000, dma_error);

                gettimeofday(&hw_end, NULL);
                hw_pure_us += (hw_end.tv_sec  - hw_start.tv_sec)  * 1e6
                            + (hw_end.tv_usec - hw_start.tv_usec);
            }

            gettimeofday(&hw_start, NULL);

            POLL_WAIT(dma1, S2MM_SR, 0x1000, dma_error);

            gettimeofday(&hw_end, NULL);
            hw_pure_us += (hw_end.tv_sec  - hw_start.tv_sec)  * 1e6
                        + (hw_end.tv_usec - hw_start.tv_usec);

            memcpy(buf_c, rx_c, bytes_c);

            for (int i = 0; i < M_TILE; i++)
                memcpy(&hw_C[m + i][n], &buf_c[i * N_TILE], N_TILE);
        }
    }

    gettimeofday(&sys_end, NULL);
    sys_total_ms = (sys_end.tv_sec  - sys_start.tv_sec)  * 1000.0
                 + (sys_end.tv_usec - sys_start.tv_usec) / 1000.0;
    printf("NPU Execution Done.\n\n");


    // ──────────────────────────────────────────────────────────────
    // ĐÃ ĐẢO XUỐNG SAU: CHẠY NHÂN MA TRẬN TRÊN CPU (CÓ TIẾN ĐỘ)
    // ──────────────────────────────────────────────────────────────
    printf("[3/4] Running CPU Baseline Matrix Multiplication (33.5 Billion MACs)...\n");
    gettimeofday(&cpu_start, NULL);

    for (int i = 0; i < M_TOTAL; i++) {
        // Cập nhật tiến độ mỗi 40 dòng để cân bằng hiệu năng hiển thị
        if (i % 40 == 0 || i == M_TOTAL - 1) {
            print_progress(i + 1, M_TOTAL);
        }

        for (int j = 0; j < N_TOTAL; j++) {
            int32_t acc = 0;
            for (int k = 0; k < K_TOTAL; k++) {
                acc += (int32_t)master_A[i][k] * (int32_t)master_B[k][j];
            }

            // --- MÔ PHỎNG CHÍNH XÁC PIPELINE RESCALE CỦA PHẦN CỨNG ---
            int64_t w_ext = (int64_t)acc; 
            int64_t round_bias = 0;
            if (SCALE_SHIFT > 0) {
                round_bias = (int64_t)1 << (SCALE_SHIFT - 1); 
            }
            int64_t w_rnd = w_ext + round_bias;
            int64_t w_shr = w_rnd >> SCALE_SHIFT; 
            int64_t w_zp  = w_shr + (int64_t)(int8_t)ZERO_POINT; 

            // Khâu bão hòa dữ liệu (Saturate clamp -> INT8)
            if (w_zp > 127) {
                cpu_C[i][j] = 127;
            } else if (w_zp < -128) {
                cpu_C[i][j] = -128;
            } else {
                cpu_C[i][j] = (int8_t)w_zp;
            }
        }
    }
    gettimeofday(&cpu_end, NULL);
    cpu_total_ms = (cpu_end.tv_sec  - cpu_start.tv_sec)  * 1000.0
                 + (cpu_end.tv_usec - cpu_start.tv_usec) / 1000.0;
    printf("\nCPU Baseline Done in %.3f ms.\n\n", cpu_total_ms);


    // --- KIỂM TRA ĐỘ CHÍNH XÁC ---
    int errors = 0;
    for (int i = 0; i < M_TOTAL; i++) {
        for (int j = 0; j < N_TOTAL; j++) {
            if (cpu_C[i][j] != hw_C[i][j]) {
                errors++;
            }
        }
    }

    // ──────────────────────────────────────────────────────────────
    // IN BÁO CÁO HIỆU NĂNG CHO MA TRẬN LỚN
    // ──────────────────────────────────────────────────────────────
    printf("\n==================================================\n");
    printf(">> PERFORMANCE & ACCURACY COMPARISON REPORT <<\n");
    printf("==================================================\n");
    printf("Matrix Size               : %d x %d x %d (INT8)\n", M_TOTAL, K_TOTAL, N_TOTAL);
    printf("1. Pure NPU Hardware Time : %.3f ms\n", hw_pure_us / 1000.0);
    printf("2. Total NPU System Time  : %.3f ms (Includes Linux overhead/driver)\n", sys_total_ms);
    printf("3. CPU Execution Time     : %.3f ms\n", cpu_total_ms);
    printf("--------------------------------------------------\n");
    printf(">> SPEEDUP (Pure Hardware) : %.2fx FASTER than CPU\n", cpu_total_ms / (hw_pure_us / 1000.0));
    printf(">> SPEEDUP (Total System)  : %.2fx FASTER than CPU\n", cpu_total_ms / sys_total_ms);
    printf("--------------------------------------------------\n");
    if (errors == 0) {
        printf(">> ACCURACY CHECK         : [PASSED] NPU outputs perfectly match CPU!\n");
    } else {
        printf(">> ACCURACY CHECK         : [FAILED] Mismatch found at %d/%d positions!\n", errors, M_TOTAL * N_TOTAL);
    }
    printf("==================================================\n\n");

    printf("[4/4] Exporting files for verification... ");
    fflush(stdout);
    dump_int8("input_A5120x1280.txt",      (int8_t *)master_A, M_TOTAL, K_TOTAL);
    dump_int8("input_B1280x5120.txt",      (int8_t *)master_B, K_TOTAL, N_TOTAL);
    dump_int8("output_C5120x5120_CPU.txt", (int8_t *)cpu_C,    M_TOTAL, N_TOTAL);
    dump_int8("output_C5120x5120_NPU.txt", (int8_t *)hw_C,     M_TOTAL, N_TOTAL);
    printf("Done.\n");

    munmap(gpio0, MAP_SIZE); munmap(gpio1, MAP_SIZE);
    munmap(dma0,  MAP_SIZE); munmap(dma1,  MAP_SIZE);
    munmap(tx_a,  MAP_SIZE); munmap(tx_b,  MAP_SIZE); munmap(rx_c, MAP_SIZE);
    close(fd);
    return 0;

dma_error:
    printf("[ERR] Aborting due to DMA timeout.\n");
    munmap(gpio0, MAP_SIZE); munmap(gpio1, MAP_SIZE);
    munmap(dma0,  MAP_SIZE); munmap(dma1,  MAP_SIZE);
    munmap(tx_a,  MAP_SIZE); munmap(tx_b,  MAP_SIZE); munmap(rx_c, MAP_SIZE);
    close(fd);
    return -1;
}