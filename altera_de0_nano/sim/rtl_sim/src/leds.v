/*===========================================================================*/
/*                                 DIGITAL I/O                               */
/*---------------------------------------------------------------------------*/
/* Test the Digital I/O interface.                                           */
/*===========================================================================*/
`define NO_TIMEOUT

initial
   begin
      $display(" ===============================================");
      $display("|                 START SIMULATION              |");
      $display(" ===============================================");
      repeat(5) @(posedge FPGA_CLK1_50);

      stimulus_done = 0;

      //repeat(100) @(posedge FPGA_CLK1_50);

      #(5000000.0); //1 ms
      // #(400000000.0);   //700 ms


      stimulus_done = 1;
      force omsp_inst_pc =16'hffff;

      stimulus_done = 1;
   end
