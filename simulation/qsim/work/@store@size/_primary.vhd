library verilog;
use verilog.vl_types.all;
entity StoreSize is
    port(
        SSControl       : in     vl_logic_vector(1 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        Data            : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end StoreSize;
