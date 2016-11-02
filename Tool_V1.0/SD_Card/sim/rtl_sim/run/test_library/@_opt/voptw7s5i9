library verilog;
use verilog.vl_types.all;
entity WB_BUS_MON is
    port(
        CLK_I           : in     vl_logic;
        RST_I           : in     vl_logic;
        ACK_I           : in     vl_logic;
        ADDR_O          : in     vl_logic_vector(31 downto 0);
        CYC_O           : in     vl_logic;
        DAT_I           : in     vl_logic_vector(31 downto 0);
        DAT_O           : in     vl_logic_vector(31 downto 0);
        ERR_I           : in     vl_logic;
        RTY_I           : in     vl_logic;
        SEL_O           : in     vl_logic_vector(3 downto 0);
        STB_O           : in     vl_logic;
        WE_O            : in     vl_logic;
        TAG_I           : in     vl_logic_vector(4 downto 0);
        TAG_O           : in     vl_logic_vector(4 downto 0);
        CAB_O           : in     vl_logic;
        check_CTI       : in     vl_logic;
        log_file_desc   : in     vl_logic_vector(31 downto 0)
    );
end WB_BUS_MON;
