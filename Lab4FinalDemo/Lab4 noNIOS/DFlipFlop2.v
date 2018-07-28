module DFlipFlop2(q, qBar, D, clk, rst);
	input D, clk, rst;
	output q, qBar;
	reg q;
	not n1 (qBar, q);
	always@ (posedge rst or posedge clk)
		begin
			if(rst)
				q = 1;
			else
				q = D;
		end
endmodule 