module BIC (en, rst, clk, out);
	output reg [3:0] out;
	input en, clk, rst;
	wire reset2;
	wire [3:0] PS, PSBar;
	reg [3:0] NS;
		
	always @(PS) 
		begin
			if (PS < 15) NS = PS + 1'b1;
			else NS = 0;
			out = PS;
		end 
		
	 
	// Stateholding 
	DFlipFlop b0 (.q(PS[0]), .qBar(PSBar[0]), .D(NS[0]), .rst(~en | rst), .clk(clk)); 
	DFlipFlop b1 (.q(PS[1]), .qBar(PSBar[1]), .D(NS[1]), .rst(~en | rst), .clk(clk)); 
	DFlipFlop b2 (.q(PS[2]), .qBar(PSBar[2]), .D(NS[2]), .rst(~en | rst), .clk(clk));
	DFlipFlop b3 (.q(PS[3]), .qBar(PSBar[3]), .D(NS[3]), .rst(~en | rst), .clk(clk));
	
endmodule 