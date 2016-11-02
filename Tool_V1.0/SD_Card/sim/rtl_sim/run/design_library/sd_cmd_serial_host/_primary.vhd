library verilog;
use verilog.vl_types.all;
entity sd_cmd_serial_host is
    generic(
        SEND_SIZE       : integer := 48;
        SIZE            : integer := 10;
        CONTENT_SIZE    : integer := 40;
        INIT            : vl_logic_vector(0 to 9) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        IDLE            : vl_logic_vector(0 to 9) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        WRITE_WR        : vl_logic_vector(0 to 9) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0);
        DLY_WR          : vl_logic_vector(0 to 9) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0);
        READ_WR         : vl_logic_vector(0 to 9) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0);
        DLY_READ        : vl_logic_vector(0 to 9) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0);
        ACK_WR          : vl_logic_vector(0 to 9) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        WRITE_WO        : vl_logic_vector(0 to 9) := (Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        DLY_WO          : vl_logic_vector(0 to 9) := (Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        ACK_WO          : vl_logic_vector(0 to 9) := (Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        Read_Delay      : integer := 7;
        EIGHT_PAD       : integer := 8
    );
    port(
        SD_CLK_IN       : in     vl_logic;
        RST_IN          : in     vl_logic;
        SETTING_IN      : in     vl_logic_vector(15 downto 0);
        CMD_IN          : in     vl_logic_vector(39 downto 0);
        REQ_IN          : in     vl_logic;
        ACK_OUT         : out    vl_logic;
        REQ_OUT         : out    vl_logic;
        ACK_IN          : in     vl_logic;
        CMD_OUT         : out    vl_logic_vector(39 downto 0);
        STATUS          : out    vl_logic_vector(7 downto 0);
        cmd_dat_i       : in     vl_logic;
        cmd_out_o       : out    vl_logic;
        cmd_oe_o        : out    vl_logic;
        st_dat_t        : out    vl_logic_vector(1 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SEND_SIZE : constant is 1;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
    attribute mti_svvh_generic_type of CONTENT_SIZE : constant is 1;
    attribute mti_svvh_generic_type of INIT : constant is 1;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of WRITE_WR : constant is 1;
    attribute mti_svvh_generic_type of DLY_WR : constant is 1;
    attribute mti_svvh_generic_type of READ_WR : constant is 1;
    attribute mti_svvh_generic_type of DLY_READ : constant is 1;
    attribute mti_svvh_generic_type of ACK_WR : constant is 1;
    attribute mti_svvh_generic_type of WRITE_WO : constant is 1;
    attribute mti_svvh_generic_type of DLY_WO : constant is 1;
    attribute mti_svvh_generic_type of ACK_WO : constant is 1;
    attribute mti_svvh_generic_type of Read_Delay : constant is 1;
    attribute mti_svvh_generic_type of EIGHT_PAD : constant is 1;
end sd_cmd_serial_host;
