`timescale 1ns/1ps
module mux2_1 (
    input a,
    input b,
    input sel,
    output y
);
    wire nsel, and0, and1;

    not(nsel,sel);
    and(and0,a,nsel);
    and(and1,b,sel);
    or(y, and0, and1);
endmodule

module mux4_1 (
    input [3:0] d,
    input [1:0] sel,
    output y
);
    wire low, high;
    mux2_1 m0 (.a(d[0]), .b(d[1]), .sel(sel[0]), .y(low));
    mux2_1 m1 (.a(d[2]), .b(d[3]), .sel(sel[0]), .y(high));
    mux2_1 m2 (.a(low), .b(high), .sel(sel[1]), .y(y));
endmodule

module mux8_1 (
    input [7:0] d,
    input [2:0] sel,
    output y
);
    wire low4, high4;
    mux4_1 mlow (.d(d[3:0]), .sel(sel[1:0]), .y(low4));
    mux4_1 mhigh(.d(d[7:4]), .sel(sel[1:0]), .y(high4));
    mux2_1 mtop (.a(low4), .b(high4), .sel(sel[2]), .y(y));
endmodule