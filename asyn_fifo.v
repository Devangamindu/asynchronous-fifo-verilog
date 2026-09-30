`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 12:55:07
// Design Name: 
// Module Name: asyn_fifo
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


module asyn_fifo(
input wr_clk,rd_clk,rst,wr_en,rd_en,
input [7:0] din,
output reg [7:0] dout,
output  full,empty
    );
reg [7:0] mem [0:15];
reg [4:0]wr_ptr,rd_ptr,wr_gray,rd_gray;
wire [4:0] wr_ptr_next,wr_gray_next;
reg [4:0] rd_gray_sync1, rd_gray_sync2;
reg [4:0] wr_gray_sync1, wr_gray_sync2;
assign full=(wr_gray_next =={~rd_gray_sync2[4:3],rd_gray_sync2[2:0]});
assign empty= (rd_gray==wr_gray_sync2);
assign wr_ptr_next  = wr_ptr + 1;
assign wr_gray_next = wr_ptr_next ^ (wr_ptr_next >> 1);
always @(posedge wr_clk) begin
 if (rst)begin
   wr_ptr<=0;
   wr_gray<=0;
 end
 else if(wr_en==1 && !full) begin
      mem[wr_ptr[3:0]]<=din;
      wr_ptr<=wr_ptr+1;
      wr_gray<=(wr_ptr+1)^((wr_ptr+1)>>1);
  end
end
always @(posedge rd_clk) begin
  if(rst) begin
    rd_ptr<=0;
    dout<=0;
    rd_gray<=0;
  end
  else if(rd_en==1 && !empty) begin
     dout<=mem[rd_ptr[3:0]];
     rd_ptr<=rd_ptr+1;
     rd_gray<=(rd_ptr+1)^((rd_ptr+1)>>1);
  end
end
always @(posedge wr_clk) begin
   if(rst) begin
      rd_gray_sync1 <= 0;
      rd_gray_sync2 <= 0;
   end
   else begin
      rd_gray_sync1 <= rd_gray;
      rd_gray_sync2 <= rd_gray_sync1;
   end
end
always @(posedge rd_clk) begin
   if(rst) begin
      wr_gray_sync1 <= 0;
      wr_gray_sync2 <= 0;
   end
   else begin
      wr_gray_sync1 <= wr_gray;
      wr_gray_sync2 <= wr_gray_sync1;
   end
end

endmodule
