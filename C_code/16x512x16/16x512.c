#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/time.h>
#include <time.h>

#define DMA0_BASE_ADDR 0xB0000000
#define DMA1_BASE_ADDR 0xB0010000
#define GPIO0_BASE     0xA0000000
#define GPIO1_BASE     0xA0010000

#define MEM_TX_A_ADDR  0x1E000000
#define MEM_TX_B_ADDR  0x1E100000
#define MEM_RX_C_ADDR  0x1E200000

#define MAP_SIZE 0x10000UL
#define MAP_MASK (MAP_SIZE - 1)

#define M_TILE      16
#define N_TILE      16
#define K_TOTAL     512
#define K_DIM       32
#define NUM_K_TILES (K_TOTAL / K_DIM)   // = 16

#define SCALE_SHIFT 10
#define ZERO_POINT  0

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

#define POLL_WAIT(base, off, bit, label)                                    \
    do {                                                                    \
        volatile int _to = POLL_TIMEOUT;                                   \
        while (!(reg_read((base), (off)) & (bit)) && _to-- > 0);          \
        if (_to <= 0) {                                                    \
            printf("[ERR] DMA TIMEOUT at %s:%d\n", __FILE__, __LINE__);   \
            goto label;                                                    \
        }                                                                  \
    } while (0)

static inline void     reg_write(void *b, int off, uint32_t v) { *((volatile uint32_t *)((char *)b + off)) = v; }
static inline uint32_t reg_read (void *b, int off)             { return *((volatile uint32_t *)((char *)b + off)); }

int main(void) {
    int fd = open("/dev/mem", O_RDWR | O_SYNC);
    if (fd < 0) { perror("open /dev/mem"); return -1; }

    static int8_t mat_A[M_TILE][K_TOTAL];
    static int8_t mat_B[K_TOTAL][N_TILE];

    srand(time(NULL));
    for (int i = 0; i < M_TILE;  i++)
        for (int j = 0; j < K_TOTAL; j++)
            mat_A[i][j] = (int8_t)((rand() % 256) - 128);
    for (int i = 0; i < K_TOTAL; i++)
        for (int j = 0; j < N_TILE; j++)
            mat_B[i][j] = (int8_t)((rand() % 256) - 128);

    void *dma0  = mmap(0, MAP_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd, DMA0_BASE_ADDR & ~MAP_MASK);
    void *dma1  = mmap(0, MAP_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd, DMA1_BASE_ADDR & ~MAP_MASK);
    void *gpio0 = mmap(0, MAP_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd, GPIO0_BASE     & ~MAP_MASK);
    void *gpio1 = mmap(0, MAP_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd, GPIO1_BASE     & ~MAP_MASK);

    int8_t *tx_a = (int8_t *)mmap(0, MAP_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd, MEM_TX_A_ADDR & ~MAP_MASK);
    int8_t *tx_b = (int8_t *)mmap(0, MAP_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd, MEM_TX_B_ADDR & ~MAP_MASK);

    reg_write(dma0, MM2S_CR, 4); reg_write(dma1, MM2S_CR, 4); reg_write(dma1, S2MM_CR, 4);
    usleep(1000);
    reg_write(dma0, MM2S_CR, 1); reg_write(dma1, MM2S_CR, 1); reg_write(dma1, S2MM_CR, 1);

    reg_write(gpio0, GPIO_CH1, (uint32_t)K_DIM);
    reg_write(gpio0, GPIO_CH2, (uint32_t)NUM_K_TILES);
    reg_write(gpio1, GPIO_CH1, (uint32_t)SCALE_SHIFT);
    reg_write(gpio1, GPIO_CH2, (uint32_t)(uint8_t)ZERO_POINT);

    const uint32_t bytes_a = M_TILE * K_DIM  * sizeof(int8_t);
    const uint32_t bytes_b = K_DIM  * N_TILE * sizeof(int8_t);
    const uint32_t bytes_c = M_TILE * N_TILE * sizeof(int8_t);

    int8_t buf_a[M_TILE * K_DIM];
    int8_t buf_b[K_DIM  * N_TILE];

    // Arm S2MM trước vòng K-tile
    reg_write(dma1, S2MM_SR,     0x1000);
    reg_write(dma1, S2MM_DA,     (uint32_t)MEM_RX_C_ADDR);
    reg_write(dma1, S2MM_LENGTH, bytes_c);

    // ── Nạp toàn bộ K-tile vào HW, KHÔNG đo thời gian ──────────────────────
    for (int t = 0; t < NUM_K_TILES; t++) {
        int k_off = t * K_DIM;

        int idx = 0;
        for (int k = k_off; k < k_off + K_DIM; k++)
            for (int i = 0; i < M_TILE; i++)
                buf_a[idx++] = mat_A[i][k];

        idx = 0;
        for (int k = k_off; k < k_off + K_DIM; k++) {
            memcpy(&buf_b[idx], &mat_B[k][0], N_TILE);
            idx += N_TILE;
        }

        memcpy(tx_a, buf_a, bytes_a);
        memcpy(tx_b, buf_b, bytes_b);

        reg_write(dma1, MM2S_SR,     0x1000);
        reg_write(dma0, MM2S_SR,     0x1000);
        reg_write(dma1, MM2S_SA,     (uint32_t)MEM_TX_A_ADDR);
        reg_write(dma0, MM2S_SA,     (uint32_t)MEM_TX_B_ADDR);
        reg_write(dma1, MM2S_LENGTH, bytes_a);
        reg_write(dma0, MM2S_LENGTH, bytes_b);

        // Chờ DMA nạp xong, không tính vào NPU time
        POLL_WAIT(dma1, MM2S_SR, 0x1000, dma_error);
        POLL_WAIT(dma0, MM2S_SR, 0x1000, dma_error);
    }
    // ────────────────────────────────────────────────────────────────────────
    // Tại đây: toàn bộ data đã vào BRAM, NPU đang tính toán.
    // Bắt đầu đo từ đây → khi S2MM xong = thuần NPU compute.
    // (S2MM writeback 256 byte ≈ 0.25 µs, bỏ qua được)
    // ────────────────────────────────────────────────────────────────────────
    struct timeval t0, t1;
    gettimeofday(&t0, NULL);

    POLL_WAIT(dma1, S2MM_SR, 0x1000, dma_error);

    gettimeofday(&t1, NULL);

    double npu_us = (t1.tv_sec  - t0.tv_sec)  * 1e6
                  + (t1.tv_usec - t0.tv_usec);

    printf("==========================================\n");
    printf(">> Pure NPU Compute Time : %.3f us\n", npu_us);
    printf("==========================================\n");

    munmap(gpio0, MAP_SIZE); munmap(gpio1, MAP_SIZE);
    munmap(dma0,  MAP_SIZE); munmap(dma1,  MAP_SIZE);
    munmap(tx_a,  MAP_SIZE); munmap(tx_b,  MAP_SIZE);
    close(fd);
    return 0;

dma_error:
    printf("[ERR] Aborting due to DMA timeout.\n");
    munmap(gpio0, MAP_SIZE); munmap(gpio1, MAP_SIZE);
    munmap(dma0,  MAP_SIZE); munmap(dma1,  MAP_SIZE);
    munmap(tx_a,  MAP_SIZE); munmap(tx_b,  MAP_SIZE);
    close(fd);
    return -1;
}