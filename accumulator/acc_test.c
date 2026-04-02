#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stdint.h>

#define GPIO_BASE_ADDR 0xB0000000 
#define GPIO_MAP_SIZE  0x10000

#define GPIO_CH1_DATA_OFFSET 0x00 
#define GPIO_CH2_DATA_OFFSET 0x08 
#define GPIO_CH1_TRI_OFFSET  0x04 
#define GPIO_CH2_TRI_OFFSET  0x0C 

uint32_t pack_inputs(uint8_t a, uint8_t b, uint8_t start) {
    return ((start & 0x01) << 8) | ((a & 0x0F) << 4) | (b & 0x0F);
}

int main() {
    int fd;
    void *gpio_map;
    volatile uint32_t *gpio_ch1_data;
    volatile uint32_t *gpio_ch2_data;
    volatile uint32_t *gpio_ch1_tri;
    volatile uint32_t *gpio_ch2_tri;

    fd = open("/dev/mem", O_RDWR | O_SYNC);
    if (fd < 0) {
        printf("Loi: Khong the mo /dev/mem. Ban da chay bang quyen sudo/root chua?\n");
        return -1;
    }

    gpio_map = mmap(NULL, GPIO_MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, GPIO_BASE_ADDR);
    if (gpio_map == MAP_FAILED) {
        printf("Loi: Mapping bo nho that bai!\n");
        close(fd);
        return -1;
    }

    gpio_ch1_data = (volatile uint32_t *)(gpio_map + GPIO_CH1_DATA_OFFSET);
    gpio_ch2_data = (volatile uint32_t *)(gpio_map + GPIO_CH2_DATA_OFFSET);
    gpio_ch1_tri  = (volatile uint32_t *)(gpio_map + GPIO_CH1_TRI_OFFSET);
    gpio_ch2_tri  = (volatile uint32_t *)(gpio_map + GPIO_CH2_TRI_OFFSET);

    *gpio_ch1_tri = 0x00000000; 
    *gpio_ch2_tri = 0xFFFFFFFF; 

    printf("==========================================\n");
    printf("   KHOI TAO HE THONG NHAN CONG DON        \n");
    printf("==========================================\n");

    *gpio_ch1_data = pack_inputs(0, 0, 0); 
    usleep(1000); 
    
    printf("[!] Psum sau khi reset: %d\n\n", *gpio_ch2_data & 0xFFFF);

    printf(">>> Chuan bi tinh: a = 3, b = 4\n");
    
    *gpio_ch1_data = pack_inputs(3, 4, 0);
    usleep(10);
    
    *gpio_ch1_data = pack_inputs(3, 4, 1);
    usleep(50000); 
    
    *gpio_ch1_data = pack_inputs(3, 4, 0);
    usleep(10);
    
    printf(">>> Psum doc duoc tu mach: %d\n", *gpio_ch2_data & 0xFFFF);
    printf("==========================================\n\n");

    printf(">>> Chuan bi tinh: a = 5, b = 2\n");
    
    *gpio_ch1_data = pack_inputs(5, 2, 0);
    usleep(10);
    
    *gpio_ch1_data = pack_inputs(5, 2, 1);
    usleep(50000); 
    
    *gpio_ch1_data = pack_inputs(5, 2, 0);
    usleep(10);
    
    printf(">>> Psum doc duoc tu mach: %d\n", *gpio_ch2_data & 0xFFFF);
    printf("==========================================\n");

    munmap(gpio_map, GPIO_MAP_SIZE);
    close(fd);

    return 0;
}