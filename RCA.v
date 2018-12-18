`timescale 1ns / 1ps
//floating point multiplier

module RCA(out,clk,an,seg);
    input clk;
	output [8:0]out;
	output [3:0]an;  //what about this??
	output [6:0] seg;   //this wont change
	wire dp;
	multip m1(clk,out[0],out[1],out[2],out[3],out[4],out[5],out[6],out[7],out[8]);
	seg7decimal s1(out,clk,0,seg,an,0);
endmodule