`timescale 1fs / 1fs

module FSM3(
    input wire clk, reset, z, max_tick_reg,
    //output pattern
    output reg [7:0] count
    //output integer count
    );
    
    clock M0 (
        .clk(clk)
    );
    
    reset_clock M1 (
        .reset(reset)
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
              st12 = 4'b1011,
              st13 = 4'b1100;
              
    reg [3:0] nst, st;
    
    initial begin
        st = st1; 
        nst = st1;   
    end

    
    //assign count = (st == st13); 
    always @ (posedge clk) begin
        if (reset) 
            begin
                st <= st1;
                count = 7'b0000000;
            end 
        else 
            begin
                st <= nst; 
                if(nst == st13)
                        count <= count + 1;
                if(max_tick_reg)
                        count = 7'b0000000;
            end
    end
    
    always @ * 
    begin 
        //nst = st;
        case(st)
            st1: if(z) nst = st2;
                 else nst = st1;
            st2: if(!z) nst = st3;
                 else nst = st2;
            st3: if(z) nst = st4;
                 else nst = st1;
            st4: if(!z) nst = st5;
                 else nst = st2;
            st5: if(z) nst = st6;
                 else nst = st1;
            st6: if(z) nst = st7;
                 else nst = st5;
            st7: if(z) nst = st8;
                 else nst = st3;
            st8: if(z) nst = st9;
                 else nst = st3;
            st9: if(z) nst = st10;
                 else nst = st3;
            st10: if(!z) nst = st11;
                  else nst = st2;
            st11: if(!z) nst = st12;
                  else nst = st4;
            st12: if(!z) nst = st13;
                  else nst = st2;
            st13: nst = st1;
            default: nst = st1;
        endcase
    end
endmodule