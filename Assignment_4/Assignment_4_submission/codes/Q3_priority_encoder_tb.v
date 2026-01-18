`timescale 1ns/1ps
module priority_encoder_tb;
    reg [7:0] I;
    reg en;
    wire [2:0] Y;
    wire valid;
    priority_encoder_8x3 dut (.I(I), .en(en), .Y(Y), .valid(valid));
    initial begin
        $dumpfile("priority_encoder_wave.vcd");
        $dumpvars(0, priority_encoder_tb);
    end

    initial begin
        en = 1;
        I = 8'b00000000; #10;
        I = 8'b00000001; #10;
        I = 8'b00000100; #10;
        I = 8'b00010000; #10;
        I = 8'b10000000; #10;
        I = 8'b00100100; #10;
        I = 8'b01110111; #10;
        I = 8'b00000010; #10;
        en = 0;
        I = 8'b11111111; #10;
        $finish;
    end
endmodule
