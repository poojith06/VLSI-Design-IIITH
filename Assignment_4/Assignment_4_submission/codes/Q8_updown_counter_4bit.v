`timescale 1ns / 1ps
module updown_counter_4bit(
    input clk,
    input up_down,
    output reg [3:0] Q);
    initial Q = 4'b0000;
    always @(posedge clk) begin
        if (up_down)
            Q <= Q + 1;
        else
            Q <= Q - 1;
    end
endmodule
