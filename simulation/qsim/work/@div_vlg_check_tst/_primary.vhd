library verilog;
use verilog.vl_types.all;
entity Div_vlg_check_tst is
    port(
        HI              : in     vl_logic_vector(31 downto 0);
        LO              : in     vl_logic_vector(31 downto 0);
        p1              : in     vl_logic_vector(32 downto 0);
        sampler_rx      : in     vl_logic
    );
end Div_vlg_check_tst;
