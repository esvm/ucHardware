library verilog;
use verilog.vl_types.all;
entity div is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        start           : in     vl_logic;
        HI              : out    vl_logic_vector(31 downto 0);
        LO              : out    vl_logic_vector(31 downto 0);
        div0            : out    vl_logic
    );
end div;
