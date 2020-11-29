`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2020 04:27:45 PM
// Design Name: 
// Module Name: top_module
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


module top_module
    #(parameter N = 4)
     ( input [N-1:0] a,
       input [N-1:0] b,
       input c_in,
       input select, // 1 means do sum, 0 means do NOT
       input clk,
       output [N-1:0] outval,
       output cout
      );
      
      wire [N-1:0]  mux_values;
      
      wire [N-1:0] sumvalues;
      wire [N-1:0] notvalues;
      
      param_adder #(N) pa1(cout, sumvalues, a, b, c_in);
      param_not #(N) pn1(a,notvalues);
      
      assign mux_values = (select == 1) ? sumvalues : notvalues;
      
      param_reg #(N) pr1(outval, mux_values, clk);
      
endmodule
