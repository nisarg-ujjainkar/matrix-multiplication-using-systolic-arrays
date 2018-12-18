`timescale 1ns / 1ps

module convo(clk,a,b,o);
    input clk,a,b;
    output [3:0]o;
    wire [11:0]re;
    wire [3:0]I[0:34][0:367];
    genvar i,j;
    for (i=0;i<35;i=i+1)
        begin
            for (j=0;j<368;j=j+1)
                begin
                    game_logo_rom r(clk,i[5:0],j[8:0],re);
                    assign I[i][j]=re[3:0];  
                end
        end
    assign o=I[1][1];
endmodule
