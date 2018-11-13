`timescale 1ns / 1ps


module PE(a,b,c,o1,o2,o3,clk);
    input clk;
    input a,b,c;
    output reg o1,o2,o3;
    reg mul;
    always@(posedge clk)
        begin
            mul = a & b;
            o1 = a;
            o2 = b;
            o3 = c+ mul;
        end
endmodule
