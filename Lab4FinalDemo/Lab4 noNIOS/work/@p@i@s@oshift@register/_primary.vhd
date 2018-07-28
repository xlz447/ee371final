library verilog;
use verilog.vl_types.all;
entity PISOshiftRegister is
    port(
        \out\           : out    vl_logic;
        data            : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        load            : in     vl_logic
    );
end PISOshiftRegister;
