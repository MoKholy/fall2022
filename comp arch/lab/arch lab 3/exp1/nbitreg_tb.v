`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2022 01:06:24 PM
// Design Name: 
// Module Name: nbitreg_tb
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


module nbitreg_tb;
    parameter N = 9;
    parameter clock_period = 10;
    reg clk;
    reg rst;
    reg load;
    reg[N-1:0] D;
    wire[N-1:0] Q;
    
    nbitregister #(N) test(clk, load, rst, D, Q);
    always #20 clk=~clk;
    
    initial begin
        clk <= 0;
        load <=0;
        rst <= 0;
        D <= 9'b111111111;
    end
    initial begin
    
    
    #(clock_period *2)
    rst = 1;
    #(clock_period *2)
    rst = 0;
    #(clock_period *2)
    load = 1;
    D = 9'b100000000;
    end
    
    
    
    
    
    
    
    
    
    
    
endmodule
