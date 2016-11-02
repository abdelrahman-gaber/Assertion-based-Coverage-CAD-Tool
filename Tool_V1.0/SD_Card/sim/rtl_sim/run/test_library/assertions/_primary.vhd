library verilog;
use verilog.vl_types.all;
entity assertions is
    port(
        wb_we_i         : in     vl_logic;
        wb_adr_i        : in     vl_logic_vector(7 downto 0);
        clk_divider     : in     vl_logic_vector(7 downto 0);
        power_control   : in     vl_logic_vector(7 downto 0);
        CMD_line        : in     vl_logic;
        RSP_line        : in     vl_logic;
        cmd_oe_en       : in     vl_logic;
        clk             : in     vl_logic;
        clksd           : in     vl_logic
    );
end assertions;
