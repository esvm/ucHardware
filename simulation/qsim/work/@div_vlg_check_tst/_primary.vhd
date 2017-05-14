library verilog;
use verilog.vl_types.all;
entity Div_vlg_check_tst is
    port(
        HI              : in     vl_logic_vector(31 downto 0);
        LO              : in     vl_logic_vector(31 downto 0);
        counter         : in     vl_logic_vector(5 downto 0);
        div0            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Div_vlg_check_tst;
