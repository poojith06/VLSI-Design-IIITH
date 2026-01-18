module FA_truthtable(input A, input B, input Cin, output reg Cout, output reg Sum);
    always @(A,B,Cin) begin
        if (A == 1'b0 && B == 1'b0 && Cin == 1'b0) begin
            Cout = 1'b0;
            Sum = 1'b0;
        end
        if (A == 1'b0 && B == 1'b0 && Cin == 1'b1) begin
            Cout = 1'b0;
            Sum = 1'b1;
        end
        if (A == 1'b0 && B == 1'b1 && Cin == 1'b0) begin
            Cout = 1'b0;
            Sum = 1'b1;
        end
        if (A == 1'b0 && B == 1'b1 && Cin == 1'b1) begin
            Cout = 1'b1;
            Sum = 1'b0;
        end
        if (A == 1'b1 && B == 1'b0 && Cin == 1'b0) begin
            Cout = 1'b0;
            Sum = 1'b1;
        end
        if (A == 1'b1 && B == 1'b0 && Cin == 1'b1) begin
            Cout = 1'b1;
            Sum = 1'b0;
        end
        if (A == 1'b1 && B == 1'b1 && Cin == 1'b0) begin
            Cout = 1'b1;
            Sum = 1'b0;
        end
        if (A == 1'b1 && B == 1'b1 && Cin == 1'b1) begin
            Cout = 1'b1;
            Sum = 1'b1;
        end
    end
endmodule