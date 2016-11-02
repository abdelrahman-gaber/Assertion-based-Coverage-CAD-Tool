library verilog;
use verilog.vl_types.all;
entity sd_controller_wb is
    generic(
        power_controll_reg: vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi1, Hi1, Hi1);
        block_size_reg  : integer := 512;
        controll_setting_reg: vl_logic_vector(0 to 15) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        capabilies_reg  : vl_logic_vector(0 to 15) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        wb_clk_i        : in     vl_logic;
        wb_rst_i        : in     vl_logic;
        wb_dat_i        : in     vl_logic_vector(31 downto 0);
        wb_dat_o        : out    vl_logic_vector(31 downto 0);
        wb_adr_i        : in     vl_logic_vector(7 downto 0);
        wb_sel_i        : in     vl_logic_vector(3 downto 0);
        wb_we_i         : in     vl_logic;
        wb_cyc_i        : in     vl_logic;
        wb_stb_i        : in     vl_logic;
        wb_ack_o        : out    vl_logic;
        we_m_tx_bd      : out    vl_logic;
        new_cmd         : out    vl_logic;
        we_m_rx_bd      : out    vl_logic;
        we_ack          : out    vl_logic;
        int_ack         : out    vl_logic;
        cmd_int_busy    : out    vl_logic;
        Bd_isr_reset    : out    vl_logic;
        normal_isr_reset: out    vl_logic;
        error_isr_reset : out    vl_logic;
        int_busy        : out    vl_logic;
        dat_in_m_tx_bd  : out    vl_logic_vector(15 downto 0);
        dat_in_m_rx_bd  : out    vl_logic_vector(15 downto 0);
        write_req_s     : in     vl_logic;
        cmd_set_s       : in     vl_logic_vector(15 downto 0);
        cmd_arg_s       : in     vl_logic_vector(31 downto 0);
        argument_reg    : out    vl_logic_vector(31 downto 0);
        cmd_setting_reg : out    vl_logic_vector(15 downto 0);
        status_reg      : in     vl_logic_vector(15 downto 0);
        cmd_resp_1      : in     vl_logic_vector(31 downto 0);
        software_reset_reg: out    vl_logic_vector(7 downto 0);
        time_out_reg    : out    vl_logic_vector(15 downto 0);
        normal_int_status_reg: in     vl_logic_vector(15 downto 0);
        error_int_status_reg: in     vl_logic_vector(15 downto 0);
        normal_int_signal_enable_reg: out    vl_logic_vector(15 downto 0);
        error_int_signal_enable_reg: out    vl_logic_vector(15 downto 0);
        clock_divider   : out    vl_logic_vector(7 downto 0);
        Bd_Status_reg   : in     vl_logic_vector(15 downto 0);
        Bd_isr_reg      : in     vl_logic_vector(7 downto 0);
        Bd_isr_enable_reg: out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of power_controll_reg : constant is 1;
    attribute mti_svvh_generic_type of block_size_reg : constant is 1;
    attribute mti_svvh_generic_type of controll_setting_reg : constant is 1;
    attribute mti_svvh_generic_type of capabilies_reg : constant is 1;
end sd_controller_wb;
