`timescale 1ns / 1ps
module demux_four_test;

// Inputs
reg y;
reg S_0;
reg S_1;

// Outputs
wire a;
wire b;
wire c;
wire d;

// Instantiate the Unit Under Test (UUT)
demux_four uut (
    .y(y),
    .S_0(S_0),
    .S_1(S_1),
    .a(a),
    .b(b),
    .c(c),
    .d(d)
);

initial begin
    // Initialize Inputs
    $dumpfile("demux_four_test.vcd");
    $dumpvars(0,demux_four_test);
    y = 0;
    S_0 = 0;
    S_1 = 0;
    #100 $finish;
end

// Add stimulus here
always #20 y = ~y;
always #5 S_0 = ~S_0;
always #10 S_1 = ~S_1;
always@(y or S_0 or S_1)
    $monitor("time = %t \t y = %d, S1 = %d, S2 = %d, a = %d, b = %d, c = %d, d = %d",$time,y,S_1,S_0,a,b,c,d);

endmodule

