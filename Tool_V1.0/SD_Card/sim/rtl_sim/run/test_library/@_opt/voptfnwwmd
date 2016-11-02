library verilog;
use verilog.vl_types.all;
entity sd_fifo_tx_filler is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        m_wb_adr_o      : out    vl_logic_vector(31 downto 0);
        m_wb_we_o       : out    vl_logic;
        m_wb_dat_i      : in     vl_logic_vector(31 downto 0);
        m_wb_cyc_o      : out    vl_logic;
        m_wb_stb_o      : out    vl_logic;
        m_wb_ack_i      : in     vl_logic;
        m_wb_cti_o      : out    vl_logic_vector(2 downto 0);
        m_wb_bte_o      : out    vl_logic_vector(1 downto 0);
        en              : in     vl_logic;
        adr             : in     vl_logic_vector(31 downto 0);
        sd_clk          : in     vl_logic;
        dat_o           : out    vl_logic_vector(31 downto 0);
        rd              : in     vl_logic;
        empty           : out    vl_logic;
        fe              : out    vl_logic
    );
end sd_fifo_tx_filler;
