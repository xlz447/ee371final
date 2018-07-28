module transmit(dataIn, transEnable, clk9600x16, clk9600, rst, dataOut, charSent);
	input transEnable, clk9600x16, clk9600, rst;
	input [7:0] dataIn;
	output dataOut;
	output reg charSent;
	reg load, bicClk, SRclk;
	wire [3:0] bscCount, bicCount;
	wire en;
	wire [7:0] dataReady, dataReadyBar;
	
	DFlipFlop ff7(dataReady[7], dataReadyBar[7], dataIn[7], load, rst);
	DFlipFlop ff6(dataReady[6], dataReadyBar[6], dataIn[6], load, rst);
	DFlipFlop ff5(dataReady[5], dataReadyBar[5], dataIn[5], load, rst);
	DFlipFlop ff4(dataReady[4], dataReadyBar[4], dataIn[4], load, rst);
	DFlipFlop ff3(dataReady[3], dataReadyBar[3], dataIn[3], load, rst);
	DFlipFlop ff2(dataReady[2], dataReadyBar[2], dataIn[2], load, rst);
	DFlipFlop ff1(dataReady[1], dataReadyBar[1], dataIn[1], load, rst);
	DFlipFlop ff0(dataReady[0], dataReadyBar[0], dataIn[0], load, rst);
	
	transmitEnable te (transEnable, clk9600, charSent, clk9600x16, rst, en);
	PISO sr1 (dataIn, load, SRclk, rst, dataOut);
	BSC myBSC(en, rst, clk9600x16, bscCount);
	BIC myBIC(en, rst, bicClk, bicCount);
	
	always@(posedge clk9600x16)
			begin
				if (bscCount == 4'b1111) bicClk = 1;
				else bicClk = 0;
				
				if (bicCount == 4'b0000 && en == 1) load = 1;
				else load = 0;
				
				if (bscCount == 4'b0001 && en == 1) SRclk = 1;
				else SRclk = 0;
			
				if (bicCount == 4'b1010 && (bscCount == 4'b11xx || bscCount == 4'b1x1x || bscCount == 4'b1xx1)) charSent = 1;
				else charSent = 0;
			end
endmodule 