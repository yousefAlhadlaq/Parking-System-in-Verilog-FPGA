`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:22:23 11/26/2024 
// Design Name: 
// Module Name:    Smart_Parking_System 
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
module Smart_Parking_System (input Sysclk,reset, entry_normal, exit_normal, entry_handicapped,exit_handicapped,output[7:0] seg,
output [7:0] an, output led_green_normal, output led_red_normal, output led_green_handicapped, output led_red_handicapped );
	wire cleanexit_ha, cleanentry_ha, cleanexit, cleanentry;
	// Debounce for normal car entry
	debounce(Sysclk, entry_normal, cleanentry);
	// Debounce for normal car exit
	debounce(Sysclk, exit_normal, cleanexit);
	// Debounce for handicapped car entry
	debounce(Sysclk, entry_handicapped, cleanentry_ha);
	// Debounce for handicapped car exit
	debounce(Sysclk, exit_handicapped, cleanexit_ha);
    // Internal signals
    wire [4:0] slots_normal;
    wire [4:0] slots_handicapped; 
    // Normal Parking Counter
    Normal_Parking_counter  normal_counter (Sysclk,reset,cleanentry,cleanexit,slots_normal);
    // Handicapped Parking Counter
    Handicapped_Parking_counter  handicapped_counter (Sysclk,reset,cleanentry_ha,cleanexit_ha,slots_handicapped);
    DISP7SEG(Sysclk,slots_normal%10,slots_normal /10,D2,D3,slots_handicapped,D5,D6,D7,seg,an);
    // LED Control
    led_control(Sysclk, slots_normal, slots_handicapped, led_green_normal, led_red_normal, led_green_handicapped, led_red_handicapped);
endmodule 