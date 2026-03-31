#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stdint.h>

#define AXI_GPIO_BASE_ADDR  0xB0000000 // Đổi lại đúng Base Address của bạn
#define AXI_GPIO_MAP_SIZE   0x1000

#define GPIO_DATA1_OFFSET   0x00
#define GPIO_DATA2_OFFSET   0x08
#define GPIO_TRI1_OFFSET    0x04
#define GPIO_TRI2_OFFSET    0x0C

int main() {
    int mem_fd = open("/dev/mem", O_RDWR | O_SYNC);
    if (mem_fd < 0) {
        perror("Loi mo /dev/mem. Dung quen sudo nhe!");
        return -1;
    }

    void *gpio_map = mmap(NULL, AXI_GPIO_MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, AXI_GPIO_BASE_ADDR);
    volatile uint32_t *gpio_regs = (volatile uint32_t *)gpio_map;

    gpio_regs[GPIO_TRI1_OFFSET / 4] = 0x00000000; // CH1: Output (Ghi xuống mạch)
    gpio_regs[GPIO_TRI2_OFFSET / 4] = 0xFFFFFFFF; // CH2: Input  (Đọc lên từ mạch)

    // Khởi tạo chân start = 0
    gpio_regs[GPIO_DATA1_OFFSET / 4] = 0;
    usleep(10);

    // Chạy 2 chu kỳ (batch)
    for (int cycle = 1; cycle <= 2; cycle++) {
        printf("\n==================================================\n");
        printf(" BẮT ĐẦU CHU KỲ TÍNH TOÁN %d (Tính 5 lần)\n", cycle);
        printf("==================================================\n");

        // CHỐT SỐ MỐC BAN ĐẦU (Đọc từ phần cứng)
        uint16_t base_psum = gpio_regs[GPIO_DATA2_OFFSET / 4] & 0xFFFF;
        printf("[!] Moc psum ban dau cua chu ky %d la: %u\n\n", cycle, base_psum);

        // Chạy 5 lần tính
        for (int i = 1; i <= 5; i++) {
            uint32_t a = i;       // a thay đổi: 1, 2, 3, 4, 5
            uint32_t b = 2;       // b cố định: 2
            
            // 1. KÍCH HOẠT: Bật start = 1 để mạch bắt đầu cộng
            uint32_t write_val = (b << 5) | (a << 1) | 1;
            gpio_regs[GPIO_DATA1_OFFSET / 4] = write_val;
            
            usleep(10); // Đợi 10 micro-giây cho mạch chạy

            // 2. TẮT: Kéo start = 0 để dừng mạch
            uint32_t stop_val  = (b << 5) | (a << 1) | 0;
            gpio_regs[GPIO_DATA1_OFFSET / 4] = stop_val;
            
            usleep(10); // Đợi tín hiệu ổn định

            // 3. ĐỌC KẾT QUẢ TỪ PHẦN CỨNG LÊN
            uint16_t hw_psum = gpio_regs[GPIO_DATA2_OFFSET / 4] & 0xFFFF;
            
            // 4. TÍNH PSUM CỦA ĐỢT NÀY (Lấy số hiện tại trừ đi số mốc)
            uint16_t current_psum = hw_psum - base_psum;

            // In kết quả chi tiết sau mỗi lần tính
            printf("  Lần %d | Ghi vào: a=%d, b=%d (Tích a*b = %d)\n", i, a, b, a*b);
            printf("         | -> Psum cộng dồn hiện tại = %u \n", current_psum);
            printf("         -----------------------------------------\n");
                    
            usleep(500000); // Tạm dừng 0.5s để bạn dễ nhìn terminal nó in ra từng dòng
        }
    }

    munmap(gpio_map, AXI_GPIO_MAP_SIZE);
    close(mem_fd);
    return 0;
}