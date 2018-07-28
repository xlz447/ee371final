library verilog;
use verilog.vl_types.all;
entity BIC is
    port(
        en              : in     vl_logic;
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        \out\           : out    vl_logic_vector(3 downto 0)
    );
end BIC;
