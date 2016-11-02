library verilog;
use verilog.vl_types.all;
entity sdModel is
    generic(
        SIZE            : integer := 10;
        CONTENT_SIZE    : integer := 40;
        IDLE            : vl_logic_vector(0 to 9) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        READ_CMD        : vl_logic_vector(0 to 9) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        ANALYZE_CMD     : vl_logic_vector(0 to 9) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0);
        SEND_CMD        : vl_logic_vector(0 to 9) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0);
        DATA_IDLE       : vl_logic_vector(0 to 9) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        READ_WAITS      : vl_logic_vector(0 to 9) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        READ_DATA       : vl_logic_vector(0 to 9) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0);
        WRITE_FLASH     : vl_logic_vector(0 to 9) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0);
        WRITE_DATA      : vl_logic_vector(0 to 9) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0);
        okcrctoken      : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi1);
        invalidcrctoken : vl_logic_vector(0 to 3) := (Hi1, Hi1, Hi1, Hi1)
    );
    port(
        sdClk           : in     vl_logic;
        cmd             : in     vl_logic;
        dat             : in     vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
    attribute mti_svvh_generic_type of CONTENT_SIZE : constant is 1;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of READ_CMD : constant is 1;
    attribute mti_svvh_generic_type of ANALYZE_CMD : constant is 1;
    attribute mti_svvh_generic_type of SEND_CMD : constant is 1;
    attribute mti_svvh_generic_type of DATA_IDLE : constant is 1;
    attribute mti_svvh_generic_type of READ_WAITS : constant is 1;
    attribute mti_svvh_generic_type of READ_DATA : constant is 1;
    attribute mti_svvh_generic_type of WRITE_FLASH : constant is 1;
    attribute mti_svvh_generic_type of WRITE_DATA : constant is 1;
    attribute mti_svvh_generic_type of okcrctoken : constant is 1;
    attribute mti_svvh_generic_type of invalidcrctoken : constant is 1;
end sdModel;
