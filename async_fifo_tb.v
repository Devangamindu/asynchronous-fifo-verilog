`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2026 11:12:45
// Design Name: 
// Module Name: async_fifo_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module async_fifo_tb;
reg wr_clk,rd_clk,rst,wr_en,rd_en;
reg [7:0] din;
wire [7:0] dout;
wire full,empty;
asyn_fifo uut(.wr_clk(wr_clk),.rd_clk(rd_clk),.rst(rst),.wr_en(wr_en),.rd_en(rd_en),
.din(din),.dout(dout),.full(full),.empty(empty));
always #5 wr_clk = ~wr_clk;
always #7 rd_clk = ~rd_clk;
initial begin
   wr_clk = 0;
   rd_clk = 0;
   rst    = 1;
   wr_en  = 0;
   rd_en  = 0;
   din    = 0;#20;
   rst = 0;
   wr_en = 1;
   din = 8'd10; #10;
   din = 8'd20; #10;
   din = 8'd30; #10;
   din = 8'd40; #10;
   din = 8'd50; #10;
   din = 8'd60; #10;
   din = 8'd70; #10;
   din = 8'd80; #10;
   din = 8'd90; #10;
   din = 8'd100; #10;
   din = 8'd110; #10;
   din = 8'd120; #10;
   din = 8'd139; #10;
   din = 8'd140; #10;
   din = 8'd150; #10;
   din = 8'd160; #10;
   wr_en = 0;#180;
   rd_en = 1;#250;
   rd_en = 0;#50;
   $finish;
end
endmodule
