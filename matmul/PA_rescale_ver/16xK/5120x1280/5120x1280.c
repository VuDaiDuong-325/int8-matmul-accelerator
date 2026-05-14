#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <time.h>
#include <sys/time.h>

// =====================================
// ĐỊA CHỈ PHẦN CỨNG
// =====================================
#define DMA0_BASE_ADDR 0xB0000000
#define DMA1_BASE_ADDR 0xB0010000
#define GPIO_K_ADDR    0xA0000000
#define GPIO1_BASE     0xA0010000  // Thêm GPIO1 cho Rescale

// Dải RAM an toàn để bypass Cache
#define MEM_TX_A_ADDR  0x1E000000
#define MEM_TX_B_ADDR  0x1E100000
#define MEM_RX_C_ADDR  0x1E200000

#define MAP_SIZE 65536UL  
#define MAP_MASK (MAP_SIZE - 1)

// =====================================
// KÍCH THƯỚC BÀI TOÁN (5120 x 1280 x 5120)
// =====================================
#define M_TOTAL 5120
#define K_TOTAL 1280
#define N_TOTAL 5120
#define M_TILE  16
#define N_TILE  16

#define K_DIM        32
#define NUM_K_TILES  (K_TOTAL / K_DIM)   // = 40 tiles mỗi chu kỳ

#define SCALE_SHIFT  10
#define ZERO_POINT   0

// =====================================
// THANH GHI DMA
// =====================================
#define MM2S_CR     0x00
#define MM2S_SR     0x04
#define MM2S_SA     0x18
#define MM2S_LENGTH 0x28
#define S2MM_CR     0x30
#define S2MM_SR     0x34
#define S2MM_DA     0x48
#define S2MM_LENGTH 0x58

void dump_int8_to_file(const char* filename, int8_t *mat, int rows, int cols) {
    FILE *f = fopen(filename, "w");
    if (!f) {
        printf("[ERROR] Cannot create file %s\n", filename);
        return;
    }
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) fprintf(f, "%d ", mat[i * cols + j]);
        fprintf(f, "\n");
    }
    fclose(f);
}

void dma_set(void* dma_base, int offset, uint32_t value) {
    *((volatile uint32_t *)((char *)dma_base + offset)) = value;
}

uint32_t dma_get(void* dma_base, int offset) {
    return *((volatile uint32_t *)((char *)dma_base + offset));
}

int main() {
    int fd;
    
    // =========================================================================
    // CẤP PHÁT ĐỘNG (Total ~39 MB cho INT8)
    // =========================================================================
    int8_t (*master_A)[K_TOTAL] = malloc(M_TOTAL * K_TOTAL * sizeof(int8_t));
    int8_t (*master_B)[N_TOTAL] = malloc(K_TOTAL * N_TOTAL * sizeof(int8_t));
    int8_t (*hw_C)[N_TOTAL]     = malloc(M_TOTAL * N_TOTAL * sizeof(int8_t));
    
    if (!master_A || !master_B || !hw_C) {
        printf("[ERROR] Insufficient free RAM for allocation!\n");
        return -1;
    }
    
    struct timeval sys_start, sys_end, hw_start, hw_end;
    double hw_pure_time_us = 0.0;
    double sys_total_time_ms = 0.0;

    srand(time(NULL));
    printf("[1/3] Generating random matrices (Will take a few seconds)... ");
    fflush(stdout);
    for (int i = 0; i < M_TOTAL; i++) 
        for (int j = 0; j < K_TOTAL; j++) 
            master_A[i][j] = (int8_t)((rand() % 256) - 128); 
            
    for (int i = 0; i < K_TOTAL; i++) 
        for (int j = 0; j < N_TOTAL; j++) 
            master_B[i][j] = (int8_t)((rand() % 256) - 128);
    printf("Done!\n");

    if ((fd = open("/dev/mem", O_RDWR | O_SYNC)) == -1) {
        perror("Cannot open /dev/mem"); return -1; 
    }

    void *dma0_base   = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, DMA0_BASE_ADDR & ~MAP_MASK);
    void *dma1_base   = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, DMA1_BASE_ADDR & ~MAP_MASK);
    void *gpio_k_base = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, GPIO_K_ADDR & ~MAP_MASK);
    void *gpio1_base  = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, GPIO1_BASE & ~MAP_MASK);
    
    int8_t *tx_a_ram  = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, MEM_TX_A_ADDR & ~MAP_MASK);
    int8_t *tx_b_ram  = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, MEM_TX_B_ADDR & ~MAP_MASK);
    int8_t *rx_c_ram  = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, MEM_RX_C_ADDR & ~MAP_MASK);

    // Reset & Khởi động DMA
    dma_set(dma0_base, MM2S_CR, 4); dma_set(dma1_base, MM2S_CR, 4); dma_set(dma1_base, S2MM_CR, 4);
    usleep(1000);                    
    dma_set(dma0_base, MM2S_CR, 1); dma_set(dma1_base, MM2S_CR, 1); dma_set(dma1_base, S2MM_CR, 1); 

    // Cấu hình tham số NPU
    dma_set(gpio_k_base, 0x00, (uint32_t)K_DIM);         // GPIO0_CH1
    dma_set(gpio_k_base, 0x08, (uint32_t)NUM_K_TILES);   // GPIO0_CH2
    dma_set(gpio1_base,  0x00, (uint32_t)SCALE_SHIFT);   // GPIO1_CH1
    dma_set(gpio1_base,  0x08, (uint32_t)ZERO_POINT);    // GPIO1_CH2

    // Kích thước chuẩn bị truyền
    const uint32_t bytes_a = (uint32_t)(M_TILE * K_DIM * sizeof(int8_t));  // 512 B
    const uint32_t bytes_b = (uint32_t)(K_DIM  * N_TILE * sizeof(int8_t)); // 512 B
    const uint32_t bytes_c = (uint32_t)(M_TILE * N_TILE * sizeof(int8_t)); // 256 B

    // STAGING BUFFERS (Đẩy tốc độ CPU lên cực hạn)
    int8_t buf_a[M_TILE * K_DIM];
    int8_t buf_b[K_DIM * N_TILE];
    int8_t buf_c[M_TILE * N_TILE];

    printf("[2/3] Running NPU Rescale Architecture (C8) with Tiling. Please wait...\n");
    gettimeofday(&sys_start, NULL);

    for (int m = 0; m < M_TOTAL; m += M_TILE) {
        
        // Log tiến độ cho các ma trận cực lớn
        if (m % 256 == 0) {
            printf("  -> Processing: M = %d / %d...\n", m, M_TOTAL);
            fflush(stdout);
        }

        for (int n = 0; n < N_TOTAL; n += N_TILE) {

            // Cấu hình S2MM hứng kết quả (Kích hoạt trước để chờ NPU xuất data)
            dma_set(dma1_base, S2MM_SR, 0x1000); 
            dma_set(dma1_base, S2MM_DA, MEM_RX_C_ADDR);
            dma_set(dma1_base, S2MM_LENGTH, bytes_c);

            for (int t = 0; t < NUM_K_TILES; t++) {
                int k_off = t * K_DIM;

                // --- CPU ĐÓNG GÓI VÀO CACHE BUFFER (Nhanh chóng) ---
                int idx = 0;
                for (int k = k_off; k < k_off + K_DIM; k++)
                    for (int i = 0; i < M_TILE; i++)
                        buf_a[idx++] = master_A[m + i][k];

                idx = 0;
                for (int k = k_off; k < k_off + K_DIM; k++) {
                    memcpy(&buf_b[idx], &master_B[k][n], N_TILE);
                    idx += N_TILE;
                }

                // --- BURST WRITE TỪ CACHE XUỐNG RAM VẬT LÝ ---
                memcpy(tx_a_ram, buf_a, bytes_a);
                memcpy(tx_b_ram, buf_b, bytes_b);

                // --- KÍCH HOẠT DMA & ĐO PURE TIME ---
                gettimeofday(&hw_start, NULL);

                dma_set(dma1_base, MM2S_SR, 0x1000);
                dma_set(dma0_base, MM2S_SR, 0x1000);
                dma_set(dma1_base, MM2S_SA, MEM_TX_A_ADDR);
                dma_set(dma0_base, MM2S_SA, MEM_TX_B_ADDR);
                dma_set(dma1_base, MM2S_LENGTH, bytes_a);
                dma_set(dma0_base, MM2S_LENGTH, bytes_b);

                int to = 10000000;
                while (!(dma_get(dma1_base, MM2S_SR) & 0x1000) && to > 0) to--;
                while (!(dma_get(dma0_base, MM2S_SR) & 0x1000) && to > 0) to--;
                
                if (to == 0) { printf("\n[ERROR] MM2S TIMEOUT\n"); return -1; }

                gettimeofday(&hw_end, NULL);
                hw_pure_time_us += (hw_end.tv_sec - hw_start.tv_sec) * 1e6 + (hw_end.tv_usec - hw_start.tv_usec);
            }

            // --- CHỜ S2MM TRẢ KẾT QUẢ ---
            gettimeofday(&hw_start, NULL);
            int to = 10000000;
            while (!(dma_get(dma1_base, S2MM_SR) & 0x1000) && to > 0) to--;
            
            if (to == 0) { printf("\n[ERROR] S2MM TIMEOUT\n"); return -1; }
            
            gettimeofday(&hw_end, NULL);
            hw_pure_time_us += (hw_end.tv_sec - hw_start.tv_sec) * 1e6 + (hw_end.tv_usec - hw_start.tv_usec);

            // --- BURST LẤY DATA TỪ RAM LÊN CACHE VÀ GÁN VÀO MA TRẬN ĐÍCH ---
            memcpy(buf_c, rx_c_ram, bytes_c);
            int idx_c = 0;
            for (int i = 0; i < M_TILE; i++) {
                memcpy(&hw_C[m + i][n], &buf_c[idx_c], N_TILE);
                idx_c += N_TILE;
            }
        }
    }

    gettimeofday(&sys_end, NULL);
    sys_total_time_ms = (sys_end.tv_sec - sys_start.tv_sec) * 1000.0 + (sys_end.tv_usec - sys_start.tv_usec) / 1000.0;
    
    printf("\n==========================================\n");
    printf(">> MATRIX DIMENSIONS          : %d x %d x %d\n", M_TOTAL, K_TOTAL, N_TOTAL);
    printf(">> Output Architecture        : INT8 Rescaled\n");
    printf(">> Pure NPU+DMA Hardware Time : %.3f ms\n", hw_pure_time_us / 1000.0);
    printf(">> Total Linux System Time    : %.3f ms\n", sys_total_time_ms);
    printf("==========================================\n\n");

    printf("[3/3] Exporting result files (Lighter due to INT8 format)...\n");
    fflush(stdout);
    
    dump_int8_to_file("input_A5120.txt", (int8_t *)master_A, M_TOTAL, K_TOTAL);
    dump_int8_to_file("input_B5120.txt", (int8_t *)master_B, K_TOTAL, N_TOTAL);
    dump_int8_to_file("output_C5120_FPGA.txt", (int8_t *)hw_C, M_TOTAL, N_TOTAL);
    
    printf("Complete! All files have been generated successfully.\n");

    // Giải phóng bộ nhớ
    munmap(gpio_k_base, MAP_SIZE); 
    munmap(gpio1_base, MAP_SIZE); 
    munmap(dma0_base, MAP_SIZE); 
    munmap(dma1_base, MAP_SIZE);
    munmap(tx_a_ram, MAP_SIZE);  
    munmap(tx_b_ram, MAP_SIZE); 
    munmap(rx_c_ram, MAP_SIZE); 
    
    free(master_A);
    free(master_B);
    free(hw_C);
    close(fd);
    
    return 0;
}