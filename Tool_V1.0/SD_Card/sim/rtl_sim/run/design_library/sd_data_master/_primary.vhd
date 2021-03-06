library verilog;
use verilog.vl_types.all;
entity sd_data_master is
    generic(
        CMD24           : vl_logic_vector(0 to 15) := (Hi0, Hi0, Hi0, Hi1, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi1, Hi0, Hi1, Hi0);
        CMD17           : vl_logic_vector(0 to 15) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi1, Hi1, Hi0, Hi1, Hi0);
        CMD12           : vl_logic_vector(0 to 15) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi1, Hi0, Hi1, Hi0);
        ACMD13          : vl_logic_vector(0 to 15) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi1, Hi0, Hi1, Hi0, Hi0, Hi0, Hi1, Hi1, Hi0, Hi1, Hi0);
        ACMD51          : vl_logic_vector(0 to 15) := (Hi0, Hi0, Hi1, Hi1, Hi0, Hi0, Hi1, Hi1, Hi0, Hi0, Hi0, Hi1, Hi1, Hi0, Hi1, Hi0);
        SIZE            : integer := 9;
        IDLE            : vl_logic_vector(0 to 8) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        GET_TX_BD       : vl_logic_vector(0 to 8) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        GET_RX_BD       : vl_logic_vector(0 to 8) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0);
        SEND_CMD        : vl_logic_vector(0 to 8) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0);
        RECIVE_CMD      : vl_logic_vector(0 to 8) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0);
        DATA_TRANSFER   : vl_logic_vector(0 to 8) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0);
        STOP            : vl_logic_vector(0 to 8) := (Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        STOP_SEND       : vl_logic_vector(0 to 8) := (Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        STOP_RECIVE_CMD : vl_logic_vector(0 to 8) := (Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        dat_in_tx       : in     vl_logic_vector(15 downto 0);
        free_tx_bd      : in     vl_logic_vector(4 downto 0);
        ack_i_s_tx      : in     vl_logic;
        re_s_tx         : out    vl_logic;
        a_cmp_tx        : out    vl_logic;
        dat_in_rx       : in     vl_logic_vector(15 downto 0);
        free_rx_bd      : in     vl_logic_vector(4 downto 0);
        ack_i_s_rx      : in     vl_logic;
        re_s_rx         : out    vl_logic;
        a_cmp_rx        : out    vl_logic;
        cmd_busy        : in     vl_logic;
        we_req          : out    vl_logic;
        we_ack          : in     vl_logic;
        d_write         : out    vl_logic;
        d_read          : out    vl_logic;
        cmd_arg         : out    vl_logic_vector(31 downto 0);
        cmd_set         : out    vl_logic_vector(15 downto 0);
        cmd_tsf_err     : in     vl_logic;
        card_status     : in     vl_logic_vector(4 downto 0);
        start_tx_fifo   : out    vl_logic;
        start_rx_fifo   : out    vl_logic;
        sys_adr         : out    vl_logic_vector(31 downto 0);
        tx_empt         : in     vl_logic;
        tx_full         : in     vl_logic;
        rx_full         : in     vl_logic;
        busy_n          : in     vl_logic;
        transm_complete : in     vl_logic;
        crc_ok          : in     vl_logic;
        ack_transfer    : out    vl_logic;
        Dat_Int_Status  : out    vl_logic_vector(7 downto 0);
        Dat_Int_Status_rst: in     vl_logic;
        CIDAT           : out    vl_logic;
        transfer_type   : in     vl_logic_vector(1 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CMD24 : constant is 1;
    attribute mti_svvh_generic_type of CMD17 : constant is 1;
    attribute mti_svvh_generic_type of CMD12 : constant is 1;
    attribute mti_svvh_generic_type of ACMD13 : constant is 1;
    attribute mti_svvh_generic_type of ACMD51 : constant is 1;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of GET_TX_BD : constant is 1;
    attribute mti_svvh_generic_type of GET_RX_BD : constant is 1;
    attribute mti_svvh_generic_type of SEND_CMD : constant is 1;
    attribute mti_svvh_generic_type of RECIVE_CMD : constant is 1;
    attribute mti_svvh_generic_type of DATA_TRANSFER : constant is 1;
    attribute mti_svvh_generic_type of STOP : constant is 1;
    attribute mti_svvh_generic_type of STOP_SEND : constant is 1;
    attribute mti_svvh_generic_type of STOP_RECIVE_CMD : constant is 1;
end sd_data_master;
