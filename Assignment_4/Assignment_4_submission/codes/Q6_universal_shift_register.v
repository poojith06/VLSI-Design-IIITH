`timescale 1ns / 1ps
module universal_shift_register (
    input clk,
    input [1:0] S,
    input [3:0] P,
    input SL_in, SR_in,
    output reg [3:0] Q);
    always @(posedge clk) begin
        case (S)
            2'b00: Q <= Q;
            2'b01: Q <= {SR_in, Q[3:1]};
            2'b10: Q <= {Q[2:0], SL_in};
            2'b11: Q <= P;
            default: Q <= Q;
        endcase
    end
endmodule
