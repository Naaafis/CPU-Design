`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2020 08:57:50 PM
// Design Name: 
// Module Name: 2to1_mux
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


module two_to_one_mux(
    input [31:0] firstIn,
    input [15:0] secondIn,
    input       select,
    output [31:0] out
    );
    
    assign out = (select) ? {16'b0, secondIn} : firstIn;
    
endmodule
