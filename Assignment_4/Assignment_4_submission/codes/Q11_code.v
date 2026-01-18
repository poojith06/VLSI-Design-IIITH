`timescale 1ns / 1ps
module fsm_11(
    input  wire CLK,
    input  wire RESET,
    input  wire IN,
    output reg  OUT);
    wire ONE  = IN;
    wire ZERO = ~IN;
    reg prev_one;
    reg prev_zero;
    reg [1:0] count_one;
    reg [1:0] count_zero;
    always @(posedge CLK or posedge RESET) begin
        if (RESET) begin
            prev_one   <= 1'b0;
            prev_zero  <= 1'b0;
            count_one  <= 2'd0;
            count_zero <= 2'd0;
            OUT        <= 1'b0;
        end else begin
            if (prev_one && !ONE) begin
                count_one <= count_one + 1;
            end
            if (prev_zero && !ZERO) begin
                count_zero <= count_zero + 1;
            end
            prev_one  <= ONE;
            prev_zero <= ZERO;
            if ((count_one >= 2) && (count_zero >= 2))
                OUT <= 1'b1;
            else
                OUT <= 1'b0;
        end
    end
endmodule
