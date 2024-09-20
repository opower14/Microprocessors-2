`timescale 1fs / 1fs

module pattern_det(
    input clk, reset, 
    //output pattern,
    //output lfsr_msb,
    output max_tick_reg,
    output [7:0] count
    //output integer count,
    //output [15:0] lfsr_reg2
    );
    
    wire [15:0]	lfsr_reg;
    wire [16:0]	lfsr_reg3;
    wire [15:0]	lfsr_out;
    wire clk_out;
    wire [7:0] count1;
    wire [7:0] count2;
    wire [7:0] count3;
    wire [7:0] count4;
    wire [7:0] count5;
    //wire pattern;
    //assign lfsr_msb = lfsr_reg[15];
    assign count = count1 + count2 + count3 + count4 + count5;
    //assign count = (5*count1);
    //assign lfsr_reg2 = lfsr_reg;
    //assign lfsr_reg3 = (2'b10 * lfsr_reg);
    
    

    
    
 
    FSM3 M0(
        .clk(clk),
        .reset(reset),
        .z(lfsr_reg[2]),
        .max_tick_reg(max_tick_reg),
        //.pattern(pattern),
        .count(count1)
    );
    
    FSM3 M3(
        .clk(clk),
        .reset(reset),
        .z(lfsr_reg[1]),
        .max_tick_reg(max_tick_reg),
        //.pattern(pattern),
        .count(count2)
    );
    
    FSM3 M4(
        .clk(clk),
        .reset(reset),
        .z(lfsr_reg[0]),
        .max_tick_reg(max_tick_reg),
        //.pattern(pattern),
        .count(count3)
    );
    
    FSM3 M5(
        .clk(clk),
        .reset(reset),
        .z(lfsr_reg[3]),
        .max_tick_reg(max_tick_reg),
        //.pattern(pattern),
        .count(count4)
    );
    
    FSM3 M6(
        .clk(clk),
        .reset(reset),
        .z(lfsr_reg[4]),
        .max_tick_reg(max_tick_reg),
        //.pattern(pattern),
        .count(count5)
    );
    
    clock M1(
        .clk(clk)
    );
    
    LFSR M2(
  	     .clk(clk),
  	     .reset(reset),
  	     .lfsr_out(lfsr_out),
 	     .lfsr_reg(lfsr_reg),
         .max_tick_reg(max_tick_reg)
    );
    
    //LFSR2 M3(
    //        .clk(clk),
    //        .reset(reset),
    //        .Q_out(lfsr_reg),
    //        .MAX_TICK_REG(max_tick_reg)
    //);
    
    
endmodule