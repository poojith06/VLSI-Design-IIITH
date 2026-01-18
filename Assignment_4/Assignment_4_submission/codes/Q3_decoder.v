`timescale 1ns/1ps
module dec2_1 (
    input a,
    input en,
    output [1:0] y
);
    wire na;
    not(na, a);
    and(y[0], na, en);
    and(y[1], a, en);
endmodule

module dec2_4 (
    input [1:0] a,
    input en,
    output [3:0] y
);
    wire [1:0] e;
    dec2_1 d0 (.a(a[1]), .en(en), .y(e));
    dec2_1 low  (.a(a[0]), .en(e[0]), .y(y[1:0]));
    dec2_1 high (.a(a[0]), .en(e[1]), .y(y[3:2]));
endmodule

module dec3_8 (
    input [2:0] a,
    input en,
    output [7:0] y
);
    wire [1:0] e;
    dec2_1 top (.a(a[2]), .en(en), .y(e));
    dec2_4 low  (.a(a[1:0]), .en(e[0]), .y(y[3:0]));
    dec2_4 high (.a(a[1:0]), .en(e[1]), .y(y[7:4]));
endmodule

