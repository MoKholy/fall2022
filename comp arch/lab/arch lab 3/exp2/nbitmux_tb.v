`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2022 01:44:47 PM
// Design Name: 
// Module Name: nbitmux_tb
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
    reg[N-1:0] B;
    reg[N-1:0] A;
    reg s;
    wire[N-1:0] C;
    nbit21mux #(N) test(A, B, s, C);
    
    initial begin
        A = 9'b101010101;
        B = 9'b010101010;
        s = 0;
    end
    
    initial begin
    
    #(clock_period *2)
    s=0;
    #(clock_period *2)
    s=1;
    
    end
    
endmodule

