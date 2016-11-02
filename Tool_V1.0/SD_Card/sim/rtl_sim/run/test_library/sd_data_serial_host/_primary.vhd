library verilog;
use verilog.vl_types.all;
entity sd_data_serial_host is
    generic(
        SIZE            : integer := 6;
        IDLE            : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        WRITE_DAT       : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        WRITE_CRC       : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0);
        WRITE_BUSY      : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi1, Hi0, Hi0, Hi0);
        READ_WAIT       : vl_logic_vector(0 to 5) := (Hi0, Hi1, Hi0, Hi0, Hi0, Hi0);
        READ_DAT        : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        sd_clk          : in     vl_logic;
        rst             : in     vl_logic;
        data_in         : in     vl_logic_vector(31 downto 0);
        rd              : out    vl_logic;
        data_out        : out    vl_logic_vector(3 downto 0);
        we              : out    vl_logic;
        DAT_oe_o        : out    vl_logic;
        DAT_dat_o       : out    vl_logic_vector(3 downto 0);
        DAT_dat_i       : in     vl_logic_vector(3 downto 0);
        start_dat       : in     vl_logic_vector(1 downto 0);
        ack_transfer    : in     vl_logic;
        busy_n          : out    vl_logic;
        transm_complete : out    vl_logic;
        crc_ok          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of WRITE_DAT : constant is 1;
    attribute mti_svvh_generic_type of WRITE_CRC : constant is 1;
    attribute mti_svvh_generic_type of WRITE_BUSY : constant is 1;
    attribute mti_svvh_generic_type of READ_WAIT : constant is 1;
    attribute mti_svvh_generic_type of READ_DAT : constant is 1;
end sd_data_serial_host;
