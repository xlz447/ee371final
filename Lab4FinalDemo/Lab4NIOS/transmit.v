module transmit(dataIn, transEnable, clk9600x16, clk9600, rst, dataOut, charSent);
	input transEnable, clk9600x16, clk9600, rst;
	input [7:0] dataIn;
	output dataOut;
	output reg charSent;
	reg load, bicClk, SRclk;
	wire [3:0] bscCount, bicCount;
	wire en;
	
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