#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <time.h>
#include <sys/time.h>

// ==========================================
// 1. HARDWARE ADDRESS DEFINITIONS
// ==========================================
#define DMA0_BASE_ADDR 0xB0000000 // DMA0 (Chỉ đọc B)
#define DMA1_BASE_ADDR 0xB0010000 // DMA1 (Đọc A, Ghi C)
#define GPIO_K_ADDR    0xA0000000 // Điều khiển K_DIM

#define MEM_TX_A_ADDR  0x70000000 // RAM chứa A
#define MEM_TX_B_ADDR  0x70100000 // RAM chứa B
#define MEM_RX_C_ADDR  0x70200000 // RAM hứng C

// [QUAN TRỌNG] Tăng kích thước Map lên 64KB (65536 Bytes)
// Vì 16 * 512 = 8192 Bytes > 4096 Bytes
#define MAP_SIZE 0x10000UL 
#define MAP_MASK (MAP_SIZE - 1)

// ==========================================
// 2. MATRIX DIMENSIONS (512x512)
// ==========================================
#define M_TOTAL 512
#define K_TOTAL 512
#define N_TOTAL 512
#define M_TILE 16
#define N_TILE 16

// ==========================================
// 3. DMA REGISTER OFFSETS
// ==========================================
#define MM2S_CR     0x00
#define MM2S_SR     0x04
#define MM2S_SA     0x18
#define MM2S_LENGTH 0x28
#define S2MM_CR     0x30
#define S2MM_SR     0x34
#define S2MM_DA     0x48
#define S2MM_LENGTH 0x58

void dma_set(void* dma_base, int offset, uint32_t value) {
    *((volatile uint32_t *)(dma_base + offset)) = value;
}

uint32_t dma_get(void* dma_base, int offset) {
    return *((volatile uint32_t *)(dma_base + offset));
}

// ==========================================
// 4. UTILITY FUNCTIONS FOR FILE EXPORT
// ==========================================
void dump_int8_to_file(const char *filename, int8_t *matrix, int rows, int cols) {
    FILE *f = fopen(filename, "w");
    if (f == NULL) {
        printf("Loi khong the tao file %s!\\n", filename);
        return;
    }
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            fprintf(f, "%d ", matrix[i * cols + j]);
        }
        fprintf(f, "\\n");
    }
    fclose(f);
}

void dump_int32_to_file(const char *filename, int32_t *matrix, int rows, int cols) {
    FILE *f = fopen(filename, "w");
    if (f == NULL) {
        printf("Loi khong the tao file %s!\\n", filename);
        return;
    }
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            fprintf(f, "%d ", matrix[i * cols + j]);
        }
        fprintf(f, "\\n");
    }
    fclose(f);
}

int main() {
    int fd;
    // Khai báo ma trận 512x512
    static int8_t master_A[M_TOTAL][K_TOTAL];
    static int8_t master_B[K_TOTAL][N_TOTAL];
    static int32_t hw_C[M_TOTAL][N_TOTAL] = {0}; 
    
    struct timeval sys_start, sys_end, hw_start, hw_end;
    double hw_pure_time_us = 0.0;
    double sys_total_time_ms = 0.0;

    srand(time(NULL));
    printf("[1/3] Generating random INT8 data (512x512)... ");
    for (int i = 0; i < M_TOTAL; i++) 
        for (int j = 0; j < K_TOTAL; j++) 
            master_A[i][j] = (rand() % 256) - 128; 
            
    for (int i = 0; i < K_TOTAL; i++) 
        for (int j = 0; j < N_TOTAL; j++) 
            master_B[i][j] = (rand() % 256) - 128;
    printf("Done.\\n");

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

    // Reset DMA
    dma_set(dma0_base, MM2S_CR, 4);
    dma_set(dma1_base, MM2S_CR, 4);
    dma_set(dma1_base, S2MM_CR, 4);
    usleep(1000);                    
    
    // Start DMA
    dma_set(dma0_base, MM2S_CR, 1); 
    dma_set(dma1_base, MM2S_CR, 1); 
    dma_set(dma1_base, S2MM_CR, 1); 

    size_t bytes_c = M_TILE * N_TILE * sizeof(int32_t); // 1024 Bytes
    size_t bytes_a = M_TILE * K_TOTAL * sizeof(int8_t); // 8192 Bytes
    size_t bytes_b = K_TOTAL * N_TILE * sizeof(int8_t); // 8192 Bytes

    printf("[2/3] Running FPGA Accelerator (NPU 16x16 | K_TOTAL = %d)...\\n", K_TOTAL);
    
    gettimeofday(&sys_start, NULL);
    
    // Config BRAM Ping-Pong Buffer Depth (K_DIM) qua GPIO
    *((volatile uint32_t *)(gpio_k_base + 0x00)) = K_TOTAL;

    for (int m = 0; m < M_TOTAL; m += M_TILE) {
        for (int n = 0; n < N_TOTAL; n += N_TILE) {
            
            // 1. Pack dữ liệu vào vùng nhớ O_SYNC cho DMA
            int idx_a = 0, idx_b = 0;
            for (int k = 0; k < K_TOTAL; k++) {
                for (int i = 0; i < M_TILE; i++) tx_a_ram[idx_a++] = master_A[m + i][k];
                for (int j = 0; j < N_TILE; j++) tx_b_ram[idx_b++] = master_B[k][n + j];
            }

            // 2. Set Memory Addresses
            dma_set(dma1_base, S2MM_DA, MEM_RX_C_ADDR);
            dma_set(dma1_base, MM2S_SA, MEM_TX_A_ADDR);
            dma_set(dma0_base, MM2S_SA, MEM_TX_B_ADDR);

            gettimeofday(&hw_start, NULL);

            // 3. Trigger DMA (S2MM chạy trước MM2S)
            dma_set(dma1_base, S2MM_LENGTH, bytes_c);
            dma_set(dma1_base, MM2S_LENGTH, bytes_a);
            dma_set(dma0_base, MM2S_LENGTH, bytes_b);

            // 4. Polling an toàn cả 3 Kênh (Check bit Idle)
            int timeout = 10000000;
            while (!(dma_get(dma1_base, S2MM_SR) & 0x02) && timeout > 0) timeout--; 
            while (!(dma_get(dma1_base, MM2S_SR) & 0x02) && timeout > 0) timeout--; 
            while (!(dma_get(dma0_base, MM2S_SR) & 0x02) && timeout > 0) timeout--; 
            
            if (timeout == 0) { 
                printf("\\n[ERR] TIMEOUT tai tile (%d, %d)! Vui long check lai Hardware.\\n", m, n); 
                return -1; 
            }

            gettimeofday(&hw_end, NULL);
            hw_pure_time_us += (hw_end.tv_sec - hw_start.tv_sec) * 1000000.0 + (hw_end.tv_usec - hw_start.tv_usec);

            // 5. Unpack kết quả C (Drain Bottom-Up)
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
    
    printf("\\n==========================================\\n");
    printf(">> Pure NPU+DMA Hardware Time : %.3f ms\\n", hw_pure_time_us / 1000.0);
    printf(">> Total Linux System Time    : %.3f ms\\n", sys_total_time_ms);
    printf("==========================================\\n\\n");

    // ========================================================
    // XUẤT FILE ĐỂ KIỂM TRA TRÊN KAGGLE / PYTHON
    // ========================================================
    printf("[3/3] Exporting result files for Kaggle... ");
    fflush(stdout);
    
    dump_int8_to_file("input_A512x512.txt", (int8_t *)master_A, M_TOTAL, K_TOTAL);
    dump_int8_to_file("input_B512x512.txt", (int8_t *)master_B, K_TOTAL, N_TOTAL);
    dump_int32_to_file("output_C512x512_FPGA.txt", (int32_t *)hw_C, M_TOTAL, N_TOTAL);
    
    printf("Done.\\n");
    printf("Files generated: input_A512x512.txt, input_B512x512.txt, output_C512x512_FPGA.txt\\n\\n");

    munmap(gpio_k_base, MAP_SIZE); 
    munmap(dma0_base, MAP_SIZE); 
    munmap(dma1_base, MAP_SIZE);
    munmap(tx_a_ram, MAP_SIZE);  
    munmap(tx_b_ram, MAP_SIZE); 
    munmap(rx_c_ram, MAP_SIZE); 
    close(fd);
    
    return 0;
}