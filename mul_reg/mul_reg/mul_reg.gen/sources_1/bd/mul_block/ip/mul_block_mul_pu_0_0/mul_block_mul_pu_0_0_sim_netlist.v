// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Tue Mar 31 21:17:10 2026
// Host        : VuDuong-32 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/HK6/Project1/testing/mul_reg/mul_reg/mul_reg.gen/sources_1/bd/mul_block/ip/mul_block_mul_pu_0_0/mul_block_mul_pu_0_0_sim_netlist.v
// Design      : mul_block_mul_pu_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xck26-sfvc784-2LV-c
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mul_block_mul_pu_0_0,mul_pu,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "mul_pu,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module mul_block_mul_pu_0_0
   (start,
    clk,
    rst_n,
    a,
    b,
    res);
  input start;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN mul_block_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst_n;
  input [3:0]a;
  input [3:0]b;
  output [7:0]res;

  wire [3:0]a;
  wire [3:0]b;
  wire clk;
  wire [7:0]res;
  wire rst_n;
  wire start;

  mul_block_mul_pu_0_0_mul_pu inst
       (.a(a),
        .b(b),
        .clk(clk),
        .res(res),
        .rst_n(rst_n),
        .start(start));
endmodule

(* ORIG_REF_NAME = "mul_pu" *) 
module mul_block_mul_pu_0_0_mul_pu
   (res,
    b,
    a,
    clk,
    rst_n,
    start);
  output [7:0]res;
  input [3:0]b;
  input [3:0]a;
  input clk;
  input rst_n;
  input start;

  wire [3:0]a;
  wire [3:0]b;
  wire clk;
  wire [7:0]res;
  wire rst_n;
  wire start;

  mul_block_mul_pu_0_0_mul_reg u_path
       (.a(a),
        .b(b),
        .clk(clk),
        .res(res),
        .rst_n(rst_n),
        .start(start));
endmodule

(* ORIG_REF_NAME = "mul_reg" *) 
module mul_block_mul_pu_0_0_mul_reg
   (res,
    b,
    a,
    clk,
    rst_n,
    start);
  output [7:0]res;
  input [3:0]b;
  input [3:0]a;
  input clk;
  input rst_n;
  input start;

  wire [3:0]a;
  wire [3:0]b;
  wire clk;
  wire en;
  wire [7:0]res;
  wire [7:0]res0;
  wire \res[3]_i_4_n_0 ;
  wire \res[3]_i_5_n_0 ;
  wire \res[3]_i_6_n_0 ;
  wire \res[3]_i_7_n_0 ;
  wire \res[4]_i_4_n_0 ;
  wire \res[4]_i_5_n_0 ;
  wire \res[4]_i_6_n_0 ;
  wire \res[4]_i_7_n_0 ;
  wire \res[5]_i_4_n_0 ;
  wire \res[5]_i_5_n_0 ;
  wire \res[5]_i_6_n_0 ;
  wire \res[5]_i_7_n_0 ;
  wire \res[6]_i_2_n_0 ;
  wire \res[6]_i_3_n_0 ;
  wire \res[7]_i_3_n_0 ;
  wire \res[7]_i_4_n_0 ;
  wire \res_reg[3]_i_2_n_0 ;
  wire \res_reg[3]_i_3_n_0 ;
  wire \res_reg[4]_i_2_n_0 ;
  wire \res_reg[4]_i_3_n_0 ;
  wire \res_reg[5]_i_2_n_0 ;
  wire \res_reg[5]_i_3_n_0 ;
  wire rst_n;
  wire start;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \res[0]_i_1 
       (.I0(a[0]),
        .I1(b[0]),
        .O(res0[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    \res[1]_i_1 
       (.I0(a[1]),
        .I1(b[0]),
        .I2(b[1]),
        .I3(a[0]),
        .O(res0[1]));
  LUT6 #(
    .INIT(64'h4B77788878887888)) 
    \res[2]_i_1 
       (.I0(a[2]),
        .I1(b[0]),
        .I2(b[2]),
        .I3(a[0]),
        .I4(a[1]),
        .I5(b[1]),
        .O(res0[2]));
  LUT6 #(
    .INIT(64'h27DF28A06020A0A0)) 
    \res[3]_i_4 
       (.I0(a[2]),
        .I1(b[0]),
        .I2(b[1]),
        .I3(a[0]),
        .I4(a[1]),
        .I5(b[2]),
        .O(\res[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEB13E46CACEC6C6C)) 
    \res[3]_i_5 
       (.I0(a[2]),
        .I1(b[0]),
        .I2(b[1]),
        .I3(a[0]),
        .I4(a[1]),
        .I5(b[2]),
        .O(\res[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hD8DFD7A09F205FA0)) 
    \res[3]_i_6 
       (.I0(a[2]),
        .I1(b[0]),
        .I2(b[1]),
        .I3(a[0]),
        .I4(a[1]),
        .I5(b[2]),
        .O(\res[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h14131B6C53EC936C)) 
    \res[3]_i_7 
       (.I0(a[2]),
        .I1(b[0]),
        .I2(b[1]),
        .I3(a[0]),
        .I4(a[1]),
        .I5(b[2]),
        .O(\res[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hB44C80000CCC8000)) 
    \res[4]_i_4 
       (.I0(b[0]),
        .I1(a[2]),
        .I2(b[1]),
        .I3(a[1]),
        .I4(b[2]),
        .I5(a[0]),
        .O(\res[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hE1FBF1BBAECCA6CC)) 
    \res[4]_i_5 
       (.I0(a[2]),
        .I1(b[0]),
        .I2(a[1]),
        .I3(b[2]),
        .I4(a[0]),
        .I5(b[1]),
        .O(\res[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hDDC8DD7FFD77AA00)) 
    \res[4]_i_6 
       (.I0(a[2]),
        .I1(b[1]),
        .I2(b[0]),
        .I3(b[2]),
        .I4(a[0]),
        .I5(a[1]),
        .O(\res[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h05041053021B5F6C)) 
    \res[4]_i_7 
       (.I0(a[2]),
        .I1(b[0]),
        .I2(b[2]),
        .I3(a[0]),
        .I4(b[1]),
        .I5(a[1]),
        .O(\res[4]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hE080808000000000)) 
    \res[5]_i_4 
       (.I0(b[1]),
        .I1(a[1]),
        .I2(b[2]),
        .I3(b[0]),
        .I4(a[0]),
        .I5(a[2]),
        .O(\res[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAFBFBFFFFCCCC)) 
    \res[5]_i_5 
       (.I0(a[2]),
        .I1(b[0]),
        .I2(a[1]),
        .I3(a[0]),
        .I4(b[1]),
        .I5(b[2]),
        .O(\res[5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hF0FFFCFFF8FFFF00)) 
    \res[5]_i_6 
       (.I0(b[0]),
        .I1(b[1]),
        .I2(b[2]),
        .I3(a[2]),
        .I4(a[1]),
        .I5(a[0]),
        .O(\res[5]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000015500015556)) 
    \res[5]_i_7 
       (.I0(a[2]),
        .I1(b[0]),
        .I2(a[0]),
        .I3(b[1]),
        .I4(b[2]),
        .I5(a[1]),
        .O(\res[5]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h2F20FFFF2F200000)) 
    \res[6]_i_1 
       (.I0(\res[6]_i_2_n_0 ),
        .I1(a[2]),
        .I2(a[3]),
        .I3(\res[6]_i_3_n_0 ),
        .I4(b[3]),
        .I5(\res[7]_i_4_n_0 ),
        .O(res0[6]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \res[6]_i_2 
       (.I0(a[0]),
        .I1(b[2]),
        .I2(a[1]),
        .I3(b[1]),
        .I4(b[0]),
        .O(\res[6]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \res[6]_i_3 
       (.I0(a[0]),
        .I1(a[1]),
        .I2(a[2]),
        .O(\res[6]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \res[7]_i_1 
       (.I0(start),
        .I1(rst_n),
        .O(en));
  LUT6 #(
    .INIT(64'h00FEFFFF00FE0000)) 
    \res[7]_i_2 
       (.I0(a[2]),
        .I1(a[1]),
        .I2(a[0]),
        .I3(a[3]),
        .I4(b[3]),
        .I5(\res[7]_i_4_n_0 ),
        .O(res0[7]));
  LUT1 #(
    .INIT(2'h1)) 
    \res[7]_i_3 
       (.I0(rst_n),
        .O(\res[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFE00)) 
    \res[7]_i_4 
       (.I0(b[0]),
        .I1(b[2]),
        .I2(b[1]),
        .I3(a[3]),
        .O(\res[7]_i_4_n_0 ));
  FDCE \res_reg[0] 
       (.C(clk),
        .CE(en),
        .CLR(\res[7]_i_3_n_0 ),
        .D(res0[0]),
        .Q(res[0]));
  FDCE \res_reg[1] 
       (.C(clk),
        .CE(en),
        .CLR(\res[7]_i_3_n_0 ),
        .D(res0[1]),
        .Q(res[1]));
  FDCE \res_reg[2] 
       (.C(clk),
        .CE(en),
        .CLR(\res[7]_i_3_n_0 ),
        .D(res0[2]),
        .Q(res[2]));
  FDCE \res_reg[3] 
       (.C(clk),
        .CE(en),
        .CLR(\res[7]_i_3_n_0 ),
        .D(res0[3]),
        .Q(res[3]));
  MUXF8 \res_reg[3]_i_1 
       (.I0(\res_reg[3]_i_2_n_0 ),
        .I1(\res_reg[3]_i_3_n_0 ),
        .O(res0[3]),
        .S(b[3]));
  MUXF7 \res_reg[3]_i_2 
       (.I0(\res[3]_i_4_n_0 ),
        .I1(\res[3]_i_5_n_0 ),
        .O(\res_reg[3]_i_2_n_0 ),
        .S(a[3]));
  MUXF7 \res_reg[3]_i_3 
       (.I0(\res[3]_i_6_n_0 ),
        .I1(\res[3]_i_7_n_0 ),
        .O(\res_reg[3]_i_3_n_0 ),
        .S(a[3]));
  FDCE \res_reg[4] 
       (.C(clk),
        .CE(en),
        .CLR(\res[7]_i_3_n_0 ),
        .D(res0[4]),
        .Q(res[4]));
  MUXF8 \res_reg[4]_i_1 
       (.I0(\res_reg[4]_i_2_n_0 ),
        .I1(\res_reg[4]_i_3_n_0 ),
        .O(res0[4]),
        .S(b[3]));
  MUXF7 \res_reg[4]_i_2 
       (.I0(\res[4]_i_4_n_0 ),
        .I1(\res[4]_i_5_n_0 ),
        .O(\res_reg[4]_i_2_n_0 ),
        .S(a[3]));
  MUXF7 \res_reg[4]_i_3 
       (.I0(\res[4]_i_6_n_0 ),
        .I1(\res[4]_i_7_n_0 ),
        .O(\res_reg[4]_i_3_n_0 ),
        .S(a[3]));
  FDCE \res_reg[5] 
       (.C(clk),
        .CE(en),
        .CLR(\res[7]_i_3_n_0 ),
        .D(res0[5]),
        .Q(res[5]));
  MUXF8 \res_reg[5]_i_1 
       (.I0(\res_reg[5]_i_2_n_0 ),
        .I1(\res_reg[5]_i_3_n_0 ),
        .O(res0[5]),
        .S(b[3]));
  MUXF7 \res_reg[5]_i_2 
       (.I0(\res[5]_i_4_n_0 ),
        .I1(\res[5]_i_5_n_0 ),
        .O(\res_reg[5]_i_2_n_0 ),
        .S(a[3]));
  MUXF7 \res_reg[5]_i_3 
       (.I0(\res[5]_i_6_n_0 ),
        .I1(\res[5]_i_7_n_0 ),
        .O(\res_reg[5]_i_3_n_0 ),
        .S(a[3]));
  FDCE \res_reg[6] 
       (.C(clk),
        .CE(en),
        .CLR(\res[7]_i_3_n_0 ),
        .D(res0[6]),
        .Q(res[6]));
  FDCE \res_reg[7] 
       (.C(clk),
        .CE(en),
        .CLR(\res[7]_i_3_n_0 ),
        .D(res0[7]),
        .Q(res[7]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
