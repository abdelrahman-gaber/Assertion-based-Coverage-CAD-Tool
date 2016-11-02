library verilog;
use verilog.vl_types.all;
entity sd_cmd_master is
    generic(
        SIZE            : integer := 3;
        IDLE            : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        SETUP           : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        EXECUTE         : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0)
    );
    port(
        CLK_PAD_IO      : in     vl_logic;
        RST_PAD_I       : in     vl_logic;
        New_CMD         : in     vl_logic;
        data_write      : in     vl_logic;
        data_read       : in     vl_logic;
        ARG_REG         : in     vl_logic_vector(31 downto 0);
        CMD_SET_REG     : in     vl_logic_vector(13 downto 0);
        TIMEOUT_REG     : in     vl_logic_vector(15 downto 0);
        STATUS_REG      : out    vl_logic_vector(15 downto 0);
        RESP_1_REG      : out    vl_logic_vector(31 downto 0);
        ERR_INT_REG     : out    vl_logic_vector(4 downto 0);
        NORMAL_INT_REG  : out    vl_logic_vector(15 downto 0);
        ERR_INT_RST     : in     vl_logic;
        NORMAL_INT_RST  : in     vl_logic;
        settings        : out    vl_logic_vector(15 downto 0);
        go_idle_o       : out    vl_logic;
        cmd_out         : out    vl_logic_vector(39 downto 0);
        req_out         : out    vl_logic;
        ack_out         : out    vl_logic;
        req_in          : in     vl_logic;
        ack_in          : in     vl_logic;
        cmd_in          : in     vl_logic_vector(39 downto 0);
        serial_status   : in     vl_logic_vector(7 downto 0);
        card_detect     : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of SETUP : constant is 1;
    attribute mti_svvh_generic_type of EXECUTE : constant is 1;
end sd_cmd_master;
