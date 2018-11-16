`timescale 1ns / 1ps


module De(a,b,o1,o2,clk, l);
    input clk;
    input l;
    input a,b;
    output reg o1,o2;
    always@(posedge clk , l)
        begin
        o1 = a;
        o2 = b;
        end
endmodule
