`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 04:57:18 PM
// Design Name: 
// Module Name: ALUCU_tb
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


module ALUCU_tb;
    reg[1:0] ALUOp;
    reg[2:0] inst;
    reg inst2;
    wire[3:0] s;
    
    ALUCU alucu(ALUOp, inst, inst2, s);
    initial begin
    ALUOp <= 0;
    inst <= 0;
    inst2 <= 0;
    
    
    #20 
    ALUOp = 1;
    #20 
    ALUOp = 2;
    #20 
    inst2 = 1;
    #20 
    inst2 = 0;
    inst = 7;
    #20 
    inst = 6;
    
    
    
    
    
    end
endmodule
