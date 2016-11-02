library verilog;
use verilog.vl_types.all;
entity WB_MASTER_BEHAVIORAL is
    port(
        CLK_I           : in     vl_logic;
        RST_I           : in     vl_logic;
        TAG_I           : in     vl_logic_vector(4 downto 0);
        TAG_O           : out    vl_logic_vector(4 downto 0);
        ACK_I           : in     vl_logic;
        ADR_O           : out    vl_logic_vector(31 downto 0);
        CYC_O           : out    vl_logic;
        DAT_I           : in     vl_logic_vector(31 downto 0);
        DAT_O           : out    vl_logic_vector(31 downto 0);
        ERR_I           : in     vl_logic;
        RTY_I           : in     vl_logic;
        SEL_O           : out    vl_logic_vector(3 downto 0);
        STB_O           : out    vl_logic;
        WE_O            : out    vl_logic;
        CAB_O           : out    vl_logic
    );
end WB_MASTER_BEHAVIORAL;
