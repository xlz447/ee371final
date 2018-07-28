library verilog;
use verilog.vl_types.all;
entity ttb is
    generic(
        period          : integer := 100
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of period : constant is 1;
end ttb;
