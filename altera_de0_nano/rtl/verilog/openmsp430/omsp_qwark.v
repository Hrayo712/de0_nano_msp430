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
	 per_dout,						// Peripheral data out
	 per_wr,							// Peripheral register write signal
	 irq_out,						// Interrupt request signal	
	 per_dout_war_addr,			// Peripheral WAR Address 
	 
// INPUTs
    mclk,							// Master Clock 										(synchronized to EU and FE)
	 en,								// Peripheral Enable 		    					(synchronized to EU and FE)
	 puc_rst,						// Power-up Clear (PUC) Reset						(synchronized to EU and FE)
	 eu_addr,           			// Execution Unit Memory Address Bus 			(Logical Address)
	 eu_en,							// Execution Unit Memory Address Bus Enable  (Active High)
	 eu_mb_wr,						// Execution Unit Memory Write					(Active High)
	 buff_rst,						// Buffers reset 										(R/W/TLB reset signal - Tied to IRQ)	 
	 mb_rd_msk						// Memory read mask									(syncrhonized to Execution Unit - Used to detect byte accesses)
);


// OUTPUTs
//=========

output  	[DATA_WIDTH-1:0] 				 tl_addr;	// Translated Address Output
output				  [3:0]				per_dout;	// Peripheral data out
output        								  per_wr;	// Peripheral register write signal
output        				  				 irq_out;	// Interrupt request signal	
output 	[DATA_WIDTH-1:0]  per_dout_war_addr;	// Peripheral WAR Address 


// INPUTs
//=========
input               	   mclk;        // Master Clock 					 					(synchronized to EU and FE)
input					        en;			 // Peripheral Enable 		    					(synchronized to EU and FE)
input                puc_rst;        // Power-up Clear (PUC) Reset					(synchronized to EU and FE)
input        [15:0]  eu_addr;        // Execution Unit Memory Address Bus 			(Logical Address)
input       		     eu_en;        // Execution Unit Memory Address Bus Enable (Active High)
input        [1:0]  eu_mb_wr;        // Execution Unit Memory Write					(Active High)
input					  buff_rst;			 // Buffers reset 									(R/W/TLB reset signal - Tied to IRQ)
input			 [1:0] mb_rd_msk;			 // Memory read mask									(syncrhonized to Execution Unit - Used to detect byte accesses)



//=============================================================================
// Parameter Declaration
//=============================================================================
parameter           DATA_WIDTH = 16;
parameter           ADDR_WIDTH =  3;
parameter           SLICE_WIDTH = 4;
//parameter         DMEM_END      = `DMEM_BASE+`DMEM_SIZE;
parameter           DMEM_END      = 16'h6000;


//=============================================================================
// Register Declaration
//=============================================================================

//status for the bufffers
wire byte_read; 
wire rd_buf_out_match;
wire wr_buf_out_match;
wire tlb_buf_out_match;

/* Match address Signals from the CAMs */
wire [ADDR_WIDTH-1:0] rd_buff_addr_match;
wire [ADDR_WIDTH-1:0] wr_buff_addr_match;

/* status Signals for the CAMs */
wire rd_buff_busy;
wire wr_buff_busy;
wire tlb_buff_busy;

/* Enable Signals for the CAMs */
reg rd_buff_wr_en = 1'b0;
reg wr_buff_wr_en = 1'b0;
reg tlb_buff_wr_en = 1'b0;
reg per_addr_wr_en = 1'b0;
/* counter for the WAR counter*/
reg [ADDR_WIDTH:0]war_ctr;

/*Index counter for the CAMs*/
reg [ADDR_WIDTH:0]rd_buff_ctr;
reg [ADDR_WIDTH:0]wr_buff_ctr;
reg [ADDR_WIDTH:0]tlb_buff_ctr;

/*Address forwarding: This is used to let the other buffer that a certain address is being written */
reg [DATA_WIDTH-1:0]wr_buff_busy_writing;
reg [DATA_WIDTH-1:0]rd_buff_busy_writing;

//Address translation wires
wire   tlb_match;
wire [ADDR_WIDTH-1:0]tlb_addr_match;									
reg  [DATA_WIDTH-1:0]tlb_addr[ADDR_WIDTH-1:0];

/* Address translation registers  */
reg [DATA_WIDTH-1:0]addr_out_tlb;	
reg [DATA_WIDTH-1:0]addr_out_war;
reg [DATA_WIDTH-1:0]addr_out_rd;

reg [1:0] rd_msk;
reg [15:0]read_address;
reg irq_flag;
reg WAR;

wire  [15:0] tl_eu_addr = eu_addr | byte_read;

assign byte_read = mb_rd_msk[1] && ~mb_rd_msk[0] ? 1'b1: 1'b0;

//=============================================================================
// Output Assignment
//=============================================================================

assign  per_dout	    		= war_ctr;
assign  per_dout_war_addr  = read_address | ~( rd_msk[0] & rd_msk[1] ) << DATA_WIDTH-1;
//assign  per_wr        		= tlb_buff_wr_en;
assign  per_wr        		= per_addr_wr_en;
assign  irq_out	    		= irq_flag;


//=============================================================================
// Address Translation Logic
//=============================================================================

assign  mem_track_en  = (eu_addr[15:0]>=(`DMEM_BASE)) & (eu_addr[15:0]< (DMEM_END));

assign tl_addr =  tlb_match 	  							 ? addr_out_tlb		 : // Prioritize TLB match, over WAR detection	
						tlb_buff_busy && rd_buf_out_match ? addr_out_rd			 :
						WAR 		 	  							 ? addr_out_war		 : 
						eu_addr;

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

		case (tlb_addr_match) 
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

		//case (rd_buff_addr_match) 
		case (tlb_buff_ctr[2:0]) 
		3'b000 : addr_out_rd <= 16'h6000;
		3'b001 : addr_out_rd <= 16'h6002;
		3'b010 : addr_out_rd <= 16'h6004;
		3'b011 : addr_out_rd <= 16'h6006;
		3'b100 : addr_out_rd <= 16'h6008;
		3'b101 : addr_out_rd <= 16'h600A;
		3'b110 : addr_out_rd <= 16'h600C;
		3'b111 : addr_out_rd <= 16'h600E;
	  default : addr_out_rd <= 16'h7000;

		endcase 
end			

//=============================================================================
// IRQ flag trigger (triggers on eight write)
//=============================================================================

always @(posedge mclk) begin
	if(puc_rst) begin
	irq_flag <= 1'b0;
	end else if((wr_buff_ctr == 7 && wr_buff_wr_en) || (rd_buff_ctr == 7 && rd_buff_wr_en)) begin
	irq_flag <= 1'b1;
	end else begin
	irq_flag <= 1'b0;
	end
end

//=============================================================================
// Write After Read (WAR) counters to translate and perform interruptions
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

//=============================================================================
// Write After Read (WAR) detection Logic
//=============================================================================

always @(rd_buf_out_match,eu_mb_wr) begin

    if(en && rd_buf_out_match  && (eu_mb_wr[0] || eu_mb_wr[1])) begin
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
	rd_buff_wr_en <= eu_en && ~eu_mb_wr[1] && ~eu_mb_wr[0] && mem_track_en && (tl_eu_addr!=wr_buff_busy_writing) && ~wr_buf_out_match && ~rd_buf_out_match && ~tlb_match ; 
	
	// The memory bus is issuing a write access, and the CAM didnt recognize the address in the buffer..Enable the Write!
	wr_buff_wr_en <= eu_en &&  (eu_mb_wr[1] || eu_mb_wr[0]) && mem_track_en  && (tl_eu_addr!=rd_buff_busy_writing) && ~rd_buf_out_match && ~wr_buf_out_match && ~tlb_match;
	
	//Enable the TLB write upon WAR detection
	tlb_buff_wr_en <= WAR && ~tlb_match &&  (tlb_buff_ctr + 1 != 8) ;
	
	per_addr_wr_en <= WAR && ~tlb_match;
	
	//store address of cycle
	read_address <= tl_eu_addr;
	
	//store write mask 
	rd_msk <= mb_rd_msk;
	end 
end


/* Write buffer Logic to Forward the READ address to the Write buffer*/
always @(posedge mclk) begin

	if(rd_buff_wr_en) begin
	rd_buff_busy_writing <= read_address;
	//busy_writing = 1;
	end else if (~rd_buff_wr_en && ~rd_buff_busy) begin
	//busy_writing = 0;
	rd_buff_busy_writing <= 16'hCAFE;
	end
end

/* Write buffer Logic to Forward the WRITE address to the Read buffer*/

always @(posedge mclk) begin

	if(wr_buff_wr_en) begin
	wr_buff_busy_writing <= read_address;
	//busy_writing = 1;
	end else if (~wr_buff_wr_en && ~wr_buff_busy) begin
	//busy_writing = 0;
	wr_buff_busy_writing <= 16'hCAFE;
	end
end

//=============================================================================
// Buffer Counters
//=============================================================================

always @(posedge mclk) begin
	if(puc_rst) begin
			rd_buff_ctr <=  4'b000;
	end else if(r1 && ~buff_rst) begin
			rd_buff_ctr <= rd_buff_ctr + 1'b1;
	end else if(rd_buff_ctr == 8 || buff_rst) begin
		   rd_buff_ctr <= 4'b000;
	end
end

always @(posedge mclk) begin
	if(puc_rst) begin
			wr_buff_ctr <=  4'b000;
	end else if(r3 && ~buff_rst) begin
			wr_buff_ctr <= wr_buff_ctr + 1'b1;
	end else if(wr_buff_ctr == 8 || buff_rst) begin
		   wr_buff_ctr <= 4'b000;
	end
end

always @(posedge mclk) begin
	if(puc_rst) begin
			tlb_buff_ctr <=  4'b000;
	end else if(r5 && ~buff_rst) begin
			tlb_buff_ctr <= tlb_buff_ctr + 1'b1;
	end else if(tlb_buff_ctr == 8 || buff_rst) begin
		   tlb_buff_ctr <= 4'b000;
	end
end


//Synchronizer for the Buffers
reg r1;
reg r3;
reg r5;
always @(posedge mclk) begin
        r1 <= rd_buff_wr_en;    
		  r3 <= wr_buff_wr_en;    
		  r5 <= tlb_buff_wr_en;   
end


//=============================================================================
// 1) CAM Read Buffer Instantiation (4 stage Write)
//=============================================================================

        cam_bram #(
            .DATA_WIDTH(DATA_WIDTH),
            .ADDR_WIDTH(ADDR_WIDTH),
            .SLICE_WIDTH(SLICE_WIDTH)
        )
        cam_read_buff (
            .clk(mclk),
            .rst(puc_rst),
				.rst_clr(buff_rst),
            .write_addr(rd_buff_ctr[2:0]), 
            .write_data(tl_eu_addr),
            .write_delete(1'b0), 
            .write_enable(rd_buff_wr_en),
            .write_busy(rd_buff_busy),
            .compare_data(tl_eu_addr),
            .match_addr(rd_buff_addr_match),
            .match(rd_buf_out_match)
        );
		

//=============================================================================
// 2)  CAM Write Buffer Instantiation (2 stage write)
//=============================================================================
        cam_bram #(
            .DATA_WIDTH(DATA_WIDTH),
            .ADDR_WIDTH(ADDR_WIDTH),
            .SLICE_WIDTH(SLICE_WIDTH)
        )
        cam_write_buff (
            .clk(mclk),
            .rst(puc_rst),
				.rst_clr(buff_rst),
            .write_addr(wr_buff_ctr[2:0]),
            .write_data(tl_eu_addr),
            .write_delete(1'b0),
            .write_enable(wr_buff_wr_en),
            .write_busy(wr_buff_busy),
            .compare_data(tl_eu_addr),
            .match_addr(wr_buff_addr_match),
            .match(wr_buf_out_match)
        );
		  
//=============================================================================
// 3)  Translation Lookaside Buffer (2 stage Write)
//=============================================================================	  
        cam_bram #(
            .DATA_WIDTH(DATA_WIDTH),
            .ADDR_WIDTH(ADDR_WIDTH),
            .SLICE_WIDTH(SLICE_WIDTH)
        )
        cam_tlb (
            .clk(mclk),
            .rst(puc_rst),
				.rst_clr(buff_rst),
            .write_addr(tlb_buff_ctr[2:0]),
            .write_data(tl_eu_addr),
            .write_delete(1'b0),
            .write_enable(tlb_buff_wr_en), 
            .write_busy(tlb_buff_busy),
            .compare_data(tl_eu_addr),
            .match_addr(tlb_addr_match),
            .match(tlb_match)
        );

		
endmodule // omsp_qwark

`ifdef OMSP_NO_INCLUDE
`else
`include "openMSP430_undefines.v"
`endif