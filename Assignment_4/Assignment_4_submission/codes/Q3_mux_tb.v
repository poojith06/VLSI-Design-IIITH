`timescale 1ns/1ps
module mux_tb;

    reg a, b, sel;
    wire y2;
    reg [3:0] d4;
    reg [1:0] sel4;
    wire y4;
    reg [7:0] d8;
    reg [2:0] sel8;
    wire y8;

    mux2_1 uut2 (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y2));
    mux4_1 uut4 (
        .d(d4),
        .sel(sel4),
        .y(y4));
    mux8_1 uut8 (
        .d(d8),
        .sel(sel8),
        .y(y8));

    initial begin
        $dumpfile("mux_wave.vcd");
        $dumpvars(0, mux_tb);
    end

    initial begin
        a = 0; b = 1;
        sel = 0; #10;
        sel = 1; #10;
        a = 1; b = 0;
        sel = 0; #10;
        sel = 1; #10;
        a = 0; b = 1;
        sel = 0; #10;
        sel = 1; #10;

        d4 = 4'b1010;
        sel4 = 2'b00; #20;
        sel4 = 2'b01; #20;
        sel4 = 2'b10; #20;
        sel4 = 2'b11; #20;
        d4 = 4'b0110;
        sel4 = 2'b00; #20;
        sel4 = 2'b01; #20;
        sel4 = 2'b10; #20;
        sel4 = 2'b11; #20;

        d8 = 8'b11010110;
        for (integer i = 0; i < 8; i = i + 1) begin
            sel8 = i;
            #10;
        end
        $finish;
    end
endmodule
