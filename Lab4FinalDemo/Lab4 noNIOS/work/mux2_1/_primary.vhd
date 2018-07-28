library verilog;
use verilog.vl_types.all;
entity mux2_1 is
    port(
        \out\           : out    vl_logic;
        in1             : in     vl_logic;
        in0             : in     vl_logic;
        s               : in     vl_logic
    );
end mux2_1;
