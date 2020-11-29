`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:39:32 03/21/2017 
// Design Name: 
// Module Name:    discussion_tb 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////
module discussion_tb;

   // Inputs
   reg clk;
   reg Reset;
   reg LoadInstructions;
   reg [31:0] Instruction;
   
   // Outputs
   wire [31:0] out;
   
   // Instantiate the Unit Under Test (UUT)
   CPU uut (
            .out(out), 
            .clk(clk), 
            .Reset(Reset), 
            .LoadInstructions(LoadInstructions), 
            .Instruction(Instruction)
            );
   
   initial begin
      // Initialize Inputs
      clk = 0;
      Reset = 1;
      LoadInstructions = 0;
      Instruction = 0;
      #10;
      
      Reset = 0;
      LoadInstructions = 1;
      // #10;
      // 0
      
      Instruction = 32'b100011_00000_01010_0000000001100100;   // LW $R10, 100(R0)
      #10; // -10
      Instruction = 32'b100011_00000_01100_0000000001111000;   // LW $R12, 120(R0)
      #10; // -9
      Instruction = 32'b100011_00000_01001_0000000001011010;   // LW $R9, 90(R0)
      #10; // -8
      Instruction = 32'b100011_00000_01000_0000000001010000;   // LW $R8, 80(R0)
      #10; // -7
      Instruction = 32'b100011_00000_00010_0000000000010100;   // LW $R2, 20(R0)
      #10; // -6
      Instruction = 32'b100011_00000_01011_0000000001101110;   // LW $R11, 110(R0)
      #10; // -5
      Instruction = 32'b100011_00000_00111_0000000001000110;   // LW $R7, 70(R0)
      #10; // -4
      #10;
      #10;
      #10;
      #10;
      #10;
      #10;
      
      Instruction = 32'b000000_00111_01100_01000_00000_100000; // add R8, R7, R12 // should be 190
      #10;
      Instruction = 32'b000000_00111_00010_01000_00000_100000; // add R8, R7, R2 // should be 190
      #10;
      Instruction = 32'b000000_01000_00010_01001_00000_100000; // add R9, R8, R2 // should be 210 (190 + 20) but w/ hazard it is 100 (80 + 20) replace 80 w/ 190
      #10; // -2
      Instruction = 32'b000000_01011_00010_01010_00000_100000; // add R10, R11, R2 // should be 130, is 130
      #10; // -1
      Instruction = 32'b000000_01001_00010_01111_00000_100000; // add R15, R9, R2 // should be 150, is 90
      #10; // -1.5
      Instruction = 32'b000000_01010_00010_01100_00000_100000; // add R12, R10, R2 // should be 150 (130 + 20) but w/ hazard is 120 (100 + 20) replace 100 w/ 130
      #10; // 0
      
      Instruction = 32'b000100_01010_00010_01100_00000_100000; // beq R12, 130
      #10; // 0
      
      Instruction = 32'b001000_00000_00001_0000000110100111; // addi $R1, $0, 423
      #10; // 1                                              // -> 423
      Instruction = 32'b001000_00000_00010_0000000001011100; // addi $R2, $0, 92
      #10; // 2                                              // -> 92
      Instruction = 32'b001000_00000_00011_0000000000001101; // addi $R3, $0, 13
      #10; // 3                                              // -> 13
      Instruction = 32'b001000_00000_00100_0000000010010010; // addi $R4, $0, 146
      #10; // 4                                              // -> 146
      Instruction = 32'b001000_00000_00101_0000000000000101; // addi $R5, $0, 5
      #10; // 5                                              // -> 5
      Instruction = 32'b000000_00001_00100_00101_00000_100000; // add $R5, $R1, $R4
      #10; // 6                                             // -> 569 (423 if wrong)
      Instruction = 32'b000000_00011_00101_00110_00000_101010; // slt $R6, $R3, $R5
      #10; // 7                                                // -> 1 (0 if wrong)
      Instruction = 32'b100011_00000_00100_0000000000000100;   // LW $R4, 4(R0)
      #10; // 8                                                // -> 4
      Instruction = 32'b000000_00100_00110_00111_00000_100010; // sub $R7, $R4, $R6
      #10; // 9                                         // -> 3 (146 or 145 if wrong)
      Instruction = 32'b101011_00000_00111_0000000000000000;   // SW $R7, 0(R0)
      #10; // 10
      Instruction = 32'b000000_00111_00010_01000_00000_100000; // add R8, R7, R2
      #10; //
      #10;
      #10;
      #10;
      
      Instruction = 32'b000000_00111_00010_01000_00000_100000; // add R8, R7, R2
      #10; // -3
      Instruction = 32'b000000_01000_00010_01001_00000_100000; // add R9, R8, R2
      #10; // -2
      Instruction = 32'b000000_01011_00010_01010_00000_100000; // add R10, R11, R2
      #10; // -1
      Instruction = 32'b000000_01001_00010_01100_00000_100000; // add R12, R9, R2
      #10; // -1
		
      LoadInstructions = 0;
      Reset = 1;
      #10;
		
      Reset = 0;
      #100;
      
   end
	
   always begin
      #5;
      clk = ~clk;
   end
   
endmodule
