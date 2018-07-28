module serialComCPU (GPIOi, CLOCK_50, SW, LEDR, GPIOo, KEY);
	input CLOCK_50;
	input [9:9] SW;
	input [3:0] KEY;
	input  GPIOi; //AJ21
	output GPIOo; //AF16
	output [7:0] LEDR;
	
	wire [31:0] clk156250;
	wire [7:0] dataToMem, dataToSent;
	wire charSent, charRecived, transEnable, clk9600x16, clk9600;
	
	clock_divider cd (CLOCK_50, clk156250);
	clkCounter cc1(clk156250[4], ~KEY[0], clk9600x16);
	clkCounter2 cc2(clk9600x16, ~KEY[0], clk9600);
	
    lab4_cpu u0 (
        .clk_clk                                 (CLOCK_50),                     			         //                              clk.clk
        .reset_reset_n                           (SW[9]),                       					      //                            reset.reset_n
        .leds_external_connection_export         (LEDR),         												//         leds_external_connection.export
        .datatomem_external_connection_export    (dataToMem),    												//    datatomem_external_connection.export
        .datatosent_external_connection_export   (dataToSent),   												//   datatosent_external_connection.export
        .charsent_external_connection_export     (charSent),     												//     charsent_external_connection.export
        .charreceived_external_connection_export (charRecived), 												// charreceived_external_connection.export
        .transenable_external_connection_export  (transEnable)   												//  transenable_external_connection.export
    );
	
	transmit tsmt (dataToSent, transEnable, clk9600x16, clk9600, ~KEY[0], GPIOo, charSent);	
	
	receive rcv (GPIOi, clk9600x16, clk9600, ~KEY[0], dataToMem, charRecived);
endmodule 