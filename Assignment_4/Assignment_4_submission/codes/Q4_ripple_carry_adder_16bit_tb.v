module ripple_carry_adder_16bit_tb;
    reg  [15:0] A, B;
    reg  Cin;
    wire [15:0] Sum;
    wire Cout;
    ripple_carry_adder_16bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout));
    initial begin
        $dumpfile("ripple_carry_adder_16bit.vcd");
        $dumpvars(0, ripple_carry_adder_16bit_tb);
        A = 16'h0000; B = 16'h0000; Cin = 0; #10
        A = 16'h0001; B = 16'h0001; Cin = 0; #10
        A = 16'h00F0; B = 16'h000F; Cin = 0; #10
        A = 16'h0F0F; B = 16'h0101; Cin = 1; #10
        A = 16'hFFFF; B = 16'h0001; Cin = 0; #10
        A = 16'hAAAA; B = 16'h5555; Cin = 0; #10
        A = 16'hFFFF; B = 16'hFFFF; Cin = 1; #10
        $finish;
    end
endmodule
