`timescale 1fs / 1fs

module reset_clock(
    output reg reset
);

    initial begin
        reset = 1'b1;
        forever begin
            #10
            reset = 1'b0;
            //reset = !reset;
            //#200
            //reset = !reset;
        end
    end
endmodule
