#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <time.h>
#include <sys/time.h>

#define DMA0_BASE_ADDR 0xB0000000
#define DMA1_BASE_ADDR 0xB0010000
#define GPIO_K_ADDR    0xA0000000

#define MEM_TX_A_ADDR  0x70000000
#define MEM_TX_B_ADDR  0x70100000
#define MEM_RX_C_ADDR  0x70200000

#define MAP_SIZE 4096UL
#define MAP_MASK (MAP_SIZE - 1)

#define M_TOTAL 128
#define K_TOTAL 128
#define N_TOTAL 128
#define M_TILE 16
#define N_TILE 16

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
    if (!f) return;
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) fprintf(f, "%4d ", mat[i * cols + j]);
        fprintf(f, "\n");
    }
    fclose(f);
}

void dump_int32_to_file(const char* filename, int32_t *mat, int rows, int cols) {
    FILE *f = fopen(filename, "w");
    if (!f) return;
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) fprintf(f, "%8d ", mat[i * cols + j]);
        fprintf(f, "\n");
    }
    fclose(f);
}

void dma_set(void* dma_base, int offset, uint32_t value) {
    *((volatile uint32_t *)(dma_base + offset)) = value;
}

uint32_t dma_get(void* dma_base, int offset) {
    return *((volatile uint32_t *)(dma_base + offset));
}

int main() {
    int fd;
    static int8_t master_A[M_TOTAL][K_TOTAL];
    static int8_t master_B[K_TOTAL][N_TOTAL];
    static int32_t hw_C[M_TOTAL][N_TOTAL] = {0}; 
    
    struct timeval sys_start, sys_end, hw_start, hw_end;
    double hw_pure_time_us = 0.0;
    double sys_total_time_ms = 0.0;

    srand(time(NULL));
    printf("[1/3] Generating random INT8 data... ");
    for (int i = 0; i < M_TOTAL; i++) 
        for (int j = 0; j < K_TOTAL; j++) 
            master_A[i][j] = (rand() % 256) - 128; 
            
    for (int i = 0; i < K_TOTAL; i++) 
        for (int j = 0; j < N_TOTAL; j++) 
            master_B[i][j] = (rand() % 256) - 128;
    printf("Done.\n");

    if ((fd = open("/dev/mem", O_RDWR | O_SYNC)) == -1) {
        perror("Cannot open /dev/mem");
        return -1; 
    }

    void *dma0_base   = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, DMA0_BASE_ADDR & ~MAP_MASK);
    void *dma1_base   = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, DMA1_BASE_ADDR & ~MAP_MASK);
    void *gpio_k_base = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, GPIO_K_ADDR & ~MAP_MASK);
    int8_t *tx_a_ram  = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, MEM_TX_A_ADDR & ~MAP_MASK);
    int8_t *tx_b_ram  = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, MEM_TX_B_ADDR & ~MAP_MASK);
    int32_t *rx_c_ram = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, MEM_RX_C_ADDR & ~MAP_MASK);

    if (dma0_base == MAP_FAILED || dma1_base == MAP_FAILED || gpio_k_base == MAP_FAILED) {
        printf("MMAP Failed!\n");
        close(fd);
        return -1;
    }

    // Reset DMA
    dma_set(dma0_base, MM2S_CR, 4);
    dma_set(dma1_base, MM2S_CR, 4);
    dma_set(dma0_base, S2MM_CR, 4);
    usleep(1000);                    
    
    // Start DMA
    dma_set(dma0_base, MM2S_CR, 1); 
    dma_set(dma1_base, MM2S_CR, 1); 
    dma_set(dma0_base, S2MM_CR, 1); 

    size_t bytes_c = M_TILE * N_TILE * sizeof(int32_t);
    size_t bytes_a = M_TILE * K_TOTAL * sizeof(int8_t);
    size_t bytes_b = K_TOTAL * N_TILE * sizeof(int8_t);

    printf("[2/3] Running FPGA Accelerator (K_TOTAL = %d)...\n", K_TOTAL);
    
    gettimeofday(&sys_start, NULL);

    for (int m = 0; m < M_TOTAL; m += M_TILE) {
        for (int n = 0; n < N_TOTAL; n += N_TILE) {
            
            int idx_a = 0, idx_b = 0;
            for (int k = 0; k < K_TOTAL; k++) {
                for (int i = 0; i < M_TILE; i++) tx_a_ram[idx_a++] = master_A[m + i][k];
                for (int j = 0; j < N_TILE; j++) tx_b_ram[idx_b++] = master_B[k][n + j];
            }

            // Truyền tổng K = 128
            *((volatile uint32_t *)(gpio_k_base + 0x00)) = K_TOTAL;

            dma_set(dma0_base, S2MM_DA, MEM_RX_C_ADDR); // Rút C ở DMA 0
            dma_set(dma0_base, MM2S_SA, MEM_TX_A_ADDR); // Bơm A ở DMA 0
            dma_set(dma1_base, MM2S_SA, MEM_TX_B_ADDR); // Bơm B ở DMA 1

            gettimeofday(&hw_start, NULL);

            // 1. Kích hoạt kênh nhận C (S2MM) trên DMA 0 TRƯỚC
            dma_set(dma0_base, S2MM_LENGTH, bytes_c);
            
            // 2. Kích hoạt 2 kênh bơm A (DMA 0) và B (DMA 1)
            dma_set(dma0_base, MM2S_LENGTH, bytes_a);
            dma_set(dma1_base, MM2S_LENGTH, bytes_b);

            // 3. Chờ tất cả hoàn thành
            int wait_timeout_b = 10000000;
            int wait_timeout_a = 10000000;
            int wait_timeout_c = 10000000;

            // Chờ DMA 1 bơm B xong
            while ((dma_get(dma1_base, MM2S_SR) & 0x02) == 0 && wait_timeout_b > 0) wait_timeout_b--;
            // Chờ DMA 0 bơm A xong
            while ((dma_get(dma0_base, MM2S_SR) & 0x02) == 0 && wait_timeout_a > 0) wait_timeout_a--;
            // Chờ DMA 0 hút C xong
            while ((dma_get(dma0_base, S2MM_SR) & 0x02) == 0 && wait_timeout_c > 0) wait_timeout_c--;
            
            if (wait_timeout_a == 0 || wait_timeout_b == 0 || wait_timeout_c == 0) { 
                printf("\n[ERR] TIMEOUT tai tile (%d, %d)! a=%d, b=%d, c=%d\n", m, n, wait_timeout_a, wait_timeout_b, wait_timeout_c); 
                return -1; 
            }

            dma_set(dma0_base, MM2S_SR, 0x1000); // Xóa cờ bơm A
            dma_set(dma1_base, MM2S_SR, 0x1000); // Xóa cờ bơm B
            dma_set(dma0_base, S2MM_SR, 0x1000); // Xóa cờ hút C
            
            gettimeofday(&hw_end, NULL);
            hw_pure_time_us += (hw_end.tv_sec - hw_start.tv_sec) * 1000000.0 + (hw_end.tv_usec - hw_start.tv_usec);

            // Giật GPIO về 0
            *((volatile uint32_t *)(gpio_k_base + 0x00)) = 0;
            
            // ========================================================
            // Áp dụng đảo hàng (M_TILE - 1 - i) để bù trừ
            // cho kiến trúc "Drain" xả từ đáy lên đỉnh của Systolic
            // ========================================================
            int idx_c = 0;
            for (int i = 0; i < M_TILE; i++) {
                for (int j = 0; j < N_TILE; j++) {
                    hw_C[m + (M_TILE - 1 - i)][n + j] = rx_c_ram[idx_c++];
                }
            }
        }
    }

    gettimeofday(&sys_end, NULL);
    sys_total_time_ms = (sys_end.tv_sec - sys_start.tv_sec) * 1000.0 + (sys_end.tv_usec - sys_start.tv_usec) / 1000.0;
    
    printf("\n==========================================\n");
    printf(">> Pure NPU+DMA Hardware Time : %.3f ms\n", hw_pure_time_us / 1000.0);
    printf(">> Total Linux System Time    : %.3f ms\n", sys_total_time_ms);
    printf("==========================================\n\n");

    printf("[3/3] Exporting result files... ");
    fflush(stdout);
    dump_int8_to_file("input_A128x128.txt", (int8_t *)master_A, M_TOTAL, K_TOTAL);
    dump_int8_to_file("input_B128x128.txt", (int8_t *)master_B, K_TOTAL, N_TOTAL);
    dump_int32_to_file("output_C128x128_FPGA.txt", (int32_t *)hw_C, M_TOTAL, N_TOTAL);
    printf("Done.\n");

    munmap(gpio_k_base, MAP_SIZE); 
    munmap(dma0_base, MAP_SIZE); 
    munmap(dma1_base, MAP_SIZE);
    munmap(tx_a_ram, MAP_SIZE);  
    munmap(tx_b_ram, MAP_SIZE); 
    munmap(rx_c_ram, MAP_SIZE); 
    close(fd);
    
    return 0;
}