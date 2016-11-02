library verilog;
use verilog.vl_types.all;
entity sd_bd is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        we_m            : in     vl_logic;
        dat_in_m        : in     vl_logic_vector(15 downto 0);
        free_bd         : out    vl_logic_vector(4 downto 0);
        re_s            : in     vl_logic;
        ack_o_s         : out    vl_logic;
        a_cmp           : in     vl_logic;
        dat_out_s       : out    vl_logic_vector(15 downto 0)
    );
end sd_bd;
