`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2022 02:47:01 PM
// Design Name: 
// Module Name: ImmGen_tb
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


module ImmGen_tb;
    
    parameter clock_period = 10;
    reg[31:0] A;
    wire[31:0] B;
    ImmGen test(A, B);
    
    initial begin
        A <= 32'b0;
    end
    initial begin
    
    
    #(clock_period *2)
    // beq -> bit 6 = 1
    A = 'hfe940ce3;
    #(clock_period *2)
    // sw -> bit 6 = 0, bit 5= 1
    A = 'h00c2a123;
    #(clock_period *2)
    // lw -> bit 6 = 0, bit 5 = 0
    A = 'h00c02403;
    end
endmodule

