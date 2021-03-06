module startBit (data, clk, rst, en);
	input data, clk, rst;
	output reg en;
	wire [3:0] PS, nc;
	reg [3:0] NS;
	
	always @(PS or data)
		begin 
			if (PS == 0)
				begin
					if (data == 0) NS = 1;
					else NS = 0;
					en = 0;
				end
			else if (PS < 9) 
				begin 
					NS = PS + 1'b1;
					en = 1;
				end
			else if (PS == 9)
				begin
					NS = 0;
					en = 0;
				end
		end
		
	DFlipFlop dff0(PS[0], nc[0], NS[0], clk, rst);
	DFlipFlop dff1(PS[1], nc[1], NS[1], clk, rst);
	DFlipFlop dff2(PS[2], nc[2], NS[2], clk, rst);
	DFlipFlop dff3(PS[3], nc[3], NS[3], clk, rst);
endmodule 

//module tb();
//	reg data, clk, rst;
//	wire en;
//	
//	parameter period = 100;
//	
//	initial clk = 0;
//	always #(period /2) clk = ~ clk;
//	
//	startBit sb (data, clk, rst, en);
//	
//	initial begin
//		rst = 1;data = 1;
//		#period rst = 0;
//		#period data = 1;
//		#(5*period); 
//		#period data = 0;
//		#period data = 0;
//		#period data = 1;
//		#period data = 1;
//		#period data = 1;
//		#period data = 1;
//		#period data = 0;
//		#period data = 1;
//		#period data = 1;
//		#period data = 0;
//		#period data = 1;
//		#(5*period); 
//		$stop();
//	end
//	
//endmodule 