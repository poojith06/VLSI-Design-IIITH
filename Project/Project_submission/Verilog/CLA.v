`timescale 1ns / 1ps

module cla_adder(
    input wire [3:0] a,
    input wire [3:0] b,
    input wire c0,
    input wire clk,
    output wire [3:0] s,
    output wire c4
);
    wire [3:0] p, g, c,s_wire;
    wire c4_wire;
    reg [3:0] a_reg, b_reg; 
    reg c0_reg;
    reg [3:0] s_reg;       
    reg c4_reg;

    always @(posedge clk) begin
        a_reg <= a;
        b_reg <= b;
        c0_reg <= c0;
    end

    assign p = a_reg ^ b_reg;
    assign g = a_reg & b_reg;

    assign c[0] = c0_reg;
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);
    assign c4_wire = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c[0]);

    assign s_wire = p ^ c;

    always @(posedge clk) begin
        s_reg <= s_wire;
        c4_reg <= c4_wire;
    end

    assign s = s_reg;
    assign c4 = c4_reg;

endmodule