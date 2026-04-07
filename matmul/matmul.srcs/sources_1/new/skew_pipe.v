module skew_pipe #(
    parameter DATA_WIDTH = 8,
    parameter DEPTH = 0
)(
    input  wire                     clk,
    input  wire                     rst_n,
    input  wire [DATA_WIDTH-1:0]    din,
    output wire [DATA_WIDTH-1:0]    dout
);

    generate
        if (DEPTH == 0) begin
            // No delay
            assign dout = din;

        end else begin
            // Shift register
            reg [DATA_WIDTH-1:0] pipe [0:DEPTH-1];
            integer k;

            always @(posedge clk) begin
                if (!rst_n) begin
                    for (k = 0; k < DEPTH; k = k + 1)
                        pipe[k] <= 0;
                end else begin
                    pipe[0] <= din;
                    for (k = 1; k < DEPTH; k = k + 1)
                        pipe[k] <= pipe[k-1];
                end
            end

            assign dout = pipe[DEPTH-1];
        end
    endgenerate

endmodule