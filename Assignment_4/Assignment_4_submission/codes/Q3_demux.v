`timescale 1ns/1ps

module demux1_2 (
    input y,
    input sel,
    output o0, o1
);
    wire nsel;
    not(nsel, sel);
    and(o0, y, nsel);
    and(o1, y, sel);
endmodule

module demux1_4 (
    input y,
    input [1:0] sel,
    output [3:0] o
);
    wire p0, p1;
    demux1_2 d0 (.y(y), .sel(sel[1]), .o0(p0), .o1(p1));
    demux1_2 d1 (.y(p0), .sel(sel[0]), .o0(o[0]), .o1(o[1]));
    demux1_2 d2 (.y(p1), .sel(sel[0]), .o0(o[2]), .o1(o[3]));
endmodule

module demux1_8 (
    input y,
    input [2:0] sel,
    output [7:0] o
);
    wire low_en, high_en;
    demux1_2 top (.y(y), .sel(sel[2]), .o0(low_en), .o1(high_en));
    demux1_4 low  (.y(low_en),  .sel(sel[1:0]), .o(o[3:0]));
    demux1_4 high (.y(high_en), .sel(sel[1:0]), .o(o[7:4]));
endmodule

