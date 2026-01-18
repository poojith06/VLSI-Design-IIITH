`timescale 1ns / 1ps

module two_demux(y,S,a,b);
input y,S;
output a,b;
and A1(a,~S,y);
and A2(b,S,y);
endmodule

module demux_four(y,S_0,S_1,a,b,c,d);
input y,S_0,S_1;
output a,b,c,d;
wire p,q;
two_demux B1(y,S_1,p,q);
two_demux B2(p,S_0,a,b);
two_demux B3(q,S_0,c,d);
endmodule
