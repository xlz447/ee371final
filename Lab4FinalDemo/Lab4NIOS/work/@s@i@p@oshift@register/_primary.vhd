library verilog;
use verilog.vl_types.all;
entity SIPOshiftRegister is
    port(
        dataOut         : out    vl_logic_vector(7 downto 0);
        data            : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end SIPOshiftRegister;
