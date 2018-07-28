library verilog;
use verilog.vl_types.all;
entity recive is
    port(
        dataIn          : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        dataOut         : out    vl_logic_vector(7 downto 0);
        charRecived     : out    vl_logic
    );
end recive;
