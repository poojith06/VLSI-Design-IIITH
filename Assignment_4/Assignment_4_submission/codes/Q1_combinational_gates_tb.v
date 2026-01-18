`timescale 1ns / 1ps

module combinational_gates_tb;
    reg a;
    reg b;
    wire and_out, or_out, nand_out, nor_out, xor_out, xnor_out, not_a, not_b;
    combinational_gates uut (
        .a(a),
        .b(b),
        .and_out(and_out),
        .or_out(or_out),
        .nand_out(nand_out),
        .nor_out(nor_out),
        .xor_out(xor_out),
        .xnor_out(xnor_out),
        .not_a(not_a),
        .not_b(not_b)
    );

    initial begin
        $dumpfile("combinational_gates.vcd");
        $dumpvars(0, combinational_gates_tb);

        $display("A B | AND OR NAND NOR XOR XNOR NOT_A NOT_B");
        $display("-------------------------------------------");

        a = 0; b = 0; #10;
        $display("%b %b |  %b   %b    %b    %b    %b    %b     %b     %b", a,b,and_out,or_out,nand_out,nor_out,xor_out,xnor_out,not_a,not_b);

        a = 0; b = 1; #10;
        $display("%b %b |  %b   %b    %b    %b    %b    %b     %b     %b", a,b,and_out,or_out,nand_out,nor_out,xor_out,xnor_out,not_a,not_b);

        a = 1; b = 0; #10;
        $display("%b %b |  %b   %b    %b    %b    %b    %b     %b     %b", a,b,and_out,or_out,nand_out,nor_out,xor_out,xnor_out,not_a,not_b);

        a = 1; b = 1; #10;
        $display("%b %b |  %b   %b    %b    %b    %b    %b     %b     %b", a,b,and_out,or_out,nand_out,nor_out,xor_out,xnor_out,not_a,not_b);
        $finish;
    end
endmodule
