`timescale 1ns / 1ps
module ripple_counter_4bit_tb;
    reg clk;
    wire [3:0] Q;
    ripple_counter_4bit uut (.clk(clk), .Q(Q));
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        $dumpfile("ripple_counter_4bit.vcd");
        $dumpvars(0, ripple_counter_4bit_tb);
        #160;
        $finish;
    end
endmodule
