library verilog;
use verilog.vl_types.all;
entity multiplication_vlg_check_tst is
    port(
        HI              : in     vl_logic_vector(31 downto 0);
        LO              : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end multiplication_vlg_check_tst;
