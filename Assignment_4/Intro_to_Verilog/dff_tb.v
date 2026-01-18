`timescale 1ns / 1ps
module dff_test;

// Inputs
reg clk;
reg rst;
reg D;

// Outputs
wire Q;

// Instantiate the Unit Under Test (UUT)
dff uut (
    .clk(clk),
    .rst(rst),
    .D(D),
    .Q(Q)
);

initial begin
    // Initialize Inputs
    $dumpfile("dff_test.vcd");
    $dumpvars(0,dff_test);
    clk = 1;
    rst = 0;
    D = 0;
    #100 $finish;
end

always #5 clk = ~clk;
always #20 rst = ~rst;
always #10 D = ~D;
always@(D or rst)
$monitor("time = %t \t rst = %b, clk = %d, D = %b, Q = %b",$time,rst,clk,D,Q);

endmodule

