`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2020 03:45:33 PM
// Design Name: 
// Module Name: sub_str
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


module sub_str(output c_out, output sub, input a, input b, input c_in);
    wire n_b;
    
    not not_b(n_b, b);
    FA_str fulladder(c_out, sub, a, n_b, c_in);  
    
endmodule
