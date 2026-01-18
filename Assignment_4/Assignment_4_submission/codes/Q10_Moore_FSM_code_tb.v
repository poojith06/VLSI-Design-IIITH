`timescale 1ns/1ps
module tb_moore_fsm;
    reg clk;
    reg x;
    wire y;
    wire [1:0] state;
    moore_fsm dut (
        .clk(clk),
        .x(x),
        .y(y),
        .state(state));
    initial clk = 0;
    always #5 clk = ~clk;
    initial begin
        x = 0;
        @(posedge clk); x = 1'b0; #1;
        @(posedge clk); x = 1'b1; #1;
        @(posedge clk); x = 1'b0; #1;
        @(posedge clk); x = 1'b1; #1;
        @(posedge clk); x = 1'b1; #1;
        @(posedge clk); x = 1'b1; #1;
        @(posedge clk); x = 1'b0; #1;
        @(posedge clk); x = 1'b0; #1;
        @(posedge clk); x = 1'b1; #1;
        @(posedge clk); x = 1'b0; #1;
        repeat (6) begin
            @(posedge clk); x = $random; #1;
        end
        #20;
        $finish;
    end
    initial begin
        $dumpfile("moore_fsm.vcd");
        $dumpvars(0, tb_moore_fsm);
    end
endmodule
