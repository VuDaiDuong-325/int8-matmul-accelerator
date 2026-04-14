`timescale 1ns / 1ps
// ============================================================
// Module  : output_accumulator
// Chức năng: Tích lũy INT32 partial results trong phần cứng,
//            thay thế software accumulation trong C code.
//
// ─── KIẾN TRÚC TỔNG QUAN ─────────────────────────────────
//
//  output_serializer        output_accumulator
//  ┌─────────────────┐     ┌────────────────────────────────┐
//  │ acc_wr_en  ─────┼─────► acc_wr_en                      │
//  │ row_in[511:0]───┼─────► row_in[511:0]   PING LUTRAM    │──► acc_row_out[511:0]
//  │ row_addr[3:0]───┼─────► row_addr[3:0]   16banks×16×32  │    acc_row_valid
//  └─────────────────┘     │                               │    acc_row_addr_out
//  systolic_ctrl            │ new_tile        PONG LUTRAM    │    acc_tile_done
//  ┌─────────────────┐     │ k_tile_last     16banks×16×32  │
//  │ new_tile   ─────┼─────►                                │
//  │ k_tile_last─────┼─────►                                │
//  └─────────────────┘     └────────────────────────────────┘
//
// ─── MEMORY: 16-COLUMN BANK DISTRIBUTED RAM ──────────────
//
//  Vấn đề: Cần đọc/ghi 16 INT32 (512-bit) mỗi cycle.
//  BRAM36 max width = 72-bit → không thể đọc 512-bit/cycle.
//  Giải pháp: 16 column banks, mỗi bank là LUTRAM 16×32-bit.
//
//  Bank[c] lưu column c của ma trận C:
//    Bank[c].ping_mem[r] = C_ping[r][c]  (r=0..15)
//
//  Đọc hàng r: { Bank[15].mem[r], ..., Bank[0].mem[r] }
//  Ghi hàng r: Bank[c].mem[r] <= data[c*32+:32]  (c=0..15)
//
//  Tài nguyên: 2(ping+pong) × 16 banks × 16×32 = 128 LUT6
//
// ─── PIPELINED READ-MODIFY-WRITE (RMW) ───────────────────
//
//  LUTRAM sync read latency = 1 nhịp.
//
//  T+0 : acc_wr_en=1, row_addr=R → issue LUTRAM read
//  T+1 : LUTRAM[R] valid → sum = LUTRAM[R] + row_in_d1
//        → write LUTRAM[R] = sum
//
//  Không có RAW hazard vì serializer đảm bảo:
//    Mỗi hàng xuất 1 lần/K-chunk, cách nhau ≥4 nhịp (LATCH+WR+SHIFT+WAIT)
//    Latency pipeline = 1 nhịp << 4 nhịp → safe
//
// ─── PING-PONG & DRAIN ────────────────────────────────────
//
//  k_tile_last=1 khi hàng row_addr=N-1 của K-chunk cuối ghi vào:
//    → Flip acc_side (write chuyển sang buffer kia)
//    → Drain FSM bắt đầu đọc buffer vừa hoàn thành
//
//  new_tile=1 khi bắt đầu tile (M,N) khác nhau:
//    → Ghi đè trực tiếp (= bỏ qua giá trị cũ trong LUTRAM)
//    → Kết hợp với k_tile_last (luôn cùng nhịp)
//
//  Overlap:
//    Drain 16 hàng = 32 nhịp (1 hàng/2 nhịp)
//    Write 16 hàng = 64 nhịp (1 hàng/4 nhịp)
//    → Drain hoàn thành TRƯỚC KHI write xong tile tiếp theo
//    → Zero idle between tiles
//
// ─── DRAIN TIMING ────────────────────────────────────────
//
//  Drain FSM dùng counter 2-phase pipeline:
//    Nhịp 2K+1 : issue read addr = row K
//    Nhịp 2K+2 : LUTRAM data valid → latch + output previous row
//  Sau N=16 hàng:
//    acc_row_out  = 1 hàng/2 nhịp, valid = 1 nhịp per hàng
//    acc_tile_done = pulse sau khi hàng N-1 xuất xong
// ============================================================

module output_accumulator #(
    parameter N         = 16,
    parameter ACC_WIDTH = 32
)(
    input  wire                     clk,
    input  wire                     rst_n,

    // ── Từ output_serializer ────────────────────────────────
    input  wire                     acc_wr_en,      // 1 nhịp pulse mỗi hàng
    input  wire [(N*ACC_WIDTH)-1:0] row_in,         // 16×INT32 = 512-bit
    input  wire [$clog2(N)-1:0]     row_addr,       // 0..N-1

    // ── Điều khiển tile ─────────────────────────────────────
    // Cả hai assert cùng lúc với acc_wr_en khi row_addr = N-1
    input  wire                     new_tile,       // 1 → ghi đè (không cộng dồn)
    input  wire                     k_tile_last,    // 1 → K-chunk cuối, flip buffer

    // ── Đến quantizer ───────────────────────────────────────
    output reg  [(N*ACC_WIDTH)-1:0] acc_row_out,    // 1 hàng 512-bit
    output reg                      acc_row_valid,  // 1 nhịp/hàng
    output reg  [$clog2(N)-1:0]     acc_row_addr_out,
    output reg                      acc_tile_done   // Pulse sau hàng cuối
);

    localparam LOG_N = $clog2(N);  // = 4 khi N=16

    // ================================================================
    // PING-PONG SIDE CONTROL
    // ================================================================
    reg acc_side;    // 0: write→Ping; 1: write→Pong
    reg drain_side;  // buffer đang được drain (= ~acc_side sau flip)
    reg flip_pending; // lật yêu cầu (set khi k_tile_last, clear khi FSM nhận)

    // ================================================================
    // N COLUMN BANKS – Distributed RAM (LUTRAM)
    // Mỗi bank: ping_mem[row], pong_mem[row] – 16-entry × 32-bit
    // Vivado sẽ inference thành RAM16 hoặc SRLC32E
    // ================================================================
    // Mảng 2D phẳng: ping[col][row], pong[col][row]
    (* ram_style = "distributed" *) reg [ACC_WIDTH-1:0] ping_mem [0:N*N-1];
    (* ram_style = "distributed" *) reg [ACC_WIDTH-1:0] pong_mem [0:N*N-1];
    // Địa chỉ: addr = row * N + col  (row = 0..N-1, col = 0..N-1)
    // Nhưng vì cần đọc N words/cycle, không thể dùng 1 mảng chung.
    // → Dùng N mảng riêng lẻ (1 mảng per column bank).

    // ================================================================
    // N COLUMN BANKS (riêng lẻ để đọc N words/cycle)
    // ================================================================
    // Khai báo N cặp mảng bên ngoài generate để tham chiếu từ FSM
    // Cách đơn giản nhất cho Verilog: dùng mảng 2D [col][row]
    // Nhưng Verilog không hỗ trợ mảng 2D port → flatten thủ công

    // Dùng generate với named block để FSM truy cập được
    wire [ACC_WIDTH-1:0] ping_rd [0:N-1]; // Kết nối đọc ping per column
    wire [ACC_WIDTH-1:0] pong_rd [0:N-1]; // Kết nối đọc pong per column

    // RMW pipeline registers (1 set, dùng chung cho tất cả columns)
    reg                  wr_pipe1;          // acc_wr_en delayed 1
    reg [LOG_N-1:0]      waddr_pipe1;       // row_addr delayed 1
    reg [(N*ACC_WIDTH)-1:0] row_in_pipe1;   // row_in delayed 1
    reg                  new_tile_pipe1;    // new_tile delayed 1
    reg                  acc_side_pipe1;    // acc_side delayed 1 (captured at T)

    // Drain read address (phát từ FSM)
    reg [LOG_N-1:0]      drain_row_rd;      // addr phát đến LUTRAM
    reg                  drain_rd_en;       // enable đọc drain

    genvar col;
    generate
        for (col = 0; col < N; col = col + 1) begin : col_bank

            (* ram_style = "distributed" *) reg [ACC_WIDTH-1:0] ping [0:N-1];
            (* ram_style = "distributed" *) reg [ACC_WIDTH-1:0] pong [0:N-1];

            // Synchronous read for RMW (write path)
            reg [ACC_WIDTH-1:0] rmw_rd;
            always @(posedge clk) begin
                if (acc_wr_en) begin
                    if (acc_side == 1'b0) rmw_rd <= ping[row_addr];
                    else                  rmw_rd <= pong[row_addr];
                end
            end

            // Write back at T+1
            wire [ACC_WIDTH-1:0] new_val = new_tile_pipe1 ?
                row_in_pipe1[col*ACC_WIDTH +: ACC_WIDTH] :
                (rmw_rd + row_in_pipe1[col*ACC_WIDTH +: ACC_WIDTH]);

            always @(posedge clk) begin
                if (wr_pipe1) begin
                    if (acc_side_pipe1 == 1'b0) ping[waddr_pipe1] <= new_val;
                    else                        pong[waddr_pipe1] <= new_val;
                end
            end

            // Drain read (synchronous read, 1-nhịp latency)
            reg [ACC_WIDTH-1:0] drain_rd;
            always @(posedge clk) begin
                if (drain_rd_en) begin
                    if (drain_side == 1'b0) drain_rd <= ping[drain_row_rd];
                    else                    drain_rd <= pong[drain_row_rd];
                end
            end

            // Expose drain output as wire
            assign pong_rd[col] = col_bank[col].drain_rd; // reuse wire for drain
            assign ping_rd[col] = col_bank[col].drain_rd; // same signal

        end
    endgenerate

    // ================================================================
    // RMW PIPELINE STAGE REGISTERS
    // ================================================================
    always @(posedge clk) begin
        if (!rst_n) begin
            wr_pipe1        <= 1'b0;
            waddr_pipe1     <= 0;
            row_in_pipe1    <= 0;
            new_tile_pipe1  <= 1'b0;
            acc_side_pipe1  <= 1'b0;
        end else begin
            wr_pipe1        <= acc_wr_en;
            waddr_pipe1     <= row_addr;
            row_in_pipe1    <= row_in;
            new_tile_pipe1  <= new_tile;
            acc_side_pipe1  <= acc_side;
        end
    end

    // ================================================================
    // PING-PONG FLIP LOGIC
    // ================================================================
    always @(posedge clk) begin
        if (!rst_n) begin
            acc_side     <= 1'b0;
            drain_side   <= 1'b1;
            flip_pending <= 1'b0;
        end else begin
            // Flip khi hàng cuối (N-1) của K-chunk cuối được ghi
            if (acc_wr_en && k_tile_last && (row_addr == N[LOG_N-1:0] - 1)) begin
                acc_side     <= ~acc_side;   // write side sang buffer kia
                drain_side   <= acc_side;    // drain side = buffer vừa xong
                flip_pending <= 1'b1;        // thông báo cho Drain FSM
            end

            // Clear sau khi Drain FSM nhận yêu cầu
            if (flip_pending && drain_state == DR_START) begin
                flip_pending <= 1'b0;
            end
        end
    end

    // ================================================================
    // DRAIN FSM
    // ================================================================
    localparam DR_IDLE  = 2'd0;
    localparam DR_START = 2'd1; // Phát addr row 0 (và reset counter)
    localparam DR_RD    = 2'd2; // Đọc LUTRAM: phát addr, nhận data nhịp sau
    localparam DR_FLUSH = 2'd3; // Flush hàng cuối

    reg [1:0]      drain_state;
    reg [LOG_N-1:0] drain_row;  // Hàng đang được đọc từ LUTRAM
    reg [LOG_N-1:0] drain_out_row; // Hàng đang output (drain_row - 1)

    // Assemble output row từ N column drain_rd registers
    wire [(N*ACC_WIDTH)-1:0] drain_assembled;
    genvar dc;
    generate
        for (dc = 0; dc < N; dc = dc + 1) begin : drain_assemble
            assign drain_assembled[dc*ACC_WIDTH +: ACC_WIDTH] = col_bank[dc].drain_rd;
        end
    endgenerate

    always @(posedge clk) begin
        if (!rst_n) begin
            drain_state      <= DR_IDLE;
            drain_row        <= 0;
            drain_out_row    <= 0;
            drain_row_rd     <= 0;
            drain_rd_en      <= 1'b0;
            acc_row_valid    <= 1'b0;
            acc_row_addr_out <= 0;
            acc_row_out      <= 0;
            acc_tile_done    <= 1'b0;
        end else begin
            acc_row_valid <= 1'b0;
            acc_tile_done <= 1'b0;
            drain_rd_en   <= 1'b0;

            case (drain_state)
                DR_IDLE: begin
                    if (flip_pending) begin
                        drain_row   <= 0;
                        drain_state <= DR_START;
                    end
                end

                DR_START: begin
                    // Phát địa chỉ hàng 0 → LUTRAM bắt đầu đọc
                    drain_row_rd <= 0;
                    drain_rd_en  <= 1'b1;
                    drain_row    <= 1;
                    drain_state  <= DR_RD;
                end

                DR_RD: begin
                    // LUTRAM data của hàng trước valid tại nhịp này
                    // Output hàng vừa đọc (drain_row - 1)
                    acc_row_out      <= drain_assembled;
                    acc_row_valid    <= 1'b1;
                    acc_row_addr_out <= drain_row - 1;

                    if (drain_row == N[LOG_N-1:0]) begin
                        // Đã phát xong tất cả địa chỉ, chờ data hàng cuối
                        drain_state <= DR_FLUSH;
                    end else begin
                        // Phát địa chỉ hàng tiếp theo
                        drain_row_rd <= drain_row;
                        drain_rd_en  <= 1'b1;
                        drain_row    <= drain_row + 1;
                    end
                end

                DR_FLUSH: begin
                    // LUTRAM data của hàng cuối (N-1) valid tại nhịp này
                    acc_row_out      <= drain_assembled;
                    acc_row_valid    <= 1'b1;
                    acc_row_addr_out <= N[LOG_N-1:0] - 1;
                    acc_tile_done    <= 1'b1;
                    drain_state      <= DR_IDLE;
                end

                default: drain_state <= DR_IDLE;
            endcase
        end
    end

endmodule
