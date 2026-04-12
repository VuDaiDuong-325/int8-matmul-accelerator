`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2026 12:07:20 AM
// Design Name: 
// Module Name: output_accumulator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module output_accumulator #(
    parameter DATA_WIDTH = 32,
    parameter DEPTH = 256 // 16x16 tile size
)(
    input  wire                  clk,
    input  wire                  rst_n,

    // Control flags from systolic_dataflow_ctrl
    input  wire                  is_first_block,
    input  wire                  is_last_block,

    // Data stream from output_serializer
    input  wire                  s_valid,
    input  wire [$clog2(DEPTH)-1:0] s_addr,
    input  wire [DATA_WIDTH-1:0] s_data,

    // Accumulated data stream to FIFO
    output reg                   m_valid,
    output reg  [DATA_WIDTH-1:0] m_data
);

    localparam ADDR_WIDTH = $clog2(DEPTH);

    // ====================================================
    // SDP BRAM INFERENCE
    // ====================================================
    // Force Vivado to use Block RAM
    (* ram_style = "block" *) reg [DATA_WIDTH-1:0] ram [0:DEPTH-1];
    reg [DATA_WIDTH-1:0] bram_rd_data;

    // ====================================================
    // PIPELINE REGISTERS (STAGE 0 -> STAGE 1)
    // ====================================================
    // These registers delay the inputs by 1 clock cycle 
    // to match the 1-cycle read latency of the BRAM.
    reg                  valid_q;
    reg [ADDR_WIDTH-1:0] addr_q;
    reg [DATA_WIDTH-1:0] data_q;
    reg                  is_first_q;
    reg                  is_last_q;

    // STAGE 0: BRAM Read & Input Latch
    always @(posedge clk) begin
        if (!rst_n) begin
            valid_q    <= 1'b0;
            addr_q     <= 0;
            data_q     <= 0;
            is_first_q <= 1'b0;
            is_last_q  <= 1'b0;
        end else begin
            valid_q    <= s_valid;
            addr_q     <= s_addr;
            data_q     <= s_data;
            is_first_q <= is_first_block;
            is_last_q  <= is_last_block;
        end
    end

    // BRAM Port B: Synchronous Read
    always @(posedge clk) begin
        bram_rd_data <= ram[s_addr];
    end

    // ====================================================
    // STAGE 1: ACCUMULATE, BRAM WRITE & OUTPUT
    // ====================================================
    wire [DATA_WIDTH-1:0] adder_out;
    
    // Multiplexer to select between direct write or accumulation
    assign adder_out = is_first_q ? data_q : (data_q + bram_rd_data);

    always @(posedge clk) begin
        if (!rst_n) begin
            m_valid <= 1'b0;
            m_data  <= 0;
        end else begin
            m_valid <= 1'b0; // Default clear

            if (valid_q) begin
                // BRAM Port A: Synchronous Write
                ram[addr_q] <= adder_out;

                // Push to FIFO only if this is the final accumulation step
                if (is_last_q) begin
                    m_valid <= 1'b1;
                    m_data  <= adder_out;
                end
            end
        end
    end

endmodule
