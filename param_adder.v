`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2020 03:49:37 PM
// Design Name: 
// Module Name: param_adder
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


module param_adder
         #(parameter N = 4) 
         ( output cout,
           output [N-1:0] sum,
           input [N-1:0] a,
           input [N-1:0] b,
           input c_in
          );
           
    genvar i;
    
    wire [N-1:0] c_out;
    
    FA_str FA_intermediate(c_out[0], sum[0], a[0], b[0], c_in);
    
    generate 
        for (i = 1; i < N; i = i + 1)
            begin
                FA_str fa0(c_out[i], sum[i], a[i], b[i], c_out[i-1]);
            end
    endgenerate
    
    assign cout = c_out[N-1];
    
endmodule
