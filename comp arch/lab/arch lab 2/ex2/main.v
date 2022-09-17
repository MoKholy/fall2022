`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2022 03:12:31 PM
// Design Name: 
// Module Name: main
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


module main(
  input CLK100MHZ, 
 input [7:0] A,
 output  [3:0] AN, 
 output  [6:0] SEG 
    );
Four_Digit_Seven_Segment_Driver exp1(CLK100MHZ, A, AN, SEG);
endmodule
