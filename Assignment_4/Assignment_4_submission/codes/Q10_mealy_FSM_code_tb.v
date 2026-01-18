`timescale 1ns/1ps
module tb_mealy_fsm;
    reg clk;
    reg x;
    wire z;
    wire [1:0] state;
    mealy_fsm dut (
        .clk(clk),
        .x(x),
        .z(z),
        .state(state));
    initial clk = 0;
    always #5 clk = ~clk;
    function [8*4:1] state_name;
        input [1:0] s;
        begin
            case (s)
                2'b00: state_name = "A";
                2'b01: state_name = "B";
                2'b10: state_name = "C";
                2'b11: state_name = "D";
                default: state_name = "??";
            endcase
        end
    endfunction
    initial begin
        x = 0;
        #12;
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
        $dumpfile("mealy_fsm.vcd");
        $dumpvars(0, tb_mealy_fsm);
    end
endmodule
