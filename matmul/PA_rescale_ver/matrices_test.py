import numpy as np

# =====================================================================
# CẤU HÌNH QUẢN LÝ RESCALE - ĐỒNG BỘ 100% VỚI PHẦN CỨNG VERILOG
# =====================================================================
SHIFT_VAL = 10     # Tương ứng với cấu hình 'scale_shift' (0..31) trên FPGA
ZERO_POINT = 0     # Tương ứng với cấu hình 'zero_point' trên FPGA (-128 đến 127)
ROUNDING = True    # Bật/Tắt chế độ cộng Round Bias (True tương ứng với scale_shift > 0)

def perform_rescale_sw(C32, shift, zp, rounding=True):
    """
    Mô phỏng chính xác từng bước của module `int32_int8_rescale` trên FPGA.
    Xử lý chính xác việc Sign-Extension và Kiểu dữ liệu có dấu.
    """
    # Bước 1 & 2: Ép kiểu lên INT64 (mô phỏng thanh ghi 34-bit của FPGA để tránh tràn số)
    # Và thực hiện cộng round_bias: 1 << (scale_shift - 1)
    temp = C32.astype(np.int64)
    if rounding and shift > 0:
        bias = 1 << (shift - 1)
        temp = temp + bias
    
    # Bước 3: Dịch phải số học (Arithmetic Right Shift `>>>` trong Verilog)
    # Python tự động giữ nguyên bit dấu khi dịch phải đối với kiểu số nguyên có dấu
    temp = temp >> shift
    
    # Bước 4: Cộng zero_point (Đảm bảo zero_point được xử lý như kiểu số 8-bit CÓ DẤU)
    # Trong Verilog: $signed({{26{zero_point[7]}}, zero_point})
    zp_signed = np.int8(zp).astype(np.int64)
    temp = temp + zp_signed
    
    # Bước 5: Saturate clamp → INT8 (Tương ứng mạch Multiplexer Clamping trong RTL)
    # Biên dưới: -128 (8'sh80) | Biên trên: 127 (8'sh7F)
    return np.clip(temp, -128, 127).astype(np.int8)

def check_matrices(file_A, file_B, file_C):
    print("=" * 75)
    print("      HỆ THỐNG KIỂM TRA ĐỒNG BỘ HÓA PHẦN CỨNG RTL `int32_int8_rescale`       ")
    print("=" * 75)

    try:
        # Đọc dữ liệu từ file văn bản dưới dạng INT8 để tiết kiệm dung lượng RAM
        print("[1/3] Đang tải các file dữ liệu ma trận...")
        A = np.loadtxt(file_A, dtype=np.int8)
        B = np.loadtxt(file_B, dtype=np.int8)
        C_hw = np.loadtxt(file_C, dtype=np.int8)
    except Exception as e:
        print(f"[ERROR] Không thể đọc file. Vui lòng kiểm tra lại đường dẫn!\nChi tiết: {e}")
        return

    # Tự động hiệu chỉnh kích thước nếu ma trận bị đọc thành mảng 1 hàng/1 cột (1D)
    if A.ndim == 1: A = A.reshape(1, -1)
    if B.ndim == 1: B = B.reshape(-1, 1)

    print(f" -> Kích thước nhận diện thực tế: A {A.shape} x B {B.shape}")
    
    if A.shape[1] != B.shape[0]:
        print(f"[ERROR] Mismatch kích thước ma trận! Không thể nhân: A_col ({A.shape[1]}) != B_row ({B.shape[0]})")
        return

    # Ép kiểu dữ liệu lên INT32 trước khi nhân tích lũy (giống mạch Post-Accumulator đầu vào của bạn)
    print("[2/3] Đang mô phỏng nhân ma trận và xử lý Rescale tuyến tính...")
    A_32 = A.astype(np.int32)
    B_32 = B.astype(np.int32)
    
    # Thực hiện nhân ma trận cho ra kết quả trung gian INT32
    C_sw_raw = np.dot(A_32, B_32)
    
    # Chạy qua bộ lọc giả lập RTL mã nguồn Verilog
    C_sw_rescaled = perform_rescale_sw(C_sw_raw, SHIFT_VAL, ZERO_POINT, ROUNDING)

    # Khớp lại định dạng ma trận C_hw từ file nếu file text lưu dữ liệu phẳng trải dài (1D)
    if C_hw.shape != C_sw_rescaled.shape:
        C_hw = C_hw.reshape(C_sw_rescaled.shape)

    # Tiến hành đối chiếu kiểm thử lỗi
    print("[3/3] Đang đối chiếu kiểm tra Bit-True so với File kết quả đầu ra...")
    
    # Ép kiểu dữ liệu lên INT16 tạm thời để thực hiện phép trừ tuyệt đối, tránh hiện tượng cuộn dấu vòng (Overflow wrap)
    diff = np.abs(C_sw_rescaled.astype(np.int16) - C_hw.astype(np.int16))
    mismatch_count = np.count_nonzero(diff)
    total_elements = C_sw_rescaled.size

    print("-" * 75)
    if mismatch_count == 0:
        print(f" [PASS] ĐỒNG BỘ HOÀN HẢO! Ma trận file C khớp Bit-True 100% ({total_elements:,}/{total_elements:,} phần tử).")
    else:
        print(f" [FAIL] SAI BIỆT DỮ LIỆU! Có {mismatch_count:,}/{total_elements:,} phần tử không trùng khớp giữa phần mềm và phần cứng.")
        
        # Truy vết 3 tọa độ lỗi đầu tiên phục vụ quá trình debug phần cứng RTL
        diff_indices = np.argwhere(C_sw_rescaled != C_hw)
        print(f" -> Gợi ý các vị trí lệch bit để debug sóng waveform:")
        for i in range(min(3, len(diff_indices))):
            r, c = diff_indices[i]
            print(f"    Tại vị trí ô [{r}, {c}]: Python_Sim = {C_sw_rescaled[r, c]:>4} | Hardware_File = {C_hw[r, c]:>4} (Giá trị INT32 gốc trước dịch bit = {C_sw_raw[r, c]})")
    print("=" * 75)

# =====================================================================
# KHAI BÁO ĐƯỜNG DẪN CÁC FILE KIỂM TRA CỦA BẠN TẠI ĐÂY
# =====================================================================
if __name__ == "__main__":
    file_matrix_A = "matran512\\input_A512x512.txt"  
    file_matrix_B = "matran512\\input_B512x512.txt"  
    file_matrix_C = "matran512\\output_C512x512_NPU.txt"  

    check_matrices(file_matrix_A, file_matrix_B, file_matrix_C)