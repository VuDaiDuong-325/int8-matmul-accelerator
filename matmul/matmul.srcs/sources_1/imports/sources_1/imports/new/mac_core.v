// Multiple w_in x x_in, then add with previous result
// P = P(previous) + (W x X)
module mac_core(
    input                       clk,
    input                       rst_n,
    input                       valid_in,
    input                       clear_acc,
    input                       last_mac_in,
    input signed        [7:0]   w_in,
    input signed        [7:0]   x_in,
    input signed        [31:0]  psum_in,
    output wire signed  [31:0]  psum_out,
    output wire                 valid_out
    );
    
    wire signed [15:0] mult_out;
    wire               valid_m;
    wire               clear_m;
    wire               last_m;
    
    mac_mult_stage u_mult (
        .clk            (clk),
        .rst_n          (rst_n),
        .valid_in       (valid_in),
        .clear_acc      (clear_acc),
        .last_mac_in    (last_mac_in),
        .w_in           (w_in),
        .x_in           (x_in),

        .mul_out        (mult_out),
        .valid_out      (valid_m),
        .clear_acc_out  (clear_m),
        .last_mac_out   (last_m)
    );
    
    wire signed [31:0] mult_to_acc;
    assign mult_to_acc = {{16{mult_out[15]}}, mult_out};  // sign-extend
     
    mac_acc_stage u_acc (
        .clk        (clk),
        .rst_n      (rst_n),

        .mul_in     (mult_to_acc),
        .psum_in    (psum_in),      

        .valid_in   (valid_m),
        .clear_acc  (clear_m),
        .last_mac_in(last_m),

        .psum_out   (psum_out),
        .valid_out  (valid_out)
    );
    
endmodule
