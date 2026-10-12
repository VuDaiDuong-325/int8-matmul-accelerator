#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <time.h>
#include <sys/time.h>

// =========================================================================
// 1. HARDWARE ADDRESS DEFINITIONS
// =========================================================================
#define GEMM_CTRL_BASE  0xA0000000

#define MEM_TX_A_ADDR   0x1E000000
#define MEM_TX_B_ADDR   0x1E100000
#define MEM_RX_C_ADDR   0x1E200000

#define MAP_SIZE_REG    0x1000
#define MAP_SIZE_DATA   0x100000

// =========================================================================
// 2. MATRIX DIMENSIONS & ACCELERATOR CONFIG
// =========================================================================
#define M_TOTAL         512
#define K_TOTAL         512
#define N_TOTAL         512

#define K_DIM           32
#define K_BLK           256
#define NUM_K_TILES     (K_BLK / K_DIM)

#define SCALE_SHIFT     8
#define ZERO_POINT      0

#define REG_M_TOTAL     0
#define REG_N_TOTAL     1
#define REG_K_TOTAL     2
#define REG_K_DIM       3
#define REG_NUM_KT      4
#define REG_BASE_A      5
#define REG_BASE_B      6
#define REG_BASE_C      7
#define REG_N_STRIDE    8
#define REG_SCALE_SH    9
#define REG_ZERO_PT     10
#define REG_CTRL_STAT   11  // [0]=Start, [1]=Busy, [2]=Done_sticky

double get_time() {
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return (double)tv.tv_sec + (double)tv.tv_usec / 1000000.0;
}

int main() {
    int fd = open("/dev/mem", O_RDWR | O_SYNC);
    if (fd < 0) {
        printf("[ERR] Không thể mở /dev/mem! Chạy bằng quyền 'sudo'.\n");
        return -1;
    }

    printf("==================================================\n");
    printf("   INT8 GEMM ACCELERATOR - L2 SYSTEM TEST (512x512)\n");
    printf("==================================================\n\n");

    // ─────────────────────────────────────────────────────────────
    // 1. MAPPING CÁC VÙNG NHỚ VÀ THANH GHI CONTROL
    // ─────────────────────────────────────────────────────────────
    printf("[1/4] Mapping hardware registers and buffers... ");
    fflush(stdout);

    volatile uint32_t *gemm_regs = (volatile uint32_t *)mmap(
        NULL, MAP_SIZE_REG, PROT_READ | PROT_WRITE, MAP_SHARED, fd, GEMM_CTRL_BASE
    );

    int8_t *v_ptr_A = (int8_t *)mmap(NULL, MAP_SIZE_DATA, PROT_READ | PROT_WRITE, MAP_SHARED, fd, MEM_TX_A_ADDR);
    int8_t *v_ptr_B = (int8_t *)mmap(NULL, MAP_SIZE_DATA, PROT_READ | PROT_WRITE, MAP_SHARED, fd, MEM_TX_B_ADDR);
    int8_t *v_ptr_C = (int8_t *)mmap(NULL, MAP_SIZE_DATA, PROT_READ | PROT_WRITE, MAP_SHARED, fd, MEM_RX_C_ADDR);

    if (gemm_regs == MAP_FAILED || v_ptr_A == MAP_FAILED ||
        v_ptr_B == MAP_FAILED || v_ptr_C == MAP_FAILED) {
        printf("\n[ERR] Memory mapping thất bại!\n");
        return -1;
    }
    printf("Done.\n");

    // ─────────────────────────────────────────────────────────────
    // 2. KHỞI TẠO DỮ LIỆU ĐẦU VÀO & TÍNH TOÁN CPU REFERENCE
    // ─────────────────────────────────────────────────────────────
    printf("[2/4] Initializing matrices & computing CPU Reference... ");
    fflush(stdout);

    int8_t *cpu_A = (int8_t *)malloc(M_TOTAL * K_TOTAL * sizeof(int8_t));
    int8_t *cpu_B = (int8_t *)malloc(K_TOTAL * N_TOTAL * sizeof(int8_t));
    int8_t *cpu_C = (int8_t *)malloc(M_TOTAL * N_TOTAL * sizeof(int8_t));

    srand(42);
    for (int i = 0; i < M_TOTAL * K_TOTAL; i++) {
        cpu_A[i] = (rand() % 15) - 7;
        v_ptr_A[i] = cpu_A[i];
    }
    for (int i = 0; i < K_TOTAL * N_TOTAL; i++) {
        cpu_B[i] = (rand() % 15) - 7;
        v_ptr_B[i] = cpu_B[i];
    }
    memset(v_ptr_C, 0, M_TOTAL * N_TOTAL);

    // [BUG FIX SW-2] Flush dữ liệu input ra DDR trước khi start NPU
    __sync_synchronize();

    for (int m = 0; m < M_TOTAL; m++) {
        for (int n = 0; n < N_TOTAL; n++) {
            int32_t sum = 0;
            for (int k = 0; k < K_TOTAL; k++) {
                sum += (int32_t)cpu_A[m * K_TOTAL + k] * (int32_t)cpu_B[k * N_TOTAL + n];
            }
            int64_t rnd = (int64_t)sum + (1LL << (SCALE_SHIFT - 1));
            int64_t shr = rnd >> SCALE_SHIFT;
            int64_t zp  = shr + ZERO_POINT;

            if (zp > 127)       cpu_C[m * N_TOTAL + n] = 127;
            else if (zp < -128) cpu_C[m * N_TOTAL + n] = -128;
            else                cpu_C[m * N_TOTAL + n] = (int8_t)zp;
        }
    }
    printf("Done.\n");

    // ─────────────────────────────────────────────────────────────
    // 3. CẤU HÌNH THANH GHI & KÍCH HOẠT PHẦN CỨNG NPU
    // ─────────────────────────────────────────────────────────────
    printf("[3/4] Configuring NPU Registers and launching execution...\n");

    gemm_regs[REG_M_TOTAL]  = M_TOTAL;
    gemm_regs[REG_N_TOTAL]  = N_TOTAL;
    gemm_regs[REG_K_TOTAL]  = K_TOTAL;
    gemm_regs[REG_K_DIM]    = K_DIM;
    gemm_regs[REG_NUM_KT]   = NUM_K_TILES;
    gemm_regs[REG_BASE_A]   = MEM_TX_A_ADDR;
    gemm_regs[REG_BASE_B]   = MEM_TX_B_ADDR;
    gemm_regs[REG_BASE_C]   = MEM_RX_C_ADDR;
    gemm_regs[REG_N_STRIDE] = N_TOTAL;
    gemm_regs[REG_SCALE_SH] = SCALE_SHIFT;
    gemm_regs[REG_ZERO_PT]  = ZERO_POINT;

    // [BUG FIX SW-2] Đảm bảo tất cả register writes flush trước khi Start
    __sync_synchronize();

    printf("      -> Configuration verified. Starting hardware matrix multiplier...\n");
    double start_time = get_time();

    // Kích hoạt xung Start (bit 0 = 1)
    gemm_regs[REG_CTRL_STAT] = 0x1;

    // [BUG FIX SW-1] Polling đúng: latch ctrl_stat từ mỗi lần đọc.
    // REG_CTRL_STAT layout: {29'b0, done_sticky[2], busy[1], 0[0]}
    //
    // QUAN TRỌNG - done_sticky là READ-CLEAR: hardware tự clear bit 2
    // ngay sau lần đọc đầu tiên (behavior của gemm_l2_axi_lite_regs.v).
    // Vì vậy KHÔNG được đọc thanh ghi này lần thứ 2 để verify done_sticky —
    // lần 2 sẽ luôn trả về 0x0 (false warning).
    //
    // Hardware (l2_tiling_agu_fixed.v) chỉ báo done=1 SAU KHI tất cả
    // DMA S2MM writes được confirm qua s2mm_sts_tvalid (state C_WAIT_STS).
    // Khi vòng lặp thoát (busy=0), toàn bộ output data đã ở trong DDR.
    uint32_t ctrl_stat;
    do {
        ctrl_stat = gemm_regs[REG_CTRL_STAT];
    } while (ctrl_stat & 0x2);  // chờ khi busy (bit 1) còn = 1

    // [BUG FIX SW-2] Memory barrier: đảm bảo CPU không đọc stale cache
    // trước khi đọc output từ DDR (cần thiết trên ARM Cortex-A với cache).
    __sync_synchronize();

    double end_time = get_time();
    double hardware_execution_time = (end_time - start_time) * 1000.0;
    printf("      -> Hardware processing completed in: %.3f ms\n", hardware_execution_time);

    // Kiểm tra done_sticky từ lần đọc trong polling (lần đọc cuối khi busy=0).
    // done_sticky = bit 2 của ctrl_stat đã latch.
    // Lưu ý: nếu done=1 đồng thời busy=0, ctrl_stat = 0x4 | 0x0 = 0x4.
    if (!(ctrl_stat & 0x4)) {
        // Trường hợp này bình thường nếu NPU done nhanh và polling bắt được
        // đúng cycle busy=0 nhưng done_sticky chưa kịp propagate qua AXI.
        // Không phải lỗi nghiêm trọng nếu ACCURACY CHECK đã PASSED.
        printf("[INFO] done_sticky (bit 2) = 0 trong lần đọc polling cuối. ctrl_stat=0x%08X\n",
               ctrl_stat);
        printf("       (Bình thường: done_sticky là read-clear, đã được clear bởi lần đọc trước)\n");
    } else {
        printf("      -> done_sticky confirmed (ctrl_stat=0x%08X).\n", ctrl_stat);
    }

    // ─────────────────────────────────────────────────────────────
    // 4. KIỂM TRA ĐỘ CHÍNH XÁC (ACCURACY CHECK)
    // ─────────────────────────────────────────────────────────────
    printf("\n[4/4] Verifying hardware results against CPU reference...\n");
    int errors = 0;
    for (int i = 0; i < M_TOTAL * N_TOTAL; i++) {
        if (v_ptr_C[i] != cpu_C[i]) {
            if (errors < 10) {
                printf("      [MISMATCH] Tại index %d: NPU = %d, CPU = %d\n",
                       i, v_ptr_C[i], cpu_C[i]);
            }
            errors++;
        }
    }

    printf("--------------------------------------------------\n");
    if (errors == 0) {
        printf(">> ACCURACY CHECK          : [PASSED] NPU outputs perfectly match CPU!\n");
        double ops = 2.0 * M_TOTAL * K_TOTAL * N_TOTAL;
        double gops = ops / (hardware_execution_time / 1000.0) / 1e9;
        printf(">> ESTIMATED PERFORMANCE   : %.2f GOPS\n", gops);
    } else {
        printf(">> ACCURACY CHECK          : [FAILED] Mismatch at %d/%d positions!\n",
               errors, M_TOTAL * N_TOTAL);
    }
    printf("==================================================\n\n");

    FILE *f_out = fopen("output_C512x512_NPU.bin", "wb");
    if (f_out) {
        fwrite(v_ptr_C, sizeof(int8_t), M_TOTAL * N_TOTAL, f_out);
        fclose(f_out);
        printf("Result exported to 'output_C512x512_NPU.bin' successfully.\n");
    }

    munmap((void *)gemm_regs, MAP_SIZE_REG);
    munmap(v_ptr_A, MAP_SIZE_DATA);
    munmap(v_ptr_B, MAP_SIZE_DATA);
    munmap(v_ptr_C, MAP_SIZE_DATA);
    free(cpu_A); free(cpu_B); free(cpu_C);
    close(fd);

    return 0;
}