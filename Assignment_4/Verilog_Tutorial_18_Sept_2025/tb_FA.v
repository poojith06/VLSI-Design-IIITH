// `include "FA_truthtable.v"
// `include "FA_expression.v"
// `include "FA_structral.v"

module tb_FA;
    reg A, B, Cin;
    wire Cout, Sum;
    // FA_truthtable dut(A, B, Cin, Cout, Sum);
    // FA_expression dut(A, B, Cin, Cout, Sum);
    // FA_structral dut(A, B, Cin, Cout, Sum);

    initial begin
        $dumpfile("tb_FA.vcd");
        $dumpvars(0);
        $monitor("at time %3t: A = %0b, B = %0b, Cin = %0b, Cout = %0b, Sum = %0b", $time, A, B, Cin, Cout, Sum);
        
        #0 A = 0; B = 0; Cin = 0;
        #10 A = 0; B = 0; Cin = 1;
        #10 A = 0; B = 1; Cin = 0;
        #10 A = 0; B = 1; Cin = 1;
        #10 A = 1; B = 0; Cin = 0;
        #10 A = 1; B = 0; Cin = 1;
        #10 A = 1; B = 1; Cin = 0;
        #10 A = 1; B = 1; Cin = 1;
        #10 $finish;
    end
endmodule