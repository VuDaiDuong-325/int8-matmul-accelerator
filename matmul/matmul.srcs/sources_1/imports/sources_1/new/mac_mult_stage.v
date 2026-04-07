module mac_mult_stage(
    input                       clk,
    input                       rst_n,
    input                       valid_in,
    input                       clear_acc,
    input                       last_mac_in,
    input signed        [7:0]   w_in,
    input signed        [7:0]   x_in,
    
    (* use_dsp = "yes" *) output reg signed   [15:0]  mul_out,
    output reg                  valid_out,
    output reg                  clear_acc_out,
    output reg                  last_mac_out
    );
    
    reg signed [7:0] w_reg, x_reg;
    reg v_s1, c_s1, l_s1;
    always @(posedge clk) begin
        if (!rst_n) begin
            w_reg <= 8'd0; 
            x_reg <= 8'd0;
            v_s1 <= 1'd0; 
            c_s1 <= 1'd0; 
            l_s1 <= 1'd0;
            mul_out <= 16'd0;
            valid_out <= 1'd0;
            clear_acc_out <= 1'd0;
            last_mac_out <= 1'd0;
         end
         else begin
            w_reg <= w_in; 
            x_reg <= x_in;
            v_s1 <= valid_in; 
            c_s1 <= clear_acc; 
            l_s1 <= last_mac_in;
            
            mul_out <= w_reg * x_reg;
            valid_out <= v_s1;
            clear_acc_out <= c_s1;
            last_mac_out <= l_s1;
          end
     end
endmodule
