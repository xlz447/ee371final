	component lab4_cpu is
		port (
			clk_clk                                 : in  std_logic                    := 'X';             -- clk
			reset_reset_n                           : in  std_logic                    := 'X';             -- reset_n
			leds_external_connection_export         : out std_logic_vector(7 downto 0);                    -- export
			datatomem_external_connection_export    : in  std_logic_vector(7 downto 0) := (others => 'X'); -- export
			datatosent_external_connection_export   : out std_logic_vector(7 downto 0);                    -- export
			charsent_external_connection_export     : in  std_logic                    := 'X';             -- export
			charreceived_external_connection_export : in  std_logic                    := 'X';             -- export
			transenable_external_connection_export  : out std_logic                                        -- export
		);
	end component lab4_cpu;

	u0 : component lab4_cpu
		port map (
			clk_clk                                 => CONNECTED_TO_clk_clk,                                 --                              clk.clk
			reset_reset_n                           => CONNECTED_TO_reset_reset_n,                           --                            reset.reset_n
			leds_external_connection_export         => CONNECTED_TO_leds_external_connection_export,         --         leds_external_connection.export
			datatomem_external_connection_export    => CONNECTED_TO_datatomem_external_connection_export,    --    datatomem_external_connection.export
			datatosent_external_connection_export   => CONNECTED_TO_datatosent_external_connection_export,   --   datatosent_external_connection.export
			charsent_external_connection_export     => CONNECTED_TO_charsent_external_connection_export,     --     charsent_external_connection.export
			charreceived_external_connection_export => CONNECTED_TO_charreceived_external_connection_export, -- charreceived_external_connection.export
			transenable_external_connection_export  => CONNECTED_TO_transenable_external_connection_export   --  transenable_external_connection.export
		);

