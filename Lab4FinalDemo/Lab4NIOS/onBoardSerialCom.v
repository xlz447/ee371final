module onBoardSerialCom (SW, KEY, LEDR, CLOCK_50);
	input CLOCK_50;
	input [9:0] SW;
	input [0:0] KEY;
	output [9:0] LEDR;
	
	wire [31:0] clk156250;
	wire clk9600x16, clk9600;
	
	clock_divider cd (CLOCK_50, clk156250);
	clkCounter cc1(clk156250[4], ~KEY[0], clk9600x16);
	clkCounter2 cc2(clk9600x16, ~KEY[0], clk9600);
	
	serialCom sc (SW[7:0], SW[9], clk9600x16, clk9600, ~KEY[0], LEDR[7:0], LEDR[8], LEDR[9]);
	
endmodule 