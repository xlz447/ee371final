library verilog;
use verilog.vl_types.all;
entity startBSC is
    port(
        \out\           : out    vl_logic_vector(3 downto 0);
        data            : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end startBSC;
