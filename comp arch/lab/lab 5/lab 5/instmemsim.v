`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2022 02:46:49 PM
// Design Name: 
// Module Name: instmemsim
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


module instmemsim ;
 reg [5:0]addr ;
    wire [31:0] data_out;
       instmem inn (addr, data_out) ;
     initial begin 
     addr = 0;
     #20 
     addr=1 ;
     #20 
     addr = 32 ;
     
     end
endmodule
