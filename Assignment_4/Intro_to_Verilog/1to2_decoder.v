`timescale 1ns / 1ps
module two_decoder(a,en,y1,y2);
input a,en;
output y1,y2;
and A1(y1,~a,en);
and A2(y2,a,en);
endmodule
