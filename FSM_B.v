`timescale 1ns / 1ps

module FSM_B(
        input CCLK, reset, 
        output [7:0] count
    );
    
    wire cl0k;
    
    clock2 test2(.CCLK(CCLK), .clkscale(1000), .clk(cl0k));
    pattern_det test(.clk(cl0k), .reset(reset), .count(count));
    
    
endmodule
