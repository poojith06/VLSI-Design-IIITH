`timescale 1ns/1ps
module mealy_fsm (
    input  wire clk,
    input  wire x,
    output reg  z,
    output reg [1:0] state);
    localparam [1:0] A = 2'b00,
                     B = 2'b01,
                     C = 2'b10,
                     D = 2'b11;
    reg [1:0] next_state;
    always @(*) begin
        next_state = A;
        z = 1'b0;
        case (state)
            A: begin
                if (x == 1'b0) begin
                    next_state = B;
                    z = 1'b1;
                end else begin
                    next_state = C;
                    z = 1'b0;
                end
            end
            B: begin
                if (x == 1'b0) begin
                    next_state = C;
                    z = 1'b0;
                end else begin
                    next_state = D;
                    z = 1'b1;
                end
            end
            C: begin
                if (x == 1'b0) begin
                    next_state = B;
                    z = 1'b0;
                end else begin
                    next_state = D;
                    z = 1'b1;
                end
            end
            D: begin
                if (x == 1'b0) begin
                    next_state = C;
                    z = 1'b1;
                end else begin
                    next_state = A;
                    z = 1'b0;
                end
            end
            default: begin
                next_state = A;
                z = 1'b0;
            end
        endcase
    end
    always @(posedge clk) begin
        state <= next_state;
    end
endmodule