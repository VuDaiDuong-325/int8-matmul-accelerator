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
#define M_TOTAL 512
#define K_TOTAL 512
#define N_TOTAL 512
#define M_TILE  16
#define N_TILE  16

#define K_DIM        32
#define NUM_K_TILES  (K_TOTAL / K_DIM)   // = 16

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

// ==========================================
// [FIX C-1] TIMEOUT: Dùng macro để reset 'to' trước MỖI lần poll.
//
// BUG GỐC: Biến 'to' được khai báo 1 lần duy nhất trước vòng for K-tile,
// rồi bị giảm dần qua 16 lần poll MM2S_A + 16 lần poll MM2S_B.
// Đến khi poll S2MM, 'to' đã bị tiêu hao đáng kể, thậm chí có thể = 0
// nếu phần cứng chậm hơn dự kiến → poll S2MM bị bỏ qua hoàn toàn,
// CPU đọc dữ liệu chưa hoàn chỉnh.
//
// FIX: Reset 'to' = POLL_TIMEOUT trước MỖI lần poll bằng macro POLL_WAIT.
// ==========================================
#define POLL_TIMEOUT 10000000

// Macro poll: reset timeout, chờ bit 'bit' của register 'reg' tại 'base'+'off' set.
// Nếu timeout: in lỗi, nhảy tới label 'err_label'.
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

// ==========================================
// 5. MAIN
// ==========================================
int main(void) {
    int fd = open("/dev/mem", O_RDWR | O_SYNC);
    if (fd < 0) { perror("Cannot open /dev/mem"); return -1; }

    static int8_t master_A[M_TOTAL][K_TOTAL];
    static int8_t master_B[K_TOTAL][N_TOTAL];
    static int8_t hw_C[M_TOTAL][N_TOTAL];

    struct timeval sys_start, sys_end, hw_start, hw_end;
    double hw_pure_us = 0.0, sys_total_ms = 0.0;

    srand(time(NULL));
    printf("[1/3] Generating random INT8 data (%dx%d)... ", M_TOTAL, N_TOTAL);
    fflush(stdout);
    for (int i = 0; i < M_TOTAL; i++)
        for (int j = 0; j < K_TOTAL; j++)
            master_A[i][j] = (int8_t)((rand() % 256) - 128);
    for (int i = 0; i < K_TOTAL; i++)
        for (int j = 0; j < N_TOTAL; j++)
            master_B[i][j] = (int8_t)((rand() % 256) - 128);
    printf("Done.\n");

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

    printf("[2/3] Running NPU: %dx%d matmul | K_DIM=%d | TILES=%d | SHIFT=%d\n",
           M_TOTAL, N_TOTAL, K_DIM, NUM_K_TILES, SCALE_SHIFT);

    gettimeofday(&sys_start, NULL);

    for (int m = 0; m < M_TOTAL; m += M_TILE) {
        for (int n = 0; n < N_TOTAL; n += N_TILE) {

            // ──────────────────────────────────────────────────────────────
            // Arm S2MM TRƯỚC khi bắt đầu K-tile loop.
            // S2MM chỉ arm 1 lần: HW tích lũy đủ NUM_K_TILES rồi mới xuất C.
            // ──────────────────────────────────────────────────────────────
            reg_write(dma1, S2MM_SR,     0x1000);           // Clear IRQ cũ
            reg_write(dma1, S2MM_DA,     (uint32_t)MEM_RX_C_ADDR);
            reg_write(dma1, S2MM_LENGTH, bytes_c);          // ARM S2MM

            for (int t = 0; t < NUM_K_TILES; t++) {
                int k_off = t * K_DIM;

                // Pack A tile: column-major (mỗi 16-byte word = 1 cột của A)
                int idx = 0;
                for (int k = k_off; k < k_off + K_DIM; k++)
                    for (int i = 0; i < M_TILE; i++)
                        buf_a[idx++] = master_A[m + i][k];

                // Pack B tile: row-major
                idx = 0;
                for (int k = k_off; k < k_off + K_DIM; k++) {
                    memcpy(&buf_b[idx], &master_B[k][n], N_TILE);
                    idx += N_TILE;
                }

                // Ghi dữ liệu vào vùng nhớ DMA
                memcpy(tx_a, buf_a, bytes_a);
                memcpy(tx_b, buf_b, bytes_b);

                // ── Đo pure HW time (MM2S) ──────────────────────────────
                gettimeofday(&hw_start, NULL);

                // Clear IRQ và trigger MM2S cho cả A (DMA1) và B (DMA0)
                reg_write(dma1, MM2S_SR,     0x1000);
                reg_write(dma0, MM2S_SR,     0x1000);
                reg_write(dma1, MM2S_SA,     (uint32_t)MEM_TX_A_ADDR);
                reg_write(dma0, MM2S_SA,     (uint32_t)MEM_TX_B_ADDR);
                reg_write(dma1, MM2S_LENGTH, bytes_a);  // Trigger DMA1 MM2S
                reg_write(dma0, MM2S_LENGTH, bytes_b);  // Trigger DMA0 MM2S

                // ── [FIX C-1] Poll với timeout riêng từng lần ──────────
                // BUG GỐC: dùng chung biến 'to' → to bị tiêu hao qua 16
                // K-tiles, poll cuối có thể bị bỏ qua hoàn toàn.
                // FIX: Macro POLL_WAIT reset timeout = POLL_TIMEOUT mỗi lần.
                POLL_WAIT(dma1, MM2S_SR, 0x1000, dma_error);
                POLL_WAIT(dma0, MM2S_SR, 0x1000, dma_error);

                gettimeofday(&hw_end, NULL);
                hw_pure_us += (hw_end.tv_sec  - hw_start.tv_sec)  * 1e6
                            + (hw_end.tv_usec - hw_start.tv_usec);
            }

            // ── Chờ S2MM hoàn thành (HW tính xong và ghi C vào DRAM) ──
            gettimeofday(&hw_start, NULL);

            // [FIX C-1] + [FIX C-2] Poll S2MM với timeout riêng và có check lỗi
            POLL_WAIT(dma1, S2MM_SR, 0x1000, dma_error);

            gettimeofday(&hw_end, NULL);
            hw_pure_us += (hw_end.tv_sec  - hw_start.tv_sec)  * 1e6
                        + (hw_end.tv_usec - hw_start.tv_usec);

            // Đọc kết quả từ DRAM
            memcpy(buf_c, rx_c, bytes_c);

            // Giải nén vào đúng vị trí trong ma trận kết quả
            for (int i = 0; i < M_TILE; i++)
                memcpy(&hw_C[m + i][n], &buf_c[i * N_TILE], N_TILE);
        }
    }

    gettimeofday(&sys_end, NULL);
    sys_total_ms = (sys_end.tv_sec  - sys_start.tv_sec)  * 1000.0
                 + (sys_end.tv_usec - sys_start.tv_usec) / 1000.0;

    printf("\n==========================================\n");
    printf(">> Pure NPU+DMA Hardware Time : %.3f ms\n", hw_pure_us / 1000.0);
    printf(">> Total Linux System Time    : %.3f ms\n", sys_total_ms);
    printf("==========================================\n\n");

    printf("[3/3] Exporting files for verification... ");
    fflush(stdout);
    dump_int8("input_A512x512.txt",      (int8_t *)master_A, M_TOTAL, K_TOTAL);
    dump_int8("input_B512x512.txt",      (int8_t *)master_B, K_TOTAL, N_TOTAL);
    dump_int8("output_C512x512_NPU.txt", (int8_t *)hw_C,     M_TOTAL, N_TOTAL);
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