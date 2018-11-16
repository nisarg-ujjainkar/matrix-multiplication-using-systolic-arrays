`timescale 1ns / 1ps


module fullAdder(sum,a,b,cin,clk);
    
    (*dont_touch = "true"*)parameter n = 3;
    input [n-1:0]a,b;
    input cin,clk;
    output reg [n:0]sum;
    always@(posedge clk)
        begin
            sum = a+b+cin;
        end
endmodule
