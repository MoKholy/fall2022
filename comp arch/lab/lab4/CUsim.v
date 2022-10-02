`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 04:35:56 PM
// Design Name: 
// Module Name: CUsim
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


module CUsim ;
reg [4:0] in ;
wire branch, MemRead, MemtoReg,  MemWrite, ALUsrc, RegWrite ;
wire [1:0] ALUOp;
CU  cii (in, branch, MemRead, MemtoReg, MemWrite, ALUsrc, RegWrite, ALUOp);
initial begin  
in  <= 01100 ;
#20 
in <= 00000;
#20 
in <= 01000;
#20 
in <= 11000;


end
endmodule
