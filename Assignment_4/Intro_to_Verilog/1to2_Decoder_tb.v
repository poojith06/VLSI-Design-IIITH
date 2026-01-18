`timescale 1ns / 1ps
module two_decoder_test;

// Inputs
reg a;
reg en;

// Outputs
wire y1;
wire y2;

// Instantiate the Unit Under Test (UUT)
two_decoder uut (
    .a(a),
    .en(en),
    .y1(y1),
    .y2(y2)
);

initial begin
    $dumpfile("two_decoder_test.vcd");
    $dumpvars(0,two_decoder_test);
    // Initialize Inputs
    a = 1'b0;
    en = 1'b0;
    #100 $finish;
end

always #5 a = ~a;
always #10 en = ~en;
always@(a)
$monitor("time = %t \t a = %b, en = %d, y1 = %d, y2 = %d",$time,a,en,y1,y2);

endmodule

