#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stdint.h>

#define AXI_GPIO_BASE_ADDR  0xA0000000 
#define GPIO_DATA_CH1_OFFSET 0x0000  // Thanh ghi Data Kênh 1 (Output)
#define GPIO_DATA_CH2_OFFSET 0x0008  // Thanh ghi Data Kênh 2 (Input) - Cách Kênh 1 8 byte

#define MAP_SIZE 4096UL
#define MAP_MASK (MAP_SIZE - 1)

int main() {
    // Khai báo 2 ma trận Input
    int8_t X[4][4] = {
        {-4, -41, -12, 42},
        {66, -61, 20, -26},
        {57, -84, 11, 127},
        {70, 27, 0, 73}
    };

    int8_t W[4][4] = {
        {23, 42, -38, -26},
        {-4, 12, -66, 25},
        {41, 95, 127, -92},
        {33, 40, 101, 23}
    };

    // Hiển thị Ma trận X
    printf("[INPUT 1] - Ma tran ACTIVATION INT8 (X):\n");
    for (int row = 0; row < 4; row++) {
        printf("[");
        for (int col = 0; col < 4; col++) {
            printf("%4d", X[row][col]);
            if (col < 3) printf(", ");
        }
        printf("]\n");
    }

    // Hiển thị Ma trận W
    printf("\n[INPUT 2] - Ma tran WEIGHT INT8 (W):\n");
    for (int row = 0; row < 4; row++) {
        printf("[");
        for (int col = 0; col < 4; col++) {
            printf("%4d", W[row][col]);
            if (col < 3) printf(", ");
        }
        printf("]\n");
    }
    printf("\n");

    int mem_fd;
    void *mapped_base;
    volatile uint32_t *gpio_ch1; // Dùng để xuất tín hiệu rst_n, start, read_addr
    volatile uint32_t *gpio_ch2; // Dùng để đọc read_data

    if ((mem_fd = open("/dev/mem", O_RDWR | O_SYNC)) == -1) {
        perror("Loi: Hay chay bang sudo!");
        return -1;
    }

    mapped_base = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, AXI_GPIO_BASE_ADDR & ~MAP_MASK);
    if (mapped_base == (void *) -1) { return -1; }

    gpio_ch1 = (uint32_t *)(mapped_base + (AXI_GPIO_BASE_ADDR & MAP_MASK) + GPIO_DATA_CH1_OFFSET);
    gpio_ch2 = (uint32_t *)(mapped_base + (AXI_GPIO_BASE_ADDR & MAP_MASK) + GPIO_DATA_CH2_OFFSET);

    printf("--- KHOI DONG NPU ---\n");
    // 1. Reset (rst_n = 0, start = 0, addr = 0) -> Ghi 0x0
    *gpio_ch1 = 0x0; 
    usleep(10000); 

    // 2. Nhả Reset (rst_n = 1, start = 0, addr = 0) -> Ghi 0x1
    *gpio_ch1 = 0x1; 
    usleep(10000); 

    // 3. Phát xung Start (rst_n = 1, start = 1, addr = 0) -> Ghi 0x3
    *gpio_ch1 = 0x3; 
    usleep(10); // Cấp xung ngắn
    
    // 4. Nhả Start, chờ NPU tính toán xong (rst_n = 1, start = 0, addr = 0) -> Ghi 0x1
    *gpio_ch1 = 0x1;
    usleep(1000); // Chờ 1ms là quá dư dả cho phần cứng tính xong

    printf("\n--- KET QUA MA TRAN 4x4 (TU PHAN CUNG) ---\n");
    
    int32_t result_matrix[16];
    
    for (int i = 0; i < 16; i++) {
        uint32_t ctrl_signal = (i << 2) | 0x1;
        *gpio_ch1 = ctrl_signal;
        usleep(1); 
        
        result_matrix[i] = (int32_t)(*gpio_ch2); 
    }

    for(int row = 0; row < 4; row++) {
        for(int col = 0; col < 4; col++) {
            printf("%6d ", result_matrix[row * 4 + col]);
        }
        printf("\n");
    }
    printf("------------------------------------------\n");

    munmap(mapped_base, MAP_SIZE);
    close(mem_fd);
    return 0;
}