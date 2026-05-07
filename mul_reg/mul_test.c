#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stdint.h>

#define GPIO_BASE_ADDRESS    0x80000000 
#define GPIO_CH1_DATA_OFFSET 0x00
#define GPIO_CH2_DATA_OFFSET 0x08

typedef struct {
    int8_t a;
    int8_t b;
    char *description;
} TestCase;

int main() {
    printf("--- FPGA Signed Multiplier Test (4-bit Inputs) ---\n");

    // 1. Mở bộ nhớ hệ thống
    int mem_fd = open("/dev/mem", O_RDWR | O_SYNC);
    if (mem_fd < 0) {
        perror("Error: Không thể mở /dev/mem. Hãy dùng 'sudo'");
        return -1;
    }

    // 2. Map địa chỉ AXI vào bộ nhớ ảo của chương trình
    void *map_base = mmap(0, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, GPIO_BASE_ADDRESS);
    if (map_base == (void *) -1) {
        perror("Error: Memory mapping thất bại");
        close(mem_fd);
        return -1;
    }

    // 3. Khai báo con trỏ tới các thanh ghi GPIO
    volatile uint32_t *gpio_ch1 = (volatile uint32_t *)(map_base + GPIO_CH1_DATA_OFFSET);
    volatile uint32_t *gpio_ch2 = (volatile uint32_t *)(map_base + GPIO_CH2_DATA_OFFSET);

    TestCase tests[] = {
        {5,  3,  "Số dương * Số dương"},
        {-3, 2,  "Số âm * Số dương"},
        {4, -2,  "Số dương * Số âm"},
        {-4, -2, "Số âm * Số âm"},
        {7,  0,  "Số bất kỳ * 0"},
        {0, -5,  "0 * Số âm"},
        {-8, 7,  "Giá trị biên cực tiểu * cực đại"},
        {-1, -1, "Trường hợp -1 * -1"}
    };

    int num_tests = sizeof(tests) / sizeof(TestCase);

    for (int i = 0; i < num_tests; i++) {
        int8_t val_a = tests[i].a;
        int8_t val_b = tests[i].b;
        uint32_t a_4bit = (uint32_t)val_a & 0x0F;
        uint32_t b_4bit = (uint32_t)val_b & 0x0F;
        
        uint32_t data_in = (a_4bit << 4) | b_4bit;

        // Thực hiện giao tiếp với FPGA
        *gpio_ch1 = data_in;            // Đưa dữ liệu lên bus
        *gpio_ch1 = data_in | (1 << 8); // Kéo chân Enable (Start) lên 1
        *gpio_ch1 = data_in;            // Hạ chân Enable xuống 0 để chốt kết quả

        // Đọc kết quả từ Channel 2 (Kết quả nhân 4-bit x 4-bit = 8-bit)
        uint32_t raw_res = *gpio_ch2;

        int32_t final_res = (int8_t)(raw_res & 0xFF);

        printf("[%s]\n", tests[i].description);
        printf("   Input: %d * %d\n", val_a, val_b);
        printf("   FPGA Output (Raw Hex): 0x%02X\n", raw_res & 0xFF);
        printf("   Kết luận: %d\n", final_res);
        printf("-------------------------------------------\n");
    }
    munmap(map_base, 4096);
    close(mem_fd);
    return 0;
}