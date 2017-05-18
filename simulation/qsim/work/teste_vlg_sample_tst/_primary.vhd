library verilog;
use verilog.vl_types.all;
entity teste_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        MDControl       : in     vl_logic;
        clk             : in     vl_logic;
        load            : in     vl_logic;
        reset           : in     vl_logic;
        start           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end teste_vlg_sample_tst;
