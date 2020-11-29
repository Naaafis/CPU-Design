`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2020 04:21:01 PM
// Design Name: 
// Module Name: ALU_str
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


module ALU_str(
  input signed R2, // a
  input signed R3, // b
  input c_in,
  input [2:0] ALUOp,

  output reg R1,
  output reg c_out
  );
   // intermediate outputs. R1 will hold one of these  based on ALUop
   
    wire intermediate_mov;
    wire intermediate_not;
    wire intermediate_add;
    wire intermediate_sub;
    // wire intermediate_intermediate_sub;
    wire intermediate_or;
    wire intermediate_and;
    wire c_out_sum;
    wire c_out_sub;
    wire c_out_sub_intermediate; // c_out of a + ~b
    // wire num_one = 0;
    //wire c_in_intermediate = 1'b1;
    
    mov_str mov1(R2, intermediate_mov);
    not_str not1(R2, intermediate_not);
    FA_str FA1(c_out_sum, intermediate_add, R2, R3, c_in);
    
    sub_str SA1(c_out_sub, intermediate_sub, R2, R3, c_in); // a + ~b
    // FA_str SA2(c_out_sub, intermediate_sub, intermediate_intermediate_sub, num_one, c_out_sub_intermediate); // a + ~b + 1
    or_str os1(R2, R3, intermediate_or);
    and_str as1(R2, R3, intermediate_and);
    
    always @(*)begin
        
        case(ALUOp)
            3'b000: R1 = intermediate_mov;
            3'b001: R1 = intermediate_not;
            3'b010: 
                begin
                    R1 = intermediate_add;
                    c_out = c_out_sum;       
                end
            3'b011: 
                begin
                    R1 = intermediate_sub;
                    c_out = c_out_sub;
                end
            3'b100: R1 = intermediate_or;
            3'b101: R1 = intermediate_and;
            //3'b110: R1 = R2 < R3;
        endcase
    end
endmodule
