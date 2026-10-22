`timescale 1ns / 1ps
//==============================================================================
// Module   : gemm_top_l2   (v6)
// Project  : INT8 GEMM Accelerator - KV260 / LLM
//
// Thin wrapper cho l2_tiling_agu. Thay đổi so với v5:
//   - DIM_W = 20 (M/K/N tối đa 1,048,575)
//   - Thêm: lda, ldb, ldc, ldc32, base_c32, base_param, out_mode, err_o
//   - Bỏ  : num_k_tiles_per_block (tự tính theo block), scale_shift, zero_point
//           (thay bằng bảng tham số requant theo kênh trong DDR)
//==============================================================================

module gemm_top_l2 #(
    parameter N          = 16,
    parameter M_BLK      = 256,
    parameter N_BLK      = 256,
    parameter K_BLK      = 256,
    parameter ADDR_W     = 32,
    parameter DIM_W      = 20,
    parameter FIFO_DEPTH = 1024,
    parameter BRAM_DEPTH = 1024
)(
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK_i CLK" *)
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_RESET RST_i, ASSOCIATED_BUSIF mm2s_cmd:mm2s:s2mm_cmd:s2mm:s2mm_sts" *)
    input  wire           CLK_i,
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST_i RST" *)
    input  wire           RST_i,

    input  wire [DIM_W-1:0]   cfg_m_total_i,
    input  wire [DIM_W-1:0]   cfg_n_total_i,
    input  wire [DIM_W-1:0]   cfg_k_total_i,
    input  wire [DIM_W-1:0]   cfg_k_dim_i,
    input  wire [ADDR_W-1:0]  cfg_base_a_i,
    input  wire [ADDR_W-1:0]  cfg_base_b_i,
    input  wire [ADDR_W-1:0]  cfg_base_c_i,
    input  wire [ADDR_W-1:0]  cfg_base_c32_i,
    input  wire [ADDR_W-1:0]  cfg_base_param_i,
    input  wire [ADDR_W-1:0]  cfg_lda_i,
    input  wire [ADDR_W-1:0]  cfg_ldb_i,
    input  wire [ADDR_W-1:0]  cfg_ldc_i,
    input  wire [ADDR_W-1:0]  cfg_ldc32_i,
    input  wire [1:0]         cfg_out_mode_i,

    input  wire   start_i,
    output wire   busy_o,
    output wire   done_o,
    output wire   err_o,

    output wire [71:0]      mm2s_cmd_tdata,
    output wire              mm2s_cmd_tvalid,
    input  wire              mm2s_cmd_tready,
    input  wire [N*8-1:0]   mm2s_tdata,
    input  wire               mm2s_tvalid,
    output wire               mm2s_tready,
    input  wire               mm2s_tlast,

    output wire [71:0]      s2mm_cmd_tdata,
    output wire              s2mm_cmd_tvalid,
    input  wire              s2mm_cmd_tready,
    output wire [N*8-1:0]   s2mm_tdata,
    output wire               s2mm_tvalid,
    input  wire               s2mm_tready,
    output wire               s2mm_tlast,
    output wire [N-1:0]      s2mm_tkeep,
    input  wire [7:0]        s2mm_sts_tdata,
    input  wire                s2mm_sts_tvalid,
    output wire                s2mm_sts_tready
);

    l2_tiling_agu #(
        .N(N), .M_BLK(M_BLK), .N_BLK(N_BLK), .K_BLK(K_BLK),
        .ADDR_W(ADDR_W), .DIM_W(DIM_W),
        .FIFO_DEPTH(FIFO_DEPTH), .BRAM_DEPTH(BRAM_DEPTH)
    ) u_l2_tiling_agu (
        .CLK_i(CLK_i), .RST_i(RST_i),
        .cfg_m_total_i(cfg_m_total_i),
        .cfg_n_total_i(cfg_n_total_i),
        .cfg_k_total_i(cfg_k_total_i),
        .cfg_k_dim_i(cfg_k_dim_i),
        .cfg_base_a_i(cfg_base_a_i),
        .cfg_base_b_i(cfg_base_b_i),
        .cfg_base_c_i(cfg_base_c_i),
        .cfg_base_c32_i(cfg_base_c32_i),
        .cfg_base_param_i(cfg_base_param_i),
        .cfg_lda_i(cfg_lda_i),
        .cfg_ldb_i(cfg_ldb_i),
        .cfg_ldc_i(cfg_ldc_i),
        .cfg_ldc32_i(cfg_ldc32_i),
        .cfg_out_mode_i(cfg_out_mode_i),
        .start_i(start_i), .busy_o(busy_o), .done_o(done_o), .err_o(err_o),
        .mm2s_cmd_tdata(mm2s_cmd_tdata),
        .mm2s_cmd_tvalid(mm2s_cmd_tvalid),
        .mm2s_cmd_tready(mm2s_cmd_tready),
        .mm2s_tdata(mm2s_tdata),
        .mm2s_tvalid(mm2s_tvalid),
        .mm2s_tready(mm2s_tready),
        .mm2s_tlast(mm2s_tlast),
        .s2mm_cmd_tdata(s2mm_cmd_tdata),
        .s2mm_cmd_tvalid(s2mm_cmd_tvalid),
        .s2mm_cmd_tready(s2mm_cmd_tready),
        .s2mm_tdata(s2mm_tdata),
        .s2mm_tvalid(s2mm_tvalid),
        .s2mm_tready(s2mm_tready),
        .s2mm_tlast(s2mm_tlast),
        .s2mm_tkeep(s2mm_tkeep),
        .s2mm_sts_tdata(s2mm_sts_tdata),
        .s2mm_sts_tvalid(s2mm_sts_tvalid),
        .s2mm_sts_tready(s2mm_sts_tready)
    );

endmodule
