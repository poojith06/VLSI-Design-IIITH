`timescale 1ns / 1ps
module universal_shift_register_tb;
    reg clk;
    reg [1:0] S;
    reg [3:0] P;
    reg SL_in, SR_in;
    wire [3:0] Q;
    universal_shift_register uut (
        .clk(clk),
        .S(S),
        .P(P),
        .SL_in(SL_in),
        .SR_in(SR_in),
        .Q(Q));
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        $dumpfile("universal_shift_register.vcd");
        $dumpvars(0, universal_shift_register_tb);
        S = 2'b00; P = 4'b0000; SL_in = 0; SR_in = 0;
        #10 S = 2'b11; P = 4'b1010;
        #10;
        #10 S = 2'b00;
        SR_in = 1; S = 2'b01; #10;
        SR_in = 0; #10;
        SL_in = 1; S = 2'b10; #10;
        SL_in = 0; #10;
        S = 2'b11; P = 4'b1100; #10;
        S = 2'b00; #10;
        $finish;
    end
    initial begin
        $monitor("%4t |  %b  | %b |  %b  %b | %b",
                 $time, S, P, SL_in, SR_in, Q);
    end
endmodule
