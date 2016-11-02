library verilog;
use verilog.vl_types.all;
entity sd_tx_fifo is
    port(
        d               : in     vl_logic_vector(31 downto 0);
        wr              : in     vl_logic;
        wclk            : in     vl_logic;
        q               : out    vl_logic_vector(31 downto 0);
        rd              : in     vl_logic;
        full            : out    vl_logic;
        empty           : out    vl_logic;
        mem_empt        : out    vl_logic_vector(5 downto 0);
        rclk            : in     vl_logic;
        rst             : in     vl_logic
    );
end sd_tx_fifo;
