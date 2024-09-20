`timescale 1ns / 1ps

module FSM5(
    input wire clk, reset,
    input wire [15:0] lfsr_reg,
    output reg [7:0] count
    );
    
    clock M0 (
        .clk(clk)
    );
    
    reset_clock M1 (
        .reset(reset)
    );
    
    LFSR M2 (
        .clk(clk),
        .reset(reset),
        .lfsr_out(lfsr_out),
        .lfsr_reg(lfsr_reg),
        .max_tick_reg(max_tick_reg)
    );
    
    always @(posedge clk, posedge reset)
        if (reset)
            begin
                count <= 0;
            end
        else begin
            case(lfsr_reg)
                16'b0001010111110000: count = count + 1;
                16'b0001010111110001: count = count + 1;
                16'b0011010111110000: count = count + 1;
                16'b0011010111110001: count = count + 1;
                16'b0101010111110000: count = count + 1;
                16'b0101010111110001: count = count + 1;
                16'b0111010111110000: count = count + 1;
                16'b0111010111110001: count = count + 1;
                16'b1001010111110000: count = count + 1;
                16'b1001010111110001: count = count + 1;
                16'b1011010111110000: count = count + 1;
                16'b1011010111110001: count = count + 1;
                16'b1101010111110000: count = count + 1;
                16'b1101010111110001: count = count + 1;
                16'b1111010111110000: count = count + 1;
                16'b1111010111110001: count = count + 1;
            endcase
        end
        
endmodule
