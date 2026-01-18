`timescale 1ns / 1ps
module carry_lookahead_adder_4bit_tb;
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;
    carry_lookahead_adder_4bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout));
    initial begin
        $dumpfile("carry_lookahead_adder_4bit.vcd");
        $dumpvars(0, carry_lookahead_adder_4bit_tb);
        A=4'b0000; B=4'b0000; Cin=0; #10
        A=4'b0011; B=4'b0101; Cin=0; #10
        A=4'b0110; B=4'b1001; Cin=0; #10
        A=4'b0111; B=4'b1001; Cin=1; #10
        A=4'b1111; B=4'b0001; Cin=0; #10
        A=4'b1111; B=4'b1111; Cin=1; #10
        $finish;
    end
endmodule
