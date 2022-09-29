`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2022 01:37:17 PM
// Design Name: 
// Module Name: nbit21mux
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


module nbit21mux #(parameter N=8) (
    input[N-1:0] A,
    input[N-1:0] B,
    input s,
    output[N-1:0] C
    );
    
    genvar i;
    generate begin
        for(i = 0; i < N; i = i+1) begin 
        mux m(A[i], B[i], s, C[i]);
        end
    end
    endgenerate
    
endmodule
