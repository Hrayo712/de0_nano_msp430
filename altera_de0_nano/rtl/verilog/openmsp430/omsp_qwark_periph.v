//----------------------------------------------------------------------------
// Copyright (C) 2009 , Olivier Girard
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
// *File Name: omsp_qwark_periph.v
//
// *Module Description:
//                      Qwark 16 bit peripheral.
//
// *Author(s):
//              - Hiram Rayo Torres Rodriguez,    hrayotorres@gmail.com
//
//----------------------------------------------------------------------------
// $Rev$
// $LastChangedBy$
// $LastChangedDate$
//----------------------------------------------------------------------------
`ifdef OMSP_NO_INCLUDE
`else
`include "openMSP430_defines.v"
`endif

module  omsp_qwark_periph (

// OUTPUTs
    per_dout,                       // Peripheral data output
	 addr_out,								// Memory Access address translated
	 qwark_irq,								// Qwark Interrupt request signal
// INPUTs
    mclk,                           // Main system clock
    per_addr,                       // Peripheral address
    per_din,                        // Peripheral data input
    per_en,                         // Peripheral enable (high active)
    per_we,                         // Peripheral write enable (high active)
    puc_rst,                        // Main system reset
	 eu_addr,          		   		// Execution Unit Memory Address Bus 			(Logical Address)
	 eu_en,									// Execution Unit Memory Address Bus Enable  (Active High)
	 eu_mb_wr,								// Execution Unit Memory Write
	 irq_qwark_acc,						// Interrupt request accepted signal 			(from the Front-End)
	 dbg_acc,								// Debug Access signal 								(from omsp debugger)
	 mb_rd_msk								// Memory read mask									(syncrhonized to Execution Unit - Used to detect byte accesses)
);

// OUTPUTs
//=========
output        [15:0] per_dout;      // Peripheral data output
output [`DMEM_MSB:0] addr_out;      // Address Out
output				  qwark_irq;		// Qwark Interrupt request signal

// INPUTs
//=========
input                   mclk;       // Main system clock
input        [13:0] per_addr;       // Peripheral address
input        [15:0]  per_din;       // Peripheral data input
input                 per_en;       // Peripheral enable (high active)
input         [1:0]   per_we;       // Peripheral write enable (high active)
input                puc_rst;       // Main system reset

input        [15:0]  eu_addr;       // Execution Unit Memory Address Bus 			(Logical Address)
input       		     eu_en;       // Execution Unit Memory Address Bus Enable  (Active High)
input        [1:0]  eu_mb_wr;       // Execution Unit Memory Write					(Active High)
input			   irq_qwark_acc;			// Interrupt request accepted signal         (from the Front-End)
input 					dbg_acc;			// Debug Access signal 								(from omsp debugger)
input 		  [1:0]mb_rd_msk;
//=============================================================================
// 1)  PARAMETER DECLARATION
//=============================================================================

// Register base address (must be aligned to decoder bit width)
parameter       [14:0] BASE_ADDR   = 15'h0190;

// Decoder bit width (defines how many bits are considered for address decoding)
parameter              DEC_WD      =  4;

// Register addresses offset
parameter [DEC_WD-1:0] CNTRL1      = 'h0,
                       CNTRL2      = 'h2,
                       CNTRL3      = 'h4,
                       CNTRL4      = 'h6,
							  CNTRL5      = 'h8,
							  CNTRL6      = 'hA,
							  CNTRL7      = 'hC,
							  CNTRL8      = 'hE;
							  
// Register one-hot decoder utilities
parameter              DEC_SZ      =  (1 << DEC_WD);
parameter [DEC_SZ-1:0] BASE_REG    =  {{DEC_SZ-1{1'b0}}, 1'b1};

// Register one-hot decoder
parameter [DEC_SZ-1:0] CNTRL1_D    = (BASE_REG << CNTRL1),
                       CNTRL2_D    = (BASE_REG << CNTRL2),
                       CNTRL3_D    = (BASE_REG << CNTRL3),
                       CNTRL4_D    = (BASE_REG << CNTRL4),
                       CNTRL5_D    = (BASE_REG << CNTRL5),
                       CNTRL6_D    = (BASE_REG << CNTRL6),
                       CNTRL7_D    = (BASE_REG << CNTRL7),
                       CNTRL8_D    = (BASE_REG << CNTRL8);

//============================================================================
// 2)  REGISTER DECODER
//============================================================================

// Local register selection
wire              reg_sel   =  per_en & (per_addr[13:DEC_WD-1]==BASE_ADDR[14:DEC_WD]);

// Register local address
wire [DEC_WD-1:0] reg_addr  =  {per_addr[DEC_WD-2:0], 1'b0};

// Register address decode
wire [DEC_SZ-1:0] reg_dec   =  (CNTRL1_D  &  {DEC_SZ{(reg_addr == CNTRL1 )}})  |
                               (CNTRL2_D  &  {DEC_SZ{(reg_addr == CNTRL2 )}})  |
                               (CNTRL3_D  &  {DEC_SZ{(reg_addr == CNTRL3 )}})  |
                               (CNTRL4_D  &  {DEC_SZ{(reg_addr == CNTRL4 )}})  |
                               (CNTRL5_D  &  {DEC_SZ{(reg_addr == CNTRL5 )}})  |
                               (CNTRL6_D  &  {DEC_SZ{(reg_addr == CNTRL6 )}})  |
                               (CNTRL7_D  &  {DEC_SZ{(reg_addr == CNTRL7 )}})  |
                               (CNTRL8_D  &  {DEC_SZ{(reg_addr == CNTRL8 )}});

// Read/Write probes
wire              reg_write =  |per_we & reg_sel;
wire              reg_read  = ~|per_we & reg_sel;

// Read/Write vectors
wire [DEC_SZ-1:0] reg_wr    = reg_dec & {DEC_SZ{reg_write}};
wire [DEC_SZ-1:0] reg_rd    = reg_dec & {DEC_SZ{reg_read}};


//============================================================================
// 3) REGISTERS
//============================================================================

wire qwark_reg_wr;
wire [3:0]qwark_dout;
wire irq_flag;
wire [15:0]qwark_war_addr;

wire [6:0]wr_addr_mux = (qwark_dout-1) == 3'b000 ? 7'b0000001 :
								(qwark_dout-1) == 3'b001 ? 7'b0000010 :
								(qwark_dout-1) == 3'b010 ? 7'b0000100 :
								(qwark_dout-1) == 3'b011 ? 7'b0001000 :
								(qwark_dout-1) == 3'b100 ? 7'b0010000 :
								(qwark_dout-1) == 3'b101 ? 7'b0100000 :
								 7'b1000000;
// CNTRL1 Register
//-----------------
reg  [15:0] cntrl1;

wire        cntrl1_wr	   = reg_wr[CNTRL1];
wire        qwark_irq_req  = cntrl1[5];
assign      qwark_irq      = qwark_irq_req;


always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)       	  cntrl1 <=  16'h0000;
  else if (cntrl1_wr) 	  cntrl1 <=  per_din;
  else if (qwark_reg_wr  &&  irq_qwark_acc)   cntrl1 <=   {{10{1'b0}},{1{1'b0}},qwark_dout[3:0],1'b0};
  else if (qwark_reg_wr  && ~irq_qwark_acc)   cntrl1 <=   {{10{1'b0}},cntrl1[5],qwark_dout[3:0],cntrl1[0]};
  else if (~qwark_reg_wr &&  irq_qwark_acc)   cntrl1 <=   {cntrl1[15:6],{1{1'b0}},cntrl1[4:1],1'b0};
  else if (irq_flag)		  							 cntrl1 <=   {{10{1'b0}},1'b1,cntrl1[4:0]};

  // CNTRL2 Register
//-----------------
reg  [15:0] cntrl2;

wire        cntrl2_wr = reg_wr[CNTRL2];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)        							 cntrl2 <=  16'h0000;
  else if (cntrl2_wr) 							 cntrl2 <=  per_din;
  else if (qwark_reg_wr && wr_addr_mux[0]) cntrl2 <=  qwark_war_addr;

// CNTRL3 Register
//-----------------
reg  [15:0] cntrl3;

wire        cntrl3_wr = reg_wr[CNTRL3];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)        cntrl3 <=  16'h0000;
  else if (cntrl3_wr) cntrl3 <=  per_din;
  else if (qwark_reg_wr && wr_addr_mux[1]) cntrl3 <=  qwark_war_addr;


// CNTRL4 Register
//-----------------
reg  [15:0] cntrl4;

wire        cntrl4_wr = reg_wr[CNTRL4];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)        cntrl4 <=  16'h0000;
  else if (cntrl4_wr) cntrl4 <=  per_din;
  else if (qwark_reg_wr && wr_addr_mux[2]) cntrl4 <=  qwark_war_addr;

// CNTRL5 Register
//-----------------
reg  [15:0] cntrl5;

wire        cntrl5_wr = reg_wr[CNTRL5];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)        cntrl5 <=  16'h0000;
  else if (cntrl5_wr) cntrl5 <=  per_din;
  else if (qwark_reg_wr && wr_addr_mux[3]) cntrl5 <=  qwark_war_addr;

  
// CNTRL6 Register
//-----------------
reg  [15:0] cntrl6;

wire        cntrl6_wr = reg_wr[CNTRL6];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)        cntrl6 <=  16'h0000;
  else if (cntrl6_wr) cntrl6 <=  per_din;
  else if (qwark_reg_wr && wr_addr_mux[4]) cntrl6 <=  qwark_war_addr;

  
// CNTRL7 Register
//-----------------
reg  [15:0] cntrl7;

wire        cntrl7_wr = reg_wr[CNTRL7];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)        cntrl7 <=  16'h0000;
  else if (cntrl7_wr) cntrl7 <=  per_din;
  else if (qwark_reg_wr && wr_addr_mux[5]) cntrl7 <=  qwark_war_addr;

  
// CNTRL8 Register
//-----------------
reg  [15:0] cntrl8;

wire        cntrl8_wr = reg_wr[CNTRL8];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)        cntrl8 <=  16'h0000;
  else if (cntrl8_wr) cntrl8 <=  per_din;
  else if (qwark_reg_wr && wr_addr_mux[6]) cntrl8 <=  qwark_war_addr;

//============================================================================
// 4) DATA OUTPUT GENERATION
//============================================================================

// Data output mux
wire [15:0] cntrl1_rd  = cntrl1  & {16{reg_rd[CNTRL1]}};
wire [15:0] cntrl2_rd  = cntrl2  & {16{reg_rd[CNTRL2]}};
wire [15:0] cntrl3_rd  = cntrl3  & {16{reg_rd[CNTRL3]}};
wire [15:0] cntrl4_rd  = cntrl4  & {16{reg_rd[CNTRL4]}};
wire [15:0] cntrl5_rd  = cntrl5  & {16{reg_rd[CNTRL5]}};
wire [15:0] cntrl6_rd  = cntrl6  & {16{reg_rd[CNTRL6]}};
wire [15:0] cntrl7_rd  = cntrl7  & {16{reg_rd[CNTRL7]}};
wire [15:0] cntrl8_rd  = cntrl8  & {16{reg_rd[CNTRL8]}};

wire [15:0] per_dout   =  cntrl1_rd  |
                          cntrl2_rd  |
                          cntrl3_rd  |
								  cntrl4_rd  |
								  cntrl5_rd  |
								  cntrl6_rd  |
								  cntrl7_rd  |
                          cntrl8_rd;

//============================================================================
// 5) QWARK PERIPHERAL FUNCTIONALITY
//============================================================================

wire [15:0] tl_addr;
wire  [15:0] dmem_addr = eu_addr[15:0] + (`DMEM_BASE);

assign addr_out = cntrl1[0] && ~dbg_acc ? tl_addr_format : eu_addr[13:1];

wire  qwark_en = dbg_acc ? 1'b0 : cntrl1[0];
wire [`DMEM_MSB:0] tl_addr_format = ({1'b0,tl_addr[15:1]})-(`DMEM_BASE);

omsp_qwark qwark_0 (

	 .tl_addr			 (tl_addr),	
	 .per_dout		    (qwark_dout),	
	 .per_wr		 	    (qwark_reg_wr),
	 .irq_out			 (irq_flag),
	 .per_dout_war_addr(qwark_war_addr),
    .mclk				 (mclk),								
	 .en					 (qwark_en),						
	 .puc_rst			 (puc_rst),						  
	 .eu_addr          (dmem_addr),     				
	 .eu_en				 (~eu_en),							
	 .eu_mb_wr			 (~eu_mb_wr),						
	 .buff_rst			 (irq_qwark_acc),
	 .mb_rd_msk			 (mb_rd_msk)
	 );


endmodule // endmodule qwark_periph


`ifdef OMSP_NO_INCLUDE
`else
`include "openMSP430_undefines.v"
`endif
