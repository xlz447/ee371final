module transmitEnable(enableIn, clk9600, charSent, clk, reset, enableOut);
	output reg enableOut;
	input enableIn, clk9600, charSent, clk, reset;
	wire [1:0] PS, PSBar;
	reg [1:0] NS;
	
	parameter [1:0] Idle1 = 2'b00, Idle2 = 2'b01, Enable = 2'b10, Empty = 2'b11;
	
	always @(PS or enableIn or clk9600 or charSent) 
		case (PS) 
			Idle1: if (enableIn == 1 && clk9600 == 0) NS = Idle2;
					 else NS = Idle1;
			Idle2: if (enableIn == 1 && clk9600 == 1) NS = Enable;
					 else NS = Idle2;
			Enable: if (charSent == 1) NS = Empty;
					  else NS = Enable;
			Empty: if (enableIn == 0) NS = Idle1;
					 else NS = Empty;
			default: NS = Idle1;
		endcase 
	 
	// Output logic 
	always @(PS) 
		case (PS) 
			Idle1: enableOut = 0; 
			Idle2: enableOut = 0;  
			Enable: enableOut = 1; 
			Empty: enableOut = 0; 
			default: enableOut = 0; 
		endcase 
		
	// Stateholding 
	DFlipFlop b0 (.q(PS[0]), .qBar(PSBar[0]), .D(NS[0]), .rst(reset), .clk(clk)); 
	DFlipFlop b1 (.q(PS[1]), .qBar(PSBar[1]), .D(NS[1]), .rst(reset), .clk(clk)); 

endmodule 