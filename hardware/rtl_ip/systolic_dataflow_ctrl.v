`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: systolic_dataflow_ctrl   (v7: chunk pipelining)
//
// Thay doi so voi v6:
//   - Bo WAIT_SER_HIGH/WAIT_SER_LOW (cho serializer xong moi chay chunk ke).
//     Thay bang rang buoc CHU KY GIUA 2 CHUNK >= MIN_PERIOD (xem phan tich ben duoi).
//   - Chunk ke chay NGAY (zero-bubble) neu bank ke da san sang, khong can qua IDLE.
//   - Them stall_i (backpressure tu FIFO C) de khong bao gio tran FIFO.
//
// Ly do MIN_PERIOD = 48:
//   hold_psum_r cua PE(i,j) chot ket qua chunk n tai T_ij = T - (30 - i - j) (T: PE(15,15) chot).
//   output_serializer dich 16 nhip lien tuc, nhip cuoi ket thuc o T+16; moi nhip dich ghi de
//   hold_psum_r cua MOI PE. Ket qua chunk n+1 cua PE(0,0) chot o T_00 + P (P = chu ky giua
//   2 lan bat dau RUN). Chot nay phai xay ra sau nhip dich cuoi:  T_00 + P >= T + 16
//   <=> P >= 46. Dung 48 (du 2 nhip du phong).
//////////////////////////////////////////////////////////////////////////////////

module systolic_dataflow_ctrl #(
    parameter N = 16,
    parameter DATA_WIDTH = 8,
    parameter BRAM_DEPTH = 1024,
    parameter MIN_PERIOD = 48
)(
    input  wire        CLK_i,
    input  wire        RST_i,
    input  wire [31:0] k_dim_config_i,
    input  wire        bram_ready_A_i,       // bank dang doc san sang
    input  wire        bram_ready_B_i,
    input  wire        next_ready_A_i,       // bank KE TIEP san sang
    input  wire        next_ready_B_i,
    input  wire        serializer_busy_i,    // khong con dung (giu cong de tuong thich)
    input  wire        stall_i,              // 1: khong bat dau chunk moi (FIFO C gan day)
    output reg         clear_bram_ready_o,
    output reg  [$clog2(BRAM_DEPTH)-1:0] bram_rd_addr_o,
    input  wire [(N*DATA_WIDTH)-1:0] bram_data_A_i,
    input  wire [(N*DATA_WIDTH)-1:0] bram_data_B_i,

    output wire [(N*DATA_WIDTH)-1:0] skewed_data_A_o,
    output wire [(N*DATA_WIDTH)-1:0] skewed_data_B_o,
    output reg         valid_delay_o,
    output reg         clear_delay_o,
    output reg         last_mac_delay_o
);

    localparam IDLE = 2'd0;
    localparam RUN  = 2'd1;
    localparam DONE = 2'd2;

    reg [1:0]  state_r;
    reg [31:0] k_cnt_r;
    reg [7:0]  since_start_r;       // so chu ky ke tu luc bat dau chunk gan nhat (bao hoa o 255)

    wire curr_vld_w = (state_r == RUN);
    wire curr_clr_w = (state_r == RUN && k_cnt_r == 0);
    wire curr_lst_w = (state_r == RUN && k_cnt_r == k_dim_config_i - 1);

    reg vld_d1_r, clr_d1_r, lst_d1_r;

    assign skewed_data_A_o = bram_data_A_i;
    assign skewed_data_B_o = bram_data_B_i;

    // chu ky toi thieu giua 2 lan bat dau RUN: tai chu ky hien tai since_start_r = (now - S);
    // chunk moi bat dau o now+1 nen can since_start_r + 1 >= MIN_PERIOD.
    wire period_ok_w = (since_start_r >= (MIN_PERIOD - 1));
    wire go_chain_w  = next_ready_A_i && next_ready_B_i && period_ok_w && !stall_i;
    wire go_idle_w   = bram_ready_A_i && bram_ready_B_i && period_ok_w && !stall_i;

    always @(posedge CLK_i) begin
        if (!RST_i) begin
            state_r <= IDLE;
            k_cnt_r <= 0;
            bram_rd_addr_o <= 0;
            clear_bram_ready_o <= 0;
            since_start_r <= 8'd255;

            vld_d1_r <= 0; valid_delay_o <= 0;
            clr_d1_r <= 0; clear_delay_o <= 0;
            lst_d1_r <= 0; last_mac_delay_o <= 0;
        end else begin
            vld_d1_r <= curr_vld_w; valid_delay_o <= vld_d1_r;
            clr_d1_r <= curr_clr_w; clear_delay_o <= clr_d1_r;
            lst_d1_r <= curr_lst_w; last_mac_delay_o <= lst_d1_r;

            clear_bram_ready_o <= 0;
            if (since_start_r != 8'd255) since_start_r <= since_start_r + 8'd1;

            case (state_r)
                IDLE: begin
                    k_cnt_r <= 0;
                    bram_rd_addr_o <= 0;
                    if (go_idle_w) begin
                        state_r <= RUN;
                        since_start_r <= 8'd0;
                    end
                end

                RUN: begin
                    if (k_cnt_r == k_dim_config_i - 1) begin
                        clear_bram_ready_o <= 1'b1;
                        if (go_chain_w) begin
                            // zero-bubble: chunk ke bat dau ngay chu ky sau.
                            // Bank doc doi o cuoi chu ky DONE (clear_ready_i hieu luc 1 chu ky sau),
                            // du lieu cua beat dau chunk ke di qua mux sau thanh ghi doc RAM nen
                            // van chon dung bank moi (xem bram_input_buffer).
                            state_r <= RUN;
                            k_cnt_r <= 0;
                            bram_rd_addr_o <= 0;
                            since_start_r <= 8'd0;
                        end else begin
                            state_r <= DONE;
                        end
                    end else begin
                        k_cnt_r <= k_cnt_r + 1;
                        bram_rd_addr_o <= bram_rd_addr_o + 1;
                    end
                end

                DONE: begin
                    // 1 chu ky cho clear_ready_i co hieu luc (rd_bank dao, co ready cu bi xoa)
                    k_cnt_r <= 0;
                    bram_rd_addr_o <= 0;
                    state_r <= IDLE;
                end

                default: state_r <= IDLE;
            endcase
        end
    end
endmodule
