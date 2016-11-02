module bind_assertions;

bind sd_controller_top_tb assertions bindas1 (.wb_we_i(sd_controller_top_tb.sd_controller_top_0.wb_we_i),
 											     .wb_adr_i(sd_controller_top_tb.sd_controller_top_0.wb_adr_i), 
 												 .clk(sd_controller_top_tb.sd_controller_top_0.wb_clk_i),
 												 .clk_divider(sd_controller_top_tb.sd_controller_top_0.wb_dat_i),
 												 .power_control(sd_controller_top_tb.sd_controller_top_0.wb_dat_i),
 												 .clksd(sd_controller_top_tb.sd_controller_top_0.sd_clk_o_pad),
 												 .CMD_line(sd_controller_top_tb.sd_controller_top_0.sd_cmd_out_o),
 												 .RSP_line(sd_controller_top_tb.sd_controller_top_0.sd_cmd_dat_i),
 												 .cmd_oe_en(sd_controller_top_tb.sd_controller_top_0.sd_cmd_oe_o)
 												 );


endmodule