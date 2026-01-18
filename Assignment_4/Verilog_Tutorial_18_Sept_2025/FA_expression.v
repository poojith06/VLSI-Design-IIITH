module FA_expression(input A, input B, input Cin, output Cout, output Sum);
  assign Cout = ((A ^ B)&Cin) | (A & B);
  assign Sum = A ^ B ^ Cin;
endmodule