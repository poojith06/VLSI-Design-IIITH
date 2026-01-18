`timescale 1ns / 1ps
module d_flipflop(
    input D,
    input clk,
    output reg Q);
    always @(posedge clk)
        Q <= D;
endmodule

module jk_flipflop(
    input J, K, clk,
    output reg Q);
    always @(posedge clk) begin
        case ({J, K})
            2'b00: Q <= Q;
            2'b01: Q <= 0;
            2'b10: Q <= 1;
            2'b11: Q <= ~Q;
        endcase
    end
endmodule

module rs_flipflop(
    input R, S, clk,
    output reg Q);
    always @(posedge clk) begin
        case ({R, S})
            2'b00: Q <= Q;
            2'b01: Q <= 1;
            2'b10: Q <= 0;
            2'b11: Q <= 1'bx;
        endcase
    end
endmodule

module t_flipflop(
    input T, clk,
    output reg Q);
    always @(posedge clk) begin
        if (T)
            Q <= ~Q;
        else
            Q <= Q;
    end
endmodule