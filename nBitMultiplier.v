`timescale 1ns / 1ps


module nBitMult(p,a,b,clk);
    (*dont_touch = "true"*)parameter n =5;
    input [n-1:0]a,b;
    input clk;
    output reg [2*n-1:0]p;
    (*dont_touch = "true"*)reg [2*n-1:0]partialProduct[n-1:0];
    
    (*dont_touch = "true"*)integer i;
    always@(posedge clk)
        begin
        for (i =0; i<n;i= i+1)
            begin
            partialProduct[i] = {n{ b[i] } } & a[n-1:0];  //something might be wrong here
            partialProduct[i] = partialProduct[i]<<i;  
            
            end
        
        p =    partialProduct[0] + partialProduct[1] + partialProduct[2] + partialProduct[3] + partialProduct[4] ;
        
        
    
        end
    endmodule
        