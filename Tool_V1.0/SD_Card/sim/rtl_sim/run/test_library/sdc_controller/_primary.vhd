library verilog;
use verilog.vl_types.all;
entity sdc_controller is
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
        m_wb_adr_o      : out    vl_logic_vector(31 downto 0);
        m_wb_sel_o      : out    vl_logic_vector(3 downto 0);
        m_wb_we_o       : out    vl_logic;
        m_wb_dat_o      : out    vl_logic_vector(31 downto 0);
        m_wb_dat_i      : in     vl_logic_vector(31 downto 0);
        m_wb_cyc_o      : out    vl_logic;
        m_wb_stb_o      : out    vl_logic;
        m_wb_ack_i      : in     vl_logic;
        m_wb_cti_o      : out    vl_logic_vector(2 downto 0);
        m_wb_bte_o      : out    vl_logic_vector(1 downto 0);
        sd_cmd_dat_i    : in     vl_logic;
        sd_cmd_out_o    : out    vl_logic;
        sd_cmd_oe_o     : out    vl_logic;
        card_detect     : in     vl_logic;
        sd_dat_dat_i    : in     vl_logic_vector(3 downto 0);
        sd_dat_out_o    : out    vl_logic_vector(3 downto 0);
        sd_dat_oe_o     : out    vl_logic;
        sd_clk_o_pad    : out    vl_logic;
        int_a           : out    vl_logic;
        int_b           : out    vl_logic;
        int_c           : out    vl_logic
    );
end sdc_controller;
