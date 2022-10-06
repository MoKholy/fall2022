`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 04:31:01 PM
// Design Name: 
// Module Name: CU
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


module CU(input [4:0] in, output reg branch, MemRead, MemtoReg,  MemWrite, ALUsrc, RegWrite, output reg [1:0] ALUOp);
always@(*)begin
branch =  (in == 24) ;
MemRead  = (in==0); 
MemtoReg  = (in==0);
MemWrite = (in ==8);
if(in == 24) ALUOp = 2'b01;
else if(in==12) ALUOp = 2'b10;
else ALUOp = 2'b00;
ALUsrc = ((in==0) || (in==8));
RegWrite = ((in==24)|| (in==0));
 
end
endmodule
