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
// 2. MATRIX DIMENSIONS
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

#define POLL_WAIT(base, off, bit, label)                                       \
    do {                                                                       \
        volatile int _to = POLL_TIMEOUT;                                       \
        while (!(reg_read((base), (off)) & (bit)) && _to-- > 0);               \
        if (_to <= 0) {                                                        \
            printf("\n[ERR] DMA TIMEOUT at %s:%d\n", __FILE__, __LINE__);      \
            goto label;                                                        \
        }                                                                      \
    } while (0)

static inline void reg_write(void *base, int off, uint32_t v) {
    *((volatile uint32_t *)((char *)base + off)) = v;
}
static inline uint32_t reg_read(void *base, int off) {
    return *((volatile uint32_t *)((char *)base + off));
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
// 4. MAIN
// ==========================================
int main(void) {
    int fd = open("/dev/mem", O_RDWR | O_SYNC);
    if (fd < 0) { perror("Cannot open /dev/mem"); return -1; }

    // Cấp phát tĩnh trong vùng nhớ BSS để tránh tràn Stack của Linux
    int8_t (*master_A)[K_TOTAL] = malloc(sizeof(int8_t[M_TOTAL][K_TOTAL]));
    int8_t (*master_B)[N_TOTAL] = malloc(sizeof(int8_t[K_TOTAL][N_TOTAL]));
    int8_t (*cpu_C)[N_TOTAL]    = malloc(sizeof(int8_t[M_TOTAL][N_TOTAL]));  
    int8_t (*hw_C)[N_TOTAL]     = malloc(sizeof(int8_t[M_TOTAL][N_TOTAL]));

    if (!master_A || !master_B || !cpu_C || !hw_C) {
        printf("[ERR] Không đủ bộ nhớ (RAM) để cấp phát ma trận!\n");
        return -1;
    }

    struct timeval sys_start, sys_end;
    struct timeval cpu_start, cpu_end; 
    struct timeval t_start, t_end;

    // Biến lưu trữ tổng thời gian cấu trúc vi mô (Micro-benchmarks)
    double t_sw_prep_us = 0.0;
    double t_dma_tx_us  = 0.0;
    double t_dma_rx_us  = 0.0;
    double t_sw_post_us = 0.0;
    double cpu_total_ms = 0.0;
    double sys_total_ms = 0.0;

    // ──────────────────────────────────────────────────────────────
    // ĐỌC DỮ LIỆU INPUT TỪ FILE BINARY (.bin)
    // ──────────────────────────────────────────────────────────────
    printf("[1/4] Loading INT8 data from binary files... ");
    fflush(stdout);

    // Đọc file input_A_5120x1280.bin
    FILE *f_a = fopen("input_A_fc1_5120x1280.bin", "rb");
    if (!f_a) {
        perror("\n[ERR] Cannot open input_A_5120x1280.bin");
        close(fd); return -1;
    }
    size_t read_a = fread(master_A, sizeof(int8_t), M_TOTAL * K_TOTAL, f_a);
    fclose(f_a);
    if (read_a != M_TOTAL * K_TOTAL) {
        printf("\n[ERR] input_A_5120x1280.bin bị lỗi kích thước hoặc thiếu dữ liệu!\n");
        close(fd); return -1;
    }

    // Đọc file input_B_1280x5120.bin
    FILE *f_b = fopen("input_B_fc1_1280x5120.bin", "rb");
    if (!f_b) {
        perror("\n[ERR] Cannot open input_B_1280x5120.bin");
        close(fd); return -1;
    }
    size_t read_b = fread(master_B, sizeof(int8_t), K_TOTAL * N_TOTAL, f_b);
    fclose(f_b);
    if (read_b != K_TOTAL * N_TOTAL) {
        printf("\n[ERR] input_B_1280x5120.bin bị lỗi kích thước hoặc thiếu dữ liệu!\n");
        close(fd); return -1;
    }
    printf("Done. Loaded %d bytes successfully.\n", (int)(read_a + read_b));

    // ──────────────────────────────────────────────────────────────
    // CHẠY MA TRẬN TRÊN CPU LÀM BASELINE ĐỐI CHIẾU 
    // ──────────────────────────────────────────────────────────────
    printf("[2/4] Running CPU Baseline Matrix Multiplication (33.5 Billion MACs)...\n");
    gettimeofday(&cpu_start, NULL);

    for (int i = 0; i < M_TOTAL; i++) {
        // Cập nhật tiến độ mỗi 40 dòng để cân bằng hiệu năng hiển thị cho ma trận lớn
        if (i % 40 == 0 || i == M_TOTAL - 1) {
            print_progress(i + 1, M_TOTAL);
        }

        for (int j = 0; j < N_TOTAL; j++) {
            int32_t acc = 0;
            for (int k = 0; k < K_TOTAL; k++) {
                acc += (int32_t)master_A[i][k] * (int32_t)master_B[k][j];
            }

            // --- MÔ PHỎNG CHÍNH XÁC PIPELINE RESCALE TRONG VERILOG ---
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


    // ──────────────────────────────────────────────────────────────
    // XỬ LÝ CHÍNH TRÊN NPU PHẦN CỨNG
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

    printf("[3/4] Running NPU: %dx%d matmul | K_DIM=%d | TILES=%d | SHIFT=%d\n",
           M_TOTAL, N_TOTAL, K_DIM, NUM_K_TILES, SCALE_SHIFT);

    gettimeofday(&sys_start, NULL);

    for (int m = 0; m < M_TOTAL; m += M_TILE) {
        for (int n = 0; n < N_TOTAL; n += N_TILE) {

            // Cấu hình thanh ghi DMA kênh nhận (S2MM) trước khi phát dữ liệu đi
            reg_write(dma1, S2MM_SR,     0x1000);            
            reg_write(dma1, S2MM_DA,     (uint32_t)MEM_RX_C_ADDR);
            reg_write(dma1, S2MM_LENGTH, bytes_c);          

            for (int t = 0; t < NUM_K_TILES; t++) {
                int k_off = t * K_DIM;

                // ---------------------------------------------------
                // GIAI ĐOẠN 1: ĐO THỜI GIAN PHẦN MỀM ĐỔI LAYOUT & CHUẨN BỊ (SW PREP)
                // ---------------------------------------------------
                gettimeofday(&t_start, NULL);

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

                gettimeofday(&t_end, NULL);
                t_sw_prep_us += (t_end.tv_sec - t_start.tv_sec) * 1e6 + (t_end.tv_usec - t_start.tv_usec);

                // ---------------------------------------------------
                // GIAI ĐOẠN 2: ĐO THỜI GIAN STREAM DỮ LIỆU ĐI + CORE TÍNH TOÁN (DMA TX)
                // ---------------------------------------------------
                gettimeofday(&t_start, NULL);

                reg_write(dma1, MM2S_SR,     0x1000);
                reg_write(dma0, MM2S_SR,     0x1000);
                reg_write(dma1, MM2S_SA,     (uint32_t)MEM_TX_A_ADDR);
                reg_write(dma0, MM2S_SA,     (uint32_t)MEM_TX_B_ADDR);
                reg_write(dma1, MM2S_LENGTH, bytes_a);  
                reg_write(dma0, MM2S_LENGTH, bytes_b);  

                POLL_WAIT(dma1, MM2S_SR, 0x1000, dma_error);
                POLL_WAIT(dma0, MM2S_SR, 0x1000, dma_error);

                gettimeofday(&t_end, NULL);
                t_dma_tx_us += (t_end.tv_sec - t_start.tv_sec) * 1e6 + (t_end.tv_usec - t_start.tv_usec);
            }

            // -------------------------------------------------------
            // GIAI ĐOẠN 3: ĐO THỜI GIAN ĐỢI CHIP KÉO KẾT QUẢ VỀ RAM (DMA RX)
            // -------------------------------------------------------
            gettimeofday(&t_start, NULL);

            POLL_WAIT(dma1, S2MM_SR, 0x1000, dma_error);

            gettimeofday(&t_end, NULL);
            t_dma_rx_us += (t_end.tv_sec - t_start.tv_sec) * 1e6 + (t_end.tv_usec - t_start.tv_usec);

            // -------------------------------------------------------
            // GIAI ĐOẠN 4: ĐO THỜI GIAN PHẦN MỀM TÁI CẤU TRÚC MA TRẬN PHẲNG (SW POST)
            // -------------------------------------------------------
            gettimeofday(&t_start, NULL);

            memcpy(buf_c, rx_c, bytes_c);

            for (int i = 0; i < M_TILE; i++)
                memcpy(&hw_C[m + i][n], &buf_c[i * N_TILE], N_TILE);

            gettimeofday(&t_end, NULL);
            t_sw_post_us += (t_end.tv_sec - t_start.tv_sec) * 1e6 + (t_end.tv_usec - t_start.tv_usec);
        }
    }

    gettimeofday(&sys_end, NULL);
    sys_total_ms = (sys_end.tv_sec  - sys_start.tv_sec)  * 1000.0
                 + (sys_end.tv_usec - sys_start.tv_usec) / 1000.0;

    // --- KIỂM TRA SAI SỐ NỘI BỘ ---
    int errors = 0;
    for (int i = 0; i < M_TOTAL; i++) {
        for (int j = 0; j < N_TOTAL; j++) {
            if (cpu_C[i][j] != hw_C[i][j]) {
                errors++;
            }
        }
    }

    // ──────────────────────────────────────────────────────────────
    // IN BÁO CÁO KẾT QUẢ TOÀN DIỆN (SYSTEM PROFILING)
    // ──────────────────────────────────────────────────────────────
    double hw_pure_ms = (t_dma_tx_us + t_dma_rx_us) / 1000.0;
    double total_measured_us = t_sw_prep_us + t_dma_tx_us + t_dma_rx_us + t_sw_post_us;

    printf("\n==================================================\n");
    printf(">> PERFORMANCE & ACCURACY COMPARISON REPORT <<\n");
    printf("==================================================\n");
    printf("Matrix Size               : %d x %d x %d (INT8)\n", M_TOTAL, K_TOTAL, N_TOTAL);
    printf("1. CPU Execution Time     : %7.3f ms\n", cpu_total_ms);
    printf("2. Pure NPU Hardware Time : %7.3f ms (DMA TX + RX Wait)\n", hw_pure_ms);
    printf("3. Total NPU System Time  : %7.3f ms (Includes Linux overhead)\n", sys_total_ms);
    printf("--------------------------------------------------\n");
    printf(">> SPEEDUP (Pure Hardware) : %.2fx FASTER than CPU\n", cpu_total_ms / hw_pure_ms);
    printf(">> SPEEDUP (Total System)  : %.2fx FASTER than CPU\n", cpu_total_ms / sys_total_ms);
    
    printf("\n==================================================\n");
    printf(">>        SYSTEM LEVEL TIMING PROFILING REPORT      <<\n");
    printf("==================================================\n");
    printf("1. Software Prep Time (T_sw_prep) : %7.3f ms (%5.1f%%)\n", 
            t_sw_prep_us / 1000.0, (t_sw_prep_us / total_measured_us) * 100.0);
    printf("2. DMA Transmit + Core (T_dma_tx) : %7.3f ms (%5.1f%%)\n", 
            t_dma_tx_us / 1000.0, (t_dma_tx_us / total_measured_us) * 100.0);
    printf("3. DMA Receive Time (T_dma_rx)    : %7.3f ms (%5.1f%%)\n", 
            t_dma_rx_us / 1000.0, (t_dma_rx_us / total_measured_us) * 100.0);
    printf("4. Software Post Time (T_sw_post) : %7.3f ms (%5.1f%%)\n", 
            t_sw_post_us / 1000.0, (t_sw_post_us / total_measured_us) * 100.0);
    printf("--------------------------------------------------\n");

    // Tính toán băng thông IO thực tế di chuyển qua kênh DMA
    // Công thức: Tổng số lượng byte đẩy đi thông qua Tiling + số lượng byte nhận về
    double total_bytes_moved = (double)(M_TOTAL/M_TILE) * (N_TOTAL/N_TILE) * NUM_K_TILES * (bytes_a + bytes_b)
                             + (double)(M_TOTAL/M_TILE) * (N_TOTAL/N_TILE) * bytes_c;
    double effective_bw = (total_bytes_moved / (1024.0 * 1024.0)) / ((t_dma_tx_us + t_dma_rx_us) / 1e6);

    printf(">> Hardware Compute Efficiency    : %.2f%%\n", 
            ((t_dma_tx_us + t_dma_rx_us) / total_measured_us) * 100.0);
    printf(">> Effective DMA Bandwidth       : %.2f MB/s\n", effective_bw);
    printf("--------------------------------------------------\n");
    if (errors == 0) {
        printf(">> ACCURACY CHECK          : [PASSED] NPU outputs perfectly match CPU!\n");
    } else {
        printf(">> ACCURACY CHECK          : [FAILED] Mismatch found at %d/%d positions!\n", errors, M_TOTAL * N_TOTAL);
    }
    printf("==================================================\n\n");

    // ──────────────────────────────────────────────────────────────
    // FILE XUẤT KẾT QUẢ ĐỂ ĐƯA LÊN JUPYTER/KAGGLE ĐỐI CHIẾU FRAMEWORK
    // ──────────────────────────────────────────────────────────────
    printf("[4/4] Exporting hardware result to output_C5120x5120_NPU.bin... ");
    fflush(stdout);

    FILE *f_c_npu = fopen("output_C5120x5120_NPU.bin", "wb");
    if (f_c_npu) {
        fwrite(hw_C, sizeof(int8_t), M_TOTAL * N_TOTAL, f_c_npu);
        fclose(f_c_npu);
        printf("Done.\n");
    } else {
        printf("\n[ERR] Ghi file kết quả output_C5120x5120_NPU.bin thất bại!\n");
    }

    munmap(gpio0, MAP_SIZE); munmap(gpio1, MAP_SIZE);
    munmap(dma0,  MAP_SIZE); munmap(dma1,  MAP_SIZE);
    munmap(tx_a,  MAP_SIZE); munmap(tx_b,  MAP_SIZE); munmap(rx_c, MAP_SIZE);
    close(fd);

    free(master_A); free(master_B); free(cpu_C); free(hw_C);
    return 0;

dma_error:
    printf("[ERR] Aborting due to DMA timeout.\n");
    munmap(gpio0, MAP_SIZE); munmap(gpio1, MAP_SIZE);
    munmap(dma0,  MAP_SIZE); munmap(dma1,  MAP_SIZE);
    munmap(tx_a,  MAP_SIZE); munmap(tx_b,  MAP_SIZE); munmap(rx_c, MAP_SIZE);
    close(fd);
    free(master_A); free(master_B); free(cpu_C); free(hw_C);
    return -1;
}