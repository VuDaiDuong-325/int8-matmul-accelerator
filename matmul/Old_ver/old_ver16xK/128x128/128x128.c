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
#define K_HW   16  

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

    struct timeval start, end;
    double fpga_time_ms;

    srand(time(NULL));

    for (int i = 0; i < M_TOTAL; i++)
        for (int j = 0; j < K_TOTAL; j++) master_A[i][j] = (rand() % 256) - 128; 

    for (int i = 0; i < K_TOTAL; i++)
        for (int j = 0; j < N_TOTAL; j++) master_B[i][j] = (rand() % 256) - 128;

    if ((fd = open("/dev/mem", O_RDWR | O_SYNC)) == -1) { 
        printf("[ERR] Cannot open /dev/mem\n"); 
        return -1; 
    }

    void *dma0_base   = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, DMA0_BASE_ADDR & ~MAP_MASK);
    void *dma1_base   = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, DMA1_BASE_ADDR & ~MAP_MASK);
    void *gpio_k_base = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, GPIO_K_ADDR & ~MAP_MASK);
    
    int8_t *tx_a_ram  = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, MEM_TX_A_ADDR & ~MAP_MASK);
    int8_t *tx_b_ram  = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, MEM_TX_B_ADDR & ~MAP_MASK);
    int32_t *rx_c_ram = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, MEM_RX_C_ADDR & ~MAP_MASK);

    *((volatile uint32_t *)(gpio_k_base + 0x00)) = (uint32_t)K_HW;
    
    size_t bytes_a = M_TILE * K_HW * sizeof(int8_t);
    size_t bytes_b = K_HW * N_TILE * sizeof(int8_t);
    size_t bytes_c = M_TILE * N_TILE * sizeof(int32_t);

    printf("[INFO] Running FPGA Accelerator (%dx%d)...\n", M_TOTAL, N_TOTAL);
    gettimeofday(&start, NULL);
    
    for (int m = 0; m < M_TOTAL; m += M_TILE) {
        for (int n = 0; n < N_TOTAL; n += N_TILE) {
            
            int32_t partial_sum[M_TILE][N_TILE] = {0}; 
            
            for (int k = 0; k < K_TOTAL; k += K_HW) {
                int idx_a = 0;
                for (int j = 0; j < K_HW; j++) {
                    for (int i = 0; i < M_TILE; i++) tx_a_ram[idx_a++] = master_A[m + i][k + j];
                }

                int idx_b = 0;
                for (int i = 0; i < K_HW; i++) {
                    for (int j = 0; j < N_TILE; j++) tx_b_ram[idx_b++] = master_B[k + i][n + j];
                }

                dma_set(dma0_base, MM2S_CR, 4); dma_set(dma1_base, MM2S_CR, 4); dma_set(dma1_base, S2MM_CR, 4); 
                dma_set(dma0_base, MM2S_CR, 1); dma_set(dma1_base, S2MM_CR, 1); dma_set(dma1_base, MM2S_CR, 1);
                
                dma_set(dma0_base, MM2S_SA, MEM_TX_B_ADDR);
                dma_set(dma1_base, S2MM_DA, MEM_RX_C_ADDR);
                dma_set(dma1_base, MM2S_SA, MEM_TX_A_ADDR);
                
                dma_set(dma1_base, S2MM_LENGTH, bytes_c);
                dma_set(dma1_base, MM2S_LENGTH, bytes_a);
                dma_set(dma0_base, MM2S_LENGTH, bytes_b);

                int timeout = 1000000; 
                while ((dma_get(dma1_base, S2MM_SR) & 0x02) == 0 && timeout > 0) { timeout--; }
                if (timeout == 0) { 
                    printf("[ERR] DMA Timeout!\n"); 
                    return -1; 
                }
                
                for (int i = 0; i < M_TILE; i++) {
                    for (int j = 0; j < N_TILE; j++) partial_sum[i][j] += rx_c_ram[i * N_TILE + j];
                }
            }
            
            for (int i = 0; i < M_TILE; i++) {
                for (int j = 0; j < N_TILE; j++) hw_C[m + i][n + j] = partial_sum[i][j];
            }
        }
    }
    gettimeofday(&end, NULL);
    fpga_time_ms = (end.tv_sec - start.tv_sec) * 1000.0 + (end.tv_usec - start.tv_usec) / 1000.0;
    
    printf("[INFO] Done in %.3f ms.\n", fpga_time_ms);

    dump_int8_to_file("input_A128x128.txt", (int8_t *)master_A, M_TOTAL, K_TOTAL);
    dump_int8_to_file("input_B128x128.txt", (int8_t *)master_B, K_TOTAL, N_TOTAL);
    dump_int32_to_file("output_C128x128_FPGA.txt", (int32_t *)hw_C, M_TOTAL, N_TOTAL);

    munmap(gpio_k_base, MAP_SIZE); munmap(dma0_base, MAP_SIZE); munmap(dma1_base, MAP_SIZE);
    munmap(tx_a_ram, MAP_SIZE);  munmap(tx_b_ram, MAP_SIZE); munmap(rx_c_ram, MAP_SIZE); close(fd);
    
    return 0;
}