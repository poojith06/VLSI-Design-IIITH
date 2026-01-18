module demux_tb;
    reg y;
    reg sel; 
    wire o0, o1;
    reg [1:0] sel4;
    wire [3:0] o4;
    reg [2:0] sel8;
    wire [7:0] o8;

    demux1_2 uut2 (.y(y), .sel(sel), .o0(o0), .o1(o1));
    demux1_4 uut4 (.y(y), .sel(sel4), .o(o4));
    demux1_8 uut8 (.y(y), .sel(sel8), .o(o8));

    initial begin
        $dumpfile("demux_wave.vcd");
        $dumpvars(0, demux_tb);
    end

    initial begin
        y = 1;
        sel = 0; #10;
        sel = 1; #10;
        y = 0;
        sel = 0; #10;
        sel = 1; #10;

        y = 1;
        sel4 = 2'b00; #10;
        sel4 = 2'b01; #10;
        sel4 = 2'b10; #10;
        sel4 = 2'b11; #10;
        y = 0;
        sel4 = 2'b10; #10;
        
        y = 1;
        sel8 = 3'b000; #10;
        sel8 = 3'b001; #10;
        sel8 = 3'b010; #10;
        sel8 = 3'b011; #10;
        sel8 = 3'b100; #10;
        sel8 = 3'b101; #10;
        sel8 = 3'b110; #10;
        sel8 = 3'b111; #10;

        y = 0; #10;
        $finish;
    end
endmodule
