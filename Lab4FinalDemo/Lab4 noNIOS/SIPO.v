module SIPO(data, clk, rst, dataOut);
	output wire [7:0] dataOut;
	input data, clk, rst;
	wire [7:0] out, outBar;

	// bulid the shift register
	DFlipFlop ff7(out[7], outBar[7], out[6], clk, rst);
	DFlipFlop ff6(out[6], outBar[6], out[5], clk, rst);
	DFlipFlop ff5(out[5], outBar[5], out[4], clk, rst);
	DFlipFlop ff4(out[4], outBar[4], out[3], clk, rst);
	DFlipFlop ff3(out[3], outBar[3], out[2], clk, rst);
	DFlipFlop ff2(out[2], outBar[2], out[1], clk, rst);
	DFlipFlop ff1(out[1], outBar[1], out[0], clk, rst);
	DFlipFlop ff0(out[0], outBar[0], data, clk, rst);
	assign dataOut = out;
endmodule 