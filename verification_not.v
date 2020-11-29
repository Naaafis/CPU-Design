`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2020 07:02:10 PM
// Design Name: 
// Module Name: verification_not
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


module verification_not
     #(parameter N = 4)
    ( input [N-1:0] a,
      output [N-1:0] out
      );
      
      assign out = ~a;
      
endmodule
