library verilog;
use verilog.vl_types.all;
entity Div is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        LO              : out    vl_logic_vector(31 downto 0);
        HI              : out    vl_logic_vector(31 downto 0);
        div0            : out    vl_logic;
        counter         : out    vl_logic_vector(5 downto 0)
    );
end Div;
