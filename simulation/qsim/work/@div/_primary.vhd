library verilog;
use verilog.vl_types.all;
entity Div is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        start           : in     vl_logic;
        LO              : out    vl_logic_vector(31 downto 0);
        HI              : out    vl_logic_vector(31 downto 0);
        p1              : out    vl_logic_vector(32 downto 0)
    );
end Div;
