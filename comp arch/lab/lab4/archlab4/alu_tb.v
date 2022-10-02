`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 03:24:31 PM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;
    reg[31:0] A;
    reg[31:0] B;
    wire[31:0] C;
    reg[3:0] s;
    wire zeroF;
    alu ii (s, A, B,C,zeroF);
    initial begin
     s <= 0;
     A <= 32;
     B <= 31;
    end
    
    initial begin
    
    #20
    s = 1;
    #20 
    s = 0;
    #20 
    s = 6;
    #20 
    s = 4;
    end
    
endmodule
