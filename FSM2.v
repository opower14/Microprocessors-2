`timescale 1ns / 1ps

module FSM2(
    input wire clk, reset,
    input wire [15:0] lfsr_reg,
    output integer count
    );
    
    integer position = 15;
    
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
    
    parameter st1 = 4'b0000,
              st2 = 4'b0001,
              st3 = 4'b0010,
              st4 = 4'b0011,
              st5 = 4'b0100,
              st6 = 4'b0101,
              st7 = 4'b0110,
              st8 = 4'b0111,
              st9 = 4'b1000,
              st10 = 4'b1001,
              st11 = 4'b1010,
              st12 = 4'b1011;
              
    reg [3:0] nst, st;
    
    always @(posedge clk, posedge reset)
        if (reset)
            begin
                count <= 0;
            end
        else begin
            case(lfsr_reg)
                st1: if(position >= 11)
                        if(lfsr_reg[position] == 0)
                            begin
                                position = position - 1;
                                nst = st2;
                            end
                        else
                            begin
                                position = position - 1;
                                nst = st1;
                            end
                     else
                        begin
                            position = 15;
                            nst = st1;
                        end   
                st2: if(lfsr_reg[position] == 0)
                        begin
                            position = position - 1;
                            nst = st3;
                        end
                     else
                        begin
                            position = position - 1;
                            nst = st1;
                        end
                st3: if(lfsr_reg[position] == 1)
                        begin
                            position = position - 1;
                            nst = st4;
                        end
                     else
                        begin
                            position = position - 1;
                            nst = st1;
                        end
                st4: if(lfsr_reg[position] == 0)
                        begin
                            position = position - 1;
                            nst = st5;
                        end
                     else
                        begin
                            position = position - 1;
                            nst = st1;
                        end
                st5: if(lfsr_reg[position] == 1)
                        begin
                            position = position - 1;
                            nst = st6;
                        end
                     else
                        begin
                            position = position - 1;
                            nst = st1;
                        end
                st6: if(lfsr_reg[position] == 1)
                        begin
                            position = position - 1;
                            nst = st7;
                        end
                     else
                        begin
                            position = position - 1;
                            nst = st1;
                        end
                st7: if(lfsr_reg[position] == 1)
                        begin
                            position = position - 1;
                            nst = st8;
                        end
                     else
                        begin
                            position = position - 1;
                            nst = st1;
                        end
                st8: if(lfsr_reg[position] == 1)
                        begin
                            position = position - 1;
                            nst = st9;
                        end
                     else
                        begin
                            position = position - 1;
                            nst = st1;
                        end
                st9: if(lfsr_reg[position] == 1)
                        begin
                            position = position - 1;
                            nst = st10;
                        end
                     else
                        begin
                            position = position - 1;
                            nst = st1;
                        end
                st10: if(lfsr_reg[position] == 0)
                        begin
                            position = position - 1;
                            nst = st11;
                        end
                     else
                        begin
                            position = position - 1;
                            nst = st1;
                        end
                st11: if(lfsr_reg[position] == 0)
                        begin
                            position = position - 1;
                            nst = st12;
                        end
                     else
                        begin
                            position = position - 1;
                            nst = st1;
                        end
                st12: if(lfsr_reg[position] == 0)
                        begin
                            count = count + 1;
                            nst = st1;
                        end
                     else
                        begin
                            position = position - 1;
                            nst = st1;
                        end
            endcase
        end
        
endmodule