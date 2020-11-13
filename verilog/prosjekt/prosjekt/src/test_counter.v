//-----------------------------------------------------------------------------
//
// Title       : test_counter
// Design      : prosjekt
// Author      : jonas.tornes@gmail.com
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : C:\Users\jonas\OneDrive - NTNU\TFE4152\Prosjekt\prosjekt\prosjekt\src\test_counter.v
// Generated   : Fri Nov 13 12:49:21 2020
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
//{module {test_counter}}
module test_counter ();
	
	reg Exp_increase;
	reg Exp_decrease;
	reg Clk;
	reg Reset;
	wire[4:0] EX_time;

	ctrl_expose reg_time(Exp_decrease,Exp_increase,Clk,Reset,EX_time);
	
	initial begin
		Clk=0; #1;
		Reset=0; #1;
		Exp_increase=0;#1;
		Exp_decrease=0;	#1;
		Reset = 1; #2;
		Reset = 0;
		Exp_increase = 1; #30
		Exp_increase = 0; 
		Exp_decrease = 1; #32;
		
	end
	always
		#0.5 Clk=!Clk;
	initial
		#80 $finish;
	

//}} End of automatically maintained section

// -- Enter your statements here -- //

endmodule
