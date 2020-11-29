`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2020 05:18:41 PM
// Design Name: 
// Module Name: Forwarding_unit
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


module Forwarding_unit(IdEx_rs, IdEx_rt, ExMem_rd, MemWb_rd, Mem_RegWrite, WB_RegWrite, ForwardA, ForwardB);
input [4:0] IdEx_rs;
input [4:0] IdEx_rt;
input [4:0] ExMem_rd;
input [4:0] MemWb_rd;
input Mem_RegWrite;
input WB_RegWrite;

output reg [1:0] ForwardA;
output reg [1:0] ForwardB;

/*
wire oneahead_rs;
wire oneahead_rt;
wire twoahead_rs;
wire twoahead_rt;

assign oneahead_rs = IdEx_rs == ExMem_rd ? 1 : 0;
assign oneahead_rt = IdEx_rt == ExMem_rd ? 1 : 0;
assign twoahead_rs = IdEx_rs == MemWb_rd ? 1 : 0;
assign twoahead_rt = IdEx_rt == MemWb_rd ? 1 : 0;

// just one ahead
assign ForwardA = oneahead_rs ? 10 : 00; 
assign ForwardB = oneahead_rt ? 10 : 00;

// just two ahead
assign ForwardA = twoahead_rs && ~oneahead_rs ? 01 : 00;
assign ForwardB = twoahead_rt && ~oneahead_rt ? 01 : 00;

// both one ahead and two ahead (take one ahead because it is the most recent one)
assign ForwardA = twoahead_rs && oneahead_rs ? 10 : 00;
assign ForwardB = twoahead_rt && oneahead_rt ? 10 : 00;
*/
always @(*) begin

assign ForwardA = 2'b00;
assign ForwardB = 2'b00;

if (ExMem_rd == IdEx_rs && Mem_RegWrite && ExMem_rd != 0)
    assign ForwardA = 2'b10;
if (ExMem_rd == IdEx_rt && Mem_RegWrite && ExMem_rd != 0)
    assign ForwardB = 2'b10;
if (ExMem_rd != IdEx_rs && MemWb_rd == IdEx_rs && WB_RegWrite && MemWb_rd != 0)
    assign ForwardA = 2'b01;
if (ExMem_rd != IdEx_rt && MemWb_rd == IdEx_rt && WB_RegWrite && MemWb_rd != 0)
    assign ForwardB = 2'b01;
if (ExMem_rd == IdEx_rs && MemWb_rd == IdEx_rs && MemWb_rd != 0 && Mem_RegWrite && ExMem_rd != 0)
    assign ForwardA = 2'b10;
if (ExMem_rd == IdEx_rt && MemWb_rd == IdEx_rt && MemWb_rd != 0 && Mem_RegWrite && ExMem_rd != 0)
    assign ForwardB = 2'b10;   
end
 
endmodule
