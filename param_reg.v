`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2020 01:06:27 PM
// Design Name: 
// Module Name: param_reg
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


module param_reg 
    #(parameter N = 4) 
         ( output [N-1:0] q_param,
           input [N-1:0] d_param,
           input clk);
           
    genvar i;
    generate 
        for (i = 0; i < N; i = i + 1)
            begin
                dff df0(q_param[i], d_param[i], clk);
            end
    endgenerate 
                             
endmodule
