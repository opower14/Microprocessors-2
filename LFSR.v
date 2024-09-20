`timescale 1fs / 1fs

module LFSR (
    input wire clk, reset,
    output wire [15:0] lfsr_out,
    output reg [15:0] lfsr_reg,
    output reg max_tick_reg
    );
    
    
    localparam lfsr_seed = 16'b0000000011111100;
    reg [15:0] lfsr_next;
    reg lfsr_tap;
    
    integer cycle_num;
    
    clock M0 (
        .clk(clk)
    );
    
    reset_clock M1 (
        .reset(reset)
    );
    
    always @(posedge clk, posedge reset)
        if (reset)
            begin
                lfsr_reg <= lfsr_seed;
                max_tick_reg <= 1'b0;
                cycle_num <= 0;
            end
        else
            begin
                lfsr_reg <= lfsr_next;
                cycle_num <= cycle_num + 1;
                if (cycle_num == 2**16 - 1)
                    begin
                    max_tick_reg <= 1'b1;
                    //$finish;
                    end
                else
                    max_tick_reg <= 1'b0;
            end

    always @*
        begin
            lfsr_tap = 1 - (lfsr_reg[15] ^ lfsr_reg[14] ^ lfsr_reg[12] ^ lfsr_reg[3]);
            lfsr_next = {lfsr_reg[14:0], lfsr_tap}; 
        end 

    assign lfsr_out = lfsr_reg[15];
    
endmodule
