module exercise9_tb;
    reg clk, x, y;
    wire z;
    sequential_circuit_DFF seq_dff (.clk(clk), .x(x), .y(y), .z(z));
    sequential_circuit_TFF seq_tff (.clk(clk));
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        $dumpfile("exercise9_final.vcd");
        $dumpvars(0, exercise9_tb);
        x = 0; y = 0; #10;
        x = 1; y = 0; #10;
        x = 1; y = 1; #10;
        x = 0; y = 1; #10;
        x = 1; y = 0; #10;
        x = 0; y = 0; #10;
        #50;
        $finish;
    end
endmodule
