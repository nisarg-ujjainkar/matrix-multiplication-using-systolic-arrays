`timescale 1ns / 1ps


module PE(a,b,c,o1,o2,o3,clk);
    parameter n=5;
    input clk;
    input [n-1:0]a,b;
    input [2*n+3:0]c;
    output reg [n-1:0]o1,o2;
    output reg [2*n+3:0]o3;
    (*dont_touch = "true"*)wire [2*n+3:0]mul;
    assign mul=a*b;
    always@(posedge clk)
        begin
            o1 = a;
            o2 = b;
            o3 = c+ mul;
        end
endmodule
