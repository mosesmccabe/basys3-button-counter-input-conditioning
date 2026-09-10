`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2026 09:44:43 AM
// Design Name: 
// Module Name: sync_2ff
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


module sync_2ff(
    input logic clk,
    input logic async_in,
    output logic sync_out
    );
    
    logic sync_ff1;
    
    always_ff @(posedge clk) begin
        sync_ff1 <= async_in;
        sync_out <= sync_ff1;
    end
    
endmodule


