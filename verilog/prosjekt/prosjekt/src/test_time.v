//-----------------------------------------------------------------------------
//
// Title       : test_time
// Design      : prosjekt
// Author      : jonas.tornes@gmail.com
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : C:\Users\jonas\OneDrive - NTNU\TFE4152\Prosjekt\prosjekt\prosjekt\src\test_time.v
// Generated   : Fri Nov 13 12:14:58 2020
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
//{module {test_time}}
module test_time ();
	logic Start;
	reg [4:0] Initial;
	logic Reset;
	logic Clk;
	
	
	
	Time_counter con(Start,Initial,Reset,Clk,TF);
	initial begin
		Clk=0; #2;
		Reset=1; #1;
		Start=0; #3;
		Reset=0;#1
		Initial<=10; #1;
		Start=1; #4;
		Start=0; #10;
	end
	always
		#0.5 Clk=!Clk;
	initial
		#60 $finish;
		
//}} End of automatically maintained section

// -- Enter your statements here -- //

endmodule
