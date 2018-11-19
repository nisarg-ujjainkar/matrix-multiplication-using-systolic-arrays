`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2018 09:46:48 PM
// Design Name: 
// Module Name: nmult
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Depen,dencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module nmult(o1,o2,o3,o4,o5,o6,o7,o8,o9,a1,a2,a3,a4,a5,a6,a7,a8,a9,b1,b2,b3,b4,b5,b6,b7,b8,b9,clk);
    input [7:0]a1,a2,a3,a4,a5,a6,a7,a8,a9;
    input [7:0]b1,b2,b3,b4,b5,b6,b7,b8,b9;
    output reg [17:0]o1=0,o2=0,o3=0,o4=0,o5=0,o6=0,o7=0,o8=0,o9=0;
    wire [7:0]A[0:2][0:2];
    wire [7:0]B[0:2][0:2];
    reg [17:0]C[0:2][0:2];
    begin
        assign A[0][0]=a1;
        assign A[0][1]=a2;
        assign A[0][2]=a3;
        assign A[1][0]=a4;
        assign A[1][1]=a5;
        assign A[1][2]=a6;
        assign A[2][0]=a7;
        assign A[2][1]=a8;
        assign A[2][2]=a9;
        assign B[0][0]=b1;
        assign B[0][1]=b2;
        assign B[0][2]=b3;
        assign B[1][0]=b4;
        assign B[1][1]=b5;
        assign B[1][2]=b6;
        assign B[2][0]=b7;
        assign B[2][1]=b8;
        assign B[2][2]=b9;
    end
    input clk;
    integer i=0,j=0,k=0;
    always@(posedge clk)
        begin
            if(i==0 && j==0 && k==0)
                begin
                    C[0][0]=0;
                    C[0][1]=0;
                    C[0][2]=0;
                    C[1][0]=0;
                    C[1][1]=0;
                    C[1][2]=0;
                    C[2][0]=0;
                    C[2][1]=0;
                    C[2][2]=0;
                    
                end
            C[i][j]=C[i][j]+A[i][k]*B[k][i];
            k=k+1;
            if(k==3)
                begin
                    j=j+1;
                    k=0;
                end
            if(j==3)
                begin
                    i=i+1;
                    j=0;
                end
            if(i==3)
                o1=C[0][0];
                o2=C[0][1];
                o3=C[0][2];
                o4=C[1][0];
                o5=C[1][1];
                o6=C[1][2];
                o7=C[2][0];
                o8=C[2][1];
                o9=C[2][2];
        end
endmodule
