`timescale 1ns / 1ps
module sync_counter_4bit_tb;
    reg clk, enable;
    wire [3:0] Q;
    sync_counter_4bit uut (.clk(clk), .enable(enable), .Q(Q));
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        $dumpfile("sync_counter_4bit.vcd");
        $dumpvars(0, sync_counter_4bit_tb);
        enable = 1; #160;
        $finish;
    end
    initial $monitor("Time=%0t  Count=%b", $time, Q);
endmodule
