`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:23:33 11/27/2024 
// Design Name: 
// Module Name:    Handicapped_Parking_counter 
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
module Handicapped_Parking_counter #(parameter maximum=5,minimum=0)(input clk,reset,entry,exit,output reg [4:0] slots);

// Internal registers to store the previous states of entry and exit signals
reg entry_prev, exit_prev;

// Always block triggered on the rising edge of the clock or the reset signal
always @(posedge clk or posedge reset) begin
    if(reset)begin
	 	 // When reset is active, initialize the parking slots to the maximum capacity
        slots<=maximum;
		 // Reset the previous states of entry and exit signals to 0
        entry_prev<=0;
        exit_prev<=0;
    end   
    else begin
	 // If the exit signal is high and was not high in the previous clock cycle
    // and the number of slots is less than the maximum, increment the slots
        if(exit && !exit_prev && slots < maximum) 
                slots<= slots+1;
					 
		   // If the entry signal is high and was not high in the previous clock cycle
        // and the number of slots is greater than the minimum, decrement the slots
         if (entry && !entry_prev && slots > minimum)
            slots<= slots-1;
				
		// Update the previous states of the entry and exit signals	
        entry_prev<=entry;
        exit_prev<=exit;
    end
end
endmodule 
