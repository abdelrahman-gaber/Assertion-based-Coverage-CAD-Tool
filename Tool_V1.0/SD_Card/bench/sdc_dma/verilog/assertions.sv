module assertions (wb_we_i, wb_adr_i, clk_divider, power_control, CMD_line, RSP_line, cmd_oe_en, clk, clksd);

//integer file ;
bit z =0;

input wb_we_i, clk, clksd ;
input [7:0] wb_adr_i, clk_divider, power_control;
input CMD_line;
input RSP_line;
input cmd_oe_en;
//assign cmd_oe_en=sd_controller_top_tb.sd_controller_top_0.sd_cmd_oe_o ;


//////////////////// Properties of covergroup WB_Interf //////////////////////
// coverpoint: Reg_Access
property arguments;
@(negedge clk && wb_we_i) (wb_adr_i == 8'h00) |-> z == 0;
endproperty

property command;
@(negedge clk && wb_we_i) (wb_adr_i == 8'h04) |-> z == 0;
endproperty

property block;
@(negedge clk && wb_we_i) (wb_adr_i == 8'h20) |-> z == 0;
endproperty

 property resp1;
 @(negedge clk && wb_we_i) (wb_adr_i == 8'h0c) |-> z == 0;
 endproperty

property software;
@(negedge clk && wb_we_i) (wb_adr_i == 8'h28) |-> z == 0;
endproperty

property timeout;
@(negedge clk && wb_we_i) (wb_adr_i == 8'h2c) |-> z == 0;
endproperty

property controller;
@(negedge clk && wb_we_i) (wb_adr_i == 8'h1c) |-> z == 0;
endproperty

property normal_iser;
@(negedge clk && wb_we_i) (wb_adr_i == 8'h38) |-> z == 0;
endproperty

property error_iser;
@(negedge clk && wb_we_i) (wb_adr_i == 8'h3c) |-> z == 0;
endproperty

property capa;
@(negedge clk && wb_we_i) (wb_adr_i == 8'h48) |-> z == 0;
endproperty

property bd_status;
@(negedge clk && wb_we_i) (wb_adr_i == 8'h50) |-> z == 0;
endproperty

property bd_isr;
@(negedge clk && wb_we_i) (wb_adr_i == 8'h54) |-> z == 0;
endproperty

property bd_iser;
@(negedge clk && wb_we_i) (wb_adr_i == 8'h58) |-> z == 0;
endproperty

property bd_rx;
@(negedge clk && wb_we_i) (wb_adr_i == 8'h60) |-> z == 0;
endproperty

property bd_tx;
@(negedge clk && wb_we_i) (wb_adr_i == 8'h80) |-> z == 0;
endproperty


// coverpoint: CLK_DIV 
property DIV2;
@(negedge clk) (wb_we_i&&(wb_adr_i==8'h4c)) |-> (clk_divider == 8'd0) |-> z == 0;
endproperty

property DIV4;
@(negedge clk) (wb_we_i&&(wb_adr_i==8'h4c)) |-> (clk_divider == 8'd1) |-> z == 0;
endproperty

property DIV6;
@(negedge clk) (wb_we_i&&(wb_adr_i==8'h4c)) |-> (clk_divider == 8'd2) |-> z == 0;
endproperty


// coverpoint: PWR_CTR
property V2;
@(negedge clk) (wb_we_i&&(wb_adr_i==8'h24)) |-> (power_control == 8'd7) |-> z == 0 ;
endproperty

property V1;
@(negedge clk) (wb_we_i&&(wb_adr_i==8'h24)) |-> (power_control == 8'd6) |-> z == 0 ;
endproperty

property V0;
@(negedge clk) (wb_we_i&&(wb_adr_i==8'h24)) |-> (power_control == 8'd5) |-> z == 0 ;
endproperty




//////////////////// Assertions of covergroup WB_Interf //////////////////////
// coverpoint: Reg_Access
arguments_as: assert property (arguments) $fdisplay(sd_controller_top_tb.file, "Reg_Access: arguments passed") ; //$fdisplay ("argument passed");
         else $fdisplay(sd_controller_top_tb.file, "Reg_Access: arguments failed");  //else $fdisplay(" argument failed");

command_as: assert property (command)  $fdisplay(sd_controller_top_tb.file,"Reg_Access: command passed") ; 
         else $fdisplay(sd_controller_top_tb.file,"Reg_Access: command_as failed"); 

block_as: assert property (block)  $fdisplay(sd_controller_top_tb.file,"Reg_Access: block passed") ; 
         else $fdisplay(sd_controller_top_tb.file,"Reg_Access: block failed"); 

resp1_as : assert property (resp1 )  $fdisplay(sd_controller_top_tb.file,"Reg_Access: resp1 passed") ; 
         else $fdisplay(sd_controller_top_tb.file,"Reg_Access: resp1 failed"); 

software_as : assert property (software)  $fdisplay(sd_controller_top_tb.file,"Reg_Access: software passed") ; 
         else $fdisplay(sd_controller_top_tb.file,"Reg_Access: software failed"); 

timeout_as : assert property (timeout)  $fdisplay(sd_controller_top_tb.file,"Reg_Access: timeout passed") ; 
         else $fdisplay(sd_controller_top_tb.file,"Reg_Access: timeout failed"); 

controller_as : assert property (controller)  $fdisplay(sd_controller_top_tb.file,"Reg_Access: controller passed") ; 
         else $fdisplay(sd_controller_top_tb.file,"Reg_Access: controller failed"); 


normal_iser_as : assert property (normal_iser)  $fdisplay(sd_controller_top_tb.file,"Reg_Access: normal_iser passed") ; 
         else $fdisplay(sd_controller_top_tb.file,"Reg_Access: normal_iser failed"); 

error_iser_as : assert property (error_iser)  $fdisplay(sd_controller_top_tb.file,"Reg_Access: error_iser passed") ; 
         else $fdisplay(sd_controller_top_tb.file,"Reg_Access: error_iser failed"); 

capa_as : assert property (capa)  $fdisplay(sd_controller_top_tb.file,"Reg_Access: capa passed") ; 
         else $fdisplay(sd_controller_top_tb.file,"Reg_Access: capa failed"); 

bd_status_as : assert property (bd_status)  $fdisplay(sd_controller_top_tb.file,"Reg_Access: bd_status passed") ; 
         else $fdisplay(sd_controller_top_tb.file,"Reg_Access: bd_status failed"); 

bd_isr_as : assert property (bd_isr)  $fdisplay(sd_controller_top_tb.file,"Reg_Access: bd_isr passed") ; 
         else $fdisplay(sd_controller_top_tb.file,"Reg_Access: bd_isr failed"); 

bd_iser_as : assert property (bd_iser)  $fdisplay(sd_controller_top_tb.file,"Reg_Access: bd_iser passed") ; 
         else $fdisplay(sd_controller_top_tb.file,"Reg_Access: bd_iser failed"); 

bd_rx_as : assert property (bd_rx)  $fdisplay(sd_controller_top_tb.file,"Reg_Access: bd_rx passed") ; 
         else $fdisplay(sd_controller_top_tb.file,"Reg_Access: bd_rx failed"); 

bd_tx_as : assert property (bd_tx)  $fdisplay(sd_controller_top_tb.file,"Reg_Access: bd_tx passed") ; 
         else $fdisplay(sd_controller_top_tb.file,"Reg_Access: bd_tx failed"); 


// coverpoint: CLK_DIV 
clock_divider_as2: assert property (DIV2) $fdisplay(sd_controller_top_tb.file,"CLK_DIV: DIV2 passed") ; 
         else $fdisplay(sd_controller_top_tb.file,"CLK_DIV: DIV1 failed");   

clock_divider_as4: assert property (DIV4) $fdisplay(sd_controller_top_tb.file,"CLK_DIV: DIV4 passed") ; 
         else $fdisplay(sd_controller_top_tb.file,"CLK_DIV: DIV2 failed"); 

clock_divider_as6: assert property (DIV6) $fdisplay(sd_controller_top_tb.file,"CLK_DIV: DIV6 passed") ; 
         else $fdisplay(sd_controller_top_tb.file,"CLK_DIV: clock_divider_pr3 failed"); 


// coverpoint: PWR_CTR
power_control_as2: assert property (V2)  $fdisplay (sd_controller_top_tb.file,"PWR_CTR: V2 passed");
         else $fdisplay(sd_controller_top_tb.file,"PWR_CTR: V1 failed");

power_control_as1: assert property (V1)  $fdisplay (sd_controller_top_tb.file,"PWR_CTR: V1 passed");
         else $fdisplay(sd_controller_top_tb.file, "PWR_CTR: V2 failed");

power_control_as0: assert property (V0)  $fdisplay (sd_controller_top_tb.file, "PWR_CTR: V0 passed");
         else $fdisplay(sd_controller_top_tb.file, "PWR_CTR: power_control_pr3 failed");


endmodule

      