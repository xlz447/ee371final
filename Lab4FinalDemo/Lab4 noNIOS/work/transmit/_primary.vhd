library verilog;
use verilog.vl_types.all;
entity transmit is
    port(
        dataIn          : in     vl_logic_vector(7 downto 0);
        transEnable     : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        dataOut         : out    vl_logic;
        charSent        : out    vl_logic
    );
end transmit;
