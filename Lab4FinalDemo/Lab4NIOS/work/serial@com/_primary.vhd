library verilog;
use verilog.vl_types.all;
entity serialCom is
    port(
        dataToSent      : in     vl_logic_vector(7 downto 0);
        transEnable     : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        dataToMem       : out    vl_logic_vector(7 downto 0);
        charRecived     : out    vl_logic;
        charSent        : out    vl_logic
    );
end serialCom;
