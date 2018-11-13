`timescale 1ns / 1ps
module try(o1,o2,a1,a2,a3);
    input a1,a2,a3;
    output o1,o2;
    and a(o1,a1,a2);
    or d(o2,o1,a3);
endmodule
