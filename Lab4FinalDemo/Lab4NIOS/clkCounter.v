module clkCounter(clk, rst, out);
	input clk, rst;
	output reg out;
	wire [3:0] nc, PS;
	reg [3:0] NS, c;
	
	always @(PS)
		begin 
			if (PS < 9) NS = PS + 1'b1;
			else NS = 0;
			c = PS;
		end
		
	DFlipFlop dff0(PS[0], nc[0], NS[0], clk, rst);
	DFlipFlop dff1(PS[1], nc[1], NS[1], clk, rst);
	DFlipFlop dff2(PS[2], nc[2], NS[2], clk, rst);
	DFlipFlop dff3(PS[3], nc[3], NS[3], clk, rst);

	always @(posedge clk)
		begin 
			if (c == 4 || c < 4 || c == 12) out = 1;
			else out = 0;
		end
	
endmodule 