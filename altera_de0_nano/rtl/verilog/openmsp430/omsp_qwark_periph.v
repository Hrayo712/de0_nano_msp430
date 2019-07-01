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
    mclk2,
	 per_addr,                       // Peripheral address
    per_din,                        // Peripheral data input
    per_en,                         // Peripheral enable (high active)
    per_we,                         // Peripheral write enable (high active)
	
    sp_val,
	 sp_wr_out,  
	 sp_inc_out,
	 sp_dec_out,
	 sp_wr_val,
	 sp_inc_val,
	 pc,	
	 irq_detect, 
	 inst_pc,
	 
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
input						  mclk2;
input        [13:0] per_addr;       // Peripheral address
input        [15:0]  per_din;       // Peripheral data input
input                 per_en;       // Peripheral enable (high active)
input         [1:0]   per_we;       // Peripheral write enable (high active)

input 		 [15:0]   sp_val;
input	 				 sp_wr_out;  
input	 			   sp_inc_out;
input				   sp_dec_out;
input 	   [15:0] sp_wr_val;
input 	   [15:0]sp_inc_val;
input	 				[15:0]  pc;
input					irq_detect;
input			  [15:0] inst_pc;

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
parameter       [14:0] BASE_ADDR   = 15'h0200;

// Decoder bit width (defines how many bits are considered for address decoding)
parameter              DEC_WD      =  8;

// Register addresses offset
parameter [DEC_WD-1:0] CNTRL1      = 'hA0,
                       CNTRL2      = 'hA2,
                       CNTRL3      = 'hA4,
                       CNTRL4      = 'hA6,
							  CNTRL5      = 'hA8,
							  CNTRL6      = 'hAA,
							  CNTRL7      = 'hAC,
							  CNTRL8      = 'hAE,
							  CNTRL9      = 'hB0,
							  CNTRL10     = 'hB2,
							  CNTRL11     = 'hB4,
							  CNTRL12     = 'hB6,
							  CNTRL13     = 'hB8;


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
                       CNTRL8_D    = (BASE_REG << CNTRL8),
                       CNTRL9_D    = (BASE_REG << CNTRL9),
							  CNTRL10_D    = (BASE_REG << CNTRL10),
							  CNTRL11_D    = (BASE_REG << CNTRL11),
							  CNTRL12_D    = (BASE_REG << CNTRL12),
                       CNTRL13_D    = (BASE_REG << CNTRL13);

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
                               (CNTRL8_D  &  {DEC_SZ{(reg_addr == CNTRL8 )}})  |
										 (CNTRL9_D  &  {DEC_SZ{(reg_addr == CNTRL9 )}})  |
										 (CNTRL10_D &  {DEC_SZ{(reg_addr == CNTRL10 )}}) |
										 (CNTRL11_D &  {DEC_SZ{(reg_addr == CNTRL11 )}}) |
										 (CNTRL12_D &  {DEC_SZ{(reg_addr == CNTRL12 )}}) |
                               (CNTRL13_D &  {DEC_SZ{(reg_addr == CNTRL13 )}});

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
wire [3:0]qwark_dout_idx;
wire [3:0]qwark_war_nr;
wire [2:0]irq_flag;
wire [15:0]qwark_war_addr;

/* One hot Address Multiplexer */
wire [7:0]wr_addr_mux = (qwark_dout_idx) == 3'b000 ? 8'b00000001 :
								(qwark_dout_idx) == 3'b001 ? 8'b00000010 :
								(qwark_dout_idx) == 3'b010 ? 8'b00000100 :
								(qwark_dout_idx) == 3'b011 ? 8'b00001000 :
								(qwark_dout_idx) == 3'b100 ? 8'b00010000 :
								(qwark_dout_idx) == 3'b101 ? 8'b00100000 :
								(qwark_dout_idx) == 3'b110 ? 8'b01000000 :
								 8'b10000000;

// Disable the peripheral and reset after a few clock cyles after the IRQ acc 

reg [4:0] irq_acc_dly_chain;
always @ (posedge mclk or posedge puc_rst)
  if (puc_rst) irq_acc_dly_chain <= 5'h00;
  else         irq_acc_dly_chain <= {irq_qwark_acc, irq_acc_dly_chain[4:1]};

assign dly_irq_qwark_acc = irq_acc_dly_chain[0];

reg r1;
always @( posedge mclk or posedge puc_rst)
if (puc_rst) r1 <= 1'b0;
else if(cntrl1[6]) r1 <= 1'b0;
else if(irq_flag[1]) r1 <= 1'b1;

reg [15:0] pc_inc;
always @( posedge mclk or posedge puc_rst)
if (puc_rst) pc_inc <= 16'h0000;
else if(cntrl1[6]) pc_inc <= 16'h0000;
else if(irq_detect && r1) pc_inc <= pc[15:0] - inst_pc[15:0];


// CNTRL1 Register
//-----------------

reg  [15:0] cntrl1;

wire        cntrl1_wr	   = reg_wr[CNTRL1];
wire        qwark_irq_req  = cntrl1[5];
assign      qwark_irq      = qwark_irq_req;


always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)       	  cntrl1 <=  16'h0000;
  else if (cntrl1_wr) 	  cntrl1 <=  per_din;
  else if (qwark_reg_wr  &&  dly_irq_qwark_acc)   cntrl1 <=   {cntrl1[15:8],1'b1,cntrl1[6],{1{1'b0}},qwark_war_nr[3:0],1'b0};
  else if (qwark_reg_wr  && ~dly_irq_qwark_acc)   cntrl1 <=   {cntrl1[15:6],cntrl1[5],qwark_war_nr[3:0],cntrl1[0]};
  else if (~qwark_reg_wr &&  dly_irq_qwark_acc)   cntrl1 <=   {cntrl1[15:8],1'b1,cntrl1[6],{1{1'b0}},cntrl1[4:1],1'b0};
  else if (irq_flag)		  							     cntrl1 <=   {cntrl1[15:6],1'b1,cntrl1[4:0]};

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

// CNTRL9 Register
//-----------------
reg  [15:0] cntrl9;

wire        cntrl9_wr = reg_wr[CNTRL9];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)        cntrl9 <=  16'h0000;
  else if (cntrl9_wr) cntrl9 <=  per_din;
  else if (qwark_reg_wr && wr_addr_mux[7]) cntrl9 <=  qwark_war_addr;
  
// CNTRL10 Register - SEGMENT ADDRESS
//-----------------
reg  [15:0] cntrl10;

wire        cntrl10_wr = reg_wr[CNTRL10];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)         cntrl10 <=  16'h0000;
  else if (cntrl10_wr) cntrl10 <=  per_din;
  else if (dly_irq_qwark_acc || sp_sig_updt[2]) cntrl10 <=  sp_seg_out;
  
// CNTRL11 Register - MAX STACK ADDRESS 
//-----------------
reg  [15:0] cntrl11;

wire        cntrl11_wr = reg_wr[CNTRL11];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)         cntrl11 <=  16'h0000;
  else if (cntrl11_wr) cntrl11 <=  per_din;
  else if (dly_irq_qwark_acc)   cntrl11 <=  sp_max_val;

  // CNTRL12 Register - INIT STACK POINTER
//-----------------
reg  [15:0] cntrl12;

wire        cntrl12_wr = reg_wr[CNTRL12];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)         cntrl12 <=  16'h0000;
  else if (cntrl12_wr) cntrl12 <=  per_din;
  else if (dly_irq_qwark_acc || sp_sig_updt[1]) cntrl12 <= sp_init_out;
  
// CNTRL12 Register - INIT STACK POINTER
//-----------------
reg  [15:0] cntrl13;

wire        cntrl13_wr = reg_wr[CNTRL13];

always @ (posedge mclk or posedge puc_rst)
  if (puc_rst)         cntrl13 <=  16'h0000;
  else if (cntrl13_wr) cntrl13 <=  per_din;
  else if (dly_irq_qwark_acc) cntrl13 <= pc_inc;

//============================================================================
// 4) DATA OUTPUT GENERATION
//============================================================================

// Data output mux
wire [15:0] cntrl1_rd   = cntrl1   & {16{reg_rd[CNTRL1]}};
wire [15:0] cntrl2_rd   = cntrl2   & {16{reg_rd[CNTRL2]}};
wire [15:0] cntrl3_rd   = cntrl3   & {16{reg_rd[CNTRL3]}};
wire [15:0] cntrl4_rd   = cntrl4   & {16{reg_rd[CNTRL4]}};
wire [15:0] cntrl5_rd   = cntrl5   & {16{reg_rd[CNTRL5]}};
wire [15:0] cntrl6_rd   = cntrl6   & {16{reg_rd[CNTRL6]}};
wire [15:0] cntrl7_rd   = cntrl7   & {16{reg_rd[CNTRL7]}};
wire [15:0] cntrl8_rd   = cntrl8   & {16{reg_rd[CNTRL8]}};
wire [15:0] cntrl9_rd   = cntrl9   & {16{reg_rd[CNTRL9]}};
wire [15:0] cntrl10_rd  = cntrl10  & {16{reg_rd[CNTRL10]}};
wire [15:0] cntrl11_rd  = cntrl11  & {16{reg_rd[CNTRL11]}};
wire [15:0] cntrl12_rd  = cntrl12  & {16{reg_rd[CNTRL12]}};
wire [15:0] cntrl13_rd  = cntrl13  & {16{reg_rd[CNTRL13]}};


wire [15:0] per_dout   =  cntrl1_rd  |
                          cntrl2_rd  |
                          cntrl3_rd  |
								  cntrl4_rd  |
								  cntrl5_rd  |
								  cntrl6_rd  |
								  cntrl7_rd  |
                          cntrl8_rd  |
				              cntrl9_rd  |
				              cntrl10_rd |
								  cntrl11_rd |
								  cntrl12_rd |
								  cntrl13_rd;

//============================================================================
// 5) QWARK PERIPHERAL FUNCTIONALITY
//============================================================================
wire [127:0] saved_war_addr = {cntrl2[15:0],cntrl3[15:0],cntrl4[15:0],cntrl5[15:0],cntrl6[15:0],cntrl7[15:0],cntrl8[15:0],cntrl9[15:0]};
wire [15:0]  tl_addr;
wire [15:0]  dmem_addr = eu_addr[15:0] + (`DMEM_BASE);

wire [2:0]  sp_sig_updt;

wire [15:0]  sp_seg_out;
wire [15:0]  sp_max_val;
wire [15:0]	 sp_init_out;

wire [15:0]  sp_seg_in     = {{1'b0},cntrl10[14:0]};
wire [15:0]  sp_max_val_in = cntrl11;
wire [15:0]  sp_init_in    = cntrl12;

wire sp_per_seg_updt  = cntrl10_wr;
wire sp_per_max_updt  = cntrl11_wr;
wire sp_per_init_updt = cntrl12_wr;

/* If the peripheral is enabled, then allow Qwark to decide which is the right address */
assign addr_out = (cntrl1[0] || cntrl1[7])  && ~dbg_acc ? tl_addr_format : eu_addr[13:1];

wire  qwark_en = dbg_acc ? 1'b0 : cntrl1[0];
wire [`DMEM_MSB:0] tl_addr_format = ({1'b0,tl_addr[15:1]})-(`DMEM_BASE);

omsp_qwark qwark_0 (

	 .tl_addr			 				    (tl_addr),	
	 .per_dout_addr_index		(qwark_dout_idx),	
	 .per_wr		 	   		     (qwark_reg_wr),
	 .irq_out			 				   (irq_flag),
	 .per_dout_war_addr		   (qwark_war_addr),
	 .per_dout_war_nr				  (qwark_war_nr),
    .mclk				 						 (mclk),
	 .mclk2										(mclk2),
	 .en									   (qwark_en),						
	 .puc_rst			 					 (puc_rst),						  
	 .eu_addr          				  (dmem_addr),     				
	 .eu_en				 					  (~eu_en),							
	 .eu_mb_wr			 				  (~eu_mb_wr),						
	 .buff_rst			 				  (cntrl1[6]),
	 .mb_rd_msk			 				  (mb_rd_msk),
	 .reg_str_addr				   (saved_war_addr),
	 
	 .sp_seg_out						 (sp_seg_out),	
	 .sp_max_val					 	 (sp_max_val),
	 .sp_sig_updt					   (sp_sig_updt),
	 .sp_init_out						(sp_init_out),	  
//Stack segmentation signals
	 .sp_val 	  							  (sp_val),
	 .sp_wr_out   						  (sp_wr_out),  
	 .sp_inc_out 						 (sp_inc_out),
	 .sp_dec_out  						 (sp_dec_out),
	 .sp_wr_val	  						  (sp_wr_val),
	 .sp_inc_val  						 (sp_inc_val),
	 .sp_seg_in							  (sp_seg_in),
	 .sp_init_in						 (sp_init_in),
	 .sp_max_val_in				 (sp_max_val_in),
	 .sp_per_seg_updt			  (sp_per_seg_updt),
	 .sp_per_init_updt		 (sp_per_init_updt),
	 .sp_per_max_updt			  (sp_per_max_updt)
	 );


endmodule // endmodule qwark_periph


`ifdef OMSP_NO_INCLUDE
`else
`include "openMSP430_undefines.v"
`endif
