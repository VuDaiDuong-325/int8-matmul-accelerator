#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <time.h>
#include <sys/time.h>
#include <string.h>

#define DMA0_BASE_ADDR 0xB0000000
#define DMA1_BASE_ADDR 0xB0010000
#define GPIO_K_ADDR    0xA0000000

#define MEM_TX_A_ADDR  0x70000000
#define MEM_TX_B_ADDR  0x70100000
#define MEM_RX_C_ADDR  0x70200000

#define MAP_SIZE 65536UL  
#define MAP_MASK (MAP_SIZE - 1)

// =====================================
// Kích thước 1280x1280
// =====================================
#define M_TOTAL 1280
#define K_TOTAL 1280
#define N_TOTAL 1280
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
    
    // Cấp phát động
    int8_t (*master_A)[K_TOTAL] = malloc(M_TOTAL * K_TOTAL * sizeof(int8_t));
    int8_t (*master_B)[N_TOTAL] = malloc(K_TOTAL * N_TOTAL * sizeof(int8_t));
    // Dùng calloc để đảm bảo hw_C ban đầu = 0, sẵn sàng cho việc cộng dồn (Accumulate)
    int32_t (*hw_C)[N_TOTAL] = calloc(M_TOTAL * N_TOTAL, sizeof(int32_t));
    
    if (!master_A || !master_B || !hw_C) {
        printf("[LỖI] Không đủ bộ nhớ RAM!\n");
        return -1;
    }
    
    struct timeval sys_start, sys_end, hw_start, hw_end;
    double hw_pure_time_us = 0.0;
    double sys_total_time_ms = 0.0;

    srand(time(NULL));
    printf("[1/3] Generating random INT8 data (1280x1280)... ");
    for (int i = 0; i < M_TOTAL; i++) 
        for (int j = 0; j < K_TOTAL; j++) 
            master_A[i][j] = (rand() % 256) - 128; 
            
    for (int i = 0; i < K_TOTAL; i++) 
        for (int j = 0; j < N_TOTAL; j++) 
            master_B[i][j] = (rand() % 256) - 128;
    printf("Done.\n");

    if ((fd = open("/dev/mem", O_RDWR | O_SYNC)) == -1) {
        perror("Cannot open /dev/mem"); return -1; 
    }

    void *dma0_base   = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, DMA0_BASE_ADDR & ~MAP_MASK);
    void *dma1_base   = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, DMA1_BASE_ADDR & ~MAP_MASK);
    void *gpio_k_base = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, GPIO_K_ADDR & ~MAP_MASK);
    int8_t *tx_a_ram  = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, MEM_TX_A_ADDR & ~MAP_MASK);
    int8_t *tx_b_ram  = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, MEM_TX_B_ADDR & ~MAP_MASK);
    int32_t *rx_c_ram = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, MEM_RX_C_ADDR & ~MAP_MASK);

    dma_set(dma0_base, MM2S_CR, 4); dma_set(dma1_base, MM2S_CR, 4); dma_set(dma1_base, S2MM_CR, 4);
    usleep(1000);                    
    dma_set(dma0_base, MM2S_CR, 1); dma_set(dma1_base, MM2S_CR, 1); dma_set(dma1_base, S2MM_CR, 1); 

    printf("[2/3] Running FPGA with K-TILING (1024 + 256)...\n");
    gettimeofday(&sys_start, NULL);

    // CHIA KHÚC: 1280 = 1024 + 256 để phần cứng BRAM_DEPTH=1024 nuốt được
    int k_chunks[] = {1024, 256}; 
    int num_chunks = 2;

    for (int m = 0; m < M_TOTAL; m += M_TILE) {
        
        int k_offset = 0;
        for (int c = 0; c < num_chunks; c++) {
            int k_len = k_chunks[c];

            // ========================================================
            // TỐI ƯU TỐC ĐỘ: Bơm Tile A ở vòng lặp ngoài (Vì nó không phụ thuộc vào n)
            // ========================================================
            int idx_a = 0;
            for (int k = 0; k < k_len; k++) {
                for (int i = 0; i < M_TILE; i++) tx_a_ram[idx_a++] = master_A[m + i][k_offset + k];
            }

            for (int n = 0; n < N_TOTAL; n += N_TILE) {
                
                // Bơm Tile B
                int idx_b = 0;
                for (int k = 0; k < k_len; k++) {
                    for (int j = 0; j < N_TILE; j++) tx_b_ram[idx_b++] = master_B[k_offset + k][n + j];
                }

                *((volatile uint32_t *)(gpio_k_base + 0x00)) = k_len;

                dma_set(dma1_base, S2MM_DA, MEM_RX_C_ADDR);
                dma_set(dma1_base, S2MM_LENGTH, M_TILE * N_TILE * sizeof(int32_t));

                gettimeofday(&hw_start, NULL);

                size_t bytes_a = M_TILE * k_len * sizeof(int8_t);
                size_t bytes_b = k_len * N_TILE * sizeof(int8_t);

                if (k_len == 1024) {
                    // DMA Limit hack cho khúc 1024
                    size_t half_a = bytes_a / 2;
                    size_t half_b = bytes_b / 2;
                    
                    dma_set(dma1_base, MM2S_SA, MEM_TX_A_ADDR);
                    dma_set(dma0_base, MM2S_SA, MEM_TX_B_ADDR);
                    dma_set(dma1_base, MM2S_LENGTH, half_a);
                    dma_set(dma0_base, MM2S_LENGTH, half_b);

                    while ((dma_get(dma1_base, MM2S_SR) & 0x02) == 0);
                    while ((dma_get(dma0_base, MM2S_SR) & 0x02) == 0);

                    dma_set(dma1_base, MM2S_SA, MEM_TX_A_ADDR + half_a);
                    dma_set(dma0_base, MM2S_SA, MEM_TX_B_ADDR + half_b);
                    dma_set(dma1_base, MM2S_LENGTH, half_a);
                    dma_set(dma0_base, MM2S_LENGTH, half_b);
                } else {
                    // Khúc 256 chạy 1 phát ăn ngay vì < 16383 bytes
                    dma_set(dma1_base, MM2S_SA, MEM_TX_A_ADDR);
                    dma_set(dma0_base, MM2S_SA, MEM_TX_B_ADDR);
                    dma_set(dma1_base, MM2S_LENGTH, bytes_a);
                    dma_set(dma0_base, MM2S_LENGTH, bytes_b);
                }

                int timeout = 10000000; 
                while ((dma_get(dma1_base, S2MM_SR) & 0x02) == 0 && timeout > 0) timeout--;
                
                // Tránh treo mạch (AXI Lock-up)
                while ((dma_get(dma1_base, MM2S_SR) & 0x02) == 0);
                while ((dma_get(dma0_base, MM2S_SR) & 0x02) == 0);

                if (timeout == 0) { 
                    printf("\n[ERR] TIMEOUT tai tile (%d, %d)!\n", m, n); 
                    return -1; 
                }

                gettimeofday(&hw_end, NULL);
                hw_pure_time_us += (hw_end.tv_sec - hw_start.tv_sec) * 1000000.0 + (hw_end.tv_usec - hw_start.tv_usec);

                *((volatile uint32_t *)(gpio_k_base + 0x00)) = 0;
                
                // ========================================================
                // CỘNG DỒN KẾT QUẢ (ACCUMULATION)
                // LƯU Ý: Phải dùng += thay vì = vì chúng ta đang ghép 2 mảnh K lại
                // ========================================================
                int idx_c = 0;
                for (int i = 0; i < M_TILE; i++) {
                    for (int j = 0; j < N_TILE; j++) {
                        hw_C[m + (M_TILE - 1 - i)][n + j] += rx_c_ram[idx_c++];
                    }
                }
            }
            k_offset += k_len; // Dịch offset để chạy khúc K=256 tiếp theo
        }
    }

    gettimeofday(&sys_end, NULL);
    sys_total_time_ms = (sys_end.tv_sec - sys_start.tv_sec) * 1000.0 + (sys_end.tv_usec - sys_start.tv_usec) / 1000.0;
    
    printf("\n==========================================\n");
    printf(">> KÍCH THƯỚC MA TRẬN         : %dx%d\n", M_TOTAL, N_TOTAL);
    printf(">> Pure NPU+DMA Hardware Time : %.3f ms\n", hw_pure_time_us / 1000.0);
    printf(">> Total Linux System Time    : %.3f ms\n", sys_total_time_ms);
    printf("==========================================\n\n");

    printf("[3/3] Exporting result files... ");
    fflush(stdout);
    
    dump_int8_to_file("input_A1280x1280.txt", (int8_t *)master_A, M_TOTAL, K_TOTAL);
    dump_int8_to_file("input_B1280x1280.txt", (int8_t *)master_B, K_TOTAL, N_TOTAL);
    dump_int32_to_file("output_C1280x1280_FPGA.txt", (int32_t *)hw_C, M_TOTAL, N_TOTAL);
    printf("Done.\n");

    munmap(gpio_k_base, MAP_SIZE); 
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