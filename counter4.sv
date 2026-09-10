`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2026 03:22:02 PM
// Design Name: 
// Module Name: counter4
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


module counter4(
    input logic rst,
    input logic en,
    input logic clk,
    
    output logic [3:0]count
    );
    
    always_ff @(posedge clk)begin
        if(rst)
            count <= 4'b0000;
        else if(en) 
            count <= count + 1'b1;
    end
endmodule
