`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2020 02:09:09 PM
// Design Name: 
// Module Name: param_mov
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


module param_mov
    #(parameter N = 4)
    (input [N-1:0] a,
     output [N-1:0] out
     );
     
     genvar i;
    generate 
        for (i = 0; i < N; i = i + 1)
            begin
                mov_str ms0(a[i], out[i]);
            end
    endgenerate
endmodule
