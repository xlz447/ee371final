
module lab4_cpu (
	clk_clk,
	reset_reset_n,
	leds_external_connection_export,
	datatomem_external_connection_export,
	datatosent_external_connection_export,
	charsent_external_connection_export,
	charreceived_external_connection_export,
	transenable_external_connection_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[7:0]	leds_external_connection_export;
	input	[7:0]	datatomem_external_connection_export;
	output	[7:0]	datatosent_external_connection_export;
	input		charsent_external_connection_export;
	input		charreceived_external_connection_export;
	output		transenable_external_connection_export;
endmodule
