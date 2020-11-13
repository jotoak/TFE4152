//-----------------------------------------------------------------------------
//
// Title       : fsm_total
// Design      : prosjekt
// Author      : jonas.tornes@gmail.com
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : C:\Users\jonas\OneDrive - NTNU\TFE4152\Prosjekt\prosjekt\prosjekt\src\fsm_total.v
// Generated   : Fri Nov 13 10:18:15 2020
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
//{module {fsm_total}}
module fsm_total (Init,Clk,Reset,Exp_decrease,Exp_increase,NRE_R1,NRE_R2,ADC,Expose,Erase);
	input Init;
	input Clk;
	input Reset;
	input Exp_decrease;
	input Exp_increase;
	output NRE_R1;
	output NRE_R2;
	output ADC;
	output Expose;
	output Erase;
	wire[0:4] EX_time;
	logic Start;
	logic TF;
	
	Time_counter timereg(Start,EX_time,Reset,Clk,TF);
	ctrl_expose counte(Exp_decrease,Exp_increase,Clk,Reset,EX_time);
	fsm fm(Init,Clk,Reset,NRE_R1,NRE_R2,ADC,Expose,Erase,Done,Start,TF);
//}} End of automatically maintained section

// -- Enter your statements here -- //

endmodule
