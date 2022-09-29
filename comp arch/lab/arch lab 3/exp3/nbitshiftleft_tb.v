`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2022 02:00:38 PM
// Design Name: 
// Module Name: nbitshiftleft_tb
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


module nbitshiftleft_tb;
    parameter N = 9;
    parameter clock_period = 10;
    reg[N-1:0] A;
    wire[N-1:0] B;
    nbitshiftleft #(N) test(A, B);
    
    initial begin
        A <= 9'b111111111;
    end
    initial begin
    
    
    #(clock_period *2)
    A <= 9'b000000001;
    #(clock_period *2)
    A <= 9'b000000010;
    #(clock_period *2)
    A <= 9'b000000100;
    #(clock_period*2)
    A <= 9'b000001000;
    #(clock_period*2)
    A <= 9'b000010000;
    end
endmodule
