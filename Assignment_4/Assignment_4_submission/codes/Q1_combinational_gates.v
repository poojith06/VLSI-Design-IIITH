`timescale 1ns / 1ps

module combinational_gates(a, b, and_out, or_out, nand_out, nor_out, xor_out, xnor_out, not_a, not_b);
    input a, b;
    output and_out, or_out, nand_out, nor_out, xor_out, xnor_out, not_a, not_b;

    assign and_out  = a & b;
    assign or_out   = a | b;
    assign nand_out = ~(a & b);
    assign nor_out  = ~(a | b);
    assign xor_out  = a ^ b;
    assign xnor_out = ~(a ^ b);
    assign not_a    = ~a;
    assign not_b    = ~b;

endmodule
