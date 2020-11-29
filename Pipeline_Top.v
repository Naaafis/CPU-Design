`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2020 08:00:08 PM
// Design Name: 
// Module Name: Pipeline_Top
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


module Pipeline_Top(
    input       clk,
    input       reset,
    input [31:0] InstrIn,
    input    WriteEnable,
    output [31:0] ALUOut
    );
    
    // The naming format for wire: Destination_portname
    
    wire [4:0]  S1_RS1;
    wire [4:0]  S1_RS2;
    wire [15:0] S1_IMM;
    wire        S1_DS;
    wire [2:0]  S1_ALUOP;
    wire [4:0]  S1_WS;
    wire        S1_WE;
    
    //Wires for the S1 to register file logic
    wire [4:0] regfile_RS1;
    wire [4:0] regfile_RS2;
    
    //Wires for the S2 stage
    wire [31:0] S2_RD1;
    wire [31:0] S2_RD2;
    wire [15:0] S2_IMM;
    wire        S2_DS;
    wire [2:0]  S2_ALUOP;
    wire [4:0]  S2_WS;
    wire        S2_WE;
    
    //Wires for the S2 to ALU(ish) logic
    wire [31:0] ALU_RD1;
    wire [31:0] MUX_RD2;
    wire [15:0] MUX_IMM;
    wire        MUX_DS;
    wire [31:0] ALU_MUXOUT;
    wire [2:0]  ALU_ALUOP;
    
    //Wires for the S3 stage
    wire [31:0] S3_ALUOut;
    wire [4:0]  S3_WS;
    wire        S3_WE;
    
    //Wires for final write back
    wire [4:0] WB_WS;
    wire       WB_WE;
    
    instruction_decode dec(
        .InstrIn(InstrIn),
        .S1_RS1(S1_RS1),
        .S1_RS2(S1_RS2),
        .S1_IMM(S1_IMM),
        .S1_DS(S1_DS),
        .S1_ALUOP(S1_ALUOP),
        .S1_WS(S1_WS)
    );

    //Instantiate registers between stages 1 and 2
    stage1_register S1_Reg(
        S1_RS1,
        S1_RS2,
        S1_IMM,
        S1_DS,
        S1_ALUOP,
        S1_WS,
        WriteEnable,
        clk,
        reset,
        RS1_out,
        RS2_out,
        IMM1_out,
        DS1_out,
        ALUOP1_out,
        WS1_out,
        WE1_out
   );
           
    //Instantiate the register file
    nbit_register_file Register_File (
        ALUOut_out,
        read_data_1,
        read_data_2, 
        RS1_out, 
        RS2_out,
        WS3_out, 
        WE3_out, 
        reset, 
        clk
    );
    
   //Instantiate registers between stages 2 and 3
   stage2_register S2_Reg(
        read_data_1,
        RD2_in,
        IMM1_out,
        DS1_out,
        ALUOP_out,
        WS1_out,
        WE1_out,
        clk,
        reset,
        RD2_1_out,
        RD2_2_out,
        IMM2_out,
        DS2_out,
        ALUOP2_out,
        WS2_out,
        WE2_out
   );
   
   //Instatiate the MUX
   two_to_one_mux ttom(
        RD2_2_out,
        IMM2_out,
        DS2_out,
        mux_out
   );
   
   //Instantiate the ALU
   Ideal_ALU ALU(
        RD2_1_out, 
        mux_out, 
        alu_out, 
        ALUOP2_out
   );
   
   //Instantiate registers between stages 3 and 4
   stage3_register S3_Reg(
		alu_out,
		WS2_out,
		WE2_out,
		clk,
		reset,
		ALUOut_out,
		WS3_out,
		WE3_out
   );
   
endmodule
