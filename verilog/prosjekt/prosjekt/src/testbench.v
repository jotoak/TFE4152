//-----------------------------------------------------------------------------
//
// Title       : testbench
// Design      : prosjekt
// Author      : jonas.tornes@gmail.com
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : C:\Users\jonas\OneDrive - NTNU\TFE4152\Prosjekt\prosjekt\prosjekt\src\testbench.v
// Generated   : Fri Nov 13 11:30:14 2020
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
//{module {testbench}}
module testbench ();
	logic Init;
	logic Reset;
	logic Exp_decrease;
	logic Exp_increase;
	logic Clk;
	logic NRE_R1;
	logic NRE_R2;
	logic ADC;
	logic Expose;
	logic Erase;
	
	fsm_total test(Init,Clk,Reset,Exp_decrease,Exp_increase,NRE_R1,NRE_R2,ADC,Expose,Erase);
	initial begin
		Clk=0;	#3;	  
		Reset=1;#3; 
		Reset=0; #1;
		Exp_increase=1; #10;
		Exp_increase=0; #1;
		Exp_decrease= 1; #2;
		Exp_decrease=0; #1;
		Init=1; #1;
		Init=0; #1;
		Reset=1; #1;
		Reset=0; #1;
		end
	always
		#0.5 Clk=!Clk;
	initial
		#60 $finish;
		
//}} End of automatically maintained section

// -- Enter your statements here -- //

endmodule
