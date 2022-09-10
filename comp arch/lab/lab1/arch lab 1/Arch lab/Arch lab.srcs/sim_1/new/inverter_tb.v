`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2022 03:46:36 PM
// Design Name: 
// Module Name: inverter_tb
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


module inverter_tb(
    
    );
    
    reg in;
    wire out;
    inverter inv(in, out);
    initial begin
     in =0; 
     #10 
     in =1;
    end
endmodule
