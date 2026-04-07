module array_top #(
    parameter ARRAY_SIZE = 4,
    parameter ADDR_WIDTH = 32
)(
    input  wire clk,
    input  wire rst_n,
    input  wire start,

    // Config by CPU
    input  wire [15:0] M_size,
    input  wire [15:0] K_size,
    input  wire [15:0] N_size,

    // BRAM interface
    output wire [ADDR_WIDTH-1:0] addr_A,
    output wire [ADDR_WIDTH-1:0] addr_B,
    input  wire [(ARRAY_SIZE*8)-1:0] data_A,
    input  wire [(ARRAY_SIZE*8)-1:0] data_B,

    // BRAM/FIFO interface (Output C)
    output wire                  we_C,
    output wire [ADDR_WIDTH-1:0] addr_C,
    output wire [31:0]           data_C,
    
    // Status flag for CPU
    output wire                  done
);

    // =========================================================
    // INTERNAL SIGNALS
    // =========================================================
    wire [ARRAY_SIZE-1:0] vld;
    wire [ARRAY_SIZE-1:0] clear_acc;
    wire [ARRAY_SIZE-1:0] last_mac;

    wire [(ARRAY_SIZE*8)-1:0] act;
    wire [(ARRAY_SIZE*8)-1:0] weight;

    // debug signals
    (* mark_debug = "true" *) wire [(ARRAY_SIZE*ARRAY_SIZE*32)-1:0] psum_out_matrix;
    (* mark_debug = "true" *) wire [(ARRAY_SIZE*ARRAY_SIZE)-1:0]    mac_valid_matrix;
    
    // =========================================================
    // ADDRESS ALIGNMENT LOGIC (WORD TO BYTE ADDRESSING)
    // =========================================================
    wire [ADDR_WIDTH-1:0] ctrl_addr_A;
    wire [ADDR_WIDTH-1:0] ctrl_addr_B;
    wire [ADDR_WIDTH-1:0] ctrl_addr_C;

    // Tính toán số bit cần dịch dựa trên độ rộng gói dữ liệu
    // Nếu ARRAY_SIZE = 4 -> data_A/B là 4 bytes -> Dịch 2 bit ($clog2(4) = 2)
    // Nếu ARRAY_SIZE = 8 -> data_A/B là 8 bytes -> Dịch 3 bit ($clog2(8) = 3)
    localparam SHIFT_AB = $clog2(ARRAY_SIZE); 
    
    // data_C luôn cố định xuất 32-bit (4 bytes) ra ngoài -> Luôn dịch 2 bit
    localparam SHIFT_C  = 2; 

    assign addr_A = ctrl_addr_A;
    assign addr_B = ctrl_addr_B;
    assign addr_C = ctrl_addr_C << SHIFT_C;

    // =========================================================
    // 1. CONTROLLER
    // =========================================================
    array_ctrl #(
        .ARRAY_SIZE (ARRAY_SIZE),
        .ADDR_WIDTH (ADDR_WIDTH)
    ) u_ctrl (
        .clk              (clk),
        .rst_n            (rst_n),
        .start            (start),

        .M_size           (M_size),
        .K_size           (K_size),
        .N_size           (N_size),

        .addr_A           (ctrl_addr_A),
        .addr_B           (ctrl_addr_B),
        .data_A           (data_A),
        .data_B           (data_B),

        .we_C             (we_C),
        .addr_C           (ctrl_addr_C),
        .data_C           (data_C),
        .psum_in_matrix   (psum_out_matrix),

        .valid_in_left    (vld),
        .clear_acc_left   (clear_acc),
        .last_mac_in_left (last_mac),
        .act_in_left      (act),
        .weight_in_top    (weight),

        .done             (done)
    );

    // =========================================================
    // 2. SYSTOLIC ARRAY
    // =========================================================
    matmul_array #(
        .ARRAY_SIZE(ARRAY_SIZE)
    ) u_matmul (
        .clk              (clk),
        .rst_n            (rst_n),

        .valid_in_left    (vld),
        .clear_acc_left   (clear_acc),
        .last_mac_in_left (last_mac),

        .act_in_left      (act),
        .weight_in_top    (weight),
        .psum_in_left     ({(ARRAY_SIZE*32){1'b0}}),

        .psum_out_matrix  (psum_out_matrix),
        .mac_valid_matrix (mac_valid_matrix)
    );
endmodule