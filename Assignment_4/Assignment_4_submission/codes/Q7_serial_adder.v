`timescale 1ns / 1ps
module serial_adder(
    input [2:0] A, B,
    output reg [2:0] Sum,
    output reg Cout);
    integer i;
    reg carry;
    always @(*) begin
        carry = 0;
        for (i = 0; i < 3; i = i + 1) begin
            {carry, Sum[i]} = A[i] + B[i] + carry;
        end
        Cout = carry;
    end
endmodule
