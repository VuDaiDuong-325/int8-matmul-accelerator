`timescale 1ns / 1ps
//==============================================================================
// Module   : gemm_top_l2_v3
// Project  : INT8 GEMM Accelerator - KV260 / Qwen2 MLP Block
// Date     : June 2026
//
// TOP-LEVEL BẢN TỐI ƯU - Double-buffered L2 (fetch/compute song song)
// Thin wrapper, toàn bộ logic nằm trong l2_tiling_agu_v3.v
//==============================================================================

module gemm_top_l2 #(
    parameter N          = 16,
    parameter M_BLK      = 256,
    parameter N_BLK      = 256,
    parameter K_BLK      = 256,
    parameter ADDR_W     = 32,
    parameter DIM_W      = 16,
    parameter FIFO_DEPTH = 1024,
    parameter BRAM_DEPTH = 1024
)(
    input  wire           aclk,
    input  wire           aresetn,

    input  wire [DIM_W-1:0]   cfg_m_total,
    input  wire [DIM_W-1:0]   cfg_n_total,
    input  wire [DIM_W-1:0]   cfg_k_total,
    input  wire [DIM_W-1:0]   cfg_k_dim,
    input  wire [DIM_W-1:0]   cfg_num_k_tiles_per_block,
    input  wire [ADDR_W-1:0]  cfg_base_a,
    input  wire [ADDR_W-1:0]  cfg_base_b,
    input  wire [ADDR_W-1:0]  cfg_base_c,
    input  wire [DIM_W-1:0]   cfg_n_stride,
    input  wire [4:0]          cfg_scale_shift,
    input  wire [7:0]          cfg_zero_point,

    input  wire   start,
    output wire   busy,
    output wire   done,

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
    ) u_l2_v3 (
        .aclk(aclk), .aresetn(aresetn),
        .cfg_m_total(cfg_m_total),
        .cfg_n_total(cfg_n_total),
        .cfg_k_total(cfg_k_total),
        .cfg_k_dim(cfg_k_dim),
        .cfg_num_k_tiles_per_block(cfg_num_k_tiles_per_block),
        .cfg_base_a(cfg_base_a),
        .cfg_base_b(cfg_base_b),
        .cfg_base_c(cfg_base_c),
        .cfg_n_stride(cfg_n_stride),
        .cfg_scale_shift(cfg_scale_shift),
        .cfg_zero_point(cfg_zero_point),
        .start(start), .busy(busy), .done(done),
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