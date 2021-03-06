module PISO (dataIn, load, clk, rst, dataOut);
	 output dataOut;
	 input [7:0] dataIn;
	 input clk, rst, load;
	 wire [9:0] q, temp, qBar;
	 
	 mux2 m9 (load, 1'b1, 1'b0,      temp[9]);//end
	 mux2 m8 (load, q[9], dataIn[0], temp[8]);
	 mux2 m7 (load, q[8], dataIn[1], temp[7]);
	 mux2 m6 (load, q[7], dataIn[2], temp[6]);
	 mux2 m5 (load, q[6], dataIn[3], temp[5]);
	 mux2 m4 (load, q[5], dataIn[4], temp[4]);
	 mux2 m3 (load, q[4], dataIn[5], temp[3]);
	 mux2 m2 (load, q[3], dataIn[6], temp[2]);
	 mux2 m1 (load, q[2], dataIn[7], temp[1]);
	 mux2 m0 (load, q[1], 1'b0,      temp[0]);//start

	 	 	 
	 DFlipFlop2 ff9 (q[9], qBar[9], temp[9], clk, rst);
	 DFlipFlop2 ff8 (q[8], qBar[8], temp[8], clk, rst);
	 DFlipFlop2 ff7 (q[7], qBar[7], temp[7], clk, rst);
	 DFlipFlop2 ff6 (q[6], qBar[6], temp[6], clk, rst);
	 DFlipFlop2 ff5 (q[5], qBar[5], temp[5], clk, rst);
	 DFlipFlop2 ff4 (q[4], qBar[4], temp[4], clk, rst);
	 DFlipFlop2 ff3 (q[3], qBar[3], temp[3], clk, rst);
	 DFlipFlop2 ff2 (q[2], qBar[2], temp[2], clk, rst);
	 DFlipFlop2 ff1 (q[1], qBar[1], temp[1], clk, rst);
	 DFlipFlop2 ff0 (q[0], qBar[0], temp[0], clk, rst);
	 
	 assign dataOut = q[0];
endmodule 