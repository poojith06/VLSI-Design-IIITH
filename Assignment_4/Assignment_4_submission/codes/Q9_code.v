`timescale 1ns / 1ps
module sequential_circuit_DFF(
    input  clk,
    input  x, y,
    output reg z);
    reg A, B;
    wire A_next, B_next;
    initial begin
        A = 1'b0;
        B = 1'b0;
    end
    assign A_next = (x & ~y) | (x & B);
    assign B_next = (x & A) | (x & ~B);
    always @(posedge clk) begin
        A <= A_next;
        B <= B_next;
    end
    always @(*) z = A;
endmodule



//------------------------------------------------------
// Part 2 : T-Flip-Flop-Based Sequential Circuit
// from figure:  T_A = A + B ,  T_B = A' + B
//------------------------------------------------------
module sequential_circuit_TFF(
    input  clk);
    reg A, B;
    wire T_A, T_B;
    wire A_next, B_next;

    // initialise state
    initial begin
        A = 1'b0;
        B = 1'b0;
    end

    // T-inputs
    assign T_A = A | B;
    assign T_B = (~A) | B;

    // next state using T-FF relation : Q(next) = Q ⊕ T
    assign A_next = A ^ T_A;
    assign B_next = B ^ T_B;

    always @(posedge clk) begin
        A <= A_next;
        B <= B_next;
    end
endmodule


