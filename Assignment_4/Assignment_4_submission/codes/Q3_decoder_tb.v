`timescale 1ns/1ps
module dec_tb;
    reg a;
    reg en;
    wire [1:0] y2;
    reg [1:0] a2;
    wire [3:0] y4;
    reg [2:0] a3;
    wire [7:0] y8;
    dec2_1 D2 (.a(a), .en(en), .y(y2));
    dec2_4 D4 (.a(a2), .en(en), .y(y4));
    dec3_8 D8 (.a(a3), .en(en), .y(y8));
    initial begin
        $dumpfile("decoder_wave.vcd");
        $dumpvars(0, dec_tb);
    end

    initial begin
        en = 1; a = 0; #10;
        a = 1; #10;
        en = 0; a = 1; #10;

        en = 1;
        a2 = 2'b00; #10;
        a2 = 2'b01; #10;
        a2 = 2'b10; #10;
        a2 = 2'b11; #10;
        en = 0; #10;

        en = 1;
        a3 = 3'b000; #10;
        a3 = 3'b001; #10;
        a3 = 3'b010; #10;
        a3 = 3'b011; #10;
        a3 = 3'b100; #10;
        a3 = 3'b101; #10;
        a3 = 3'b110; #10;
        a3 = 3'b111; #10;
        en = 0; #10;
        $finish;
    end
endmodule
