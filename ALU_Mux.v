`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2020 06:12:27 PM
// Design Name: 
// Module Name: ALU_Mux
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


module ALU_Mux(
    input[31:0] Read_Data2,
    input[15:0] Immediate,
    input select,
    output [31:0] R3  
);

wire [31:0] Intermediate_Immediate;
/*
assign Intermediate_Immediate[15:0] = Immediate[15:0];

assign Intermediate_Immediate[31:16] = Immediate[15] ? 16'd1: 16'd0;

assign R3 = (select == 1) ? Intermediate_Immediate : Read_Data2;
 */
assign R3 = (select == 1) ? {16'b0, Immediate} : Read_Data2;

endmodule
