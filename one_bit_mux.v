`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2020 03:50:18 PM
// Design Name: 
// Module Name: one_bit_mux
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


module one_bit_mux(
    sel, 
    in,
    out 
    );
    
    input sel;
    input in;
wire in_0 = in;
wire in_1 = ~in;

output out;

assign out = (sel) ? in_1 : in_0;
endmodule
