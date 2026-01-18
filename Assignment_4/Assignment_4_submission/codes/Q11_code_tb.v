`timescale 1ns / 1ps
module tb_fsm_11;
    reg CLK;
    reg RESET;
    reg IN;
    wire OUT;
    fsm_11 dut (
        .CLK(CLK),
        .RESET(RESET),
        .IN(IN),
        .OUT(OUT));
    initial CLK = 0;
    always #5 CLK = ~CLK;
    initial begin
        $dumpfile("fsm_11.vcd");
        $dumpvars(0, tb_fsm_11);
        RESET = 1;
        IN = 0;
        #20 RESET = 0;
        #30 IN = 1;
        #30 IN = 0;
        #20 IN = 0;
        #20 IN = 1;
        #30 IN = 1;
        #30 IN = 0;
        #20 IN = 0;
        #20 IN = 1;
        #50 $finish;
    end
endmodule