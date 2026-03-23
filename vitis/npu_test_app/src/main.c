#include <stdio.h>
#include <xil_types.h>
#include "xparameters.h"
#include "xil_printf.h"
#include "xil_io.h"

// Địa chỉ Base của NPU (Lấy từ Vivado: 0xB000_0000)
#define NPU_BASE_ADDR 0xB0000000 

// Các Offset thanh ghi theo thiết kế Verilog của bạn
#define REG_CTRL      0x00 // slv_reg0: Điều khiển (Start, Wr_En)
#define REG_DATA      0x04 // slv_reg1: Dữ liệu Act/Weight nạp vào
#define REG_K_SIZE    0x08 // slv_reg2: Cấu hình độ dài ma trận K
#define REG_ADDR      0x0C // slv_reg3: Địa chỉ RAM để ghi vào

// Định nghĩa các bit trong REG_CTRL
#define BIT_START       0x01 // Bit 0
#define BIT_WR_EN_ACT   0x04 // Bit 2
#define BIT_WR_EN_WGT   0x08 // Bit 3

// =======================================================
// HÀM GHI DỮ LIỆU VÀO RAM BÊN TRONG NPU
// is_weight = 0 (Ghi Activation), is_weight = 1 (Ghi Weight)
// =======================================================
void npu_write_ram(u32 ram_addr, u32 data, int is_weight) {
    // 1. Set địa chỉ RAM muốn ghi
    Xil_Out32(NPU_BASE_ADDR + REG_ADDR, ram_addr);
    
    // 2. Đưa dữ liệu lên bus
    Xil_Out32(NPU_BASE_ADDR + REG_DATA, data);
    
    // 3. Tạo một xung (Pulse) Write Enable
    u32 we_bit = is_weight ? BIT_WR_EN_WGT : BIT_WR_EN_ACT;
    
    Xil_Out32(NPU_BASE_ADDR + REG_CTRL, we_bit); // Kéo chân Wr_En lên 1
    Xil_Out32(NPU_BASE_ADDR + REG_CTRL, 0x00);   // Kéo chân Wr_En xuống 0 (Hoàn thành ghi)
}

int main()
{
    xil_printf("\n\r====================================\n\r");
    xil_printf("   Kria NPU Accelerator Started!    \n\r");
    xil_printf("====================================\n\r");

    u32 k_size = 4; // Giả sử tính ma trận với K = 4
    
    // 1. CẤU HÌNH K_SIZE
    xil_printf("[1] Setting K_SIZE to %lu...\n\r", k_size);
    Xil_Out32(NPU_BASE_ADDR + REG_K_SIZE, k_size);

    // 2. NẠP DỮ LIỆU VÀO BRAM CỦA NPU
    // Giả sử mảng Activation có 4 giá trị và Weight có 4 giá trị
    u32 test_act[4] = {1, 2, 3, 4};
    u32 test_wgt[4] = {5, 6, 7, 8};
    
    xil_printf("[2] Loading Data to NPU Memory...\n\r");
    for(u32 i = 0; i < k_size; i++) {
        npu_write_ram(i, test_act[i], 0); // Nạp Act vào địa chỉ i
        npu_write_ram(i, test_wgt[i], 1); // Nạp Wgt vào địa chỉ i
    }

    // 3. RA LỆNH START CHO NPU
    xil_printf("[3] Sending START trigger...\n\r");
    Xil_Out32(NPU_BASE_ADDR + REG_CTRL, BIT_START); // Ghi 1 vào Bit 0
    // Control Unit tự xóa bit start trong Verilog nên không cần ghi lại bằng 0

    // 4. CHỜ NPU TÍNH TOÁN XONG
    xil_printf("[4] Waiting for NPU to complete...\n\r");
    u32 status;
    while(1) {
        // Đọc thanh ghi Status (Trong verilog bạn map npu_done vào bit 1 của offset 0x04)
        status = Xil_In32(NPU_BASE_ADDR + REG_DATA); 
        if((status & 0x02) != 0) { // Nếu bit 1 == 1 là Done
            break;
        }
    }
    
    xil_printf("[5] NPU DONE! Process Finished.\n\r");

    // LƯU Ý: Phần đọc kết quả (`final_data_out`) từ NPU về Zynq 
    // cần tùy thuộc vào việc bạn đã nối dây `final_data_out` vào slv_reg nào.
    // Nếu bạn nối vào slv_reg4 (Offset 0x10), bạn có thể đọc như sau:
    // u32 result = Xil_In32(NPU_BASE_ADDR + 0x10);
    // xil_printf("Final Psum Result: %lu\n\r", result);

    return 0;
}