`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2020 04:43:07 PM
// Design Name: 
// Module Name: shift_left_sixteen
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


module shift_left_sixteen(in, out);
parameter size = 16;

input [size-1:0] in;
output [31:0] out;

assign out = {in[size - 1:0], 16'd0};
endmodule
