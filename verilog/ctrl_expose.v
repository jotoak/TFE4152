//-----------------------------------------------------------------------------
//
// Title       : ctrl_expose
// Design      : prosjekt
// Author      : jonas.tornes@gmail.com
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : c:\My_Designs\prosjekt\prosjekt\src\ctrl_expose.v
// Generated   : Tue Nov 10 10:46:26 2020
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
//{module {ctrl_expose}}
module ctrl_expose (Exp_decrease,Exp_increase,Clk,Reset);

	output reg[4:0] EX_time;
	input wire Exp_decrease;
	input wire Exp_increase;
	input wire Clk;
	input wire Reset;
	
	always_ff@(posedge Clk)begin
		if(Reset)EX_time=2;
		else if(Exp_decrease) begin
			if(EX_time>2) EX_time<=EX_time-1;
		end
		else if(Exp_increase) begin
			if(EX_time<30)EX_time<=EX_time+1;
		end
	end
	

//}} End of automatically maintained section

// -- Enter your statements here -- //

endmodule
