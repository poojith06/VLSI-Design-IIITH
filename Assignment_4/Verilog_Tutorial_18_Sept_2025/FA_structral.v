module FA_structral(input A, input B, input Cin, output Cout, output Sum);
    wire S1C1,C2;
    xor(S1, A, B);
    xor(Sum, S1,Cin);
    and(C1, S1, Cin);
    and(C2, A, B);
    or(Cout, C1, C2);
endmodule