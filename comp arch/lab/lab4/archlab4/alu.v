`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 03:02:19 PM
// Design Name: 
// Module Name: alu
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


module alu(
    input[3:0] s,
    input [31:0] A, 
    input [31:0] B,
    output reg [31:0] C,
    output reg zeroF
    );
    reg [31:0] D;
    wire[31:0] temp;
    adder add(A, D, temp);
    always @ * begin
    if(s == 0) begin
    // and
    C = A&B;
    end
    else if(s==1) begin
    // or
    
    C = A | B;
    end
    else if(s == 6) begin
       D =(~B)+1; 
       C = temp;
       end
    else if (s==4) begin 
    D = B;
    C = temp;
    end
    else   C = 0;
    zeroF = C == 0;
   end 
   
   
    
endmodule
