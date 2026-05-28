module post_accumulator #(
    parameter N      = 16,   // Kích thước systolic array (số cột/hàng)
    parameter DATA_W = 32    // Độ rộng mỗi phần tử (INT32)
)(
    input  wire        clk,
    input  wire        rst_n,
 
    // ── Config ────────────────────────────────────────────────────────────────
    // num_k_tiles: số tiles cần tích lũy, [31:0] cho nhất quán với k_dim config
    input  wire [31:0] num_k_tiles,
 
    // ── AXI-Stream Slave: nhận INT32 rows từ FIFO C (FWFT) ───────────────────
    input  wire [(N*DATA_W)-1:0] s_axis_tdata,
    input  wire                  s_axis_tvalid,
    output reg                   s_axis_tready,
    input  wire                  s_axis_tlast,   // không dùng trong FSM, pass-through
 
    // ── AXI-Stream Master: xuất INT32 rows đến int32_to_int8_rescale ─────────
    output reg  [(N*DATA_W)-1:0] m_axis_tdata,
    output reg                   m_axis_tvalid,
    input  wire                  m_axis_tready,
    output reg                   m_axis_tlast,   // 1 mỗi hàng (HSIZE line)
    output reg                   m_axis_tuser    // 1 ở hàng đầu tiên (SOF)
);
 
    localparam S_RECV   = 1'b0;   // Pha nhận và tích lũy tiles
    localparam S_OUTPUT = 1'b1;   // Pha xuất kết quả
 
    reg        state;
    reg  [4:0] row_cnt;    // Hàng đang nhận (0..N-1)
    reg [31:0] tile_cnt;   // Tile đang nhận (0..num_k_tiles-1)
    reg  [4:0] out_cnt;    // Hàng đang xuất (0..N, N = báo kết thúc)
 
    // ── Bộ đệm tích lũy: distributed-RAM N×(N×32b) ──────────────────────────
    (* ram_style = "distributed" *)
    reg [(N*DATA_W)-1:0] acc_ram [0:N-1];
 
    // ── Giá trị mới: ghi đè (tile 0) hoặc cộng dồn (tile >0) ────────────────
    wire [(N*DATA_W)-1:0] new_row_val;
    genvar g;
    generate
        for (g = 0; g < N; g = g + 1) begin : GEN_ACC_ADDER
            assign new_row_val[g*DATA_W +: DATA_W] =
                (tile_cnt == 32'd0)
                ? s_axis_tdata[g*DATA_W +: DATA_W]
                : $signed(acc_ram[row_cnt][g*DATA_W +: DATA_W])
                  + $signed(s_axis_tdata[g*DATA_W +: DATA_W]);
        end
    endgenerate
 
    // ── FSM ──────────────────────────────────────────────────────────────────
    always @(posedge clk) begin
        if (!rst_n) begin
            state         <= S_RECV;
            row_cnt       <= 5'd0;
            tile_cnt      <= 32'd0;
            out_cnt       <= 5'd0;
            s_axis_tready <= 1'b1;
            m_axis_tvalid <= 1'b0;
            m_axis_tlast  <= 1'b0;
            m_axis_tuser  <= 1'b0;
            m_axis_tdata  <= {(N*DATA_W){1'b0}};
        end else begin
            case (state)
 
                // =============================================================
                // S_RECV: Nhận từng hàng từ FIFO, ghi/cộng vào acc_ram
                // =============================================================
                S_RECV: begin
                    s_axis_tready <= 1'b1;
                    m_axis_tvalid <= 1'b0;
                    m_axis_tlast  <= 1'b0;
                    m_axis_tuser  <= 1'b0;
 
                    if (s_axis_tvalid && s_axis_tready) begin
                        acc_ram[row_cnt] <= new_row_val;
 
                        if (row_cnt == N[4:0] - 1) begin
                            row_cnt <= 5'd0;
                            if (tile_cnt >= num_k_tiles - 32'd1) begin
                                // Đủ tiles → chuyển sang xuất
                                tile_cnt      <= 32'd0;
                                out_cnt       <= 5'd0;
                                s_axis_tready <= 1'b0;
                                state         <= S_OUTPUT;
                            end else begin
                                tile_cnt <= tile_cnt + 32'd1;
                            end
                        end else begin
                            row_cnt <= row_cnt + 5'd1;
                        end
                    end
                end
 
                // =============================================================
                // S_OUTPUT: Xuất lần lượt N hàng ra downstream.
                //
                //   Thứ tự: acc_ram[N-1] trước, acc_ram[0] sau.
                //   Lý do: systolic drain bắt đầu từ hàng cuối (bottom-up),
                //          nên acc_ram[0] = C[N-1], acc_ram[N-1] = C[0].
                //          Đảo ngược để downstream nhận C[0] trước.
                //
                //   Handshake: chỉ advance out_cnt khi (!tvalid || tready)
                //   Sau khi xuất đủ N hàng (out_cnt == N): về S_RECV.
                // =============================================================
                S_OUTPUT: begin
                    if (!m_axis_tvalid || m_axis_tready) begin
                        if (out_cnt == N[4:0]) begin
                            // Xong N hàng → về nhận tile tiếp theo
                            m_axis_tvalid <= 1'b0;
                            m_axis_tlast  <= 1'b0;
                            m_axis_tuser  <= 1'b0;
                            s_axis_tready <= 1'b1;
                            state         <= S_RECV;
                        end else begin
                            m_axis_tvalid <= 1'b1;
                            m_axis_tdata  <= acc_ram[N[4:0] - 1 - out_cnt];
                            
                            // [FIX LỖI TLAST]: Chỉ bật tlast ở hàng cuối cùng của mảng 16x16
                            m_axis_tlast  <= (out_cnt == (N[4:0] - 5'd1)) ? 1'b1 : 1'b0; 
                            
                            m_axis_tuser  <= (out_cnt == 5'd0) ? 1'b1 : 1'b0; // SOF
                            out_cnt       <= out_cnt + 5'd1;
                        end
                    end
                end
 
                default: begin
                    state         <= S_RECV;
                    s_axis_tready <= 1'b1;
                end
            endcase
        end
    end
 
endmodule
 