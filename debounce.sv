`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2026 09:59:15 AM
// Design Name: 
// Module Name: debounce
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


module debounce #(
        parameter integer STABLE_CYCLES = 1_000_000 // predefined threshold
    )(
        input logic clk,
        input logic rst,
        input logic sync_in,
        output logic debounced_out
    );
    
    localparam integer COUNT_WIDTH = $clog2(STABLE_CYCLES + 1);
    
    logic [COUNT_WIDTH -1:0]count;
    
    always_ff @(posedge clk) begin
        if (rst) begin
            count <= '0;
            debounced_out <= 1'b0;
        end
        else begin
            if (sync_in == debounced_out) begin
                count <= '0;
            end
            else begin
            // update debounced_out once the input remained stable for a predefined threshold
                if (count == STABLE_CYCLES - 1) begin 
                    debounced_out <= sync_in;
                    count <= '0;
                end
                else begin
                    count <= count + 1'b1;
                end
            end
        end
    end // end always block
    
endmodule
