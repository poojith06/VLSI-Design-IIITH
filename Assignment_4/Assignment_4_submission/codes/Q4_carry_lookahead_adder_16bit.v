`timescale 1ns / 1ps
module carry_lookahead_adder_4bit(
    input [3:0] A, B,
    input Cin,
    output [3:0] Sum,
    output Cout,
    output G_group, P_group );
    wire [3:0] G, P;
    wire [4:0] C;
    assign C[0] = Cin;
    assign G = A & B;
    assign P = A ^ B;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
    assign C[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) |
                  (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C[0]);
    assign Sum = P ^ C[3:0];
    assign Cout = C[4];
    assign G_group = G[3] | (P[3] & G[2]) |
                     (P[3] & P[2] & G[1]) |
                     (P[3] & P[2] & P[1] & G[0]);
    assign P_group = P[3] & P[2] & P[1] & P[0];
endmodule

module carry_lookahead_adder_16bit(
    input  [15:0] A, B,
    input  Cin,
    output [15:0] Sum,
    output Cout);
    wire [3:0] C;
    wire [3:0] G, P;
    assign C[0] = Cin;
    carry_lookahead_adder_4bit CLA0 (.A(A[3:0]),   .B(B[3:0]),   .Cin(C[0]), .Sum(Sum[3:0]),   .Cout(), .G_group(G[0]), .P_group(P[0]));
    carry_lookahead_adder_4bit CLA1 (.A(A[7:4]),   .B(B[7:4]),   .Cin(C[1]), .Sum(Sum[7:4]),   .Cout(), .G_group(G[1]), .P_group(P[1]));
    carry_lookahead_adder_4bit CLA2 (.A(A[11:8]),  .B(B[11:8]),  .Cin(C[2]), .Sum(Sum[11:8]),  .Cout(), .G_group(G[2]), .P_group(P[2]));
    carry_lookahead_adder_4bit CLA3 (.A(A[15:12]), .B(B[15:12]), .Cin(C[3]), .Sum(Sum[15:12]), .Cout(Cout), .G_group(G[3]), .P_group(P[3]));
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
endmodule

