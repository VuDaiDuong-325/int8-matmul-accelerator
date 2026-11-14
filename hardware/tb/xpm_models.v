`timescale 1ns / 1ps
// Behavioral models cho xpm_memory_sdpram / xpm_fifo_sync (CHI de mo phong).
// Bo nho khoi tao bang gia tri NGAU NHIEN (khong phai X) de kiem tra mask padding:
// neu RTL doc nham du lieu rac ma khong mask, ket qua se sai that chu khong bi X che.

module xpm_memory_sdpram #(
    parameter ADDR_WIDTH_A = 9,
    parameter ADDR_WIDTH_B = 9,
    parameter WRITE_DATA_WIDTH_A = 128,
    parameter READ_DATA_WIDTH_B = 128,
    parameter MEMORY_SIZE = 128*512,
    parameter READ_LATENCY_B = 1,
    parameter MEMORY_PRIMITIVE = "block",
    parameter WRITE_MODE_B = "read_first"
)(
    input  wire clka, input wire clkb, input wire ena, input wire enb,
    input  wire wea,
    input  wire [ADDR_WIDTH_A-1:0] addra,
    input  wire [WRITE_DATA_WIDTH_A-1:0] dina,
    input  wire [ADDR_WIDTH_B-1:0] addrb,
    output reg  [READ_DATA_WIDTH_B-1:0] doutb,
    input  wire sleep, input wire regceb, input wire injectsbiterra, input wire injectdbiterra
);
    localparam DEPTH = MEMORY_SIZE / WRITE_DATA_WIDTH_A;
    reg [WRITE_DATA_WIDTH_A-1:0] mem [0:DEPTH-1];
    integer i, j;
    initial begin
        for (i = 0; i < DEPTH; i = i + 1) begin
            for (j = 0; j < (WRITE_DATA_WIDTH_A+31)/32; j = j + 1)
                mem[i][j*32 +: 32] = $random;
        end
        doutb = {READ_DATA_WIDTH_B{1'b0}};
    end
    // clka == clkb (cung mot clock trong thiet ke nay). Doc truoc ghi (read_first).
    always @(posedge clka) begin
        if (ena && wea) mem[addra] <= dina;
        if (enb)        doutb      <= mem[addrb];
    end
endmodule

module xpm_fifo_sync #(
    parameter FIFO_MEMORY_TYPE = "block",
    parameter READ_MODE = "fwft",
    parameter FIFO_WRITE_DEPTH = 1024,
    parameter WRITE_DATA_WIDTH = 32,
    parameter READ_DATA_WIDTH = 32,
    parameter FIFO_READ_LATENCY = 0,
    parameter USE_ADV_FEATURES = "0000"
)(
    output wire [READ_DATA_WIDTH-1:0] dout,
    output wire empty, output wire full,
    input  wire [WRITE_DATA_WIDTH-1:0] din,
    input  wire rd_en, input wire wr_clk, input wire wr_en, input wire rst,
    input  wire injectdbiterr, input wire injectsbiterr, input wire sleep
);
    reg [WRITE_DATA_WIDTH-1:0] mem [0:FIFO_WRITE_DEPTH-1];
    reg [31:0] rp_r, wp_r, cnt_r;
    assign empty = (cnt_r == 0);
    assign full  = (cnt_r == FIFO_WRITE_DEPTH);
    assign dout  = mem[rp_r];
    wire wr_ok = wr_en && !full;
    wire rd_ok = rd_en && !empty;
    initial begin rp_r = 0; wp_r = 0; cnt_r = 0; end
    always @(posedge wr_clk) begin
        if (rst) begin
            rp_r <= 0; wp_r <= 0; cnt_r <= 0;
        end else begin
            if (wr_ok) begin
                mem[wp_r] <= din;
                wp_r <= (wp_r + 1) % FIFO_WRITE_DEPTH;
            end
            if (rd_ok) rp_r <= (rp_r + 1) % FIFO_WRITE_DEPTH;
            cnt_r <= cnt_r + (wr_ok ? 1 : 0) - (rd_ok ? 1 : 0);
        end
    end
endmodule
