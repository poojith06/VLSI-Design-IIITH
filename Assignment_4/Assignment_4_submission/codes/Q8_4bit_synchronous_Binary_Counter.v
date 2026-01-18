`timescale 1ns / 1ps
module sync_counter_4bit(
    input clk,
    input enable,
    output reg [3:0] Q);
    initial Q = 4'b0000;
    always @(posedge clk) begin
        if (enable)
            Q <= Q + 1;
    end
endmodule
