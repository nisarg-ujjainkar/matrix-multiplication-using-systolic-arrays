`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2018 01:25:51 AM
// Design Name: 
// Module Name: convolution
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module convolution(clk);
    input clk;
    reg [3:0]a1=-1,a2=-1,a3=-1,a4=-1,a5=8,a6=-1,a7=-1,a8=-1,a9=-1;
    reg [3:0]b1,b2,b3,b4,b5,b6,b7,b8,b9;
    reg f=0,flag = 0;
    wire [11:0]re;
    reg [3:0]I[0:24][0:31];
    wire [3:0]C[0:22][0:29];
//    reg [5:0]ro;
//    reg [8:0]co;
    integer r=0,c=0,i=0,j=0;
    game_logo_rom g(clk,r,c,re);
    multip m(a1,a2,a3,a4,a5,a6,a7,a8,a9,b1,b2,b3,b4,b5,b6,b7,b8,b9,clk,C[i][j]);
    always@(posedge clk)
        begin
            if(~flag)
                begin
                    c=c+1;
                    if(c==32)
                        begin
                           r=r+1;
                           c=0; 
                        end
                    if(r==25)
                        begin
                            flag=1'b1;
                        end
                    b1=I[i][j][3:0];
                    b2=I[i][j+1][3:0];
                    b3=I[i][j+2][3:0];
                    b4=I[i+1][j][3:0];
                    b5=I[i+1][j+1][3:0];
                    b6=I[i+1][j+2][3:0]; 
                    b7=I[i+2][j][3:0];
                    b8=I[i+2][j+1][3:0];
                    b9=I[i+2][j+2][3:0];
                end
            if(flag==1 && i<23)
                begin
                    j=j+1;
                    if(j==30)
                        begin
                            j=0;
                            i=i+1;
                        end
                end
        end
//    begin
//        for (i=1;i<24;i=i+1)
//            begin
//                for(j=1;j<31;j=j+1)
//                    begin
//                        assign b1=I[i][j][3:0];
//                        assign b2=I[i][j+1][3:0];
//                        assign b3=I[i][j+2][3:0];
//                        assign b4=I[i+1][j][3:0];
//                        assign b5=I[i+1][j+1][3:0];
//                        assign b6=I[i+1][j+2][3:0]; 
//                        assign b7=I[i+2][j][3:0];
//                        assign b8=I[i+2][j+1][3:0];
//                        assign b9=I[i+2][j+2][3:0];
//                        multip m(a1,a2,a3,a4,a5,a6,a7,a8,a9,b1,b2,b3,b4,b5,b6,b7,b8,b9,clk,C[i][j]);
//                    end
//            end
//    end
endmodule
