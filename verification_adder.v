`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2020 06:50:43 PM
// Design Name: 
// Module Name: verification_adder
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


module verification_adder
    #(parameter N = 4)
    ( input [N-1:0] a,
      input [N-1:0] b,
      input c_in,
      output [N-1:0] sum,
      output c_out);
      
      assign {c_out, sum} = a + b + c_in;
      
endmodule
