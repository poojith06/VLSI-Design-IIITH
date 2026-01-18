module flipflops_all_tb;
    reg D, J, K, R, S, T, clk;
    wire Qd, Qjk, Qrs, Qt;
    d_flipflop  DFF (.D(D), .clk(clk), .Q(Qd));
    jk_flipflop JKFF (.J(J), .K(K), .clk(clk), .Q(Qjk));
    rs_flipflop RSFF (.R(R), .S(S), .clk(clk), .Q(Qrs));
    t_flipflop  TFF (.T(T), .clk(clk), .Q(Qt));
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        $dumpfile("flipflops_all.vcd");
        $dumpvars(0, flipflops_all_tb);
        D=0; J=0; K=0; R=0; S=0; T=0;
        #10;
        D=1; #10;
        D=0; #10;
        D=1; #10;
        J=1; K=0; #10;
        J=0; K=1; #10;
        J=1; K=1; #20;
        R=0; S=1; #10;
        R=1; S=0; #10;
        R=0; S=0; #10;
        R=1; S=1; #10;
        T=1; #40;
        T=0; #10;
        $finish;
    end
    initial begin
        $monitor("%4t | %b  %b | %b %b  %b | %b %b  %b | %b  %b",
                 $time, D, Qd, J, K, Qjk, R, S, Qrs, T, Qt);
    end
endmodule
