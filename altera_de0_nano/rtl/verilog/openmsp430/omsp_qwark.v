//----------------------------------------------------------------------------
// Copyright (C) 2019 , Hiram Rayo Torres Rodriguez
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the authors nor the names of its contributors
//       may be used to endorse or promote products derived from this software
//       without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
// OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
// THE POSSIBILITY OF SUCH DAMAGE
//
//----------------------------------------------------------------------------
//
// *File Name: omsp_qwark.v
//
// *Module Description:
//                       Qwark Module
//
// *Author(s):
//              - Hiram Rayo Torres Rodriguez,    hrayotorres@gmail.com
//
//----------------------------------------------------------------------------
// $Rev$ 1.0
// $LastChangedBy$ Hiram Rayo Torres Rodriguez
// $LastChangedDate$ May 5th 2019
//----------------------------------------------------------------------------
`ifdef OMSP_NO_INCLUDE
`else
`include "openMSP430_defines.v"
`endif

module  omsp_qwark (

// OUTPUTs
	 tl_addr,						// Translated Address Output
	 per_dout_addr_index,		// Peripheral data out
	 per_wr,							// Peripheral register write signal
	 irq_out,						// Interrupt request signal	
	 per_dout_war_addr,			// Peripheral WAR Address 
	 per_dout_war_nr,
	 sp_seg_out,
	 sp_max_val,
	 sp_sig_updt,
	 sp_init_out,
// INPUTs
    mclk,							// Master Clock 										(synchronized to EU and FE)
	 mclk2,
    en,								// Peripheral Enable 		    					(synchronized to EU and FE)
	 puc_rst,						// Power-up Clear (PUC) Reset						(synchronized to EU and FE)
	 eu_addr,           			// Execution Unit Memory Address Bus 			(Logical Address)
	 eu_en,							// Execution Unit Memory Address Bus Enable  (Active High)
	 eu_mb_wr,						// Execution Unit Memory Write					(Active High)
	 buff_rst,						// Buffers reset 										(R/W/TLB reset signal - Tied to IRQ)	 
	 mb_rd_msk,						// Memory read mask									(syncrhonized to Execution Unit - Used to detect byte accesses)
	 reg_str_addr,
  
	 sp_val,
	 sp_wr_out,  
	 sp_inc_out,
	 sp_dec_out,
	 sp_wr_val,
	 sp_inc_val,
	 sp_seg_in,
	 sp_init_in,
	 sp_max_val_in,
	 sp_per_seg_updt,
	 sp_per_init_updt,
	 sp_per_max_updt
	 );


// OUTPUTs
//=========

output  	[DATA_WIDTH-1:0] 				 tl_addr;	// Translated Address Output
output				  [3:0]per_dout_addr_index;	// Peripheral data out
output        								  per_wr;	// Peripheral register write signal
output        				  		[2:0]	 irq_out;	// Interrupt request signal	
output 	[DATA_WIDTH-1:0]  per_dout_war_addr;	// Peripheral WAR Address 
output 				  [3:0]	  per_dout_war_nr;
output				 [15:0]			 sp_seg_out;
output					[15:0]       sp_max_val;
output						 [2:0]   sp_sig_updt;
output						  [15:0] sp_init_out;

// INPUTs
//=========
input               	   mclk;        		// Master Clock 					 					(synchronized to EU and FE)
input						  mclk2;
input					        en;			 		// Peripheral Enable 		    					(synchronized to EU and FE)
input                puc_rst;        		// Power-up Clear (PUC) Reset					(synchronized to EU and FE)
input        [15:0]  eu_addr;        		// Execution Unit Memory Address Bus 			(Logical Address)
input       		     eu_en;        		// Execution Unit Memory Address Bus Enable (Active High)
input        [1:0]  eu_mb_wr;        		// Execution Unit Memory Write					(Active High)
input					  buff_rst;			 		// Buffers reset 									(R/W/TLB reset signal - Tied to IRQ)
input			 [1:0] mb_rd_msk;			 		// Memory read mask									(syncrhonized to Execution Unit - Used to detect byte accesses)
input	  [127:0] reg_str_addr;

input 			[15:0] sp_val;
input	 				 sp_wr_out;  
input	 			   sp_inc_out;
input				   sp_dec_out;
input 	  [15:0]  sp_wr_val;
input 	  [15:0] sp_inc_val;
input		  [15:0]  sp_seg_in;
input		  [15:0]  sp_init_in;
input		[15:0] sp_max_val_in;
input 		 sp_per_seg_updt;
input			sp_per_init_updt;
input			 sp_per_max_updt;
//=============================================================================
// Parameter Declaration
//=============================================================================
parameter           DATA_WIDTH = 16;
parameter           ADDR_WIDTH =  4;

parameter           SLICE_WIDTH = 4;

parameter           DMEM_END      = 16'h6000;
parameter 			  SEGMENT_THRESHOLD = 64;

//=============================================================================
// Register Declaration
//=============================================================================

/* Enable Signals */
reg rd_buff_wr_en = 1'b0;
reg wr_buff_wr_en = 1'b0;
reg tlb_buff_wr_en = 1'b0;
reg per_addr_wr_en = 1'b0;

/* counters*/
reg [3:0]war_ctr;
reg [ADDR_WIDTH:0]rd_buff_ctr;
reg [ADDR_WIDTH:0]wr_buff_ctr;

/*Address forwarding: This is used to let the other buffer that a certain address is being written */
reg [DATA_WIDTH-1:0]rd_buff_busy_writing;
reg [DATA_WIDTH-1:0]wr_buff_busy_writing;
reg [DATA_WIDTH-1:0]tlb_buff_busy_writing;

/* Address translation registers  */
reg [DATA_WIDTH-1:0]addr_out_tlb;	
reg [DATA_WIDTH-1:0]addr_out_war;
reg [DATA_WIDTH-1:0]fwrd_tlb;


reg [1:0] rd_msk;
reg [15:0]read_address;
reg irq_flag;
reg WAR;
wire byte_read; 


/* Format Address  */
wire [15:0] off_eu_addr = (eu_addr >= sp_seg_addr[14:0]) && (sp_seg_addr[14:0] != 16'h0000) && ~sp_r1_syn ? eu_addr - 16'h1000 : eu_addr;

wire  [15:0] tl_eu_addr = (~( mb_rd_msk[0] & mb_rd_msk[1] ) << DATA_WIDTH-1) | off_eu_addr | byte_read;		
																									
assign byte_read = mb_rd_msk[1] && ~mb_rd_msk[0] ? 1'b1: 1'b0;


//=============================================================================
// Output Assignment
//=============================================================================
reg [2:0] reg_tlb_addr_match;
reg reg_tlb_mux;

assign  per_dout_addr_index = reg_tlb_mux ? reg_tlb_addr_match : war_ctr-1;
assign  per_dout_war_nr     = war_ctr;
assign  per_dout_war_addr   = read_address | ~( rd_msk[0] & rd_msk[1] ) << DATA_WIDTH-1;
assign  per_wr        		 = per_addr_wr_en;
assign  irq_out	    		 = {irq_flag,irq_seg[1],irq_seg[0]};
assign  sp_seg_out			 = sp_seg_addr;
assign  sp_max_val			 = max_sp;
assign  sp_sig_updt  		 = sp_sig[2:0];
assign  sp_init_out			 = init_sp_val;

always @(posedge mclk) begin

	if(en && tlb_match) begin
		reg_tlb_addr_match <= tlb_match_addr;
		reg_tlb_mux <= 1;
	end else begin
		reg_tlb_addr_match <= 3'b000;
		reg_tlb_mux <= 0;
	end
end

									
//=============================================================================
// Stack Segmentation Logic
//=============================================================================	
reg [15:0] init_sp_val;
reg [15:0] max_sp;
reg [15:0] sp_seg_addr;
wire [1:0] irq_seg;

reg sp_r1_syn;

reg [2:0] sp_sig;
reg [7:0] dbg_seg_val;

assign irq_seg[0] = en && ~sp_r1_syn && sp_dec_out && (sp_init_in > sp_inc_val) &&  ((sp_init_in - sp_inc_val) >= SEGMENT_THRESHOLD) ? 1'b1 : 1'b0;
assign irq_seg[1] = en && ~sp_r1_syn && sp_wr_out  && (sp_init_in > sp_wr_val)  &&  ((sp_init_in - sp_wr_val)  >= SEGMENT_THRESHOLD) ? 1'b1 : 1'b0;

//===========For debugging==================================================================	

always @(posedge mclk) begin
	
	if (puc_rst || buff_rst) begin
	dbg_seg_val <= 8'h00;
	end else if (sp_dec_out && (sp_init_in > sp_inc_val)) begin
	dbg_seg_val <= (sp_init_in - sp_inc_val);

	end else if (sp_wr_out  && (sp_init_in > sp_wr_val)) begin
	dbg_seg_val <= (sp_init_in - sp_wr_val); 
	
	end else if (sp_inc_out && (sp_init_in > (sp_val+2))) begin
	dbg_seg_val <= (sp_init_in - (sp_val+2)); 
	end
end

//============================================================================================	
reg sp_per_init_updt_dly;
reg sp_per_seg_updt_dly;
reg sp_per_max_updt_dly;

// Segmentation Interrupt logic and segment update
wire [14:0 ]sp_seg_addr_dbg = sp_seg_addr[14:0];

always @(posedge mclk) begin
	if (puc_rst) begin
	sp_r1_syn <= 1'b0;
	sp_sig[2] <= 1'b0;
   sp_seg_addr <= 16'h0000;
	end else if (buff_rst) begin
	sp_r1_syn <= 1'b0;
	sp_sig[2] <= 1'b0;
	
	end else if (sp_per_seg_updt_dly) begin
	sp_seg_addr <= sp_seg_in;
	
	end else if(en && irq_seg[0] && ~irq_seg[1] && ~sp_r1_syn) begin
	sp_r1_syn <= 1'b1;
	sp_seg_addr <= 16'h8000 | (sp_val - 2);
	
	end else if(en && ~irq_seg[0] && irq_seg[1] && ~sp_r1_syn) begin
	sp_r1_syn <= 1'b1;
	sp_seg_addr <= 16'h8000 | (sp_val);
	
	end else if (en && sp_seg_addr[14:0] != 16'h0000 && sp_val >= sp_seg_addr[14:0] && ~sp_r1_syn) begin
	sp_sig[2] <= 1'b1;
	sp_seg_addr <= sp_val;
	
	end else begin
	sp_sig[2] <= 1'b0;
	end
end

//Init sp logic 

always @(posedge mclk) begin
	if (puc_rst) begin
   init_sp_val <= 16'h0000;
	sp_sig[0] <= 1'b0;
	sp_sig[1] <= 1'b0;
	end else if(en && ~sp_sig[0]) begin
	init_sp_val <= sp_val;
	sp_sig[0] <= 1'b1;
	end else if (en && sp_sig[0] && sp_val >= init_sp_val) begin
	sp_sig[1] <= 1'b1;
	init_sp_val <= sp_val;
	
	end else if (sp_per_init_updt_dly) begin
	init_sp_val <= sp_init_in;

	end else begin

	sp_sig[1] <= 1'b0;
	
	end
end


always @(posedge mclk) begin
	if (puc_rst) begin
   max_sp <= 16'h0000;
	
	end else if(en && max_sp == 16'h0000) begin
	max_sp <= sp_val;

   end else if (en && sp_val > max_sp) begin
	max_sp <= sp_val;
	
	end else if (sp_per_max_updt_dly) begin
	max_sp <= sp_max_val_in;
	end
end


always @(posedge mclk) begin
	sp_per_init_updt_dly	<= sp_per_init_updt;
	sp_per_seg_updt_dly  <= sp_per_seg_updt;
	sp_per_max_updt_dly  <= sp_per_max_updt;
end

//=============================================================================
// Address Translation Logic
//=============================================================================

assign  mem_track_en  = ((eu_addr[15:0]>=(`DMEM_BASE)) && (eu_addr[15:0]< (DMEM_END))) || (eu_addr[15:0]>= sp_seg_addr[14:0] && sp_seg_addr[14:0] != 16'h0000 && ~sp_r1_syn) ;

assign tl_addr =  tlb_match 											? addr_out_tlb		 : // Prioritize TLB match, over WAR detection	
						WAR		 											? addr_out_war		 : 
						tlb_buff_busy_writing == tl_eu_addr 	  	? fwrd_tlb  		 :
						off_eu_addr;

						
						
always @(war_ctr) begin

		case (war_ctr[2:0]) 
		3'b000 : addr_out_war <= 16'h6000;
		3'b001 : addr_out_war <= 16'h6002;
		3'b010 : addr_out_war <= 16'h6004;
		3'b011 : addr_out_war <= 16'h6006;
		3'b100 : addr_out_war <= 16'h6008;
		3'b101 : addr_out_war <= 16'h600A;
		3'b110 : addr_out_war <= 16'h600C;
		3'b111 : addr_out_war <= 16'h600E;
	  default : addr_out_war <= 16'h7000;
	  endcase  
end		

always @* begin

		case (tlb_match_addr[2:0]) 
		3'b000 : addr_out_tlb <= 16'h6000;
		3'b001 : addr_out_tlb <= 16'h6002;
		3'b010 : addr_out_tlb <= 16'h6004;
		3'b011 : addr_out_tlb <= 16'h6006;
		3'b100 : addr_out_tlb <= 16'h6008;
		3'b101 : addr_out_tlb <= 16'h600A;
		3'b110 : addr_out_tlb <= 16'h600C;
		3'b111 : addr_out_tlb <= 16'h600E;
	  default : addr_out_tlb <= 16'h7000;
		endcase 
end			

always @* begin

		case (war_ctr-1) 
		3'b000 : fwrd_tlb <= 16'h6000;
		3'b001 : fwrd_tlb <= 16'h6002;
		3'b010 : fwrd_tlb <= 16'h6004;
		3'b011 : fwrd_tlb <= 16'h6006;
		3'b100 : fwrd_tlb <= 16'h6008;
		3'b101 : fwrd_tlb <= 16'h600A;
		3'b110 : fwrd_tlb <= 16'h600C;
		3'b111 : fwrd_tlb <= 16'h600E;
	  default : fwrd_tlb <= 16'h7000;
		endcase 
end			
//=============================================================================
// IRQ flag trigger (triggers on eight write)
//=============================================================================
//TO DO: revise this condition, it could lead to trouble

always @(posedge mclk) begin
	if(puc_rst) begin
	irq_flag <= 1'b0;
	end else if((wr_buff_ctr == 7 && wr_buff_wr_en) || (rd_buff_ctr == 7 && rd_buff_wr_en) ) begin //used to be 5 //tested segmentation on 6
	irq_flag <= 1'b1;
	end else begin
	irq_flag <= 1'b0;
	end
end

//=============================================================================
// Write After Read (WAR) detection Logic
//=============================================================================


always @(rd_match,eu_mb_wr,tlb_match) begin

    if(en && (rd_match || tlb_match) && (eu_mb_wr[0] || eu_mb_wr[1])) begin
	  WAR = 1'b1;
	 end else begin
	  WAR = 1'b0;
	 end
end

	
//=============================================================================
// Address Tracking Logic
//=============================================================================

always @(posedge mclk) begin
	if(puc_rst) begin
	rd_buff_wr_en   <= 1'b0;
	wr_buff_wr_en   <= 1'b0;
	read_address    <= 1'b0;
	tlb_buff_wr_en  <= 1'b0;
	end else if (en) begin
	
	// The memory bus is issuing a read access, and the CAM didnt recognize the address in the buffer..Enable the Write!
	rd_buff_wr_en <= eu_en && ~eu_mb_wr[1] && ~eu_mb_wr[0] && mem_track_en && (tl_eu_addr!=wr_buff_busy_writing) && ~wr_match && ~rd_match && ~tlb_match ; 
	
	// The memory bus is issuing a write access, and the CAM didnt recognize the address in the buffer..Enable the Write!
	wr_buff_wr_en <= eu_en &&  (eu_mb_wr[1] || eu_mb_wr[0]) && mem_track_en  && (tl_eu_addr!=rd_buff_busy_writing) && ~rd_match && ~wr_match && ~tlb_match;
	
	// Enable the TLB write upon WAR detection	
	per_addr_wr_en <= WAR;
	
	// Store address of cycle
	read_address <= tl_eu_addr;
	
	// Store write mask 
	rd_msk <= mb_rd_msk;
	
	end 
end


//=============================================================================
// Address Forward logic
//=============================================================================

/* Read buffer Logic to Forward the READ address to the Write buffer*/
always @(posedge mclk) begin

	if(en && eu_en && ~eu_mb_wr[1] && ~eu_mb_wr[0] && mem_track_en && (tl_eu_addr!=wr_buff_busy_writing) && ~wr_match && ~rd_match && ~tlb_match) begin
	rd_buff_busy_writing <= tl_eu_addr;
	end else if (~rd_buff_wr_en) begin
	// = 0;
	rd_buff_busy_writing <= 16'hCAFE;
	end
end


always @(posedge mclk) begin

	if(en && eu_en &&  (eu_mb_wr[1] || eu_mb_wr[0]) && mem_track_en  && (tl_eu_addr!=rd_buff_busy_writing) && ~rd_match && ~wr_match && ~tlb_match) begin
	wr_buff_busy_writing <= tl_eu_addr;
	
	end else if (~wr_buff_wr_en) begin
	
	wr_buff_busy_writing <= 16'hCAFE;
	end
end

always @(posedge mclk) begin

	if(WAR) begin
	tlb_buff_busy_writing <= tl_eu_addr;
	
	end else if (~WAR) begin
	
	tlb_buff_busy_writing <= 16'hCAFE;
	end
end


//=============================================================================
// Counters
//=============================================================================


always @(posedge mclk) begin
	if(puc_rst) begin
	war_ctr <= 1'b0;
	end else if(WAR && ~tlb_match) begin
	war_ctr <= 	war_ctr + 1;
	end else if (buff_rst) begin
	war_ctr <= 1'b0;
	end
end


always @(posedge mclk) begin
	if(puc_rst) begin
			rd_buff_ctr <=  4'b000;
	end else if(rd_buff_wr_en) begin
			rd_buff_ctr <= rd_buff_ctr + 1'b1;
	end else if(buff_rst) begin
		   rd_buff_ctr <= 4'b000;
	end
end

always @(posedge mclk) begin
	if(puc_rst) begin
			wr_buff_ctr <=  4'b000;
	end else if(wr_buff_wr_en) begin
			wr_buff_ctr <= wr_buff_ctr + 1'b1;
	end else if(buff_rst) begin
		   wr_buff_ctr <= 4'b000;
	end
end

//=============================================================================
// Compare Logic
//=============================================================================						
									
																	
wire [15:0] word_match_addr_reg = eu_en &&  ((reg_str_addr[16*(7) +: 16] == (eu_addr)) || 
															(reg_str_addr[16*(6) +: 16] == (eu_addr)) ||		
															(reg_str_addr[16*(5) +: 16] == (eu_addr)) ||
															(reg_str_addr[16*(4) +: 16] == (eu_addr)) || 
															(reg_str_addr[16*(3) +: 16] == (eu_addr)) ||
															(reg_str_addr[16*(2) +: 16] == (eu_addr)) ||
															(reg_str_addr[16*(1) +: 16] == (eu_addr)) ||
															(reg_str_addr[16*(0) +: 16] == (eu_addr))) ? eu_addr :
															1'b0;
													  											
												  
wire word_match_addr =  eu_en && (word_match_addr_reg == eu_addr)  && ~word_match_addr_reg[15] ? 1'b1 : 1'b0;


												
//The word address is in the registers, and the access is byte based, lead the comparison in a word manner.
wire [15:0] tlb_cmp_eu_addr =  word_match_addr & (~( mb_rd_msk[0] & mb_rd_msk[1] ) ) ? eu_addr : 
										 tl_eu_addr;

															 
//First  : detect a byte read (upper or lower) on a possibly word write dominated location ...then lead the write buffer to compare against the whole word to verify if the read might be being masked by word write.
//Second : if the location is word write dominated, a byte write should be ignored, so, compare also with the word equivalent. This is possible due to bad pointer handling.
//Third  : For easiness of the imlpementation word read acts conservatively and allows the buffers to store such location even if they might be byte_write_dominated, since for it to be secure, both bytes would have to be write dominated, not just one. So, word or nothing. subsequent byte/word writes are inhibited by history and the rest of the mechanisms 
wire [15:0] wr_cmp_eu_addr =   (~( mb_rd_msk[1]  &    mb_rd_msk[0] )) &&  wr_cmp_sync == 0   ? tl_eu_addr    : //byte read
										 (~( mb_rd_msk[1]  &    mb_rd_msk[0] )) &&  wr_cmp_sync == 1   ? eu_addr       : //byte read
										 (~( eu_mb_wr[0]   &     eu_mb_wr[1] ))  && wr_cmp_sync == 0 	? eu_addr 		 : //byte write access to compare with the whole word				  
									    tl_eu_addr;   																									 

																																					
//First:   detect a  byte write (upper or lower) on a possibly word read dominateed location ...lead the read buffer to compare against the whole word, if comparison is made just in byte basis, this can mask WAR violations (upper/lower byte write to a word-read location)!!
//Second:  detect a  word write  on a possibly byte read dominated location (upper or lower)  ...lead the read buffer to compare against the bytes, if comparison is made just in byte basis, this can mask WAR violations (byte write to a word-read location)!!

wire [15:0] rd_cmp_eu_addr =  (~( eu_mb_wr[0] & eu_mb_wr[1] ) && rd_cmp_sync == 0) 						  ? tl_eu_addr    		  : 	   //byte write access				  
									   (~( eu_mb_wr[0] & eu_mb_wr[1] ) && rd_cmp_sync == 1) 						  ? eu_addr    		     :   	//byte write access	
									   ( ( eu_mb_wr[0] & eu_mb_wr[1] ) && rd_cmp_sync == 0) 						  ? tl_eu_addr            : 		//word write access
									   ( ( eu_mb_wr[0] & eu_mb_wr[1] ) && rd_cmp_sync == 1)						  ? eu_addr | 16'h8000    : 		//word write access
									       eu_addr | 16'h8001; 

reg [2:0] rd_cmp_sync;
reg  wr_cmp_sync;

//Trigger a search over the location
always @(posedge mclk2 or posedge puc_rst) begin
		
		if (puc_rst) begin
			rd_cmp_sync <= 0;
		end else if ( eu_en && (eu_mb_wr[0] || eu_mb_wr[1]) && ~rd_match && ~tlb_match) begin
			rd_cmp_sync <= rd_cmp_sync + 1'b1;
		end else if (rd_match) begin
			rd_cmp_sync <= rd_cmp_sync;
		end else begin
			rd_cmp_sync <= 1'b0;
		end
end

//Trigger a search over the location
always @(posedge mclk2 or posedge puc_rst) begin
		
		if (puc_rst) begin
			wr_cmp_sync <= 0;
		end else if ( eu_en && (~( eu_mb_wr[0] & eu_mb_wr[1] )) && ~wr_match && ~tlb_match) begin
			wr_cmp_sync <= wr_cmp_sync + 1'b1;
		end else if (wr_match) begin
			wr_cmp_sync <= wr_cmp_sync;
		end else begin
			wr_cmp_sync <= 1'b0;
		end
end


//=============================================================================
// NEW READ BUFFER
//==============================================================================


reg [255:0] rd_buff;
//For debug
wire [15:0]rd_buff_0 = rd_buff[16*(0)  +: 16];
wire [15:0]rd_buff_1 = rd_buff[16*(1)  +: 16];
wire [15:0]rd_buff_2 = rd_buff[16*(2)  +: 16];
wire [15:0]rd_buff_3 = rd_buff[16*(3)  +: 16];
wire [15:0]rd_buff_4 = rd_buff[16*(4)  +: 16];
wire [15:0]rd_buff_5 = rd_buff[16*(5)  +: 16];
wire [15:0]rd_buff_6 = rd_buff[16*(6)  +: 16];
wire [15:0]rd_buff_7 = rd_buff[16*(7)  +: 16];
wire [15:0]rd_buff_8 = rd_buff[16*(8)  +: 16];
wire [15:0]rd_buff_9 = rd_buff[16*(9)  +: 16];
wire [15:0]rd_buff_10 = rd_buff[16*(10)  +: 16];
wire [15:0]rd_buff_11 = rd_buff[16*(11)  +: 16];
wire [15:0]rd_buff_12 = rd_buff[16*(12)  +: 16];
wire [15:0]rd_buff_13 = rd_buff[16*(13)  +: 16];
wire [15:0]rd_buff_14 = rd_buff[16*(14)  +: 16];
wire [15:0]rd_buff_15 = rd_buff[16*(15)  +: 16];


always @(posedge mclk) begin
	
		if(puc_rst || buff_rst) begin
			rd_buff <= 255'h0000000000000000000000000000000000000000000000000000000000000000;
		end else if (en && rd_buff_wr_en && rd_buff_ctr <= 15) begin
			rd_buff[16*(rd_buff_ctr[3:0]) +: 16] <= read_address;
		end
end 

wire [15:0]rd_match_bits;

assign 	rd_match_bits[0]  = rd_cmp_eu_addr == rd_buff[16*(0)  +: 16]	? 1'b1 : 1'b0;
assign	rd_match_bits[1]  = rd_cmp_eu_addr == rd_buff[16*(1)  +: 16]	? 1'b1 : 1'b0;
assign	rd_match_bits[2]  = rd_cmp_eu_addr == rd_buff[16*(2)  +: 16]	? 1'b1 : 1'b0;
assign	rd_match_bits[3]  = rd_cmp_eu_addr == rd_buff[16*(3)  +: 16]	? 1'b1 : 1'b0;
assign	rd_match_bits[4]  = rd_cmp_eu_addr == rd_buff[16*(4)  +: 16]	? 1'b1 : 1'b0;
assign	rd_match_bits[5]  = rd_cmp_eu_addr == rd_buff[16*(5)  +: 16]	? 1'b1 : 1'b0;
assign	rd_match_bits[6]  = rd_cmp_eu_addr == rd_buff[16*(6)  +: 16]	? 1'b1 : 1'b0;
assign	rd_match_bits[7]  = rd_cmp_eu_addr == rd_buff[16*(7)  +: 16]	? 1'b1 : 1'b0;
assign	rd_match_bits[8]  = rd_cmp_eu_addr == rd_buff[16*(8)  +: 16]	? 1'b1 : 1'b0;
assign	rd_match_bits[9]  = rd_cmp_eu_addr == rd_buff[16*(9)  +: 16]	? 1'b1 : 1'b0;
assign	rd_match_bits[10] = rd_cmp_eu_addr == rd_buff[16*(10) +: 16]	? 1'b1 : 1'b0;
assign	rd_match_bits[11] = rd_cmp_eu_addr == rd_buff[16*(11) +: 16]	? 1'b1 : 1'b0;
assign	rd_match_bits[12] = rd_cmp_eu_addr == rd_buff[16*(12) +: 16]	? 1'b1 : 1'b0;
assign	rd_match_bits[13] = rd_cmp_eu_addr == rd_buff[16*(13) +: 16]	? 1'b1 : 1'b0;
assign	rd_match_bits[14] = rd_cmp_eu_addr == rd_buff[16*(14) +: 16]	? 1'b1 : 1'b0;
assign	rd_match_bits[15] = rd_cmp_eu_addr == rd_buff[16*(15) +: 16]	? 1'b1 : 1'b0;


				
wire [4:0] rd_match_bus =  rd_match_bits[0]  ? 5'b10000 :
									rd_match_bits[1]  ? 5'b10001 :
									rd_match_bits[2]  ? 5'b10010 :
									rd_match_bits[3]  ? 5'b10011 :
									rd_match_bits[4]  ? 5'b10100 :
									rd_match_bits[5]  ? 5'b10101 :
									rd_match_bits[6]  ? 5'b10110 :
									rd_match_bits[7]  ? 5'b10111 :
									rd_match_bits[8]  ? 5'b11000 :
									rd_match_bits[9]  ? 5'b11001 :
									rd_match_bits[10] ? 5'b11010 :
									rd_match_bits[11] ? 5'b11011 :
									rd_match_bits[12] ? 5'b11100 :
									rd_match_bits[13] ? 5'b11101 :
									rd_match_bits[14] ? 5'b11110 :
									rd_match_bits[15] ? 5'b11111 :
									5'b01111;
									 
wire [3:0] rd_match_addr = rd_match_bus[3:0];
wire       rd_match      = rd_match_bus[4];


 //=============================================================================
// NEW WRITE BUFFER
//=============================================================================									

reg [255:0] wr_buff;
//For debug
wire [15:0]wr_buff_0 = wr_buff[16*(0)  +: 16];
wire [15:0]wr_buff_1 = wr_buff[16*(1)  +: 16];
wire [15:0]wr_buff_2 = wr_buff[16*(2)  +: 16];
wire [15:0]wr_buff_3 = wr_buff[16*(3)  +: 16];
wire [15:0]wr_buff_4 = wr_buff[16*(4)  +: 16];
wire [15:0]wr_buff_5 = wr_buff[16*(5)  +: 16];
wire [15:0]wr_buff_6 = wr_buff[16*(6)  +: 16];
wire [15:0]wr_buff_7 = wr_buff[16*(7)  +: 16];
wire [15:0]wr_buff_8 = wr_buff[16*(8)  +: 16];
wire [15:0]wr_buff_9 = wr_buff[16*(9)  +: 16];
wire [15:0]wr_buff_10 = wr_buff[16*(10)  +: 16];
wire [15:0]wr_buff_11 = wr_buff[16*(11)  +: 16];
wire [15:0]wr_buff_12 = wr_buff[16*(12)  +: 16];
wire [15:0]wr_buff_13 = wr_buff[16*(13)  +: 16];
wire [15:0]wr_buff_14 = wr_buff[16*(14)  +: 16];
wire [15:0]wr_buff_15 = wr_buff[16*(15)  +: 16];

always @(posedge mclk) begin
	
		if(puc_rst || buff_rst) begin
			wr_buff <= 255'h0000000000000000000000000000000000000000000000000000000000000000;
		end else if (en && wr_buff_wr_en && wr_buff_ctr <= 15) begin
			wr_buff[16*(wr_buff_ctr[3:0]) +: 16] <= read_address;
		end
end 

wire [15:0] wr_match_bits;

assign	wr_match_bits[0]  = wr_cmp_eu_addr == wr_buff[16*(0)  +: 16]	? 1'b1 : 1'b0;
assign   wr_match_bits[1]  = wr_cmp_eu_addr == wr_buff[16*(1)  +: 16]	? 1'b1 : 1'b0;
assign	wr_match_bits[2]  = wr_cmp_eu_addr == wr_buff[16*(2)  +: 16]	? 1'b1 : 1'b0;
assign	wr_match_bits[3]  = wr_cmp_eu_addr == wr_buff[16*(3)  +: 16]	? 1'b1 : 1'b0;
assign	wr_match_bits[4]  = wr_cmp_eu_addr == wr_buff[16*(4)  +: 16]	? 1'b1 : 1'b0;
assign	wr_match_bits[5]  = wr_cmp_eu_addr == wr_buff[16*(5)  +: 16]	? 1'b1 : 1'b0;
assign	wr_match_bits[6]  = wr_cmp_eu_addr == wr_buff[16*(6)  +: 16]	? 1'b1 : 1'b0;
assign	wr_match_bits[7]  = wr_cmp_eu_addr == wr_buff[16*(7)  +: 16]	? 1'b1 : 1'b0;
assign	wr_match_bits[8]  = wr_cmp_eu_addr == wr_buff[16*(8)  +: 16]	? 1'b1 : 1'b0;
assign	wr_match_bits[9]  = wr_cmp_eu_addr == wr_buff[16*(9)  +: 16]	? 1'b1 : 1'b0;
assign	wr_match_bits[10] = wr_cmp_eu_addr == wr_buff[16*(10) +: 16]	? 1'b1 : 1'b0;
assign	wr_match_bits[11] = wr_cmp_eu_addr == wr_buff[16*(11) +: 16]	? 1'b1 : 1'b0;
assign	wr_match_bits[12] = wr_cmp_eu_addr == wr_buff[16*(12) +: 16]	? 1'b1 : 1'b0;
assign	wr_match_bits[13] = wr_cmp_eu_addr == wr_buff[16*(13) +: 16]	? 1'b1 : 1'b0;
assign	wr_match_bits[14] = wr_cmp_eu_addr == wr_buff[16*(14) +: 16]	? 1'b1 : 1'b0;
assign	wr_match_bits[15] = wr_cmp_eu_addr == wr_buff[16*(15) +: 16]	? 1'b1 : 1'b0;


				
wire [4:0] wr_match_bus =  wr_match_bits[0]  ? 5'b10000 :
									wr_match_bits[1]  ? 5'b10001 :
									wr_match_bits[2]  ? 5'b10010 :
									wr_match_bits[3]  ? 5'b10011 :
									wr_match_bits[4]  ? 5'b10100 :
									wr_match_bits[5]  ? 5'b10101 :
									wr_match_bits[6]  ? 5'b10110 :
									wr_match_bits[7]  ? 5'b10111 :
									wr_match_bits[8]  ? 5'b11000 :
									wr_match_bits[9]  ? 5'b11001 :
									wr_match_bits[10] ? 5'b11010 :
									wr_match_bits[11] ? 5'b11011 :
									wr_match_bits[12] ? 5'b11100 :
									wr_match_bits[13] ? 5'b11101 :
									wr_match_bits[14] ? 5'b11110 :
									wr_match_bits[15] ? 5'b11111 :
									5'b01111;
									 
wire [3:0] wr_match_addr = wr_match_bus[3:0];
wire       wr_match      = wr_match_bus[4];

										 
//=============================================================================
// NEW TLB
//=============================================================================									
wire [7:0]tlb_match_bits;

assign	tlb_match_bits[0] = tlb_cmp_eu_addr == reg_str_addr[16*(7) +: 16]	? 1'b1 : 1'b0;
assign	tlb_match_bits[1] = tlb_cmp_eu_addr == reg_str_addr[16*(6) +: 16]	? 1'b1 : 1'b0;
assign	tlb_match_bits[2] = tlb_cmp_eu_addr == reg_str_addr[16*(5) +: 16]	? 1'b1 : 1'b0;
assign	tlb_match_bits[3] = tlb_cmp_eu_addr == reg_str_addr[16*(4) +: 16]	? 1'b1 : 1'b0;
assign	tlb_match_bits[4] = tlb_cmp_eu_addr == reg_str_addr[16*(3) +: 16]	? 1'b1 : 1'b0;
assign	tlb_match_bits[5] = tlb_cmp_eu_addr == reg_str_addr[16*(2) +: 16]	? 1'b1 : 1'b0;
assign	tlb_match_bits[6] = tlb_cmp_eu_addr == reg_str_addr[16*(1) +: 16]	? 1'b1 : 1'b0;
assign	tlb_match_bits[7] = tlb_cmp_eu_addr == reg_str_addr[16*(0) +: 16]	? 1'b1 : 1'b0;
									
wire [3:0] tlb_match_bus =  tlb_match_bits[7] ? 4'b1111 :
									 tlb_match_bits[6] ? 4'b1110 :
									 tlb_match_bits[5] ? 4'b1101 :
									 tlb_match_bits[4] ? 4'b1100 :
									 tlb_match_bits[3] ? 4'b1011 :
									 tlb_match_bits[2] ? 4'b1010 :
									 tlb_match_bits[1] ? 4'b1001 :
									 tlb_match_bits[0] ? 4'b1000 :
									 4'b0000;
									 
wire [2:0] tlb_match_addr = tlb_match_bus[2:0];
wire  tlb_match      = tlb_match_bus[3];

endmodule // omsp_qwark

`ifdef OMSP_NO_INCLUDE
`else
`include "openMSP430_undefines.v"
`endif