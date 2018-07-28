module receive (dataIn, clk9600x16, clk9600, rst, dataToMem, charRecived);
	input dataIn, clk9600x16, clk9600, rst;
	output [7:0] dataToMem;
	output reg charRecived;
	wire [3:0] bscCount, bicCount;
	wire [7:0] dataReady, dataReadyBar;
	wire en;
	reg SRclk, bicClk;
	
	DFlipFlop ff7(dataToMem[7], dataReadyBar[7], dataReady[7], charRecived, rst);
	DFlipFlop ff6(dataToMem[6], dataReadyBar[6], dataReady[6], charRecived, rst);
	DFlipFlop ff5(dataToMem[5], dataReadyBar[5], dataReady[5], charRecived, rst);
	DFlipFlop ff4(dataToMem[4], dataReadyBar[4], dataReady[4], charRecived, rst);
	DFlipFlop ff3(dataToMem[3], dataReadyBar[3], dataReady[3], charRecived, rst);
	DFlipFlop ff2(dataToMem[2], dataReadyBar[2], dataReady[2], charRecived, rst);
	DFlipFlop ff1(dataToMem[1], dataReadyBar[1], dataReady[1], charRecived, rst);
	DFlipFlop ff0(dataToMem[0], dataReadyBar[0], dataReady[0], charRecived, rst);
	
	SIPO sr0 (dataIn, SRclk, rst, dataReady);
	startBit myStartBit (dataIn, clk9600, rst, en);
	BSC myBSC(en, rst, clk9600x16, bscCount);
	BIC myBIC(en, rst, bicClk, bicCount);
	
	always@(posedge clk9600x16)
		begin
			if (bscCount == 4'b1111) bicClk = 1;
			else bicClk = 0;
			
			if (bscCount == 4'b0111) SRclk = 1;
			else SRclk = 0;
		
			if ((bicCount == 4'b0111) && (bscCount > 8) && (bscCount < 15)) charRecived = 1;
			else charRecived = 0;
		end
		
endmodule 