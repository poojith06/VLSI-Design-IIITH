`timescale 1ns / 1ps
module full_adder(
    input A, B, Cin,
    output Sum, Cout);
    assign Sum  = A ^ B ^ Cin;
    assign Cout = (A & B) | ((A ^ B) & Cin);
endmodule

module ripple_carry_adder_4bit(
    input [3:0] A, B,
    input Cin,
    output [3:0] Sum,
    output Cout);
    wire C1, C2, C3;
    full_adder FA0 (.A(A[0]), .B(B[0]), .Cin(Cin), .Sum(Sum[0]), .Cout(C1));
    full_adder FA1 (.A(A[1]), .B(B[1]), .Cin(C1),  .Sum(Sum[1]), .Cout(C2));
    full_adder FA2 (.A(A[2]), .B(B[2]), .Cin(C2),  .Sum(Sum[2]), .Cout(C3));
    full_adder FA3 (.A(A[3]), .B(B[3]), .Cin(C3),  .Sum(Sum[3]), .Cout(Cout));
endmodule

module ripple_carry_adder_16bit(
    input  [15:0] A, B,
    input  Cin,
    output [15:0] Sum,
    output Cout);
    wire C1, C2, C3;
    ripple_carry_adder_4bit RCA0 (.A(A[3:0]),   .B(B[3:0]),   .Cin(Cin), .Sum(Sum[3:0]),   .Cout(C1));
    ripple_carry_adder_4bit RCA1 (.A(A[7:4]),   .B(B[7:4]),   .Cin(C1),  .Sum(Sum[7:4]),   .Cout(C2));
    ripple_carry_adder_4bit RCA2 (.A(A[11:8]),  .B(B[11:8]),  .Cin(C2),  .Sum(Sum[11:8]),  .Cout(C3));
    ripple_carry_adder_4bit RCA3 (.A(A[15:12]), .B(B[15:12]), .Cin(C3),  .Sum(Sum[15:12]), .Cout(Cout));
endmodule

