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

#define REG_MAP_SIZE   4096UL
#define DATA_MAP_SIZE  1048576UL 

// Kích thước thật của ma trận
#define M_TOTAL 5120
#define K_TOTAL 1280
#define N_TOTAL 1280
#define M_TILE 16
#define N_TILE 16

// [QUAN TRỌNG] Giới hạn chunk K để lách luật phần cứng
// 512 đảm bảo: 1. Nằm trong BRAM_DEPTH (1024)
//              2. 512 * 16 = 8192 bytes < 16383 bytes (Giới hạn DMA 14-bit)
#define K_MAX_CHUNK 512 

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
    
    int8_t *master_A = (int8_t *)malloc(M_TOTAL * K_TOTAL * sizeof(int8_t));
    int8_t *master_B = (int8_t *)malloc(K_TOTAL * N_TOTAL * sizeof(int8_t));
    int32_t *hw_C    = (int32_t *)malloc(M_TOTAL * N_TOTAL * sizeof(int32_t));
    
    if (!master_A || !master_B || !hw_C) {
        printf("Loi: Khong du RAM!\n");
        return -1;
    }

    struct timeval sys_start, sys_end, hw_start, hw_end;
    double hw_pure_time_us = 0.0;
    double sys_total_time_ms = 0.0;

    srand(time(NULL));
    printf("[1/3] Generating random INT8 data... ");
    for (int i = 0; i < M_TOTAL; i++) 
        for (int j = 0; j < K_TOTAL; j++) 
            master_A[i * K_TOTAL + j] = (rand() % 256) - 128; 
            
    for (int i = 0; i < K_TOTAL; i++) 
        for (int j = 0; j < N_TOTAL; j++) 
            master_B[i * N_TOTAL + j] = (rand() % 256) - 128;
    printf("Done.\n");

    if ((fd = open("/dev/mem", O_RDWR | O_SYNC)) == -1) {
        perror("Cannot open /dev/mem");
        return -1; 
    }

    void *dma0_base   = mmap(0, REG_MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, DMA0_BASE_ADDR);
    void *dma1_base   = mmap(0, REG_MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, DMA1_BASE_ADDR);
    void *gpio_k_base = mmap(0, REG_MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, GPIO_K_ADDR);
    
    int8_t *tx_a_ram  = mmap(0, DATA_MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, MEM_TX_A_ADDR);
    int8_t *tx_b_ram  = mmap(0, DATA_MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, MEM_TX_B_ADDR);
    int32_t *rx_c_ram = mmap(0, DATA_MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, MEM_RX_C_ADDR);

    // Reset & Start DMA
    dma_set(dma0_base, MM2S_CR, 4); dma_set(dma1_base, MM2S_CR, 4); dma_set(dma0_base, S2MM_CR, 4);
    usleep(1000);                    
    dma_set(dma0_base, MM2S_CR, 1); dma_set(dma1_base, MM2S_CR, 1); dma_set(dma0_base, S2MM_CR, 1); 

    printf("[2/3] Running FPGA (M=%d, K=%d, N=%d) with Software Tiling...\n", M_TOTAL, K_TOTAL, N_TOTAL);
    
    int total_tiles = (M_TOTAL / M_TILE) * (N_TOTAL / N_TILE);
    int current_tile = 0;

    gettimeofday(&sys_start, NULL);

    for (int m = 0; m < M_TOTAL; m += M_TILE) {
        for (int n = 0; n < N_TOTAL; n += N_TILE) {
            
            current_tile++;
            if (current_tile % 500 == 0 || current_tile == total_tiles) {
                printf("\r  -> Processing tile %d / %d...", current_tile, total_tiles);
                fflush(stdout);
            }

            // Khởi tạo mảng lưu kết quả Cục bộ (Partial C) cho Tile 16x16 hiện tại
            int32_t partial_C_tile[M_TILE][N_TILE] = {0};

            // TIẾN HÀNH BĂM NHỎ CHIỀU K
            for (int k = 0; k < K_TOTAL; k += K_MAX_CHUNK) {
                
                // Tính toán độ dài K cho vòng lặp hiện tại (trường hợp K lẻ)
                int current_k_chunk = (k + K_MAX_CHUNK <= K_TOTAL) ? K_MAX_CHUNK : (K_TOTAL - k);

                int idx_a = 0, idx_b = 0;
                for (int ck = 0; ck < current_k_chunk; ck++) {
                    for (int i = 0; i < M_TILE; i++) tx_a_ram[idx_a++] = master_A[(m + i) * K_TOTAL + (k + ck)];
                    for (int j = 0; j < N_TILE; j++) tx_b_ram[idx_b++] = master_B[(k + ck) * N_TOTAL + (n + j)];
                }

                // Báo cho NPU biết chỉ chạy `current_k_chunk` nhịp
                *((volatile uint32_t *)(gpio_k_base + 0x00)) = current_k_chunk;

                dma_set(dma0_base, S2MM_DA, MEM_RX_C_ADDR); 
                dma_set(dma0_base, MM2S_SA, MEM_TX_A_ADDR); 
                dma_set(dma1_base, MM2S_SA, MEM_TX_B_ADDR); 

                size_t bytes_a = M_TILE * current_k_chunk * sizeof(int8_t);
                size_t bytes_b = current_k_chunk * N_TILE * sizeof(int8_t);
                size_t bytes_c = M_TILE * N_TILE * sizeof(int32_t); // C output luôn là 16x16 = 1024 bytes

                gettimeofday(&hw_start, NULL);

                dma_set(dma0_base, S2MM_LENGTH, bytes_c);
                dma_set(dma0_base, MM2S_LENGTH, bytes_a);
                dma_set(dma1_base, MM2S_LENGTH, bytes_b);

                int wait_timeout_b = 20000000;
                int wait_timeout_a = 20000000;
                int wait_timeout_c = 20000000;

                while ((dma_get(dma1_base, MM2S_SR) & 0x02) == 0 && wait_timeout_b > 0) wait_timeout_b--;
                while ((dma_get(dma0_base, MM2S_SR) & 0x02) == 0 && wait_timeout_a > 0) wait_timeout_a--;
                while ((dma_get(dma0_base, S2MM_SR) & 0x02) == 0 && wait_timeout_c > 0) wait_timeout_c--;
                
                if (wait_timeout_a == 0 || wait_timeout_b == 0 || wait_timeout_c == 0) { 
                    printf("\n[ERR] TIMEOUT tai (m=%d, n=%d, k=%d)! a=%d, b=%d, c=%d\n", m, n, k, wait_timeout_a, wait_timeout_b, wait_timeout_c); 
                    return -1; 
                }

                dma_set(dma0_base, MM2S_SR, 0x1000); 
                dma_set(dma1_base, MM2S_SR, 0x1000); 
                dma_set(dma0_base, S2MM_SR, 0x1000); 
                
                gettimeofday(&hw_end, NULL);
                hw_pure_time_us += (hw_end.tv_sec - hw_start.tv_sec) * 1000000.0 + (hw_end.tv_usec - hw_start.tv_usec);

                *((volatile uint32_t *)(gpio_k_base + 0x00)) = 0;
                
                // CỘNG DỒN KẾT QUẢ Partial C VÀO TILE
                // Lật hàng từ đáy lên để tương thích với khối Drain phần cứng
                int idx_c = 0;
                for (int i = 0; i < M_TILE; i++) {
                    for (int j = 0; j < N_TILE; j++) {
                        partial_C_tile[M_TILE - 1 - i][j] += rx_c_ram[idx_c++]; // <--- Cộng dồn tại đây
                    }
                }
            } // Hết vòng lặp K chunks

            // Đưa kết quả hoàn chỉnh của Block 16x16 vào ma trận C lớn
            for (int i = 0; i < M_TILE; i++) {
                for (int j = 0; j < N_TILE; j++) {
                     hw_C[(m + i) * N_TOTAL + (n + j)] = partial_C_tile[i][j];
                }
            }
        }
    }

    gettimeofday(&sys_end, NULL);
    sys_total_time_ms = (sys_end.tv_sec - sys_start.tv_sec) * 1000.0 + (sys_end.tv_usec - sys_start.tv_usec) / 1000.0;
    
    printf("\n\n==========================================\n");
    printf(">> Pure NPU+DMA Hardware Time : %.3f ms\n", hw_pure_time_us / 1000.0);
    printf(">> Total Linux System Time    : %.3f ms\n", sys_total_time_ms);
    printf("==========================================\n\n");

    printf("[3/3] Exporting result files... ");
    fflush(stdout);
    dump_int8_to_file("input_A_large.txt", master_A, M_TOTAL, K_TOTAL);
    dump_int8_to_file("input_B_large.txt", master_B, K_TOTAL, N_TOTAL);
    dump_int32_to_file("output_C_large_FPGA.txt", hw_C, M_TOTAL, N_TOTAL);
    printf("Done.\n");

    munmap(gpio_k_base, REG_MAP_SIZE); 
    munmap(dma0_base, REG_MAP_SIZE); 
    munmap(dma1_base, REG_MAP_SIZE);
    munmap(tx_a_ram, DATA_MAP_SIZE);  
    munmap(tx_b_ram, DATA_MAP_SIZE); 
    munmap(rx_c_ram, DATA_MAP_SIZE); 
    close(fd);
    
    free(master_A);
    free(master_B);
    free(hw_C);

    return 0;
}