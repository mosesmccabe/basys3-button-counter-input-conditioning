`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2026 11:25:15 AM
// Design Name: 
// Module Name: button_counter_top
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



module button_counter_top #(
    parameter integer STABLE_CYCLES = 1_000_000
)(
    input  logic       clk,
    input  logic       rst,
    input  logic       button_async,
    output logic [3:0] count
);

    logic sync_button;
    logic debounced_button;
    logic button_pulse;

    // 1. Synchronize asynchronous button
    sync_2ff SYNC (
        .clk      (clk),
        .async_in (button_async),
        .sync_out (sync_button)
    );

    // 2. Remove mechanical contact bounce
    debounce #(
        .STABLE_CYCLES(STABLE_CYCLES)
    ) DEBOUNCE (
        .clk           (clk),
        .rst           (rst),
        .sync_in       (sync_button),
        .debounced_out (debounced_button)
    );

    // 3. Convert clean button level to one-cycle event
    edge_detect EDGE (
        .clk          (clk),
        .rst          (rst),
        .debounced_in (debounced_button),
        .pulse        (button_pulse)
    );

    // 4. Increment once per valid button press
    counter4 COUNTER (
        .clk   (clk),
        .rst   (rst),
        .en    (button_pulse),
        .count (count)
    );

endmodule
