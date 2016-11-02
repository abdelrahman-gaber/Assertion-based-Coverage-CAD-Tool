library verilog;
use verilog.vl_types.all;
entity sd_clock_divider is
    port(
        CLK             : in     vl_logic;
        DIVIDER         : in     vl_logic_vector(7 downto 0);
        RST             : in     vl_logic;
        SD_CLK          : out    vl_logic
    );
end sd_clock_divider;
