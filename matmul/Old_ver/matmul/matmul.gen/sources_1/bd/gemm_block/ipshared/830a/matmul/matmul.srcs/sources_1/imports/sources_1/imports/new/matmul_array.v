`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2026 07:58:29 PM
// Design Name: 
// Module Name: matmul_array
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


module matmul_array #(
    parameter ARRAY_SIZE = 16  //pe 16x16
)(
    input  wire clk,
    input  wire rst_n,

    input  wire [ARRAY_SIZE-1:0]               valid_in_left,
    input  wire [ARRAY_SIZE-1:0]               clear_acc_left,
    input  wire [ARRAY_SIZE-1:0]               last_mac_in_left,
    input  wire [(ARRAY_SIZE*8)-1:0]           act_in_left,    
    input  wire [(ARRAY_SIZE*8)-1:0]           weight_in_top,  

    output wire [(ARRAY_SIZE*ARRAY_SIZE*32)-1:0] psum_out_matrix,
    output wire [(ARRAY_SIZE*ARRAY_SIZE)-1:0]    mac_valid_matrix
);

    // Weight:              vertical axis
    // Act, valid, clear:   horizontal axis
    wire [7:0] w_wire   [0:ARRAY_SIZE][0:ARRAY_SIZE]; 
    wire [7:0] a_wire   [0:ARRAY_SIZE][0:ARRAY_SIZE]; 
    wire       vld_wire [0:ARRAY_SIZE][0:ARRAY_SIZE]; 
    wire       clr_wire [0:ARRAY_SIZE][0:ARRAY_SIZE]; 
    wire       lst_wire [0:ARRAY_SIZE][0:ARRAY_SIZE];

    genvar i, j;
    
    // Gen for 0th column & row
    generate
        for (i = 0; i < ARRAY_SIZE; i = i + 1) begin : BIND_INPUTS
            assign a_wire[i][0]   = act_in_left[(i*8)+7 : i*8];
            assign vld_wire[i][0] = valid_in_left[i];
            assign clr_wire[i][0] = clear_acc_left[i];
            assign lst_wire[i][0] = last_mac_in_left[i];
            
            assign w_wire[0][i]   = weight_in_top[(i*8)+7 : i*8];
        end
    endgenerate
    
    generate
        for (i = 0; i < ARRAY_SIZE; i = i + 1) begin : ROW 
            for (j = 0; j < ARRAY_SIZE; j = j + 1) begin : COL 
                
                // Tính index phẳng cho mảng ngõ ra 1 chiều
                localparam FLAT_IDX = (i * ARRAY_SIZE) + j;

                pe_wrapper u_pe (
                    .clk                (clk),
                    .rst_n              (rst_n),
                    
                    // Act, valid, clear: left -> right (j -> j++)
                    .act_in             (a_wire[i][j]),
                    .valid_in           (vld_wire[i][j]),
                    .clear_acc          (clr_wire[i][j]),
                    .last_mac_in        (lst_wire[i][j]),
                    
                    // Weight: top -> down (i -> i++)
                    .weight_in          (w_wire[i][j]),
                    
                    .act_out            (a_wire[i][j+1]),
                    .valid_out_fwd      (vld_wire[i][j+1]),
                    .clear_acc_fwd      (clr_wire[i][j+1]),
                    .last_mac_out_fwd   (lst_wire[i][j+1]),
                    
                    .weight_out         (w_wire[i+1][j]),
                    
                    .psum_out           (psum_out_matrix[(FLAT_IDX*32)+31 : FLAT_IDX*32]),  // 32 bit / 1 psum_out
                    .mac_valid_out      (mac_valid_matrix[FLAT_IDX])
                );
            end
        end
    endgenerate

endmodule
