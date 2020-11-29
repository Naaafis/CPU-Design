`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2020 06:01:05 PM
// Design Name: 
// Module Name: param_ALU
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


module param_ALU
    #(parameter N = 4)
    (
  input signed [N-1:0] R2, // a
  input signed [N-1:0] R3, // b
  input c_in,
  input [2:0] ALUOp,

  output signed [N-1:0] R1,
  output c_out
  );
    //wire [N-1:0] R1_intermediate_sub; 
    //wire cout_intermediate_sub;
    //wire [N-1:0] R1_intermediate;
    wire [N-1:0] cout_intermediate;
    // wire [N-1:0] num_one;
    wire c_in_intermediate;
    
    
    assign c_in_intermediate = ALUOp == 3'b011 ? 1'b1 : c_in;
    
    ALU_str ALU1(R2[0], R3[0], c_in_intermediate, ALUOp, R1[0], cout_intermediate[0]);
    //assign num_one[0] = 1;
    
    genvar i;
    generate 
        for (i = 1; i < N; i = i + 1)
            begin
                ALU_str ALU1(R2[i], R3[i], cout_intermediate[i-1], ALUOp, R1[i], cout_intermediate[i]);
                //assign num_one[i] = 0;
            end
    endgenerate
    
    assign c_out = cout_intermediate[N-1];
    
    /*
    param_adder sub1(cout_intermediate_sub, R1_intermediate_sub, R1_intermediate, num_one, cout_intermediate[N-1]);
    */
    
    
    //assign R1 =  R1_intermediate;
    
    /*
    FA_str FA_intermediate(c_out_sum_array[0], intermediate_add[0], R2[0], R3[0], c_in);
    
    genvar j;
    generate 
        for (j = 1; j < N; j = j + 1)
            begin
                FA_str fa1(c_out_sum_array[j], intermediate_add[j], R2[j], R3[j], c_out_sum_array[j-1]);
            end
    endgenerate
    
    assign c_out_sum = c_out_sum_array[N-1];
    
    
    
    

    //FA_str FA1(c_out_sum, intermediate_add, R2, R3, c_in);
    sub_str SA1(c_out_sub_intermediate, intermediate_intermediate_sub, R2, R3, c_in); // a + ~b
    FA_str SA2(c_out_sub, intermediate_sub, intermediate_intermediate_sub, num_one, c_out_sub_intermediate); // a + ~b + 1
    
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
   
    */
    
    
endmodule
