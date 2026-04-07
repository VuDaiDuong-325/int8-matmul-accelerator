module array_ctrl #(
    parameter ARRAY_SIZE = 4,
    parameter ADDR_WIDTH = 32
)(
    input  wire clk,
    input  wire rst_n,
    input  wire start,

    input  wire [15:0] M_size,
    input  wire [15:0] K_size,
    input  wire [15:0] N_size,

    // BRAM interface (read A, B)
    output reg  [ADDR_WIDTH-1:0] addr_A,
    output reg  [ADDR_WIDTH-1:0] addr_B,
    input  wire [ARRAY_SIZE*8-1:0] data_A,
    input  wire [ARRAY_SIZE*8-1:0] data_B,
    
    // BRAM interface (write C)
    output reg                   we_C,
    output reg  [ADDR_WIDTH-1:0] addr_C,
    output reg  [31:0]           data_C,
    
    // To systolic array   
    input  wire [(ARRAY_SIZE*ARRAY_SIZE*32)-1:0] psum_in_matrix,
    output wire [ARRAY_SIZE-1:0] valid_in_left,
    output wire [ARRAY_SIZE-1:0] clear_acc_left,
    output wire [ARRAY_SIZE-1:0] last_mac_in_left,
    output wire [(ARRAY_SIZE*8)-1:0] act_in_left,
    output wire [(ARRAY_SIZE*8)-1:0] weight_in_top,

    output reg done
);

    // =========================================================
    // PARAM
    // =========================================================
    localparam TILE = ARRAY_SIZE;
    localparam TILE_SHIFT = $clog2(TILE);

    localparam IDLE         = 0;
    localparam LOAD         = 1;
    localparam RUN          = 2;
    localparam FLUSH        = 3;
    localparam WRITE_BACK   = 4;
    localparam NEXT         = 5;
    localparam DONE         = 6;

    // =========================================================
    // STATE
    // =========================================================
    reg [2:0] state, next_state;

    always @(posedge clk)
        if (!rst_n) state <= IDLE;
        else        state <= next_state;

    // =========================================================
    // COUNTERS
    // =========================================================
    reg [15:0] m_tile_cnt, n_tile_cnt, k_tile_cnt;
    reg [15:0] k_inner_cnt;
    reg [15:0] flush_cnt;
    reg [15:0] wb_row, wb_col;

    wire [15:0] m_tile_max = (M_size + TILE - 1) >> TILE_SHIFT;
    wire [15:0] n_tile_max = (N_size + TILE - 1) >> TILE_SHIFT;
    wire [15:0] k_tile_max = (K_size + TILE - 1) >> TILE_SHIFT;

    wire last_m_tile = (m_tile_cnt == m_tile_max - 1);
    wire last_n_tile = (n_tile_cnt == n_tile_max - 1);
    wire last_k_tile = (k_tile_cnt == k_tile_max - 1);

    wire k_inner_done = (k_inner_cnt == TILE-1);

    // Flush to get all of the array
    localparam FLUSH_CYCLES = (2*ARRAY_SIZE) + 4;
    wire flush_done = (flush_cnt == FLUSH_CYCLES);
    
    //  Check for 1 block C
    wire wb_done = (wb_row == TILE-1) && (wb_col == TILE-1);

    wire all_done = last_m_tile && last_n_tile && last_k_tile;

    // =========================================================
    // FSM 
    // =========================================================
    always @(*) begin
        case (state)
            IDLE:  next_state = start ? LOAD : IDLE;

            LOAD:  next_state = RUN;

            RUN: begin
                if (k_inner_done) begin
                    if (last_k_tile)
                        next_state = FLUSH;   // chỉ flush khi hết K
                    else
                        next_state = NEXT;    // tiếp tục accumulate
                end else begin
                    next_state = RUN;
                end
            end

            FLUSH: next_state = flush_done ? WRITE_BACK : FLUSH;
            
            WRITE_BACK: next_state = wb_done ? NEXT : WRITE_BACK;

            NEXT:  next_state = all_done ? DONE : LOAD;

            DONE:  next_state = IDLE;

            default: next_state = IDLE;
        endcase
    end

    // =========================================================
    // COUNTER UPDATE
    // =========================================================
    always @(posedge clk) begin
        if (!rst_n) begin
            m_tile_cnt <= 0;
            n_tile_cnt <= 0;
            k_tile_cnt <= 0;
            k_inner_cnt <= 0;
            wb_row <= 0;
            wb_col <= 0;
            flush_cnt <= 0;
            done <= 0;
        end else begin
            case (state)

                IDLE: begin
                    m_tile_cnt <= 0;
                    n_tile_cnt <= 0;
                    k_tile_cnt <= 0;
                    k_inner_cnt <= 0;
                    flush_cnt <= 0;
                    done <= 0;
                end

                RUN: begin
                    if (!k_inner_done)
                        k_inner_cnt <= k_inner_cnt + 1;
                end

                FLUSH: begin
                    flush_cnt <= flush_cnt + 1;
                end
                
                WRITE_BACK: begin
                    if (wb_col == TILE - 1) begin
                        wb_col <= 16'd0;
                        if (wb_row == TILE - 1) begin
                            wb_row <= 16'd0;
                        end else begin
                            wb_row <= wb_row + 16'd1;
                        end
                    end else begin
                        wb_col <= wb_col + 16'd1;
                    end
                end

                NEXT: begin
                    k_inner_cnt <= 0;
                    flush_cnt <= 0;

                    if (!last_k_tile) begin
                        k_tile_cnt <= k_tile_cnt + 1;
                    end else begin
                        k_tile_cnt <= 0;

                        if (!last_n_tile) begin
                            n_tile_cnt <= n_tile_cnt + 1;
                        end else begin
                            n_tile_cnt <= 0;

                            if (!last_m_tile) begin
                                m_tile_cnt <= m_tile_cnt + 1;
                            end else begin
                                m_tile_cnt <= 0;
                            end
                        end
                    end
                end

                DONE: begin
                    done <= 1;
                end
            endcase
        end
    end
    
    // =========================================================
    // WRITE BACK LOGIC (WRITE C)
    // =========================================================
    wire [ADDR_WIDTH-1:0] current_c_row = (m_tile_cnt * TILE) + wb_row;
    wire [ADDR_WIDTH-1:0] current_c_col = (n_tile_cnt * TILE) + wb_col;
    
    // Boundary check:
    wire is_valid_c_element = (current_c_row < M_size) && (current_c_col < N_size);
    
    wire [15:0] flat_idx = (wb_row * TILE) + wb_col;

    always @(posedge clk) begin
        if (!rst_n) begin
            we_C   <= 1'b0;
            addr_C <= 0;
            data_C <= 0;
        end else if (state == WRITE_BACK) begin
            // we_C = 1 if data is not zero-padding
            we_C   <= is_valid_c_element;
            
            // C address calculate (Row-major format)
            addr_C <= (current_c_row * N_size) + current_c_col;
            
            // get corresponding 32 bit form psum_in_matrix (Verilog 2001)
            data_C <= psum_in_matrix[flat_idx * 32 +: 32]; 
        end else begin
            we_C   <= 1'b0;
        end
    end

    // =========================================================
    // ADDRESS A, B
    // =========================================================
    wire [15:0] k_inner_next =
        (state == RUN && !k_inner_done) ? (k_inner_cnt + 1) :
                                          k_inner_cnt;

    always @(posedge clk) begin
        if (state == LOAD || state == RUN) begin
            addr_A <= (k_tile_cnt * TILE + k_inner_next) * M_size 
                    + (m_tile_cnt * TILE);

            addr_B <= (k_tile_cnt * TILE + k_inner_next) * N_size
                    + (n_tile_cnt * TILE);
        end
    end

    // =========================================================
    // CONTROL (delay 1 cycle for BRAM)
    // =========================================================
    wire base_valid_early = (state == RUN);
    wire base_clear_early = (state == RUN) && (k_tile_cnt == 0) && (k_inner_cnt == 0);
    wire base_last_early  = (state == RUN) && last_k_tile && k_inner_done;

    reg base_valid, base_clear, base_last;

    always @(posedge clk) begin
        if (!rst_n) begin
            base_valid <= 0;
            base_clear <= 0;
            base_last  <= 0;
        end else begin
            base_valid <= base_valid_early;
            base_clear <= base_clear_early;
            base_last  <= base_last_early;
        end
    end

    // =========================================================
    // SKEW PIPE
    // =========================================================
    genvar i;
    generate
        for (i = 0; i < ARRAY_SIZE; i = i + 1) begin : skew

            skew_pipe #(.DATA_WIDTH(1), .DEPTH(i))
                u_vld (.clk(clk), .rst_n(rst_n),
                       .din(base_valid),
                       .dout(valid_in_left[i]));

            skew_pipe #(.DATA_WIDTH(1), .DEPTH(i))
                u_clr (.clk(clk), .rst_n(rst_n),
                       .din(base_clear),
                       .dout(clear_acc_left[i]));

            skew_pipe #(.DATA_WIDTH(1), .DEPTH(i))
                u_lst (.clk(clk), .rst_n(rst_n),
                       .din(base_last),
                       .dout(last_mac_in_left[i]));

            skew_pipe #(.DATA_WIDTH(8), .DEPTH(i))
                u_act (.clk(clk), .rst_n(rst_n),
                       .din(base_valid ? data_A[(i*8)+7:i*8] : 8'd0),
                       .dout(act_in_left[(i*8)+7:i*8]));

            skew_pipe #(.DATA_WIDTH(8), .DEPTH(i))
                u_wgt (.clk(clk), .rst_n(rst_n),
                       .din(base_valid ? data_B[(i*8)+7:i*8] : 8'd0),
                       .dout(weight_in_top[(i*8)+7:i*8]));

        end
    endgenerate

endmodule