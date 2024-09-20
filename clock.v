`timescale 1fs / 1fs


module clock(
    output reg clk
    );
    
    initial begin
        clk = 1'b1;
        forever begin
            #1
            clk = !clk;
        end
    end
    
    
endmodule
