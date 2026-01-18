`timescale 1ns/1ps
module priority_encoder_8x3 (
    input [7:0] I,
    input en,
    output [2:0] Y,
    output valid);
    wire any;
    wire b2, b1, b0;
    or(any, I[0], I[1], I[2], I[3], I[4], I[5], I[6], I[7]);
    or(b2, I[7], I[6], I[5], I[4]);
    or(b1, I[7], I[6], I[3], I[2]);
    or(b0, I[7], I[5], I[3], I[1]);
    and(Y[2], b2, en);
    and(Y[1], b1, en);
    and(Y[0], b0, en);
    and(valid, any, en);
endmodule