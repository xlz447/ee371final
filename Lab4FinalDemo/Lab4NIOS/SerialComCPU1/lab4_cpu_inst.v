	lab4_cpu u0 (
		.clk_clk                                 (<connected-to-clk_clk>),                                 //                              clk.clk
		.reset_reset_n                           (<connected-to-reset_reset_n>),                           //                            reset.reset_n
		.leds_external_connection_export         (<connected-to-leds_external_connection_export>),         //         leds_external_connection.export
		.datatomem_external_connection_export    (<connected-to-datatomem_external_connection_export>),    //    datatomem_external_connection.export
		.datatosent_external_connection_export   (<connected-to-datatosent_external_connection_export>),   //   datatosent_external_connection.export
		.charsent_external_connection_export     (<connected-to-charsent_external_connection_export>),     //     charsent_external_connection.export
		.charreceived_external_connection_export (<connected-to-charreceived_external_connection_export>), // charreceived_external_connection.export
		.transenable_external_connection_export  (<connected-to-transenable_external_connection_export>)   //  transenable_external_connection.export
	);

