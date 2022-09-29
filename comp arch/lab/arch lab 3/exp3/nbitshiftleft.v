`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2022 01:55:31 PM
// Design Name: 
// Module Name: nbitshiftleft
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


module nbitshiftleft #(parameter N=8)(
    input[N-1:0] A,
    output[N-1:0] B
    );
    assign B = {A[N-2:0], 1'b0};
    
endmodule
