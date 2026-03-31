`timescale 1ns / 1ps

module array_ctrl #(
    parameter ARRAY_SIZE = 4
)(
    input  wire clk,
    input  wire rst_n,
    input  wire start_btn,

    output wire [ARRAY_SIZE-1:0]               valid_in_left,
    output wire [ARRAY_SIZE-1:0]               clear_acc_left,
    output wire [ARRAY_SIZE-1:0]               last_mac_in_left,
    output wire [(ARRAY_SIZE*8)-1:0]           act_in_left,
    output wire [(ARRAY_SIZE*8)-1:0]           weight_in_top,
    output reg  test_done
);

    // ==========================================
    // 1. FSM ĐIỀU KHIỂN BÀI TEST
    // ==========================================
    localparam IDLE    = 2'b00;
    localparam RUN     = 2'b01; 
    localparam FLUSH   = 2'b10;
    localparam DONE    = 2'b11;

    reg [1:0] state, next_state;
    reg [2:0] k_cnt;     
    reg [3:0] flush_cnt;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) state <= IDLE;
        else        state <= next_state;
    end

    always @(*) begin
        next_state = state;
        case (state)
            IDLE:  if (start_btn) next_state = RUN;
            RUN:   if (k_cnt == 3) next_state = FLUSH;
            FLUSH: if (flush_cnt == 8) next_state = DONE;
            DONE:  if (!start_btn) next_state = IDLE; 
        endcase
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            k_cnt     <= 0;
            flush_cnt <= 0;
            test_done <= 0;
        end else begin
            case (state)
                IDLE: begin
                    k_cnt     <= 0;
                    flush_cnt <= 0;
                    test_done <= 0;
                end
                RUN: begin
                    k_cnt <= k_cnt + 1;
                end
                FLUSH: begin
                    flush_cnt <= flush_cnt + 1;
                end
                DONE: begin
                    test_done <= 1;
                end
            endcase
        end
    end

    // ==========================================
    // 2. TẠO ROM CHỨA MA TRẬN A VÀ B (SỐ CÓ DẤU)
    // ==========================================
    wire       base_valid = (state == RUN);
    wire       base_clear = (state == RUN) && (k_cnt == 0);
    wire       base_last  = (state == RUN) && (k_cnt == 3);

    wire [7:0] ROM_A [0:3][0:3];
    wire [7:0] ROM_B [0:3][0:3];

    assign ROM_A[0][0] = -8'sd4;   assign ROM_A[0][1] = -8'sd41;  assign ROM_A[0][2] = -8'sd12;  assign ROM_A[0][3] =  8'sd42;
    assign ROM_A[1][0] =  8'sd66;  assign ROM_A[1][1] = -8'sd61;  assign ROM_A[1][2] =  8'sd20;  assign ROM_A[1][3] = -8'sd26;
    assign ROM_A[2][0] =  8'sd57;  assign ROM_A[2][1] = -8'sd84;  assign ROM_A[2][2] =  8'sd11;  assign ROM_A[2][3] =  8'sd127;
    assign ROM_A[3][0] =  8'sd70;  assign ROM_A[3][1] =  8'sd27;  assign ROM_A[3][2] =  8'sd0;   assign ROM_A[3][3] =  8'sd73;

    assign ROM_B[0][0] =  8'sd23;  assign ROM_B[0][1] =  8'sd42;  assign ROM_B[0][2] = -8'sd38;  assign ROM_B[0][3] = -8'sd26;
    assign ROM_B[1][0] = -8'sd4;   assign ROM_B[1][1] =  8'sd12;  assign ROM_B[1][2] = -8'sd66;  assign ROM_B[1][3] =  8'sd25;
    assign ROM_B[2][0] =  8'sd41;  assign ROM_B[2][1] =  8'sd95;  assign ROM_B[2][2] =  8'sd127; assign ROM_B[2][3] = -8'sd92;
    assign ROM_B[3][0] =  8'sd33;  assign ROM_B[3][1] =  8'sd40;  assign ROM_B[3][2] =  8'sd101; assign ROM_B[3][3] =  8'sd23;

    // ==========================================
    // 3. MẠCH SKEW CHO MẢNG SYSTOLIC ARRAY
    // ==========================================
    genvar i;
    generate
        for (i = 0; i < ARRAY_SIZE; i = i + 1) begin : skew_gen
            // Lấy dữ liệu từ ROM ra theo hàng/cột (i) và nhịp bơm (k_cnt)
            wire [7:0] current_act = ROM_A[i][k_cnt]; 
            wire [7:0] current_wgt = ROM_B[k_cnt][i]; 

            if (i == 0) begin
                assign valid_in_left[i]    = base_valid;
                assign clear_acc_left[i]   = base_clear;
                assign last_mac_in_left[i] = base_last;
                assign act_in_left[7:0]    = base_valid ? current_act : 8'd0;
                assign weight_in_top[7:0]  = base_valid ? current_wgt : 8'd0;
                
            end else if (i == 1) begin
                reg d_vld, d_clr, d_lst;
                reg [7:0] d_act, d_wgt;
                
                always @(posedge clk or negedge rst_n) begin
                    if (!rst_n) begin
                        d_vld <= 0; d_clr <= 0; d_lst <= 0;
                        d_act <= 8'd0; d_wgt <= 8'd0;
                    end else begin
                        d_vld <= base_valid;
                        d_clr <= base_clear;
                        d_lst <= base_last;
                        d_act <= base_valid ? current_act : 8'd0;
                        d_wgt <= base_valid ? current_wgt : 8'd0;
                    end
                end
                
                assign valid_in_left[i]    = d_vld;
                assign clear_acc_left[i]   = d_clr;
                assign last_mac_in_left[i] = d_lst;
                assign act_in_left[15:8]   = d_act;
                assign weight_in_top[15:8] = d_wgt;
                
            end else begin
                reg [i-1:0]     d_vld, d_clr, d_lst;
                reg [(i*8)-1:0] d_act, d_wgt;

                always @(posedge clk or negedge rst_n) begin
                    if (!rst_n) begin
                        d_vld <= 0; d_clr <= 0; d_lst <= 0;
                        d_act <= 0; d_wgt <= 0;
                    end else begin
                        d_vld <= {d_vld[i-2:0], base_valid};
                        d_clr <= {d_clr[i-2:0], base_clear};
                        d_lst <= {d_lst[i-2:0], base_last};
                        
                        d_act <= {d_act[(i-1)*8-1 : 0], (base_valid ? current_act : 8'd0)};
                        d_wgt <= {d_wgt[(i-1)*8-1 : 0], (base_valid ? current_wgt : 8'd0)};
                    end
                end

                assign valid_in_left[i]    = d_vld[i-1];
                assign clear_acc_left[i]   = d_clr[i-1];
                assign last_mac_in_left[i] = d_lst[i-1];
                assign act_in_left[(i*8)+7 : i*8]   = d_act[(i*8)-1 : (i-1)*8];
                assign weight_in_top[(i*8)+7 : i*8] = d_wgt[(i*8)-1 : (i-1)*8];
            end
        end
    endgenerate

endmodule