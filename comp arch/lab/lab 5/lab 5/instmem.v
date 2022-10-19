`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2022 02:45:26 PM
// Design Name: 
// Module Name: instmem
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


module instmem (input [5:0] addr, output [31:0] data_out);
 reg [31:0] mem [0:63];
 assign data_out = mem[addr];
 initial begin 
 
 mem[0] = 0 ; 
 mem[1] = 1;
 mem[32] = 32;
 
 end
endmodule