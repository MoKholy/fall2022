`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2022 02:54:50 PM
// Design Name: 
// Module Name: datamem_tb
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


module datamem_tb;

reg clk, memread, memwrite;
reg[5:0] addr;
reg[31:0] data_in;
wire [31:0] data_out;
datamem dm(clk, memread, memwrite, addr, data_in , data_out );
always #20 clk = ~clk;
initial begin
clk = 0;
addr = 0;

// initial
memread = 0;
memwrite = 0;
data_in = 9;
#20  
memwrite = 1;
addr = 20;

#20
memwrite = 0;
memread = 1;
#20 
memwrite = 1;
addr = 30;
#20 
data_in = 30;








end
endmodule
