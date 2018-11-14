`timescale 1ns / 1ps

module multip(a,b,clk,out);
    input [8:0]a,b;
    input clk;
    output reg [8:0]out=9'b000000000;
    wire [18:0] pe_out1;
    wire [18:0] pe_out2;
    wire [18:0] pe_out3;
    wire [5:0] de_out1;
    wire [5:0] de_out2;
    reg [4:0]ai=5'b00000, bi=5'b00000;
    integer i=0;
    
    //first row
    PE pe1(ai[0],bi[0],0,pe_out1[0],pe_out2[0],pe_out3[0],clk);
    PE pe2(pe_out1[0],bi[1],0,pe_out1[1],pe_out2[1],pe_out3[1],clk);
    PE pe3(pe_out1[1],bi[2],0,pe_out1[2],pe_out2[2],pe_out3[2],clk);
    De d1(pe_out1[2],bi[3],de_out1[0],de_out2[0],clk);
    De d2(de_out1[0],bi[4],de_out1[1],de_out2[1],clk);
    
    //second row
    PE pe4(ai[1],pe_out2[0],0,pe_out1[3],pe_out2[3],pe_out3[3],clk);
    PE pe5(pe_out1[3],pe_out2[1],pe_out3[0],pe_out1[4],pe_out2[4],pe_out3[4],clk);
    PE pe6(pe_out1[4],pe_out2[2],pe_out3[1],pe_out1[5],pe_out2[5],pe_out3[5],clk);
    PE pe7(pe_out1[5],de_out2[0],pe_out3[2],pe_out1[6],pe_out2[6],pe_out3[6],clk);
    De d3(pe_out1[6],de_out2[1],de_out1[2],de_out2[2],clk);
    
    //third row
    PE pe8(ai[2],pe_out2[3],0,pe_out1[7],pe_out2[7],pe_out3[7],clk);
    PE pe9(pe_out1[7],pe_out2[4],pe_out3[3],pe_out1[8],pe_out2[8],pe_out3[8],clk);
    PE pe10(pe_out1[8],pe_out2[5],pe_out3[4],pe_out1[9],pe_out2[9],pe_out3[9],clk);
    PE pe11(pe_out1[9],pe_out2[6],pe_out3[5],pe_out1[10],pe_out2[10],pe_out3[10],clk);
    PE pe12(pe_out1[10],pe_out2[7],pe_out3[6],pe_out1[11],pe_out2[11],pe_out3[11],clk);
    
    //fourth row
    De d4(ai[3],pe_out2[7],de_out1[3],de_out2[3],clk);
    PE pe13(de_out1[3],pe_out2[8],pe_out3[7],pe_out1[12],pe_out2[12],pe_out3[12],clk);
    PE pe14(pe_out1[12],pe_out2[9],pe_out3[8],pe_out1[13],pe_out2[13],pe_out3[13],clk);
    PE pe15(pe_out1[13],pe_out2[10],pe_out3[9],pe_out1[14],pe_out2[14],pe_out3[14],clk);
    PE pe16(pe_out1[14],pe_out2[11],pe_out3[10],pe_out1[15],pe_out2[15],pe_out3[15],clk);
    
    //fifth row
    De d5(ai[4],de_out2[3],de_out1[4],de_out2[4],clk);
    De d6(de_out1[4],pe_out2[12],de_out1[5],de_out2[5],clk);
    PE pe17(de_out1[5],pe_out2[13],pe_out3[12],pe_out1[16],pe_out2[16],pe_out3[16],clk);
    PE pe18(pe_out1[16],pe_out2[14],pe_out3[13],pe_out1[17],pe_out2[17],pe_out3[17],clk);
    PE pe19(pe_out1[17],pe_out2[15],pe_out3[14],pe_out1[18],pe_out2[18],pe_out3[18],clk);

    always@(posedge clk)
    begin
        i=i+1;
        case(i)
            1:
                begin
                    ai[0]=a[0]; ai[1]=a[1]; ai[2]=a[2]; ai[3]=0; ai[4]=0;
                    bi[0]=b[0]; bi[1]=b[3]; bi[2]=b[6]; bi[3]=0; bi[4]=0;
                end
            2:
                begin
                    ai[0]=0; ai[1]=a[3]; ai[2]=a[4]; ai[3]=a[5]; ai[4]=0;
                    bi[0]=0; bi[1]=b[1]; bi[2]=b[4]; bi[3]=b[7]; bi[4]=0;
                end
            3:
                begin
                    ai[0]=0; ai[1]=0; ai[2]=a[6]; ai[3]=a[7]; ai[4]=a[8];
                    bi[0]=0; bi[1]=0; bi[2]=b[2]; bi[3]=b[5]; bi[4]=b[8];
                end
            7:
                begin
                    ai[0]=0; ai[1]=0; ai[2]=0; ai[3]=0; ai[4]=0;
                    bi[0]=0; bi[1]=0; bi[2]=0; bi[3]=0; bi[4]=0;
                    out[0]=pe_out3[18];
                    out[1]=pe_out3[15]; 
                    out[2]=pe_out3[11]; 
                    out[3]=pe_out3[17]; 
                    out[6]=pe_out3[16]; 
                end
            8:
                begin
                    ai[0]=0; ai[1]=0; ai[2]=0; ai[3]=0; ai[4]=0;
                    bi[0]=0; bi[1]=0; bi[2]=0; bi[3]=0; bi[4]=0;
                    out[4]=pe_out3[18];
                    out[5]=pe_out3[15]; 
                    out[7]=pe_out3[17];
                end
            9:
                begin
                    ai[0]=0; ai[1]=0; ai[2]=0; ai[3]=0; ai[4]=0;
                    bi[0]=0; bi[1]=0; bi[2]=0; bi[3]=0; bi[4]=0;
                    out[8]=pe_out3[18];
                end
            default:
                begin
                    ai[0]=0; ai[1]=0; ai[2]=0; ai[3]=0; ai[4]=0;
                    bi[0]=0; bi[1]=0; bi[2]=0; bi[3]=0; bi[4]=0;
                end
        endcase
    end
endmodule
