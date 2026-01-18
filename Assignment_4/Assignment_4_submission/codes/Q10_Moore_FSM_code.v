`timescale 1ns / 1ps
module moore_fsm(
    input  wire clk,
    input  wire x,
    output reg  y,
    output reg [1:0] state);
    localparam [1:0] A = 2'b00,
                     B = 2'b01,
                     C = 2'b10,
                     D = 2'b11;
    reg [1:0] next_state;
    always @(*) begin
        case (state)
            A: begin
                if (x == 1'b0) next_state = B;
                else           next_state = C;
            end
            B: begin
                if (x == 1'b0) next_state = C;
                else           next_state = D;
            end
            C: begin
                if (x == 1'b0) next_state = B;
                else           next_state = D;
            end
            D: begin
                if (x == 1'b0) next_state = C;
                else           next_state = A;
            end
            default: next_state = A;
        endcase
    end
    always @(posedge clk) begin
        if ($time < 1)
            state <= A;
        else
            state <= next_state;
    end
    always @(*) begin
        case (state)
            A: y = 1'b0;
            B: y = 1'b1;
            C: y = 1'b1;
            D: y = 1'b0;
            default: y = 1'b0;
        endcase
    end
endmodule
