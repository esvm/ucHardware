library verilog;
use verilog.vl_types.all;
entity StoreSize_vlg_sample_tst is
    port(
        B               : in     vl_logic_vector(31 downto 0);
        Data            : in     vl_logic_vector(31 downto 0);
        SSControl       : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end StoreSize_vlg_sample_tst;
