`timescale 1ns / 1ps

module convolution(clk);
    input clk;
    //kernel
    reg [4:0]a1=-1,a2=-1,a3=-1,a4=-1,a5=8,a6=-1,a7=-1,a8=-1,a9=-1;
    //image
    reg [4:0]b1,b2,b3,b4,b5,b6,b7,b8,b9; 
    reg flag = 0;
    wire [11:0]re;//12bit pixel out
    reg [3:0]I[0:24][0:31];//image
    wire [3:0]C[0:22][0:29];//convoluted image
    reg [5:0]ro;
    reg [8:0]co;
    integer r=0,c=0,i=0,j=0;  //r,c for image; i,j for conv
    game_logo_rom g(clk,ro,co,re); //returns 12 bit pixel out
    multip m(a1,a2,a3,a4,a5,a6,a7,a8,a9,b1,b2,b3,b4,b5,b6,b7,b8,b9,clk,C[i][j]); 
    always@(posedge clk)
        begin
            if(~flag)  //if flag is zero then read image
                begin
                    I [r][c] = re[11:8]; //first four
                    c=c+1;
                    if(c==32)
                        begin
                           r=r+1;
                           c=0; 
                        end
                    ro = r[5:0];
                    co=c[8:0];
                    if(r==25)
                        begin
                            flag=1'b1;
                        end
                end
            if(flag==1 && i<23) //conv here
                begin
                    b1=I[i][j];
                    b2=I[i][j+1];
                    b3=I[i][j+2];
                    b4=I[i+1][j];
                    b5=I[i+1][j+1];
                    b6=I[i+1][j+2]; 
                    b7=I[i+2][j];
                    b8=I[i+2][j+1];
                    b9=I[i+2][j+2];
                    j=j+1;
                    if(j==30)
                        begin
                            j=0;
                            i=i+1;
                        end
                end
        end
   
endmodule
