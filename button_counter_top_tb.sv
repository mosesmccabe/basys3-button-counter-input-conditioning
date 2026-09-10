`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2026 11:55:38 AM
// Design Name: 
// Module Name: button_counter_top_tb
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

module button_counter_top_tb;

    logic clk;
    logic rst;
    logic button_async;
    logic [3:0] count;

    // Small debounce threshold for simulation
    button_counter_top #(
        .STABLE_CYCLES(5)
    ) DUT (
        .clk          (clk),
        .rst          (rst),
        .button_async (button_async),
        .count        (count)
    );

    // 100 MHz clock
    initial clk = 1'b0;
    always #5 clk = ~clk;

    initial begin

        // Initial state
        rst          = 1'b1;
        button_async = 1'b0;

        #20;
        rst = 1'b0;

        // ------------------------------------------------
        // Simulate ONE physical button press with bounce
        // ------------------------------------------------

        #17;
        button_async = 1'b1;

        #7;
        button_async = 1'b0;

        #6;
        button_async = 1'b1;

        #7;
        button_async = 1'b0;

        #9;
        button_async = 1'b1;   // finally settles HIGH

        // Hold button down
        #120;

        // Release button
        button_async = 1'b0;

        #120;

        $finish;
    end

endmodule