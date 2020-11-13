//-----------------------------------------------------------------------------
//
// Title       : teset_fsm
// Design      : prosjekt
// Author      : jonas.tornes@gmail.com
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : C:\Users\jonas\OneDrive - NTNU\TFE4152\Prosjekt\prosjekt\prosjekt\src\teset_fsm.v
// Generated   : Fri Nov 13 13:35:10 2020
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
//{module {teset_fsm}}
module teset_fsm ();
	logic Init;
	logic Clk;
	logic Reset;
	logic Done;
	logic TF;
	
	
	fsm k(Init,Clk,Reset,NRE_R1,NRE_R2,ADC,Expose,Erase,Done,Start,TF);
	
	initial begin
		Clk=0; #1;
		Init=0; #1;
		Reset=1; #1;
		Reset=0; #1;
		Init=1; #10;
		
		Init=0; #40;
		Reset=1; #15;
		Reset=0; #1;
		TF=1; 
	end
	always
		#0.5 Clk=!Clk;
	initial 
		#100 $finish;
		
	

//}} End of automatically maintained section

// -- Enter your statements here -- //

endmodule
