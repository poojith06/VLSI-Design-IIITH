`timescale 1ns / 1ps
module compound_circuits_tb;
    reg a,b,c,d,e,f;
    wire y1,y2,y3,y4,y5;
    compound_circuits uut(a,b,c,d,e,f,y1,y2,y3,y4,y5);
    initial begin
        $dumpfile("compound_circuits.vcd");
        $dumpvars(0, compound_circuits_tb);
        for (integer i=0; i<64; i=i+1) begin
            {a,b,c,d,e,f} = i;
            #5;
        end
        $finish;
    end
endmodule
