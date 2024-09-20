`timescale 1fs / 1fs


module FSM_tb(

    );
    reg clk;
    wire max_tick_reg;
    reg reset;
    //wire pattern;
    //wire lfsr_msb;
    wire [7:0] count;
    //integer count;
    wire [15:0] lfsr_reg2;
    wire lfsr_reg4;
    assign lfsr_reg4 = lfsr_reg2[0];
    //reg [20:0] count2;
    //assign count2 = 20'b00000000000000000000;
    

    pattern_det M0(
        .clk(clk), 
        .reset(reset), 
        //.pattern(pattern), 
        //.lfsr_msb(lfsr_msb), 
        .max_tick_reg(max_tick_reg), 
        .count(count)
        //.lfsr_reg2(lfsr_reg2)
    );

  
    initial
        begin
            reset = 1'b1;
            #4
            reset = 1'b0;
            //#6000000;
            //$finish;
        end

    initial 
        begin 
            clk	= 1'b1;
           //count2 = 20'b00000000000000000000;
			forever	
			     begin
			         #1	
			         clk	= !clk;
			         //count2 = count2 + 1;
			     end
	    end 



    

endmodule