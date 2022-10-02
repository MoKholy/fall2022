`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 04:52:17 PM
// Design Name: 
// Module Name: ALUCU
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


module ALUCU(
    input [1:0] ALUOp,
    input [2:0] Inst,
    input Inst2,
    output reg [3:0] s
    );
    always @ * begin
    if ( ALUOp == 0) s = 2;
    else if(ALUOp == 1) s = 6;
    else if(ALUOp ==2 && Inst == 0 && Inst2 == 0) s =2;
    else if(ALUOp ==2 && Inst == 0 && Inst2 == 1) s = 6;
    else if(ALUOp ==2 && Inst == 7 && Inst2 == 0) s = 0;
    else if(ALUOp ==2 && Inst == 6 && Inst2 == 0) s = 1;
    
    end
    
    
endmodule
