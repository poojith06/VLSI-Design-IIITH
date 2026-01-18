`timescale 1ns / 1ps
module ripple_counter_4bit(
    input clk,
    output [3:0] Q);
    reg [3:0] count = 0;
    always @(posedge clk)
        count[0] <= ~count[0];
    always @(negedge count[0])
        count[1] <= ~count[1];
    always @(negedge count[1])
        count[2] <= ~count[2];
    always @(negedge count[2])
        count[3] <= ~count[3];
    assign Q = count;
endmodule
