`timescale 1ns / 1ps
module serial_adder_tb;
    reg [2:0] A, B;
    wire [2:0] Sum;
    wire Cout;
    serial_adder uut (.A(A), .B(B), .Sum(Sum), .Cout(Cout));
    initial begin
        $dumpfile("serial_adder.vcd");
        $dumpvars(0, serial_adder_tb);
        A = 3'b011; B = 3'b101; #10;
        A = 3'b111; B = 3'b111; #10;
        A = 3'b010; B = 3'b100; #10;
        A = 3'b001; B = 3'b001; #10;
        $finish;
    end
endmodule
