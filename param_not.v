`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2020 06:09:05 PM
// Design Name: 
// Module Name: param_not
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


module param_not
    #(parameter N = 4)
    (input [N-1:0] a,
     output [N-1:0] out
     );
     
     genvar i;
    generate 
        for (i = 0; i < N; i = i + 1)
            begin
                not_str ns0(a[i], out[i]);
            end
    endgenerate     
endmodule
