library verilog;
use verilog.vl_types.all;
entity LoadSize_vlg_sample_tst is
    port(
        Data            : in     vl_logic_vector(31 downto 0);
        LSControl       : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end LoadSize_vlg_sample_tst;
