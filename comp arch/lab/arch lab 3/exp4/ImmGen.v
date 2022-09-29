`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2022 02:27:12 PM
// Design Name: 
// Module Name: ImmGen
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


module ImmGen(
    input[31:0] inst,
    output reg[31:0] gen_out
    );
    wire[1:0] mode;
    // beq -> mode = 0, lw-> mode = 1, sw-> mode = 2
    assign mode = inst[6]? 0: inst[5]?2: 1;
    always@* begin
        if(mode == 0) 
            gen_out <= {{20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0};
        else if(mode == 1)
            gen_out <= {{20{inst[31]}}, inst[31:20]};
        else
            gen_out <= {{20{inst[31]}}, inst[31:25], inst[11:7]};
    end
    
endmodule
