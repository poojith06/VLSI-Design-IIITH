`timescale 1ns / 1ps

module cla_adder_tb;

    reg [3:0] a;
    reg [3:0] b;
    reg c0;
    reg clk;

    wire [3:0] s;
    wire c4;

    cla_adder uut (
        .a(a),
        .b(b),
        .c0(c0),
        .clk(clk),
        .s(s),
        .c4(c4)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("output.vcd");
        $dumpvars(0, cla_adder_tb);
        a = 4'b0000; b = 4'b0000; c0 = 1'b1;
        #8 a = 4'b0001; b = 4'b1000; c0 = 1'b0;   
        #10 a = 4'b0110; b = 4'b0101; c0 = 1'b1;   
        #10 a = 4'b1111; b = 4'b1111; c0 = 1'b0;    
        #10 a = 4'b1010; b = 4'b0101; c0 = 1'b1;   
        #10 a = 4'b0011; b = 4'b1111; c0 = 1'b1;   
        #20 $finish;
    end

    always @(posedge clk) begin
        $display("Time: %0t | a: %b | b: %b | c0: %b | s: %b | c4: %b", 
                  $time, a, b, c0, s, c4);
    end

endmodule