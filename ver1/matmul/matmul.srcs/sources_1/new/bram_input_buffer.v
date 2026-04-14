`timescale 1ns / 1ps
// ============================================================
// Module: bram_input_buffer (Ping-Pong Buffer)
//
// FIX: [Synth 8-6849] ram_style = "block" infeasible
//
// NGUYÊN NHÂN:
//   DATA_WIDTH = N*8 = 128-bit.
//   Vivado BRAM36 Simple Dual Port chỉ hỗ trợ tối đa 72-bit/word.
//   Khai báo reg [127:0] ram[0:1023] với (* ram_style="block" *)
//   là "infeasible" → Vivado fall-back sang LUTRAM, gây warning
//   và tiêu tốn hàng nghìn LUT thay vì 8 BRAM36.
//
// GIẢI PHÁP (BRAM Banking):
//   Tách mỗi RAM ping/pong thành N_BANKS bank độc lập,
//   mỗi bank rộng BANK_WIDTH = 64-bit.
//   DATA_WIDTH=128 → N_BANKS=2 → mỗi bank là 1024×64 = 1 BRAM36 SDP.
//   Đọc/ghi ghép lại bằng bit-slice, logic ngoài không đổi.
//
// TÀI NGUYÊN (DATA_WIDTH=128, DEPTH=1024):
//   2 banks × 2 RAMs (ping+pong) = 4 BRAM36 mỗi instance
//   → 2 instances (A, B) = 8 BRAM36 tổng cộng
// ============================================================

module bram_input_buffer #(
    parameter DATA_WIDTH = 128,
    parameter DEPTH      = 1024,
    // Bank width phải <= 64 để Vivado map vào BRAM36 SDP (1K×64-bit)
    // Không đổi tham số này trừ khi biết mình đang làm gì.
    parameter BANK_WIDTH = 64,
    parameter N_BANKS    = (DATA_WIDTH + BANK_WIDTH - 1) / BANK_WIDTH
)(
    input  wire                     clk,
    input  wire                     rst_n,
    input  wire [29:0]              chunk_len,
    input  wire [DATA_WIDTH-1:0]    s_axis_tdata,
    input  wire                     s_axis_tvalid,
    output wire                     s_axis_tready,
    input  wire                     s_axis_tlast,
    input  wire [$clog2(DEPTH)-1:0] rd_addr,
    output wire [DATA_WIDTH-1:0]    rd_data,
    output wire                     block_ready,
    input  wire                     clear_ready
);

    localparam ADDR_WIDTH = $clog2(DEPTH);

    // ----------------------------------------------------------------
    // PING-PONG CONTROL REGISTERS
    // ----------------------------------------------------------------
    reg [ADDR_WIDTH-1:0] wr_ptr;
    reg wr_side;
    reg rd_side;
    reg ping_ready;
    reg pong_ready;

    assign s_axis_tready = (wr_side == 1'b0) ? ~ping_ready : ~pong_ready;
    assign block_ready   = (rd_side == 1'b0) ?  ping_ready :  pong_ready;

    // ----------------------------------------------------------------
    // WRITE FSM + FLAG LOGIC
    // clear_ready luôn ở cuối always block để đảm bảo NB priority:
    // nếu DMA set và CTRL clear xảy ra cùng nhịp → clear thắng.
    // ----------------------------------------------------------------
    always @(posedge clk) begin
        if (!rst_n) begin
            wr_ptr     <= 0;
            wr_side    <= 1'b0;
            ping_ready <= 1'b0;
            pong_ready <= 1'b0;
        end else begin
            if (s_axis_tvalid && s_axis_tready) begin
                if (wr_ptr == chunk_len - 1 || s_axis_tlast) begin
                    wr_ptr  <= 0;
                    if (wr_side == 1'b0) ping_ready <= 1'b1;
                    else                 pong_ready <= 1'b1;
                    wr_side <= ~wr_side;
                end else begin
                    wr_ptr <= wr_ptr + 1;
                end
            end
            // clear_ready sau cùng → ưu tiên cao nhất
            if (clear_ready) begin
                if (rd_side == 1'b0) ping_ready <= 1'b0;
                else                 pong_ready <= 1'b0;
            end
        end
    end

    // ----------------------------------------------------------------
    // READ SIDE FLIP + PIPELINE DELAY
    // ----------------------------------------------------------------
    reg rd_side_d1; // Cần thêm tín hiệu trễ 1 nhịp để điều khiển MUX
    
    always @(posedge clk) begin
        if (!rst_n) begin
            rd_side    <= 1'b0;
            rd_side_d1 <= 1'b0;
        end else begin
            if (clear_ready) rd_side <= ~rd_side;
            
            // Trễ 1 nhịp để đồng bộ với dữ liệu chui ra từ BRAM
            rd_side_d1 <= rd_side; 
        end
    end

    // ================================================================
    // BANKED BRAM INFERENCE (ĐÃ SỬA LỖI MUX)
    // ================================================================
    wire [DATA_WIDTH-1:0] bram_ping_out;
    wire [DATA_WIDTH-1:0] bram_pong_out;
    reg  [DATA_WIDTH-1:0] pipeline_reg;

    assign rd_data = pipeline_reg;

    // Pipeline stage 2 (Bộ MUX nằm SAU BRAM register)
    always @(posedge clk) begin
        if (rd_side_d1 == 1'b0)
            pipeline_reg <= bram_ping_out;
        else
            pipeline_reg <= bram_pong_out;
    end

    genvar bk;
    generate
        for (bk = 0; bk < N_BANKS; bk = bk + 1) begin : gen_bram_bank

            localparam integer BIT_LO = bk * BANK_WIDTH;
            localparam integer BIT_HI = (BIT_LO + BANK_WIDTH - 1 < DATA_WIDTH - 1) ?
                                         BIT_LO + BANK_WIDTH - 1 : DATA_WIDTH - 1;
            localparam integer BK_W   = BIT_HI - BIT_LO + 1;

            (* ram_style = "block" *) reg [BK_W-1:0] ram_ping [0:DEPTH-1];
            (* ram_style = "block" *) reg [BK_W-1:0] ram_pong [0:DEPTH-1];

            // --- Write port (Không đổi) ---
            always @(posedge clk) begin
                if (s_axis_tvalid && s_axis_tready) begin
                    if (wr_side == 1'b0)
                        ram_ping[wr_ptr] <= s_axis_tdata[BIT_HI:BIT_LO];
                    else
                        ram_pong[wr_ptr] <= s_axis_tdata[BIT_HI:BIT_LO];
                end
            end

            // --- Read port (SỬA Ở ĐÂY: Vô điều kiện) ---
            reg [BK_W-1:0] ping_out_reg;
            reg [BK_W-1:0] pong_out_reg;

            always @(posedge clk) begin
                // Không dùng lệnh IF. Đọc song song cả 2 BRAM.
                // Điều này làm Vivado nhận diện chính xác 100% template của BRAM
                ping_out_reg <= ram_ping[rd_addr];
                pong_out_reg <= ram_pong[rd_addr];
            end

            // Nối dữ liệu bank này vào bus tổng
            assign bram_ping_out[BIT_HI:BIT_LO] = ping_out_reg;
            assign bram_pong_out[BIT_HI:BIT_LO] = pong_out_reg;

        end
    endgenerate

endmodule