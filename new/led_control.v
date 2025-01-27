`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:58:39 11/26/2024 
// Design Name: 
// Module Name:    led_control 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module led_control ( input clk,
    input [4:0] slots_normal,
    input [4:0] slots_handicapped,
    output reg led_green_normal,
    output reg led_red_normal,
    output reg led_green_handicapped,
    output reg led_red_handicapped
);

    // Always block triggered on the rising edge of the clock
	 always @(posedge clk) begin
          // Control LEDs for normal parking slots
        if (slots_normal > 0) begin
            led_green_normal = 1; // Green LED ON when normal slots are available
            led_red_normal = 0;  // Red LED OFF
        end else begin
            led_green_normal = 0; // Green LED OFF when normal slots are full
            led_red_normal = 1; // Red LED ON
        end

        // Control LEDs for handicapped parking slots
        if (slots_handicapped > 0) begin
            led_green_handicapped = 1; // Green LED ON when handicapped slots are available
            led_red_handicapped = 0;  // Red LED OFF
        end else begin
            led_green_handicapped = 0; // Green LED OFF when handicapped slots are full
            led_red_handicapped = 1;  // Red LED ON
        end
    end
endmodule
