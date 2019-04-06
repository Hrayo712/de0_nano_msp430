//----------------------------------------------------------------------------
// Copyright (C) 2001 Authors
//
// This source file may be used and distributed without restriction provided
// that this copyright statement is not removed from the file and that any
// derivative work contains the original copyright notice and the associated
// disclaimer.
//
// This source file is free software; you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published
// by the Free Software Foundation; either version 2.1 of the License, or
// (at your option) any later version.
//
// This source is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public
// License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this source; if not, write to the Free Software Foundation,
// Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
//
//----------------------------------------------------------------------------
//
// *File Name: tb_openMSP430_fpga.v
//
// *Module Description:
//                      openMSP430 FPGA testbench
//
// *Author(s):
//              - Olivier Girard,    olgirard@gmail.com
//
//----------------------------------------------------------------------------
// $Rev: 111 $
// $LastChangedBy: olivier.girard $
// $LastChangedDate: 2011-05-20 22:39:02 +0200 (Fri, 20 May 2011) $
//----------------------------------------------------------------------------
`include "timescale.v"
`ifdef OMSP_NO_INCLUDE
`else
`include "openMSP430_defines.v"
`endif

module  tb_openMSP430_fpga;

//
// Wire & Register definition
//------------------------------

// User Clocks
reg               FPGA_CLK1_50;

// User Interface (FPGA)
reg         [1:0] KEY;
reg         [3:0] SW;
wire        [7:0] LED;

//-----------------------------
// UART INTERFACE 
//-----------------------------
wire        UART_TX;
reg        UART_RX;


// Core debug signals
wire   [8*32-1:0] omsp_i_state;
wire   [8*32-1:0] omsp_e_state;
wire	   [31:0] omsp_inst_cycle;
wire   [8*32-1:0] omsp_inst_full;
wire	   [31:0] omsp_inst_number;
wire	   [15:0] omsp_inst_pc;
wire   [8*32-1:0] omsp_inst_short;


// Testbench variables
integer           i;
integer           error;
reg               stimulus_done;


//
// Include files
//------------------------------

// CPU & Memory registers
`include "registers_omsp.v"

// Verilog stimulus
`include "stimulus.v"

//
// Initialize Program Memory
//------------------------------

initial
  begin
     // Read memory file
     #10 $readmemh("./pmem.mem", pmem);
  end

//
// Generate Clock & Reset
//------------------------------
initial
  begin
     FPGA_CLK1_50 = 1'b0;
     forever #500.0 FPGA_CLK1_50 <= ~FPGA_CLK1_50; // 50 MHz
  end

initial
  begin
     KEY[0]      = 1'b1;
     #100 KEY[0] = 1'b0;
     #600 KEY[0] = 1'b1;
  end

//
// Global initialization
//------------------------------
initial
  begin
     error              = 0;        // Testbench
     stimulus_done      = 1;

     KEY[1]             = 1'b1;     // Keys/Buttons

     SW[0]              = 1'b0;     // Switches
     SW[1]              = 1'b0;
     SW[2]              = 1'b0;
     SW[3]              = 1'b0;

 
  end

//
// openMSP430 FPGA Instance
//----------------------------------

openMSP430_fpga dut (

     // USER CLOCKS
     .FPGA_CLK1_50    ( FPGA_CLK1_50    ),

     // USER INTERFACE (FPGA)
     .KEY             ( KEY             ),
     .LED             ( LED             ),
     .SW              ( SW              ),
     .UART_RX	      ( UART_RX		),
     .UART_TX	      ( UART_TX		)

);


// Debug utility signals
//----------------------------------------
msp_debug msp_debug_omsp (

// OUTPUTs
    .e_state      (omsp_e_state),       // Execution state
    .i_state      (omsp_i_state),       // Instruction fetch state
    .inst_cycle   (omsp_inst_cycle),    // Cycle number within current instruction
    .inst_full    (omsp_inst_full),     // Currently executed instruction (full version)
    .inst_number  (omsp_inst_number),   // Instruction number since last system reset
    .inst_pc      (omsp_inst_pc),       // Instruction Program counter
    .inst_short   (omsp_inst_short)     // Currently executed instruction (short version)
);

//
// Generate Waveform
//----------------------------------------
initial
  begin
   `ifdef VPD_FILE
     $vcdplusfile("tb_openMSP430_fpga.vpd");
     $vcdpluson();
   `else
     `ifdef TRN_FILE
        $recordfile ("tb_openMSP430_fpga.trn");
        $recordvars;
     `else
        $dumpfile("tb_openMSP430_fpga.vcd");
        $dumpvars(0, tb_openMSP430_fpga);
     `endif
   `endif
  end

//
// End of simulation
//----------------------------------------

initial // Timeout
  begin
   `ifdef NO_TIMEOUT
   `else
     `ifdef VERY_LONG_TIMEOUT
       #500000000;
     `else
     `ifdef LONG_TIMEOUT
       #5000000;
     `else
       #500000;
     `endif
     `endif
       $display(" ===============================================");
       $display("|               SIMULATION FAILED               |");
       $display("|              (simulation Timeout)             |");
       $display(" ===============================================");
       $finish;
   `endif
  end

initial // Normal end of test
  begin
     @(omsp_inst_pc===16'hffff)
     $display(" ===============================================");
     if (error!=0)
       begin
	  $display("|               SIMULATION FAILED               |");
	  $display("|     (some verilog stimulus checks failed)     |");
       end
     else if (~stimulus_done)
       begin
	  $display("|               SIMULATION FAILED               |");
	  $display("|     (the verilog stimulus didn't complete)    |");
       end
     else
       begin
	  $display("|               SIMULATION PASSED               |");
       end
     $display(" ===============================================");
     $finish;
  end


//
// Tasks Definition
//------------------------------

   task tb_error;
      input [65*8:0] error_string;
      begin
	 $display("ERROR: %s %t", error_string, $time);
	 error = error+1;
      end
   endtask


endmodule
