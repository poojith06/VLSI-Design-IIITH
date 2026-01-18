`timescale 1ns / 1ps
module compound_circuits(
    input  a, b, c, d, e, f,
    output y1, y2, y3, y4, y5);

    wire na, nb, nc, nd, ne;
    nand(na, a, a);
    nand(nb, b, b);
    nand(nc, c, c);
    nand(nd, d, d);
    nand(ne, e, e);

    wire w1_ab_n, w1_cd_n;
    nand(w1_ab_n, a, b);
    nand(w1_cd_n, c, d);
    nand(y1, w1_ab_n, w1_cd_n);

    wire w2_abc_n, w2_de_n, w2_sum, w2_and_n;
    nand(w2_abc_n, a, b, c);
    nand(w2_de_n, d, e);
    nand(w2_sum, w2_abc_n, w2_de_n);
    nand(w2_and_n, w2_sum, f);
    nand(y2, w2_and_n, w2_and_n);

    wire w3_t1, w3_t2, w3_t3;
    nand(w3_t1, na, b);
    nand(w3_t2, nc, ne);
    nand(w3_t3, nd, ne);
    nand(y3, w3_t1, w3_t2, w3_t3);

    wire w4_abp_n;
    nand(w4_abp_n, a, nb);
    nand(y4, d, w4_abp_n);

    wire w5_t1_n, w5_t2_n, w5_t3_n;
    nand(w5_t1_n, c, nd);
    nand(w5_t2_n, nb, nd);
    nand(w5_t3_n, a, b, nc, d);
    nand(y5, w5_t1_n, w5_t2_n, w5_t3_n);

endmodule

















