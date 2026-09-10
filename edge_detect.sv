`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2026 10:36:44 AM
// Design Name: 
// Module Name: edge_detect
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


module edge_detect(
    input logic clk,
    input logic rst,
    input logic debounced_in,
    output logic pulse
    );
    
    logic prev;
    
    always_ff @(posedge clk) begin
        if (rst)
            prev <= 1'b0;
        else
            prev <= debounced_in;
    end
    
    assign pulse = debounced_in & ~prev;
    
endmodule
