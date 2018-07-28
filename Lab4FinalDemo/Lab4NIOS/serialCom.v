module serialCom (dataToSent, transEnable, clk9600x16, clk9600, rst, dataToMem, charRecived, charSent);
	input transEnable, clk9600x16, clk9600, rst;
	input [7:0] dataToSent;
	output charRecived, charSent;
	output [7:0] dataToMem;
	wire dataOut;
	
	transmit tsmt (dataToSent, transEnable, clk9600x16, clk9600, rst, dataOut, charSent);	
	
	receive rcv (dataOut, clk9600x16, clk9600, rst, dataToMem, charRecived);
	
endmodule 