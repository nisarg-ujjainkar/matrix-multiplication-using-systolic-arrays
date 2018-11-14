`timescale 1ns / 1ps


module PE(a,b,c,o1,o2,o3,clk);
    input clk;
    input [7:0]a,b,c;
    output reg [7:0]o1,o2,o3;
    wire [7:0]mul,ad;
    floatingPntMult(mul,a,b,clk);
    always@(posedge clk)
        begin
            o1 = a;
            o2 = b;
            o3 = c+ mul;
        end
endmodule
