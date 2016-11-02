library verilog;
use verilog.vl_types.all;
entity WB_SLAVE_BEHAVIORAL is
    port(
        CLK_I           : in     vl_logic;
        RST_I           : in     vl_logic;
        ACK_O           : out    vl_logic;
        ADR_I           : in     vl_logic_vector(31 downto 0);
        CYC_I           : in     vl_logic;
        DAT_O           : out    vl_logic_vector(31 downto 0);
        DAT_I           : in     vl_logic_vector(31 downto 0);
        ERR_O           : out    vl_logic;
        RTY_O           : out    vl_logic;
        SEL_I           : in     vl_logic_vector(3 downto 0);
        STB_I           : in     vl_logic;
        WE_I            : in     vl_logic;
        CAB_I           : in     vl_logic
    );
end WB_SLAVE_BEHAVIORAL;
