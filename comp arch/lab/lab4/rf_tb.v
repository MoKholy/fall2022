`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 04:06:11 PM
// Design Name: 
// Module Name: rf_tb
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


module rf_tb;
reg clk;
reg rst;
reg[4:0] R1;
reg[4:0] R2;
reg[4:0] W;
reg[31:0]data;
reg regwrite;
wire[31:0]o1;
wire[31:0] o2;


RF rf(clk, rst, R1, R2, W, data, regwrite, o1, o2);
always #20 clk = ~clk;



initial begin 

    clk <= 0;
    rst <= 1;
    R1 <= 0;
    R2 <= 0;
    W <= 0;
    data <= 4;
    regwrite <= 0;
    
#20
regwrite =1;
rst = 0;
R1 = 1;
R2 = 2;
#20
W = 1;
#20
W=2;




end




















endmodule
