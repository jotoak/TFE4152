//-----------------------------------------------------------------------------
//
// Title       : Time_counter
// Design      : prosjekt
// Author      : jonas.tornes@gmail.com
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : c:\My_Designs\prosjekt\prosjekt\src\Time_counter.v
// Generated   : Tue Nov 10 10:53:45 2020
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

//{{ Section below this comment is automatically maintained
//   and may be overwritten
//{module {Time_counter}}
module Time_counter (Start,Initial,Reset,Clk,TF);
	input wire Start;
	input reg [4:0] Initial;
	input wire Reset;
	input wire Clk;
	output logic TF;
	reg[4:0] count_reg;
	initial count_reg=0;
		
	typedef enum logic[1:0]{Base,Count}statetype;
	statetype state, nextstate;
	
	always@(posedge Clk) begin
		if(Reset) state=Base;
		else state=nextstate;
		case(state)
			Base:begin
				TF=0;
				if(Start)nextstate=Count;
				
				else nextstate=Base;
			end
		Count:begin
			if(count_reg==Initial-1)begin
				TF=1;
				nextstate=Base;
			end
			else count_reg=count_reg+1;
		 end
	endcase 	
	end

//}} End of automatically maintained section

// -- Enter your statements here -- //

endmodule
