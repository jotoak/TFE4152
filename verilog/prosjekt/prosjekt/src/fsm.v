//-----------------------------------------------------------------------------
//
// Title       : fsm
// Design      : prosjekt
// Author      : jonas.tornes@gmail.com
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : c:\My_Designs\prosjekt\prosjekt\src\fsm.v
// Generated   : Tue Nov 10 10:44:51 2020
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
//{module {fsm}}
module fsm (Init,Clk,Reset,NRE_R1,NRE_R2,ADC,Expose,Erase,Done,Start,TF);
	input wire Init;
	input wire Clk;
	input wire Reset;
	output logic NRE_R1;
	output logic NRE_R2;
	output logic ADC;
	output logic Expose;
	output reg Erase;
	input wire Done;
	output logic Start;
	input wire TF;
	
	reg[3:0]count_reg;
	reg started;
	initial begin
		count_reg=0;
		started=0;
	end
	
	typedef enum logic[2:0]{Ventende,Eksponering,Avlesning} statetype;
	statetype state, nextstate;
	
	always@(posedge Clk) begin
		if(Reset)state=Ventende;
		else state=nextstate;
		case(state)
			Ventende:begin
				Expose=0;
				NRE_R1=1;
				NRE_R2=1;
				ADC=0;
				Start=0;
				Erase=1;
				started=0;
				if(Init) 
					nextstate=Eksponering;
				else 
					nextstate=Ventende;
			end
			Eksponering:begin
				if(!started)begin
					Start=1;
					Expose=1;
					Erase=0;
					started=1;
				end
				else Start=0;
				if(TF)begin
					nextstate=Avlesning;
					Expose=0;
				end
				else 
					nextstate=Eksponering;
				end
			
			Avlesning:begin
				case(count_reg)
					1:NRE_R1=0;
					2:ADC=1;
					3:ADC=0;
					4:NRE_R1=1;
					5:NRE_R2=0;
					6:ADC=1;
					7:ADC=0;
					8:begin
						NRE_R2=1;
						nextstate=Ventende;
					end
				endcase
				count_reg=count_reg+1;
			end
		
	endcase
end
//}} End of automatically maintained section

// -- Enter your statements here -- //

endmodule
