module Coverage(clkw,clksd);
input clkw,clksd;
wire cmd_oe_en;
reg [5:0] command_index;
reg [7:0] wb_adr_i,clk_divider,power_control;
reg wb_we_i;
reg CMD_line;
reg RSP_line;
assign cmd_oe_en=sd_controller_top_tb.sd_controller_top_0.sd_cmd_oe_o ;
covergroup WB_Interf;
	option.per_instance=1;
	Reg_Access:coverpoint wb_adr_i iff(wb_we_i)
	{
		bins argument={8'h00};
		bins command={8'h04};
		//bins status={8'h08}; //
		bins resp1={8'h0c};  //
		bins controller={8'h1c};  //
		bins block={8'h20};
		//bins power={8'h24}; ////
		bins software={8'h28};
		bins timeout={8'h2c};  
		//bins normal_isr={8'h30};   //
		//bins error_isr={8'h34};  //
		bins normal_iser={8'h38};  //
		bins error_iser={8'h3c};  //
		bins capa={8'h48};    //
		//bins clock_d={8'h4c}; /////
		bins bd_status={8'h50};  //
		bins bd_isr={8'h54};  //
		bins bd_iser={8'h58}; //
		bins bd_rx={8'h60};  //
		bins bd_tx={8'h80};  //
	}



	CLK_DIV: coverpoint clk_divider iff(wb_we_i&&(wb_adr_i==8'h4c))
	{
		bins DIV2={8'd0};
		bins DIV4={8'd1};
		bins DIV6={8'd2};
	}
	
	PWR_CTR: coverpoint power_control iff(wb_we_i&&(wb_adr_i==8'h24))
	{
		bins V2={8'd7};
		bins V1={8'd6};
		bins V0={8'd5};
	}

endgroup

WB_Interf WBI;
//SD_Interf SDI;
initial
begin
	WBI=new;
	forever
	begin
		@(negedge clkw)
		begin
			wb_adr_i=sd_controller_top_tb.sd_controller_top_0.wb_adr_i ;
			wb_we_i=sd_controller_top_tb.sd_controller_top_0.wb_we_i;
			command_index=sd_controller_top_tb.sd_controller_top_0.wb_dat_i[13:8];
			clk_divider=sd_controller_top_tb.sd_controller_top_0.wb_dat_i[7:0];
			power_control=sd_controller_top_tb.sd_controller_top_0.wb_dat_i[7:0];	
			WBI.sample();
		end
	end
end

/*initial
begin
	SDI=new;
	forever
	begin
		@(negedge clksd)
		begin
			CMD_line=sd_controller_top_tb.sd_controller_top_0.sd_cmd_out_o;
			RSP_line=sd_controller_top_tb.sd_controller_top_0.sd_cmd_dat_i;
			SDI.sample();
		end
	end	
end*/				
endmodule