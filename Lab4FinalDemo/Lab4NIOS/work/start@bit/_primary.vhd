library verilog;
use verilog.vl_types.all;
entity startBit is
    port(
        data            : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        en              : out    vl_logic
    );
end startBit;
