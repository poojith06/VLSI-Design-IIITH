module my_design;
	integer i;

	initial begin
		// Note that ++ operator does not exist in Verilog !
		for (i = 0; i < 10; i = i + 1) begin
			$display ("Current loop#%0d ", i);
		end
	end
endmodule