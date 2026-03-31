// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Wed Mar 25 22:44:12 2026
// Host        : VuDuong-32 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/HK6/Project1/testing/accumulator/accumulator/accumulator.gen/sources_1/bd/acc_block/ip/acc_block_acc_reg_0_0/acc_block_acc_reg_0_0_sim_netlist.v
// Design      : acc_block_acc_reg_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xck26-sfvc784-2LV-c
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "acc_block_acc_reg_0_0,acc_reg,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "acc_reg,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module acc_block_acc_reg_0_0
   (a,
    b,
    start,
    clk,
    rst_n,
    psum);
  input [3:0]a;
  input [3:0]b;
  input start;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN acc_block_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst_n;
  output [15:0]psum;

  wire [3:0]a;
  wire [3:0]b;
  wire clk;
  wire [15:0]psum;
  wire rst_n;
  wire start;

  acc_block_acc_reg_0_0_acc_reg inst
       (.a(a),
        .b(b),
        .clk(clk),
        .psum(psum),
        .rst_n(rst_n),
        .start(start));
endmodule

(* ORIG_REF_NAME = "acc_ctrl" *) 
module acc_block_acc_reg_0_0_acc_ctrl
   (Q,
    start,
    clk,
    \FSM_onehot_state_reg[3]_0 );
  output [1:0]Q;
  input start;
  input clk;
  input \FSM_onehot_state_reg[3]_0 ;

  wire \FSM_onehot_state_reg[3]_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[3] ;
  wire [1:0]Q;
  wire clk;
  wire next_state_n_0;
  wire start;

  (* FSM_ENCODED_STATES = "MULT:0010,ADD:0100,WAIT_LOW:1000,IDLE:0001" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(clk),
        .CE(next_state_n_0),
        .D(\FSM_onehot_state_reg_n_0_[3] ),
        .PRE(\FSM_onehot_state_reg[3]_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "MULT:0010,ADD:0100,WAIT_LOW:1000,IDLE:0001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(clk),
        .CE(next_state_n_0),
        .CLR(\FSM_onehot_state_reg[3]_0 ),
        .D(\FSM_onehot_state_reg_n_0_[0] ),
        .Q(Q[0]));
  (* FSM_ENCODED_STATES = "MULT:0010,ADD:0100,WAIT_LOW:1000,IDLE:0001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(clk),
        .CE(next_state_n_0),
        .CLR(\FSM_onehot_state_reg[3]_0 ),
        .D(Q[0]),
        .Q(Q[1]));
  (* FSM_ENCODED_STATES = "MULT:0010,ADD:0100,WAIT_LOW:1000,IDLE:0001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(clk),
        .CE(next_state_n_0),
        .CLR(\FSM_onehot_state_reg[3]_0 ),
        .D(Q[1]),
        .Q(\FSM_onehot_state_reg_n_0_[3] ));
  LUT5 #(
    .INIT(32'hFFFEEEFE)) 
    next_state
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(\FSM_onehot_state_reg_n_0_[3] ),
        .I3(start),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .O(next_state_n_0));
endmodule

(* ORIG_REF_NAME = "acc_reg" *) 
module acc_block_acc_reg_0_0_acc_reg
   (psum,
    a,
    b,
    clk,
    start,
    rst_n);
  output [15:0]psum;
  input [3:0]a;
  input [3:0]b;
  input clk;
  input start;
  input rst_n;

  wire [3:0]a;
  wire [3:0]b;
  wire clk;
  wire [15:0]psum;
  wire rst_n;
  wire start;
  wire u_ctrl_n_0;
  wire u_path_n_16;
  wire vld_in;

  acc_block_acc_reg_0_0_acc_ctrl u_ctrl
       (.\FSM_onehot_state_reg[3]_0 (u_path_n_16),
        .Q({u_ctrl_n_0,vld_in}),
        .clk(clk),
        .start(start));
  acc_block_acc_reg_0_0_acc_top u_path
       (.Q({u_ctrl_n_0,vld_in}),
        .a(a),
        .b(b),
        .clk(clk),
        .psum(psum),
        .rst_n(rst_n),
        .rst_n_0(u_path_n_16));
endmodule

(* ORIG_REF_NAME = "acc_stage" *) 
module acc_block_acc_reg_0_0_acc_stage
   (psum,
    rst_n_0,
    Q,
    clk,
    \psum_out_reg[7]_0 ,
    rst_n);
  output [15:0]psum;
  output rst_n_0;
  input [0:0]Q;
  input clk;
  input [7:0]\psum_out_reg[7]_0 ;
  input rst_n;

  wire [0:0]Q;
  wire clk;
  wire [15:0]p_0_in;
  wire [15:0]psum;
  wire psum_out0_carry__0_n_1;
  wire psum_out0_carry__0_n_2;
  wire psum_out0_carry__0_n_3;
  wire psum_out0_carry__0_n_4;
  wire psum_out0_carry__0_n_5;
  wire psum_out0_carry__0_n_6;
  wire psum_out0_carry__0_n_7;
  wire psum_out0_carry_i_1_n_0;
  wire psum_out0_carry_i_2_n_0;
  wire psum_out0_carry_i_3_n_0;
  wire psum_out0_carry_i_4_n_0;
  wire psum_out0_carry_i_5_n_0;
  wire psum_out0_carry_i_6_n_0;
  wire psum_out0_carry_i_7_n_0;
  wire psum_out0_carry_i_8_n_0;
  wire psum_out0_carry_n_0;
  wire psum_out0_carry_n_1;
  wire psum_out0_carry_n_2;
  wire psum_out0_carry_n_3;
  wire psum_out0_carry_n_4;
  wire psum_out0_carry_n_5;
  wire psum_out0_carry_n_6;
  wire psum_out0_carry_n_7;
  wire [7:0]\psum_out_reg[7]_0 ;
  wire rst_n;
  wire rst_n_0;
  wire [7:7]NLW_psum_out0_carry__0_CO_UNCONNECTED;

  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 psum_out0_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({psum_out0_carry_n_0,psum_out0_carry_n_1,psum_out0_carry_n_2,psum_out0_carry_n_3,psum_out0_carry_n_4,psum_out0_carry_n_5,psum_out0_carry_n_6,psum_out0_carry_n_7}),
        .DI(psum[7:0]),
        .O(p_0_in[7:0]),
        .S({psum_out0_carry_i_1_n_0,psum_out0_carry_i_2_n_0,psum_out0_carry_i_3_n_0,psum_out0_carry_i_4_n_0,psum_out0_carry_i_5_n_0,psum_out0_carry_i_6_n_0,psum_out0_carry_i_7_n_0,psum_out0_carry_i_8_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 psum_out0_carry__0
       (.CI(psum_out0_carry_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_psum_out0_carry__0_CO_UNCONNECTED[7],psum_out0_carry__0_n_1,psum_out0_carry__0_n_2,psum_out0_carry__0_n_3,psum_out0_carry__0_n_4,psum_out0_carry__0_n_5,psum_out0_carry__0_n_6,psum_out0_carry__0_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[15:8]),
        .S(psum[15:8]));
  LUT2 #(
    .INIT(4'h6)) 
    psum_out0_carry_i_1
       (.I0(psum[7]),
        .I1(\psum_out_reg[7]_0 [7]),
        .O(psum_out0_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    psum_out0_carry_i_2
       (.I0(psum[6]),
        .I1(\psum_out_reg[7]_0 [6]),
        .O(psum_out0_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    psum_out0_carry_i_3
       (.I0(psum[5]),
        .I1(\psum_out_reg[7]_0 [5]),
        .O(psum_out0_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    psum_out0_carry_i_4
       (.I0(psum[4]),
        .I1(\psum_out_reg[7]_0 [4]),
        .O(psum_out0_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    psum_out0_carry_i_5
       (.I0(psum[3]),
        .I1(\psum_out_reg[7]_0 [3]),
        .O(psum_out0_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    psum_out0_carry_i_6
       (.I0(psum[2]),
        .I1(\psum_out_reg[7]_0 [2]),
        .O(psum_out0_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    psum_out0_carry_i_7
       (.I0(psum[1]),
        .I1(\psum_out_reg[7]_0 [1]),
        .O(psum_out0_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    psum_out0_carry_i_8
       (.I0(psum[0]),
        .I1(\psum_out_reg[7]_0 [0]),
        .O(psum_out0_carry_i_8_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \psum_out[15]_i_1 
       (.I0(rst_n),
        .O(rst_n_0));
  FDCE \psum_out_reg[0] 
       (.C(clk),
        .CE(Q),
        .CLR(rst_n_0),
        .D(p_0_in[0]),
        .Q(psum[0]));
  FDCE \psum_out_reg[10] 
       (.C(clk),
        .CE(Q),
        .CLR(rst_n_0),
        .D(p_0_in[10]),
        .Q(psum[10]));
  FDCE \psum_out_reg[11] 
       (.C(clk),
        .CE(Q),
        .CLR(rst_n_0),
        .D(p_0_in[11]),
        .Q(psum[11]));
  FDCE \psum_out_reg[12] 
       (.C(clk),
        .CE(Q),
        .CLR(rst_n_0),
        .D(p_0_in[12]),
        .Q(psum[12]));
  FDCE \psum_out_reg[13] 
       (.C(clk),
        .CE(Q),
        .CLR(rst_n_0),
        .D(p_0_in[13]),
        .Q(psum[13]));
  FDCE \psum_out_reg[14] 
       (.C(clk),
        .CE(Q),
        .CLR(rst_n_0),
        .D(p_0_in[14]),
        .Q(psum[14]));
  FDCE \psum_out_reg[15] 
       (.C(clk),
        .CE(Q),
        .CLR(rst_n_0),
        .D(p_0_in[15]),
        .Q(psum[15]));
  FDCE \psum_out_reg[1] 
       (.C(clk),
        .CE(Q),
        .CLR(rst_n_0),
        .D(p_0_in[1]),
        .Q(psum[1]));
  FDCE \psum_out_reg[2] 
       (.C(clk),
        .CE(Q),
        .CLR(rst_n_0),
        .D(p_0_in[2]),
        .Q(psum[2]));
  FDCE \psum_out_reg[3] 
       (.C(clk),
        .CE(Q),
        .CLR(rst_n_0),
        .D(p_0_in[3]),
        .Q(psum[3]));
  FDCE \psum_out_reg[4] 
       (.C(clk),
        .CE(Q),
        .CLR(rst_n_0),
        .D(p_0_in[4]),
        .Q(psum[4]));
  FDCE \psum_out_reg[5] 
       (.C(clk),
        .CE(Q),
        .CLR(rst_n_0),
        .D(p_0_in[5]),
        .Q(psum[5]));
  FDCE \psum_out_reg[6] 
       (.C(clk),
        .CE(Q),
        .CLR(rst_n_0),
        .D(p_0_in[6]),
        .Q(psum[6]));
  FDCE \psum_out_reg[7] 
       (.C(clk),
        .CE(Q),
        .CLR(rst_n_0),
        .D(p_0_in[7]),
        .Q(psum[7]));
  FDCE \psum_out_reg[8] 
       (.C(clk),
        .CE(Q),
        .CLR(rst_n_0),
        .D(p_0_in[8]),
        .Q(psum[8]));
  FDCE \psum_out_reg[9] 
       (.C(clk),
        .CE(Q),
        .CLR(rst_n_0),
        .D(p_0_in[9]),
        .Q(psum[9]));
endmodule

(* ORIG_REF_NAME = "acc_top" *) 
module acc_block_acc_reg_0_0_acc_top
   (psum,
    rst_n_0,
    Q,
    clk,
    a,
    b,
    rst_n);
  output [15:0]psum;
  output rst_n_0;
  input [1:0]Q;
  input clk;
  input [3:0]a;
  input [3:0]b;
  input rst_n;

  wire [1:0]Q;
  wire [3:0]a;
  wire [3:0]b;
  wire clk;
  wire [7:0]in;
  wire [15:0]psum;
  wire rst_n;
  wire rst_n_0;

  acc_block_acc_reg_0_0_acc_stage u_acc
       (.Q(Q[1]),
        .clk(clk),
        .psum(psum),
        .\psum_out_reg[7]_0 (in),
        .rst_n(rst_n),
        .rst_n_0(rst_n_0));
  acc_block_acc_reg_0_0_mul_stage u_mul
       (.Q(in),
        .a(a),
        .b(b),
        .clk(clk),
        .\mul_res_reg[7]_0 (Q[0]),
        .\mul_res_reg[7]_1 (rst_n_0));
endmodule

(* ORIG_REF_NAME = "mul_stage" *) 
module acc_block_acc_reg_0_0_mul_stage
   (Q,
    a,
    b,
    \mul_res_reg[7]_0 ,
    clk,
    \mul_res_reg[7]_1 );
  output [7:0]Q;
  input [3:0]a;
  input [3:0]b;
  input [0:0]\mul_res_reg[7]_0 ;
  input clk;
  input \mul_res_reg[7]_1 ;

  wire [7:0]Q;
  wire [3:0]a;
  wire [3:0]b;
  wire clk;
  wire [7:1]mul_res0;
  wire \mul_res[0]_i_1_n_0 ;
  wire \mul_res[2]_i_1_n_0 ;
  wire \mul_res[4]_i_2_n_0 ;
  wire \mul_res[4]_i_3_n_0 ;
  wire \mul_res[4]_i_4_n_0 ;
  wire \mul_res[4]_i_5_n_0 ;
  wire \mul_res[4]_i_6_n_0 ;
  wire \mul_res[6]_i_1_n_0 ;
  wire \mul_res[7]_i_2_n_0 ;
  wire \mul_res[7]_i_3_n_0 ;
  wire \mul_res[7]_i_4_n_0 ;
  wire \mul_res[7]_i_5_n_0 ;
  wire \mul_res[7]_i_6_n_0 ;
  wire \mul_res[7]_i_7_n_0 ;
  wire \mul_res[7]_i_8_n_0 ;
  wire [0:0]\mul_res_reg[7]_0 ;
  wire \mul_res_reg[7]_1 ;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \mul_res[0]_i_1 
       (.I0(a[0]),
        .I1(b[0]),
        .O(\mul_res[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    \mul_res[1]_i_1 
       (.I0(b[0]),
        .I1(a[1]),
        .I2(b[1]),
        .I3(a[0]),
        .O(mul_res0[1]));
  LUT6 #(
    .INIT(64'h4777B88878887888)) 
    \mul_res[2]_i_1 
       (.I0(a[2]),
        .I1(b[0]),
        .I2(b[1]),
        .I3(a[1]),
        .I4(b[2]),
        .I5(a[0]),
        .O(\mul_res[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \mul_res[3]_i_1 
       (.I0(\mul_res[4]_i_4_n_0 ),
        .I1(\mul_res[4]_i_2_n_0 ),
        .I2(\mul_res[4]_i_3_n_0 ),
        .O(mul_res0[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h718E8E71)) 
    \mul_res[4]_i_1 
       (.I0(\mul_res[4]_i_2_n_0 ),
        .I1(\mul_res[4]_i_3_n_0 ),
        .I2(\mul_res[4]_i_4_n_0 ),
        .I3(\mul_res[4]_i_5_n_0 ),
        .I4(\mul_res[4]_i_6_n_0 ),
        .O(mul_res0[4]));
  LUT6 #(
    .INIT(64'h80007FFF7FFF7FFF)) 
    \mul_res[4]_i_2 
       (.I0(a[1]),
        .I1(b[1]),
        .I2(a[0]),
        .I3(b[2]),
        .I4(b[0]),
        .I5(a[3]),
        .O(\mul_res[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7888877787778777)) 
    \mul_res[4]_i_3 
       (.I0(b[1]),
        .I1(a[2]),
        .I2(a[0]),
        .I3(b[3]),
        .I4(a[1]),
        .I5(b[2]),
        .O(\mul_res[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h88A8800080008000)) 
    \mul_res[4]_i_4 
       (.I0(b[0]),
        .I1(a[2]),
        .I2(a[0]),
        .I3(b[2]),
        .I4(a[1]),
        .I5(b[1]),
        .O(\mul_res[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    \mul_res[4]_i_5 
       (.I0(b[3]),
        .I1(a[0]),
        .I2(b[2]),
        .I3(a[1]),
        .I4(b[1]),
        .I5(a[2]),
        .O(\mul_res[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    \mul_res[4]_i_6 
       (.I0(\mul_res[7]_i_7_n_0 ),
        .I1(b[2]),
        .I2(a[2]),
        .I3(\mul_res[7]_i_8_n_0 ),
        .I4(a[3]),
        .I5(b[1]),
        .O(\mul_res[4]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \mul_res[5]_i_1 
       (.I0(\mul_res[7]_i_3_n_0 ),
        .I1(\mul_res[7]_i_5_n_0 ),
        .I2(\mul_res[7]_i_4_n_0 ),
        .O(mul_res0[5]));
  LUT6 #(
    .INIT(64'hE817171717E8E8E8)) 
    \mul_res[6]_i_1 
       (.I0(\mul_res[7]_i_3_n_0 ),
        .I1(\mul_res[7]_i_4_n_0 ),
        .I2(\mul_res[7]_i_5_n_0 ),
        .I3(a[3]),
        .I4(b[3]),
        .I5(\mul_res[7]_i_2_n_0 ),
        .O(\mul_res[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF8F8F880F8808080)) 
    \mul_res[7]_i_1 
       (.I0(b[3]),
        .I1(a[3]),
        .I2(\mul_res[7]_i_2_n_0 ),
        .I3(\mul_res[7]_i_3_n_0 ),
        .I4(\mul_res[7]_i_4_n_0 ),
        .I5(\mul_res[7]_i_5_n_0 ),
        .O(mul_res0[7]));
  LUT6 #(
    .INIT(64'hE8808080C0008000)) 
    \mul_res[7]_i_2 
       (.I0(b[3]),
        .I1(a[2]),
        .I2(b[2]),
        .I3(a[3]),
        .I4(b[1]),
        .I5(a[1]),
        .O(\mul_res[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8282EB82EB82EBEB)) 
    \mul_res[7]_i_3 
       (.I0(\mul_res[4]_i_5_n_0 ),
        .I1(\mul_res[7]_i_6_n_0 ),
        .I2(\mul_res[7]_i_7_n_0 ),
        .I3(\mul_res[4]_i_4_n_0 ),
        .I4(\mul_res[4]_i_3_n_0 ),
        .I5(\mul_res[4]_i_2_n_0 ),
        .O(\mul_res[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h2A80802A802A802A)) 
    \mul_res[7]_i_4 
       (.I0(\mul_res[7]_i_7_n_0 ),
        .I1(b[2]),
        .I2(a[2]),
        .I3(\mul_res[7]_i_8_n_0 ),
        .I4(a[3]),
        .I5(b[1]),
        .O(\mul_res[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hE75F30007800F000)) 
    \mul_res[7]_i_5 
       (.I0(b[1]),
        .I1(a[1]),
        .I2(a[2]),
        .I3(b[3]),
        .I4(a[3]),
        .I5(b[2]),
        .O(\mul_res[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h7888877787778777)) 
    \mul_res[7]_i_6 
       (.I0(b[1]),
        .I1(a[3]),
        .I2(a[1]),
        .I3(b[3]),
        .I4(a[2]),
        .I5(b[2]),
        .O(\mul_res[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \mul_res[7]_i_7 
       (.I0(a[1]),
        .I1(b[1]),
        .I2(a[0]),
        .I3(b[2]),
        .I4(b[0]),
        .I5(a[3]),
        .O(\mul_res[7]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \mul_res[7]_i_8 
       (.I0(a[1]),
        .I1(b[3]),
        .O(\mul_res[7]_i_8_n_0 ));
  FDCE \mul_res_reg[0] 
       (.C(clk),
        .CE(\mul_res_reg[7]_0 ),
        .CLR(\mul_res_reg[7]_1 ),
        .D(\mul_res[0]_i_1_n_0 ),
        .Q(Q[0]));
  FDCE \mul_res_reg[1] 
       (.C(clk),
        .CE(\mul_res_reg[7]_0 ),
        .CLR(\mul_res_reg[7]_1 ),
        .D(mul_res0[1]),
        .Q(Q[1]));
  FDCE \mul_res_reg[2] 
       (.C(clk),
        .CE(\mul_res_reg[7]_0 ),
        .CLR(\mul_res_reg[7]_1 ),
        .D(\mul_res[2]_i_1_n_0 ),
        .Q(Q[2]));
  FDCE \mul_res_reg[3] 
       (.C(clk),
        .CE(\mul_res_reg[7]_0 ),
        .CLR(\mul_res_reg[7]_1 ),
        .D(mul_res0[3]),
        .Q(Q[3]));
  FDCE \mul_res_reg[4] 
       (.C(clk),
        .CE(\mul_res_reg[7]_0 ),
        .CLR(\mul_res_reg[7]_1 ),
        .D(mul_res0[4]),
        .Q(Q[4]));
  FDCE \mul_res_reg[5] 
       (.C(clk),
        .CE(\mul_res_reg[7]_0 ),
        .CLR(\mul_res_reg[7]_1 ),
        .D(mul_res0[5]),
        .Q(Q[5]));
  FDCE \mul_res_reg[6] 
       (.C(clk),
        .CE(\mul_res_reg[7]_0 ),
        .CLR(\mul_res_reg[7]_1 ),
        .D(\mul_res[6]_i_1_n_0 ),
        .Q(Q[6]));
  FDCE \mul_res_reg[7] 
       (.C(clk),
        .CE(\mul_res_reg[7]_0 ),
        .CLR(\mul_res_reg[7]_1 ),
        .D(mul_res0[7]),
        .Q(Q[7]));
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
