`timescale 1ns / 1ps
module dff(clk,rst,D,Q);
input clk,rst,D;
output reg Q;
always@(posedge clk or negedge rst)
begin
if(!rst)
Q <= 1'b0;
else
Q <= D;
end
endmodule

