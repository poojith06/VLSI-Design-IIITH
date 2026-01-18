`timescale 1ns / 1ps
module updown_counter_4bit_tb;
    reg clk, up_down;
    wire [3:0] Q;
    updown_counter_4bit uut (.clk(clk), .up_down(up_down), .Q(Q));
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        $dumpfile("updown_counter_4bit.vcd");
        $dumpvars(0, updown_counter_4bit_tb);
        up_down = 1; #80;
        up_down = 0; #80;
        $finish;
    end
endmodule
