
// START MODULE NAME -----------------------------------------------------------
//
// Module Name : ALTPLL
//
// Description : Phase-Locked Loop (PLL) behavioral model. Model supports basic
//               PLL features such as clock division and multiplication,
//               programmable duty cycle and phase shifts, various feedback modes
//               and clock delays. Also supports real-time reconfiguration of
//               PLL "parameters" and clock switchover between the 2 input
//               reference clocks. Up to 10 clock outputs may be used.
//
// Limitations : Applicable to Stratix, Stratix-GX, Stratix II and Cyclone II device families only
//               There is no support in the model for spread-spectrum feature
//
// Expected results : Up to 10 output clocks, each defined by its own set of
//                    parameters. Locked output (active high) indicates when the
//                    PLL locks. clkbad, clkloss and activeclock are used for
//                    clock switchover to inidicate which input clock has gone
//                    bad, when the clock switchover initiates and which input
//                    clock is being used as the reference, respectively.
//                    scandataout is the data output of the serial scan chain.

//END MODULE NAME --------------------------------------------------------------

`timescale 1 ps / 1ps
`define STR_LENGTH 18

// MODULE DECLARATION
module altpll (
    inclk,      // input reference clock - up to 2 can be used
    fbin,       // external feedback input port
    pllena,     // PLL enable signal
    clkswitch,  // switch between inclk0 and inclk1
    areset,     // asynchronous reset
    pfdena,     // enable the Phase Frequency Detector (PFD)
    clkena,     // enable clk0 to clk5 clock outputs
    extclkena,  // enable extclk0 to extclk3 clock outputs
    scanclk,    // clock for the serial scan chain
    scanaclr,   // asynchronous clear the serial scan chain
    scanclkena,
    scanread,   // determines when the scan chain can read in data from the scandata port
    scanwrite,  // determines when the scan chain can write out data into pll
    scandata,    // data for the scan chain
    phasecounterselect,
    phaseupdown,
    phasestep,
    configupdate,
    fbmimicbidir,
    clk,         // internal clock outputs (feeds the core)
    extclk,      // external clock outputs (feeds pins)
    clkbad,      // indicates if inclk0/inclk1 has gone bad
    enable0,     // load enable pulse 0 for lvds
    enable1,     // load enable pulse l for lvds
    activeclock, // indicates which input clock is being used
    clkloss,     // indicates when clock switchover initiates
    locked,      // indicates when the PLL locks onto the input clock
    scandataout, // data output of the serial scan chain
    scandone,    // indicates when pll reconfiguration is complete
    sclkout0,    // serial clock output 0 for lvds
    sclkout1,     // serial clock output 1 for lvds
    phasedone,
    vcooverrange,
    vcounderrange,
    fbout,
    fref,
    icdrclk
);

// GLOBAL PARAMETER DECLARATION
parameter   intended_device_family    = "Stratix" ;
parameter   operation_mode            = "NORMAL" ;
parameter   pll_type                  = "AUTO" ;
parameter   qualify_conf_done         = "OFF" ;
parameter   compensate_clock          = "CLK0" ;
parameter   scan_chain                = "LONG";
parameter   primary_clock             = "inclk0";
parameter   inclk0_input_frequency    = 1000;
parameter   inclk1_input_frequency    = 0;
parameter   gate_lock_signal          = "NO";
parameter   gate_lock_counter         = 0;
parameter   lock_high                 = 1;
parameter   lock_low                  = 0;
parameter   valid_lock_multiplier     = 1;
parameter   invalid_lock_multiplier   = 5;
parameter   switch_over_type          = "AUTO";
parameter   switch_over_on_lossclk    = "OFF" ;
parameter   switch_over_on_gated_lock = "OFF" ;
parameter   enable_switch_over_counter = "OFF";
parameter   switch_over_counter       = 0;
parameter   feedback_source           = "EXTCLK0" ;
parameter   bandwidth                 = 0;
parameter   bandwidth_type            = "UNUSED";
parameter   lpm_hint                  = "UNUSED";
parameter   spread_frequency          = 0;
parameter   down_spread               = "0.0";
parameter   self_reset_on_gated_loss_lock = "OFF";
parameter   self_reset_on_loss_lock = "OFF";
parameter   lock_window_ui           = "0.05";
parameter   width_clock              = 6;
parameter   width_phasecounterselect = 4;
parameter charge_pump_current_bits = 9999;
parameter loop_filter_c_bits = 9999;
parameter loop_filter_r_bits = 9999;
parameter scan_chain_mif_file = "UNUSED";

// SIMULATION_ONLY_PARAMETERS_BEGIN

parameter   simulation_type           = "functional";
parameter   source_is_pll             = "off";

// SIMULATION_ONLY_PARAMETERS_END

parameter   skip_vco                    = "off";

//  internal clock specifications
parameter   clk9_multiply_by        = 1;
parameter   clk8_multiply_by        = 1;
parameter   clk7_multiply_by        = 1;
parameter   clk6_multiply_by        = 1;
parameter   clk5_multiply_by        = 1;
parameter   clk4_multiply_by        = 1;
parameter   clk3_multiply_by        = 1;
parameter   clk2_multiply_by        = 1;
parameter   clk1_multiply_by        = 1;
parameter   clk0_multiply_by        = 1;
parameter   clk9_divide_by          = 1;
parameter   clk8_divide_by          = 1;
parameter   clk7_divide_by          = 1;
parameter   clk6_divide_by          = 1;
parameter   clk5_divide_by          = 1;
parameter   clk4_divide_by          = 1;
parameter   clk3_divide_by          = 1;
parameter   clk2_divide_by          = 1;
parameter   clk1_divide_by          = 1;
parameter   clk0_divide_by          = 1;
parameter   clk9_phase_shift        = "0";
parameter   clk8_phase_shift        = "0";
parameter   clk7_phase_shift        = "0";
parameter   clk6_phase_shift        = "0";
parameter   clk5_phase_shift        = "0";
parameter   clk4_phase_shift        = "0";
parameter   clk3_phase_shift        = "0";
parameter   clk2_phase_shift        = "0";
parameter   clk1_phase_shift        = "0";
parameter   clk0_phase_shift        = "0";

parameter   clk5_time_delay         = "0";  // For stratix pll use only
parameter   clk4_time_delay         = "0";  // For stratix pll use only
parameter   clk3_time_delay         = "0";  // For stratix pll use only
parameter   clk2_time_delay         = "0";  // For stratix pll use only
parameter   clk1_time_delay         = "0";  // For stratix pll use only
parameter   clk0_time_delay         = "0";  // For stratix pll use only
parameter   clk9_duty_cycle         = 50;
parameter   clk8_duty_cycle         = 50;
parameter   clk7_duty_cycle         = 50;
parameter   clk6_duty_cycle         = 50;
parameter   clk5_duty_cycle         = 50;
parameter   clk4_duty_cycle         = 50;
parameter   clk3_duty_cycle         = 50;
parameter   clk2_duty_cycle         = 50;
parameter   clk1_duty_cycle         = 50;
parameter   clk0_duty_cycle         = 50;

parameter   clk9_use_even_counter_mode    = "OFF";
parameter   clk8_use_even_counter_mode    = "OFF";
parameter   clk7_use_even_counter_mode    = "OFF";
parameter   clk6_use_even_counter_mode    = "OFF";
parameter   clk5_use_even_counter_mode    = "OFF";
parameter   clk4_use_even_counter_mode    = "OFF";
parameter   clk3_use_even_counter_mode    = "OFF";
parameter   clk2_use_even_counter_mode    = "OFF";
parameter   clk1_use_even_counter_mode    = "OFF";
parameter   clk0_use_even_counter_mode    = "OFF";
parameter   clk9_use_even_counter_value   = "OFF";
parameter   clk8_use_even_counter_value   = "OFF";
parameter   clk7_use_even_counter_value   = "OFF";
parameter   clk6_use_even_counter_value   = "OFF";
parameter   clk5_use_even_counter_value   = "OFF";
parameter   clk4_use_even_counter_value   = "OFF";
parameter   clk3_use_even_counter_value   = "OFF";
parameter   clk2_use_even_counter_value   = "OFF";
parameter   clk1_use_even_counter_value   = "OFF";
parameter   clk0_use_even_counter_value   = "OFF";

parameter   clk2_output_frequency   = 0;
parameter   clk1_output_frequency   = 0;
parameter   clk0_output_frequency   = 0;

//  external clock specifications (for stratix pll use only)
parameter   extclk3_multiply_by     = 1;
parameter   extclk2_multiply_by     = 1;
parameter   extclk1_multiply_by     = 1;
parameter   extclk0_multiply_by     = 1;
parameter   extclk3_divide_by       = 1;
parameter   extclk2_divide_by       = 1;
parameter   extclk1_divide_by       = 1;
parameter   extclk0_divide_by       = 1;
parameter   extclk3_phase_shift     = "0";
parameter   extclk2_phase_shift     = "0";
parameter   extclk1_phase_shift     = "0";
parameter   extclk0_phase_shift     = "0";
parameter   extclk3_time_delay      = "0";
parameter   extclk2_time_delay      = "0";
parameter   extclk1_time_delay      = "0";
parameter   extclk0_time_delay      = "0";
parameter   extclk3_duty_cycle      = 50;
parameter   extclk2_duty_cycle      = 50;
parameter   extclk1_duty_cycle      = 50;
parameter   extclk0_duty_cycle      = 50;

// The following 4 parameters are for Stratix II pll in lvds mode only 
parameter vco_multiply_by = 0;
parameter vco_divide_by = 0;
parameter sclkout0_phase_shift = "0";
parameter sclkout1_phase_shift = "0";

parameter dpa_multiply_by = 0;
parameter dpa_divide_by = 0;
parameter dpa_divider = 0;

//  advanced user parameters
parameter   vco_min             = 0;
parameter   vco_max             = 0;
parameter   vco_center          = 0;
parameter   pfd_min             = 0;
parameter   pfd_max             = 0;
parameter   m_initial           = 1;
parameter   m                   = 0; // m must default to 0 in order for altpll to calculate advanced parameters for itself
parameter   n                   = 1;
parameter   m2                  = 1;
parameter   n2                  = 1;
parameter   ss                  = 0;
parameter   l0_high             = 1;
parameter   l1_high             = 1;
parameter   g0_high             = 1;
parameter   g1_high             = 1;
parameter   g2_high             = 1;
parameter   g3_high             = 1;
parameter   e0_high             = 1;
parameter   e1_high             = 1;
parameter   e2_high             = 1;
parameter   e3_high             = 1;
parameter   l0_low              = 1;
parameter   l1_low              = 1;
parameter   g0_low              = 1;
parameter   g1_low              = 1;
parameter   g2_low              = 1;
parameter   g3_low              = 1;
parameter   e0_low              = 1;
parameter   e1_low              = 1;
parameter   e2_low              = 1;
parameter   e3_low              = 1;
parameter   l0_initial          = 1;
parameter   l1_initial          = 1;
parameter   g0_initial          = 1;
parameter   g1_initial          = 1;
parameter   g2_initial          = 1;
parameter   g3_initial          = 1;
parameter   e0_initial          = 1;
parameter   e1_initial          = 1;
parameter   e2_initial          = 1;
parameter   e3_initial          = 1;
parameter   l0_mode             = "bypass";
parameter   l1_mode             = "bypass";
parameter   g0_mode             = "bypass";
parameter   g1_mode             = "bypass";
parameter   g2_mode             = "bypass";
parameter   g3_mode             = "bypass";
parameter   e0_mode             = "bypass";
parameter   e1_mode             = "bypass";
parameter   e2_mode             = "bypass";
parameter   e3_mode             = "bypass";
parameter   l0_ph               = 0;
parameter   l1_ph               = 0;
parameter   g0_ph               = 0;
parameter   g1_ph               = 0;
parameter   g2_ph               = 0;
parameter   g3_ph               = 0;
parameter   e0_ph               = 0;
parameter   e1_ph               = 0;
parameter   e2_ph               = 0;
parameter   e3_ph               = 0;
parameter   m_ph                = 0;
parameter   l0_time_delay       = 0;
parameter   l1_time_delay       = 0;
parameter   g0_time_delay       = 0;
parameter   g1_time_delay       = 0;
parameter   g2_time_delay       = 0;
parameter   g3_time_delay       = 0;
parameter   e0_time_delay       = 0;
parameter   e1_time_delay       = 0;
parameter   e2_time_delay       = 0;
parameter   e3_time_delay       = 0;
parameter   m_time_delay        = 0;
parameter   n_time_delay        = 0;
parameter   extclk3_counter     = "e3" ;
parameter   extclk2_counter     = "e2" ;
parameter   extclk1_counter     = "e1" ;
parameter   extclk0_counter     = "e0" ;
parameter   clk9_counter        = "c9" ;
parameter   clk8_counter        = "c8" ;
parameter   clk7_counter        = "c7" ;
parameter   clk6_counter        = "c6" ;
parameter   clk5_counter        = "l1" ;
parameter   clk4_counter        = "l0" ;
parameter   clk3_counter        = "g3" ;
parameter   clk2_counter        = "g2" ;
parameter   clk1_counter        = "g1" ;
parameter   clk0_counter        = "g0" ;
parameter   enable0_counter     = "l0";
parameter   enable1_counter     = "l0";
parameter   charge_pump_current = 2;
parameter   loop_filter_r       = "1.0";
parameter   loop_filter_c       = 5;
parameter   vco_post_scale      = 0;
parameter   vco_frequency_control = "AUTO";
parameter   vco_phase_shift_step = 0;
parameter   lpm_type            = "altpll";

// The following parameter are used to define the connectivity for some of the input
// and output ports.
parameter port_clkena0 = "PORT_CONNECTIVITY";
parameter port_clkena1 = "PORT_CONNECTIVITY";
parameter port_clkena2 = "PORT_CONNECTIVITY";
parameter port_clkena3 = "PORT_CONNECTIVITY";
parameter port_clkena4 = "PORT_CONNECTIVITY";
parameter port_clkena5 = "PORT_CONNECTIVITY";
parameter port_extclkena0 = "PORT_CONNECTIVITY";
parameter port_extclkena1 = "PORT_CONNECTIVITY";
parameter port_extclkena2 = "PORT_CONNECTIVITY";
parameter port_extclkena3 = "PORT_CONNECTIVITY";
parameter port_extclk0 = "PORT_CONNECTIVITY";
parameter port_extclk1 = "PORT_CONNECTIVITY";
parameter port_extclk2 = "PORT_CONNECTIVITY";
parameter port_extclk3 = "PORT_CONNECTIVITY";
parameter port_clk0 = "PORT_CONNECTIVITY";
parameter port_clk1 = "PORT_CONNECTIVITY";
parameter port_clk2 = "PORT_CONNECTIVITY";
parameter port_clk3 = "PORT_CONNECTIVITY";
parameter port_clk4 = "PORT_CONNECTIVITY";
parameter port_clk5 = "PORT_CONNECTIVITY";
parameter port_clk6 = "PORT_CONNECTIVITY";
parameter port_clk7 = "PORT_CONNECTIVITY";
parameter port_clk8 = "PORT_CONNECTIVITY";
parameter port_clk9 = "PORT_CONNECTIVITY";
parameter port_scandata = "PORT_CONNECTIVITY";
parameter port_scandataout = "PORT_CONNECTIVITY";
parameter port_scandone = "PORT_CONNECTIVITY";
parameter port_sclkout1 = "PORT_CONNECTIVITY";
parameter port_sclkout0 = "PORT_CONNECTIVITY";
parameter port_clkbad0 = "PORT_CONNECTIVITY";
parameter port_clkbad1 = "PORT_CONNECTIVITY";
parameter port_activeclock = "PORT_CONNECTIVITY";
parameter port_clkloss = "PORT_CONNECTIVITY";
parameter port_inclk1 = "PORT_CONNECTIVITY";
parameter port_inclk0 = "PORT_CONNECTIVITY";
parameter port_fbin = "PORT_CONNECTIVITY";
parameter port_fbout = "PORT_CONNECTIVITY";
parameter port_pllena = "PORT_CONNECTIVITY";
parameter port_clkswitch = "PORT_CONNECTIVITY";
parameter port_areset = "PORT_CONNECTIVITY";
parameter port_pfdena = "PORT_CONNECTIVITY";
parameter port_scanclk = "PORT_CONNECTIVITY";
parameter port_scanaclr = "PORT_CONNECTIVITY";
parameter port_scanread = "PORT_CONNECTIVITY";
parameter port_scanwrite = "PORT_CONNECTIVITY";
parameter port_enable0 = "PORT_CONNECTIVITY";
parameter port_enable1 = "PORT_CONNECTIVITY";
parameter port_locked = "PORT_CONNECTIVITY";
parameter port_configupdate = "PORT_CONNECTIVITY";
parameter port_phasecounterselect = "PORT_CONNECTIVITY";
parameter port_phasedone = "PORT_CONNECTIVITY";
parameter port_phasestep = "PORT_CONNECTIVITY";
parameter port_phaseupdown = "PORT_CONNECTIVITY";
parameter port_vcooverrange = "PORT_CONNECTIVITY";
parameter port_vcounderrange = "PORT_CONNECTIVITY";
parameter port_scanclkena = "PORT_CONNECTIVITY";
parameter using_fbmimicbidir_port = "ON";

//For Stratixii pll use only
parameter   c0_high             = 1;
parameter   c1_high             = 1;
parameter   c2_high             = 1;
parameter   c3_high             = 1;
parameter   c4_high             = 1;
parameter   c5_high             = 1;
parameter   c6_high             = 1;
parameter   c7_high             = 1;
parameter   c8_high             = 1;
parameter   c9_high             = 1;
parameter   c0_low              = 1;
parameter   c1_low              = 1;
parameter   c2_low              = 1;
parameter   c3_low              = 1;
parameter   c4_low              = 1;
parameter   c5_low              = 1;
parameter   c6_low              = 1;
parameter   c7_low              = 1;
parameter   c8_low              = 1;
parameter   c9_low              = 1;
parameter   c0_initial          = 1;
parameter   c1_initial          = 1;
parameter   c2_initial          = 1;
parameter   c3_initial          = 1;
parameter   c4_initial          = 1;
parameter   c5_initial          = 1;
parameter   c6_initial          = 1;
parameter   c7_initial          = 1;
parameter   c8_initial          = 1;
parameter   c9_initial          = 1;
parameter   c0_mode             = "bypass";
parameter   c1_mode             = "bypass";
parameter   c2_mode             = "bypass";
parameter   c3_mode             = "bypass";
parameter   c4_mode             = "bypass";
parameter   c5_mode             = "bypass";
parameter   c6_mode             = "bypass";
parameter   c7_mode             = "bypass";
parameter   c8_mode             = "bypass";
parameter   c9_mode             = "bypass";
parameter   c0_ph               = 0;
parameter   c1_ph               = 0;
parameter   c2_ph               = 0;
parameter   c3_ph               = 0;
parameter   c4_ph               = 0;
parameter   c5_ph               = 0;
parameter   c6_ph               = 0;
parameter   c7_ph               = 0;
parameter   c8_ph               = 0;
parameter   c9_ph               = 0;
parameter   c1_use_casc_in      = "off";
parameter   c2_use_casc_in      = "off";
parameter   c3_use_casc_in      = "off";
parameter   c4_use_casc_in      = "off";
parameter   c5_use_casc_in      = "off";
parameter   c6_use_casc_in      = "off";
parameter   c7_use_casc_in      = "off";
parameter   c8_use_casc_in      = "off";
parameter   c9_use_casc_in      = "off";
parameter   m_test_source       = 5;
parameter   c0_test_source      = 5;
parameter   c1_test_source      = 5;
parameter   c2_test_source      = 5;
parameter   c3_test_source      = 5;
parameter   c4_test_source      = 5;
parameter   c5_test_source      = 5;
parameter   c6_test_source      = 5;
parameter   c7_test_source      = 5;
parameter   c8_test_source      = 5;
parameter   c9_test_source      = 5;
parameter   sim_gate_lock_device_behavior = "OFF";

// INPUT PORT DECLARATION
input       [1:0] inclk;
input       fbin;
input       pllena;
input       clkswitch;
input       areset;
input       pfdena;
input       [5:0] clkena;
input       [3:0] extclkena;
input       scanclk;
input       scanclkena;
input       scanaclr;
input       scanread;
input       scanwrite;
input       scandata;
input       [width_phasecounterselect-1:0] phasecounterselect;
input       phaseupdown;
input       phasestep;
input       configupdate;

// INOUT PORT DECLARATION
inout fbmimicbidir;

// OUTPUT PORT DECLARATION
output        [width_clock-1:0] clk;
output        [3:0] extclk;
output        [1:0] clkbad;
output        activeclock;
output        enable0;
output        enable1;
output        clkloss;
output        locked;
output        scandataout;
output        scandone;
output        sclkout0;
output        sclkout1;
output        phasedone;
output        vcooverrange;
output        vcounderrange;
output        fbout;
output        fref;
output        icdrclk;

// pullups
tri1 ena_pullup;
tri1 pfdena_pullup;
tri1 [5:0] clkena_pullup;
tri1 [3:0] extclkena_pullup;
tri1 scanclkena_pullup;

// pulldowns
tri0 fbin_pulldown;
tri0 [1:0] inclk_pulldown;
tri0 clkswitch_pulldown;
tri0 areset_pulldown;
tri0 scanclk_pulldown;
tri0 scanclr_pulldown;
tri0 scanread_pulldown;
tri0 scanwrite_pulldown;
tri0 scandata_pulldown;
tri0 comparator_pulldown;
tri0 configupdate_pulldown;
tri0 [3:0] phasecounterselect_pulldown;
tri0 phaseupdown_pulldown;
tri0 phasestep_pulldown;

// For fast mode, the stratix pll atom model will give active low signal on locked output.
// Therefore, need to invert the lock signal for fast mode as in user view, locked signal is
// always active high.
wire locked_tmp;
wire pll_lock;
wire [1:0] stratix_inclk;
wire stratix_fbin;
wire stratix_ena;
wire stratix_clkswitch;
wire stratix_areset;
wire stratix_pfdena;
wire [5:0] stratix_clkena;
wire [3:0] stratix_extclkena;
wire stratix_scanclk;
wire stratix_scanclr;
wire stratix_scandata;
wire [5:0] stratix_clk;
wire [3:0] stratix_extclk;
wire [1:0] stratix_clkbad;
wire stratix_activeclock;
wire stratix_locked;
wire stratix_clkloss;
wire stratix_scandataout;
wire stratix_enable0;
wire stratix_enable1;

wire [1:0] stratixii_inclk;
wire stratixii_fbin;
wire stratixii_ena;
wire stratixii_clkswitch;
wire stratixii_areset;
wire stratixii_pfdena;
wire stratixii_scanread;
wire stratixii_scanwrite;
wire stratixii_scanclk;
wire stratixii_scandata;
wire stratixii_scandone;
wire [5:0] stratixii_clk;
wire [1:0] stratixii_clkbad;
wire stratixii_activeclock;
wire stratixii_locked;
wire stratixii_clkloss;
wire stratixii_scandataout;
wire stratixii_enable0;
wire stratixii_enable1;
wire stratixii_sclkout0;
wire stratixii_sclkout1;
wire [1:0] stratix3_inclk;
wire stratix3_clkswitch;
wire stratix3_areset;
wire stratix3_pfdena;
wire stratix3_scanclk;
wire [9:0] stratix3_clk;
wire [1:0] stratix3_clkbad;
wire stratix3_activeclock;
wire stratix3_locked;
wire stratix3_scandataout;
wire stratix3_scandone;
wire stratix3_phasedone;
wire stratix3_vcooverrange;
wire stratix3_vcounderrange;
wire stratix3_fbin;
wire stratix3_fbout;
wire [3:0] stratix3_phasecounterselect;

wire [1:0] cyclone3_inclk;
wire cyclone3_clkswitch;
wire cyclone3_areset;
wire cyclone3_pfdena;
wire cyclone3_scanclk;
wire [4:0] cyclone3_clk;
wire [1:0] cyclone3_clkbad;
wire cyclone3_activeclock;
wire cyclone3_locked;
wire cyclone3_scandataout;
wire cyclone3_scandone;
wire cyclone3_phasedone;
wire cyclone3_vcooverrange;
wire cyclone3_vcounderrange;
wire cyclone3_fbout;
wire [2:0] cyclone3_phasecounterselect;

wire [1:0] cyclone3gl_inclk;
wire cyclone3gl_clkswitch;
wire cyclone3gl_areset;
wire cyclone3gl_pfdena;
wire cyclone3gl_scanclk;
wire [4:0] cyclone3gl_clk;
wire [1:0] cyclone3gl_clkbad;
wire cyclone3gl_activeclock;
wire cyclone3gl_locked;
wire cyclone3gl_scandataout;
wire cyclone3gl_scandone;
wire cyclone3gl_phasedone;
wire cyclone3gl_vcooverrange;
wire cyclone3gl_vcounderrange;
wire cyclone3gl_fbout;
wire [2:0] cyclone3gl_phasecounterselect;
wire cyclone3gl_fref;
wire cyclone3gl_icdrclk;
wire[9:0] clk_wire;
wire[9:0] clk_tmp;
wire[1:0] clkbad_wire;
wire activeclock_wire;
wire clkloss_wire;
wire scandataout_wire;
wire scandone_wire;
wire sclkout0_wire;
wire sclkout1_wire;
wire locked_wire;
wire phasedone_wire;
wire vcooverrange_wire;
wire vcounderrange_wire;
wire fbout_wire;
wire iobuf_io;
wire iobuf_o;

reg pll_lock_sync;

reg family_stratixiii;
reg family_cycloneiii;
reg family_cycloneiiigl;
reg family_base_cycloneii;
reg family_arriaii;
reg family_has_stratix_style_pll;
reg family_has_stratixii_style_pll;

ALTERA_DEVICE_FAMILIES_2 dev ();

// FUNCTION DECLARATION

// convert uppercase parameter values to lowercase
// assumes that the maximum character length of a parameter is 18
function [8*`STR_LENGTH:1] alpha_tolower;
input [8*`STR_LENGTH:1] given_string;

reg [8*`STR_LENGTH:1] return_string;
reg [8*`STR_LENGTH:1] reg_string;
reg [8:1] tmp;
reg [8:1] conv_char;
integer byte_count;
begin
    return_string = "                    "; // initialise strings to spaces
    conv_char = "        ";
    reg_string = given_string;
    for (byte_count = `STR_LENGTH; byte_count >= 1; byte_count = byte_count - 1)
    begin
        tmp = reg_string[8*`STR_LENGTH:(8*(`STR_LENGTH-1)+1)];
        reg_string = reg_string << 8;
        if ((tmp >= 65) && (tmp <= 90)) // ASCII number of 'A' is 65, 'Z' is 90
        begin
            conv_char = tmp + 32; // 32 is the difference in the position of 'A' and 'a' in the ASCII char set
            return_string = {return_string, conv_char};
        end
        else
            return_string = {return_string, tmp};
    end

    alpha_tolower = return_string;
end
endfunction

// INITIAL BLOCK
initial
begin

    // Begin of parameter checking

    if (clk5_multiply_by <= 0)
    begin
        $display("ERROR: The clk5_multiply_by must be greater than 0");
        $display("Time: %0t  Instance: %m", $time);
        $stop;
    end

    if (clk4_multiply_by <= 0)
    begin
        $display("ERROR: The clk4_multiply_by must be greater than 0");
        $display("Time: %0t  Instance: %m", $time);
        $stop;
    end

    if (clk3_multiply_by <= 0)
    begin
        $display("ERROR: The clk3_multiply_by must be greater than 0");
        $display("Time: %0t  Instance: %m", $time);
        $stop;
    end


    if (clk2_multiply_by <= 0)
    begin
        $display("ERROR: The clk2_multiply_by must be greater than 0");
        $display("Time: %0t  Instance: %m", $time);
        $stop;
    end

    if (clk1_multiply_by <= 0)
    begin
        $display("ERROR: The clk1_multiply_by must be greater than 0");
        $display("Time: %0t  Instance: %m", $time);
        $stop;
    end

    if (clk0_multiply_by <= 0)
    begin
        $display("ERROR: The clk0_multiply_by must be greater than 0");
        $display("Time: %0t  Instance: %m", $time);
        $stop;
    end

    if (clk5_divide_by <= 0)
    begin
        $display("ERROR: The clk5_divide_by must be greater than 0");
        $display("Time: %0t  Instance: %m", $time);
        $stop;
    end


    if (clk4_divide_by <= 0)
    begin
        $display("ERROR: The clk4_divide_by must be greater than 0");
        $display("Time: %0t  Instance: %m", $time);
        $stop;
    end


    if (clk3_divide_by <= 0)
    begin
        $display("ERROR: The clk3_divide_by must be greater than 0");
        $display("Time: %0t  Instance: %m", $time);
        $stop;
    end


    if (clk2_divide_by <= 0)
    begin
        $display("ERROR: The clk2_divide_by must be greater than 0");
        $display("Time: %0t  Instance: %m", $time);
        $stop;
    end


    if (clk1_divide_by <= 0)
    begin
        $display("ERROR: The clk1_divide_by must be greater than 0");
        $display("Time: %0t  Instance: %m", $time);
        $stop;
    end


    if (clk0_divide_by <= 0)
    begin
        $display("ERROR: The clk0_divide_by must be greater than 0");
        $display("Time: %0t  Instance: %m", $time);
        $stop;
    end

    if (extclk3_multiply_by <= 0)
    begin
        $display("ERROR: The extclk3_multiply_by must be greater than 0");
        $display("Time: %0t  Instance: %m", $time);
        $stop;
    end

    if (extclk2_multiply_by <= 0)
    begin
        $display("ERROR: The extclk2_multiply_by must be greater than 0");
        $display("Time: %0t  Instance: %m", $time);
        $stop;
    end

    if (extclk1_multiply_by <= 0)
    begin
        $display("ERROR: The extclk1_multiply_by must be greater than 0");
        $display("Time: %0t  Instance: %m", $time);
        $stop;
    end

    if (extclk0_multiply_by <= 0)
    begin
        $display("ERROR: The extclk0_multiply_by must be greater than 0");
        $display("Time: %0t  Instance: %m", $time);
        $stop;
    end


    if (extclk3_divide_by <= 0)
    begin
        $display("ERROR: The extclk3_divide_by must be greater than 0");
        $display("Time: %0t  Instance: %m", $time);
        $stop;
    end


    if (extclk2_divide_by <= 0)
    begin
        $display("ERROR: The extclk2_divide_by must be greater than 0");
        $display("Time: %0t  Instance: %m", $time);
        $stop;
    end


    if (extclk1_divide_by <= 0)
    begin
        $display("ERROR: The extclk1_divide_by must be greater than 0");
        $display("Time: %0t  Instance: %m", $time);
        $stop;
    end


    if (extclk0_divide_by <= 0)
    begin
        $display("ERROR: The extclk0_divide_by must be greater than 0");
        $display("Time: %0t  Instance: %m", $time);
        $stop;
    end

    if (!((primary_clock == "inclk0") || (primary_clock == "INCLK0") || 
        (primary_clock == "inclk1") || (primary_clock == "INCLK1"))) 
    begin
        $display("ERROR: The primary clock is set to an illegal value");
        $display("Time: %0t  Instance: %m", $time);
        $stop;
    end

    if (dev.IS_VALID_FAMILY(intended_device_family) == 0)
    begin
        $display ("Error! Unknown INTENDED_DEVICE_FAMILY=%s.", intended_device_family);
        $stop;
    end
    
    family_stratixiii = dev.FEATURE_FAMILY_STRATIXIII(intended_device_family);
    family_cycloneiiigl = dev.FEATURE_FAMILY_CYCLONEIVGX(intended_device_family);
    family_cycloneiii = !family_cycloneiiigl && (dev.FEATURE_FAMILY_CYCLONEIII(intended_device_family) || dev.FEATURE_FAMILY_MAX10(intended_device_family) );
    family_base_cycloneii = dev.FEATURE_FAMILY_BASE_CYCLONEII(intended_device_family);
    family_arriaii = dev.FEATURE_FAMILY_ARRIAIIGX(intended_device_family);
    family_has_stratix_style_pll = dev.FEATURE_FAMILY_HAS_STRATIX_STYLE_PLL(intended_device_family);
    family_has_stratixii_style_pll = dev.FEATURE_FAMILY_HAS_STRATIXII_STYLE_PLL(intended_device_family);

    if((family_arriaii) && (operation_mode == "external_feedback"))
    begin
        $display ("ERROR: The external feedback mode is not supported for the ARRIA II family.");
        $stop;
    end
    
    if((family_arriaii) && (pll_type == "top_bottom"))
    begin
        $display ("WARNING: A pll_type specification is not supported for the ARRIA II family.  It will be ignored.");
        $display ("Time: %0t  Instance: %m", $time);
    end
    
    if((family_arriaii) && ((port_clk7 != "PORT_UNUSED") || (port_clk8 != "PORT_UNUSED") || (port_clk9 != "PORT_UNUSED")))
    begin
        $display ("ERROR: One or more clock outputs used in the design are not supported in ARRIA II family.");
        $stop;
    end
    
    // End of parameter checking

    pll_lock_sync = 1'b1;

end

// COMPONENT INSTANTIATION
generate
if ((intended_device_family == "Stratix") || (intended_device_family == "STRATIX") || (intended_device_family == "stratix") || (intended_device_family == "Yeager") || (intended_device_family == "YEAGER") || (intended_device_family == "yeager") 
    || (intended_device_family == "Cyclone") || (intended_device_family == "CYCLONE") || (intended_device_family == "cyclone") || (intended_device_family == "ACEX2K") || (intended_device_family == "acex2k") || (intended_device_family == "ACEX 2K") || (intended_device_family == "acex 2k") || (intended_device_family == "Tornado") || (intended_device_family == "TORNADO") || (intended_device_family == "tornado") 
    || (intended_device_family == "Stratix GX") || (intended_device_family == "STRATIX GX") || (intended_device_family == "stratix gx") || (intended_device_family == "Stratix-GX") || (intended_device_family == "STRATIX-GX") || (intended_device_family == "stratix-gx") || (intended_device_family == "StratixGX") || (intended_device_family == "STRATIXGX") || (intended_device_family == "stratixgx") || (intended_device_family == "Aurora") || (intended_device_family == "AURORA") || (intended_device_family == "aurora") 
    || (intended_device_family == "StratixHC"))
begin : stratix_pll

MF_stratix_pll
#(
        .operation_mode         (operation_mode),
        .pll_type               (pll_type),
        .qualify_conf_done      (qualify_conf_done),
        .compensate_clock       (compensate_clock),
        .scan_chain             (scan_chain),
        .primary_clock          (primary_clock),
        .inclk0_input_frequency (inclk0_input_frequency),
        .inclk1_input_frequency (inclk1_input_frequency),
        .gate_lock_signal       (gate_lock_signal),
        .gate_lock_counter      (gate_lock_counter),
        .valid_lock_multiplier  (valid_lock_multiplier),
        .invalid_lock_multiplier (invalid_lock_multiplier),
        .switch_over_on_lossclk (switch_over_on_lossclk),
        .switch_over_on_gated_lock (switch_over_on_gated_lock),
        .enable_switch_over_counter (enable_switch_over_counter),
        .switch_over_counter    (switch_over_counter),
        .feedback_source        (feedback_source),
        .bandwidth              (bandwidth),
        .bandwidth_type         (bandwidth_type),
        .spread_frequency       (spread_frequency),
        .down_spread            (down_spread),
        .simulation_type        (simulation_type),
        .skip_vco               (skip_vco),
        .family_name            (intended_device_family),

        //  internal clock specifications
        .clk5_multiply_by       (clk5_multiply_by),
        .clk4_multiply_by       (clk4_multiply_by),
        .clk3_multiply_by       (clk3_multiply_by),
        .clk2_multiply_by       (clk2_multiply_by),
        .clk1_multiply_by       (clk1_multiply_by),
        .clk0_multiply_by       (clk0_multiply_by),
        .clk5_divide_by         (clk5_divide_by),
        .clk4_divide_by         (clk4_divide_by),
        .clk3_divide_by         (clk3_divide_by),
        .clk2_divide_by         (clk2_divide_by),
        .clk1_divide_by         (clk1_divide_by),
        .clk0_divide_by         (clk0_divide_by),
        .clk5_phase_shift       (clk5_phase_shift),
        .clk4_phase_shift       (clk4_phase_shift),
        .clk3_phase_shift       (clk3_phase_shift),
        .clk2_phase_shift       (clk2_phase_shift),
        .clk1_phase_shift       (clk1_phase_shift),
        .clk0_phase_shift       (clk0_phase_shift),
        .clk5_time_delay        (clk5_time_delay),
        .clk4_time_delay        (clk4_time_delay),
        .clk3_time_delay        (clk3_time_delay),
        .clk2_time_delay        (clk2_time_delay),
        .clk1_time_delay        (clk1_time_delay),
        .clk0_time_delay        (clk0_time_delay),
        .clk5_duty_cycle        (clk5_duty_cycle),
        .clk4_duty_cycle        (clk4_duty_cycle),
        .clk3_duty_cycle        (clk3_duty_cycle),
        .clk2_duty_cycle        (clk2_duty_cycle),
        .clk1_duty_cycle        (clk1_duty_cycle),
        .clk0_duty_cycle        (clk0_duty_cycle),

        //  external clock specifications
        .extclk3_multiply_by    (extclk3_multiply_by),
        .extclk2_multiply_by    (extclk2_multiply_by),
        .extclk1_multiply_by    (extclk1_multiply_by),
        .extclk0_multiply_by    (extclk0_multiply_by),
        .extclk3_divide_by      (extclk3_divide_by),
        .extclk2_divide_by      (extclk2_divide_by),
        .extclk1_divide_by      (extclk1_divide_by),
        .extclk0_divide_by      (extclk0_divide_by),
        .extclk3_phase_shift    (extclk3_phase_shift),
        .extclk2_phase_shift    (extclk2_phase_shift),
        .extclk1_phase_shift    (extclk1_phase_shift),
        .extclk0_phase_shift    (extclk0_phase_shift),
        .extclk3_time_delay     (extclk3_time_delay),
        .extclk2_time_delay     (extclk2_time_delay),
        .extclk1_time_delay     (extclk1_time_delay),
        .extclk0_time_delay     (extclk0_time_delay),
        .extclk3_duty_cycle     (extclk3_duty_cycle),
        .extclk2_duty_cycle     (extclk2_duty_cycle),
        .extclk1_duty_cycle     (extclk1_duty_cycle),
        .extclk0_duty_cycle     (extclk0_duty_cycle),

        // advanced parameters
        .vco_min                ((vco_min == 0 && m != 0)? 1000 : vco_min),
        .vco_max                ((vco_max == 0 && m != 0)? 3600 : vco_max),
        .vco_center             (vco_center),
        .pfd_min                (pfd_min),
        .pfd_max                (pfd_max),
        .m_initial              (m_initial),
        .m                      (m),
        .n                      (n),
        .m2                     (m2),
        .n2                     (n2),
        .ss                     (ss),
        .l0_high                (l0_high),
        .l1_high                (l1_high),
        .g0_high                (g0_high),
        .g1_high                (g1_high),
        .g2_high                (g2_high),
        .g3_high                (g3_high),
        .e0_high                (e0_high),
        .e1_high                (e1_high),
        .e2_high                (e2_high),
        .e3_high                (e3_high),
        .l0_low                 (l0_low),
        .l1_low                 (l1_low),
        .g0_low                 (g0_low),
        .g1_low                 (g1_low),
        .g2_low                 (g2_low),
        .g3_low                 (g3_low),
        .e0_low                 (e0_low),
        .e1_low                 (e1_low),
        .e2_low                 (e2_low),
        .e3_low                 (e3_low),
        .l0_initial             (l0_initial),
        .l1_initial             (l1_initial),
        .g0_initial             (g0_initial),
        .g1_initial             (g1_initial),
        .g2_initial             (g2_initial),
        .g3_initial             (g3_initial),
        .e0_initial             (e0_initial),
        .e1_initial             (e1_initial),
        .e2_initial             (e2_initial),
        .e3_initial             (e3_initial),
        .l0_mode                (l0_mode),
        .l1_mode                (l1_mode),
        .g0_mode                (g0_mode),
        .g1_mode                (g1_mode),
        .g2_mode                (g2_mode),
        .g3_mode                (g3_mode),
        .e0_mode                (e0_mode),
        .e1_mode                (e1_mode),
        .e2_mode                (e2_mode),
        .e3_mode                (e3_mode),
        .l0_ph                  (l0_ph),
        .l1_ph                  (l1_ph),
        .g0_ph                  (g0_ph),
        .g1_ph                  (g1_ph),
        .g2_ph                  (g2_ph),
        .g3_ph                  (g3_ph),
        .e0_ph                  (e0_ph),
        .e1_ph                  (e1_ph),
        .e2_ph                  (e2_ph),
        .e3_ph                  (e3_ph),
        .m_ph                   (m_ph),
        .l0_time_delay          (l0_time_delay),
        .l1_time_delay          (l1_time_delay),
        .g0_time_delay          (g0_time_delay),
        .g1_time_delay          (g1_time_delay),
        .g2_time_delay          (g2_time_delay),
        .g3_time_delay          (g3_time_delay),
        .e0_time_delay          (e0_time_delay),
        .e1_time_delay          (e1_time_delay),
        .e2_time_delay          (e2_time_delay),
        .e3_time_delay          (e3_time_delay),
        .m_time_delay           (m_time_delay),
        .n_time_delay           (n_time_delay),
        .extclk3_counter        (extclk3_counter),
        .extclk2_counter        (extclk2_counter),
        .extclk1_counter        (extclk1_counter),
        .extclk0_counter        (extclk0_counter),
        .clk5_counter           (clk5_counter),
        .clk4_counter           (clk4_counter),
        .clk3_counter           (clk3_counter),
        .clk2_counter           (clk2_counter),
        .clk1_counter           (clk1_counter),
        .clk0_counter           (clk0_counter),
        .enable0_counter        (enable0_counter),
        .enable1_counter        (enable1_counter),
        .charge_pump_current    (charge_pump_current),
        .loop_filter_r          (loop_filter_r),
        .loop_filter_c          (loop_filter_c)
)

pll0
(
    .inclk (stratix_inclk),
    .fbin (stratix_fbin),
    .ena (stratix_ena),
    .clkswitch (stratix_clkswitch),
    .areset (stratix_areset),
    .pfdena (stratix_pfdena),
    .clkena (stratix_clkena),
    .extclkena (stratix_extclkena),
    .scanclk (stratix_scanclk),
    .scanaclr (stratix_scanclr),
    .scandata (stratix_scandata),
    .comparator(),
    .clk (stratix_clk),
    .extclk (stratix_extclk),
    .clkbad (stratix_clkbad),
    .activeclock (stratix_activeclock),
    .locked (locked_tmp),
    .clkloss (stratix_clkloss),
    .scandataout (stratix_scandataout),
    .enable0 (stratix_enable0),
    .enable1 (stratix_enable1)
);

end
endgenerate

generate
if ((intended_device_family == "Stratix II") || (intended_device_family == "STRATIX II") || (intended_device_family == "stratix ii") || (intended_device_family == "StratixII") || (intended_device_family == "STRATIXII") || (intended_device_family == "stratixii") || (intended_device_family == "Armstrong") || (intended_device_family == "ARMSTRONG") || (intended_device_family == "armstrong") 
    || (intended_device_family == "HardCopy II") || (intended_device_family == "HARDCOPY II") || (intended_device_family == "hardcopy ii") || (intended_device_family == "HardCopyII") || (intended_device_family == "HARDCOPYII") || (intended_device_family == "hardcopyii") || (intended_device_family == "Fusion") || (intended_device_family == "FUSION") || (intended_device_family == "fusion")
    || (intended_device_family == "Stratix II GX") || (intended_device_family == "STRATIX II GX") || (intended_device_family == "stratix ii gx") || (intended_device_family == "StratixIIGX") || (intended_device_family == "STRATIXIIGX") || (intended_device_family == "stratixiigx")
    || (intended_device_family == "Arria GX") || (intended_device_family == "ARRIA GX") || (intended_device_family == "arria gx") || (intended_device_family == "ArriaGX") || (intended_device_family == "ARRIAGX") || (intended_device_family == "arriagx") || (intended_device_family == "Stratix II GX Lite") || (intended_device_family == "STRATIX II GX LITE") || (intended_device_family == "stratix ii gx lite") || (intended_device_family == "StratixIIGXLite") || (intended_device_family == "STRATIXIIGXLITE") || (intended_device_family == "stratixiigxlite")
    || (intended_device_family == "Cyclone II") || (intended_device_family == "CYCLONE II") || (intended_device_family == "cyclone ii") || (intended_device_family == "Cycloneii") || (intended_device_family == "CYCLONEII") || (intended_device_family == "cycloneii") || (intended_device_family == "Magellan") || (intended_device_family == "MAGELLAN") || (intended_device_family == "magellan"))
begin : stratixii_pll

MF_stratixii_pll
#(
        .operation_mode         (operation_mode),
        .pll_type               (pll_type),
        .qualify_conf_done      (qualify_conf_done),
        .compensate_clock       (compensate_clock),
        .inclk0_input_frequency (inclk0_input_frequency),
        .inclk1_input_frequency (inclk1_input_frequency),
        .gate_lock_signal       (gate_lock_signal),
        .gate_lock_counter      (gate_lock_counter),
        .valid_lock_multiplier  (valid_lock_multiplier),
        .invalid_lock_multiplier (invalid_lock_multiplier),
        .switch_over_type       (switch_over_type),
        .switch_over_on_lossclk (switch_over_on_lossclk),
        .switch_over_on_gated_lock (switch_over_on_gated_lock),
        .enable_switch_over_counter (enable_switch_over_counter),
        .switch_over_counter    (switch_over_counter),
        .feedback_source        ((feedback_source == "EXTCLK0") ? "CLK0" : feedback_source),
        .bandwidth              (bandwidth),
        .bandwidth_type         (bandwidth_type),
        .spread_frequency       (spread_frequency),
        .down_spread            (down_spread),
        .self_reset_on_gated_loss_lock (self_reset_on_gated_loss_lock),
        .simulation_type        (simulation_type),
        .family_name            (intended_device_family),

        //  internal clock specifications
        .clk5_multiply_by       (clk5_multiply_by),
        .clk4_multiply_by       (clk4_multiply_by),
        .clk3_multiply_by       (clk3_multiply_by),
        .clk2_multiply_by       (clk2_multiply_by),
        .clk1_multiply_by       (clk1_multiply_by),
        .clk0_multiply_by       (clk0_multiply_by),
        .clk5_divide_by         (clk5_divide_by),
        .clk4_divide_by         (clk4_divide_by),
        .clk3_divide_by         (clk3_divide_by),
        .clk2_divide_by         (clk2_divide_by),
        .clk1_divide_by         (clk1_divide_by),
        .clk0_divide_by         (clk0_divide_by),
        .clk5_phase_shift       (clk5_phase_shift),
        .clk4_phase_shift       (clk4_phase_shift),
        .clk3_phase_shift       (clk3_phase_shift),
        .clk2_phase_shift       (clk2_phase_shift),
        .clk1_phase_shift       (clk1_phase_shift),
        .clk0_phase_shift       (clk0_phase_shift),
        .clk5_duty_cycle        (clk5_duty_cycle),
        .clk4_duty_cycle        (clk4_duty_cycle),
        .clk3_duty_cycle        (clk3_duty_cycle),
        .clk2_duty_cycle        (clk2_duty_cycle),
        .clk1_duty_cycle        (clk1_duty_cycle),
        .clk0_duty_cycle        (clk0_duty_cycle),
        .vco_multiply_by        (vco_multiply_by),
        .vco_divide_by          (vco_divide_by),
        .clk2_output_frequency  (clk2_output_frequency),
        .clk1_output_frequency  (clk1_output_frequency),
        .clk0_output_frequency  (clk0_output_frequency),

        // advanced parameters
        .vco_min                ((vco_min == 0 && m != 0)? 700 : vco_min),
        .vco_max                ((vco_max == 0 && m != 0)? 3600 : vco_max),
        .vco_center             (vco_center),
        .pfd_min                (pfd_min),
        .pfd_max                (pfd_max),
        .m_initial              (m_initial),
        .m                      (m),
        .n                      (n),
        .m2                     (m2),
        .n2                     (n2),
        .ss                     (ss),
        .c0_high                (c0_high),
        .c1_high                (c1_high),
        .c2_high                (c2_high),
        .c3_high                (c3_high),
        .c4_high                (c4_high),
        .c5_high                (c5_high),
        .c0_low                 (c0_low),
        .c1_low                 (c1_low),
        .c2_low                 (c2_low),
        .c3_low                 (c3_low),
        .c4_low                 (c4_low),
        .c5_low                 (c5_low),
        .c0_initial             (c0_initial),
        .c1_initial             (c1_initial),
        .c2_initial             (c2_initial),
        .c3_initial             (c3_initial),
        .c4_initial             (c4_initial),
        .c5_initial             (c5_initial),
        .c0_mode                (c0_mode),
        .c1_mode                (c1_mode),
        .c2_mode                (c2_mode),
        .c3_mode                (c3_mode),
        .c4_mode                (c4_mode),
        .c5_mode                (c5_mode),
        .c0_ph                  (c0_ph),
        .c1_ph                  (c1_ph),
        .c2_ph                  (c2_ph),
        .c3_ph                  (c3_ph),
        .c4_ph                  (c4_ph),
        .c5_ph                  (c5_ph),
        .m_ph                   (m_ph),
        .c1_use_casc_in         (c1_use_casc_in),
        .c2_use_casc_in         (c2_use_casc_in),
        .c3_use_casc_in         (c3_use_casc_in),
        .c4_use_casc_in         (c4_use_casc_in),
        .c5_use_casc_in         (c5_use_casc_in),
        .clk5_counter           ((clk5_counter == "l1") ? "c5" : clk5_counter),
        .clk4_counter           ((clk4_counter == "l0") ? "c4" : clk4_counter),
        .clk3_counter           ((clk3_counter == "g3") ? "c3" : clk3_counter),
        .clk2_counter           ((clk2_counter == "g2") ? "c2" : clk2_counter),
        .clk1_counter           ((clk1_counter == "g1") ? "c1" : clk1_counter),
        .clk0_counter           ((clk0_counter == "g0") ? "c0" : clk0_counter),
        .enable0_counter        ((enable0_counter == "l0") ? "c0" : enable0_counter),
        .enable1_counter        ((enable1_counter == "l0") ? "c1" : enable1_counter),
        .charge_pump_current    ((m == 0)? 52 : charge_pump_current),
        .loop_filter_r          (loop_filter_r),
        .loop_filter_c          ((m == 0)? 16 : loop_filter_c),
        .m_test_source          (m_test_source),
        .c0_test_source         (c0_test_source),
        .c1_test_source         (c1_test_source),
        .c2_test_source         (c2_test_source),
        .c3_test_source         (c3_test_source),
        .c4_test_source         (c4_test_source),
        .c5_test_source         (c5_test_source),
        .sim_gate_lock_device_behavior (sim_gate_lock_device_behavior)
)

pll1
(
    .inclk (stratixii_inclk),
    .fbin (stratixii_fbin),
    .ena (stratixii_ena),
    .clkswitch (stratixii_clkswitch),
    .areset (stratixii_areset),
    .pfdena (stratixii_pfdena),
    .scanclk (stratixii_scanclk),
    .scanread (stratixii_scanread),
    .scanwrite (stratixii_scanwrite),
    .scandata (stratixii_scandata),
    .testin(),
    .scandone (stratixii_scandone),
    .clk (stratixii_clk),
    .clkbad (stratixii_clkbad),
    .activeclock (stratixii_activeclock),
    .locked (stratixii_locked),
    .clkloss (stratixii_clkloss),
    .scandataout (stratixii_scandataout),
    .enable0 (stratixii_enable0),
    .enable1 (stratixii_enable1),
    .testupout (),
    .testdownout (),
    .sclkout({stratixii_sclkout1, stratixii_sclkout0})
);

end
endgenerate

generate
if ((intended_device_family == "Stratix III") || (intended_device_family == "STRATIX III") || (intended_device_family == "stratix iii") || (intended_device_family == "StratixIII") || (intended_device_family == "STRATIXIII") || (intended_device_family == "stratixiii") || (intended_device_family == "Titan") || (intended_device_family == "TITAN") || (intended_device_family == "titan") || (intended_device_family == "SIII") || (intended_device_family == "siii")
    || (intended_device_family == "Stratix IV") || (intended_device_family == "STRATIX IV") || (intended_device_family == "stratix iv") || (intended_device_family == "TGX") || (intended_device_family == "tgx") || (intended_device_family == "StratixIV") || (intended_device_family == "STRATIXIV") || (intended_device_family == "stratixiv") || (intended_device_family == "Stratix IV (GT)") || (intended_device_family == "STRATIX IV (GT)") || (intended_device_family == "stratix iv (gt)") || (intended_device_family == "Stratix IV (GX)") || (intended_device_family == "STRATIX IV (GX)") || (intended_device_family == "stratix iv (gx)") || (intended_device_family == "Stratix IV (E)") || (intended_device_family == "STRATIX IV (E)") || (intended_device_family == "stratix iv (e)") || (intended_device_family == "StratixIV(GT)") || (intended_device_family == "STRATIXIV(GT)") || (intended_device_family == "stratixiv(gt)") || (intended_device_family == "StratixIV(GX)") || (intended_device_family == "STRATIXIV(GX)") || (intended_device_family == "stratixiv(gx)") || (intended_device_family == "StratixIV(E)") || (intended_device_family == "STRATIXIV(E)") || (intended_device_family == "stratixiv(e)") || (intended_device_family == "StratixIIIGX") || (intended_device_family == "STRATIXIIIGX") || (intended_device_family == "stratixiiigx") || (intended_device_family == "Stratix IV (GT/GX/E)") || (intended_device_family == "STRATIX IV (GT/GX/E)") || (intended_device_family == "stratix iv (gt/gx/e)") || (intended_device_family == "Stratix IV (GT/E/GX)") || (intended_device_family == "STRATIX IV (GT/E/GX)") || (intended_device_family == "stratix iv (gt/e/gx)") || (intended_device_family == "Stratix IV (E/GT/GX)") || (intended_device_family == "STRATIX IV (E/GT/GX)") || (intended_device_family == "stratix iv (e/gt/gx)") || (intended_device_family == "Stratix IV (E/GX/GT)") || (intended_device_family == "STRATIX IV (E/GX/GT)") || (intended_device_family == "stratix iv (e/gx/gt)") || (intended_device_family == "StratixIV(GT/GX/E)") || (intended_device_family == "STRATIXIV(GT/GX/E)") || (intended_device_family == "stratixiv(gt/gx/e)") || (intended_device_family == "StratixIV(GT/E/GX)") || (intended_device_family == "STRATIXIV(GT/E/GX)") || (intended_device_family == "stratixiv(gt/e/gx)") || (intended_device_family == "StratixIV(E/GX/GT)") || (intended_device_family == "STRATIXIV(E/GX/GT)") || (intended_device_family == "stratixiv(e/gx/gt)") || (intended_device_family == "StratixIV(E/GT/GX)") || (intended_device_family == "STRATIXIV(E/GT/GX)") || (intended_device_family == "stratixiv(e/gt/gx)") || (intended_device_family == "Stratix IV (GX/E)") || (intended_device_family == "STRATIX IV (GX/E)") || (intended_device_family == "stratix iv (gx/e)") || (intended_device_family == "StratixIV(GX/E)") || (intended_device_family == "STRATIXIV(GX/E)") || (intended_device_family == "stratixiv(gx/e)")
    || (intended_device_family == "Arria II GX") || (intended_device_family == "ARRIA II GX") || (intended_device_family == "arria ii gx") || (intended_device_family == "ArriaIIGX") || (intended_device_family == "ARRIAIIGX") || (intended_device_family == "arriaiigx") || (intended_device_family == "Arria IIGX") || (intended_device_family == "ARRIA IIGX") || (intended_device_family == "arria iigx") || (intended_device_family == "ArriaII GX") || (intended_device_family == "ARRIAII GX") || (intended_device_family == "arriaii gx") || (intended_device_family == "Arria II") || (intended_device_family == "ARRIA II") || (intended_device_family == "arria ii") || (intended_device_family == "ArriaII") || (intended_device_family == "ARRIAII") || (intended_device_family == "arriaii") || (intended_device_family == "Arria II (GX/E)") || (intended_device_family == "ARRIA II (GX/E)") || (intended_device_family == "arria ii (gx/e)") || (intended_device_family == "ArriaII(GX/E)") || (intended_device_family == "ARRIAII(GX/E)") || (intended_device_family == "arriaii(gx/e)") || (intended_device_family == "PIRANHA") || (intended_device_family == "piranha")
    || (intended_device_family == "HardCopy IV") || (intended_device_family == "HARDCOPY IV") || (intended_device_family == "hardcopy iv") || (intended_device_family == "HardCopyIV") || (intended_device_family == "HARDCOPYIV") || (intended_device_family == "hardcopyiv") || (intended_device_family == "HardCopy IV (GX)") || (intended_device_family == "HARDCOPY IV (GX)") || (intended_device_family == "hardcopy iv (gx)") || (intended_device_family == "HardCopy IV (E)") || (intended_device_family == "HARDCOPY IV (E)") || (intended_device_family == "hardcopy iv (e)") || (intended_device_family == "HardCopyIV(GX)") || (intended_device_family == "HARDCOPYIV(GX)") || (intended_device_family == "hardcopyiv(gx)") || (intended_device_family == "HardCopyIV(E)") || (intended_device_family == "HARDCOPYIV(E)") || (intended_device_family == "hardcopyiv(e)") || (intended_device_family == "HCXIV") || (intended_device_family == "hcxiv") || (intended_device_family == "HardCopy IV (GX/E)") || (intended_device_family == "HARDCOPY IV (GX/E)") || (intended_device_family == "hardcopy iv (gx/e)") || (intended_device_family == "HardCopy IV (E/GX)") || (intended_device_family == "HARDCOPY IV (E/GX)") || (intended_device_family == "hardcopy iv (e/gx)") || (intended_device_family == "HardCopyIV(GX/E)") || (intended_device_family == "HARDCOPYIV(GX/E)") || (intended_device_family == "hardcopyiv(gx/e)") || (intended_device_family == "HardCopyIV(E/GX)") || (intended_device_family == "HARDCOPYIV(E/GX)") || (intended_device_family == "hardcopyiv(e/gx)")
    || (intended_device_family == "Stratix V") || (intended_device_family == "STRATIX V") || (intended_device_family == "stratix v") || (intended_device_family == "StratixV") || (intended_device_family == "STRATIXV") || (intended_device_family == "stratixv") || (intended_device_family == "Stratix V (GS)") || (intended_device_family == "STRATIX V (GS)") || (intended_device_family == "stratix v (gs)") || (intended_device_family == "StratixV(GS)") || (intended_device_family == "STRATIXV(GS)") || (intended_device_family == "stratixv(gs)") || (intended_device_family == "Stratix V (GX)") || (intended_device_family == "STRATIX V (GX)") || (intended_device_family == "stratix v (gx)") || (intended_device_family == "StratixV(GX)") || (intended_device_family == "STRATIXV(GX)") || (intended_device_family == "stratixv(gx)") || (intended_device_family == "Stratix V (GS/GX)") || (intended_device_family == "STRATIX V (GS/GX)") || (intended_device_family == "stratix v (gs/gx)") || (intended_device_family == "StratixV(GS/GX)") || (intended_device_family == "STRATIXV(GS/GX)") || (intended_device_family == "stratixv(gs/gx)") || (intended_device_family == "Stratix V (GX/GS)") || (intended_device_family == "STRATIX V (GX/GS)") || (intended_device_family == "stratix v (gx/gs)") || (intended_device_family == "StratixV(GX/GS)") || (intended_device_family == "STRATIXV(GX/GS)") || (intended_device_family == "stratixv(gx/gs)")
    || (intended_device_family == "Arria V GZ") || (intended_device_family == "ARRIA V GZ") || (intended_device_family == "arria v gz") || (intended_device_family == "ArriaVGZ")  || (intended_device_family == "ARRIAVGZ")  || (intended_device_family == "arriavgz")
    || (intended_device_family == "ArriaV") || (intended_device_family == "ARRIAV") || (intended_device_family == "arriav") || (intended_device_family == "Arria V") || (intended_device_family == "ARRIA V") || (intended_device_family == "arria v")
    || (intended_device_family == "Arria II GZ") || (intended_device_family == "ARRIA II GZ") || (intended_device_family == "arria ii gz") || (intended_device_family == "ArriaII GZ") || (intended_device_family == "ARRIAII GZ") || (intended_device_family == "arriaii gz") || (intended_device_family == "Arria IIGZ") || (intended_device_family == "ARRIA IIGZ") || (intended_device_family == "arria iigz") || (intended_device_family == "ArriaIIGZ") || (intended_device_family == "ARRIAIIGZ") || (intended_device_family == "arriaiigz")
    || (intended_device_family == "HardCopy III") || (intended_device_family == "HARDCOPY III") || (intended_device_family == "hardcopy iii") || (intended_device_family == "HardCopyIII") || (intended_device_family == "HARDCOPYIII") || (intended_device_family == "hardcopyiii") || (intended_device_family == "HCX") || (intended_device_family == "hcx"))
begin : stratixiii_pll

MF_stratixiii_pll
#(
        .operation_mode         (operation_mode),
        .pll_type               (pll_type),
        .compensate_clock       (compensate_clock),
        .inclk0_input_frequency (inclk0_input_frequency),
        .inclk1_input_frequency (inclk1_input_frequency),
        .self_reset_on_loss_lock (self_reset_on_loss_lock),
        .switch_over_type       (switch_over_type),
        .enable_switch_over_counter (enable_switch_over_counter),
        .switch_over_counter    (switch_over_counter),
        .bandwidth              (bandwidth),
        .bandwidth_type         (bandwidth_type),
        .lock_high              (lock_high),
        .lock_low               (lock_low),
        .lock_window_ui         (lock_window_ui),
        .simulation_type        (simulation_type),
        .vco_frequency_control  (vco_frequency_control),
        .vco_phase_shift_step   (vco_phase_shift_step),
        .family_name            (intended_device_family),

        //  internal clock specifications
        .clk9_multiply_by       (clk9_multiply_by),
        .clk8_multiply_by       (clk8_multiply_by),
        .clk7_multiply_by       (clk7_multiply_by),
        .clk6_multiply_by       (clk6_multiply_by),
        .clk5_multiply_by       (clk5_multiply_by),
        .clk4_multiply_by       (clk4_multiply_by),
        .clk3_multiply_by       (clk3_multiply_by),
        .clk2_multiply_by       (clk2_multiply_by),
        .clk1_multiply_by       (clk1_multiply_by),
        .clk0_multiply_by       (clk0_multiply_by),
        .clk9_divide_by         (clk9_divide_by),
        .clk8_divide_by         (clk8_divide_by),
        .clk7_divide_by         (clk7_divide_by),
        .clk6_divide_by         (clk6_divide_by),
        .clk5_divide_by         (clk5_divide_by),
        .clk4_divide_by         (clk4_divide_by),
        .clk3_divide_by         (clk3_divide_by),
        .clk2_divide_by         (clk2_divide_by),
        .clk1_divide_by         (clk1_divide_by),
        .clk0_divide_by         (clk0_divide_by),
        .clk9_phase_shift       (clk9_phase_shift),
        .clk8_phase_shift       (clk8_phase_shift),
        .clk7_phase_shift       (clk7_phase_shift),
        .clk6_phase_shift       (clk6_phase_shift),
        .clk5_phase_shift       (clk5_phase_shift),
        .clk4_phase_shift       (clk4_phase_shift),
        .clk3_phase_shift       (clk3_phase_shift),
        .clk2_phase_shift       (clk2_phase_shift),
        .clk1_phase_shift       (clk1_phase_shift),
        .clk0_phase_shift       (clk0_phase_shift),
        .clk9_duty_cycle        (clk9_duty_cycle),
        .clk8_duty_cycle        (clk8_duty_cycle),
        .clk7_duty_cycle        (clk7_duty_cycle),
        .clk6_duty_cycle        (clk6_duty_cycle),
        .clk5_duty_cycle        (clk5_duty_cycle),
        .clk4_duty_cycle        (clk4_duty_cycle),
        .clk3_duty_cycle        (clk3_duty_cycle),
        .clk2_duty_cycle        (clk2_duty_cycle),
        .clk1_duty_cycle        (clk1_duty_cycle),
        .clk0_duty_cycle        (clk0_duty_cycle),
        .vco_multiply_by        (vco_multiply_by),
        .vco_divide_by          (vco_divide_by),
        .dpa_multiply_by        (dpa_multiply_by),
        .dpa_divide_by          (dpa_divide_by),
        .dpa_divider            (dpa_divider),
        .clk2_output_frequency  (clk2_output_frequency),
        .clk1_output_frequency  (clk1_output_frequency),
        .clk0_output_frequency  (clk0_output_frequency),
        .clk9_use_even_counter_mode    (clk9_use_even_counter_mode),
        .clk8_use_even_counter_mode    (clk8_use_even_counter_mode),
        .clk7_use_even_counter_mode    (clk7_use_even_counter_mode),
        .clk6_use_even_counter_mode    (clk6_use_even_counter_mode),
        .clk5_use_even_counter_mode    (clk5_use_even_counter_mode),
        .clk4_use_even_counter_mode    (clk4_use_even_counter_mode),
        .clk3_use_even_counter_mode    (clk3_use_even_counter_mode),
        .clk2_use_even_counter_mode    (clk2_use_even_counter_mode),
        .clk1_use_even_counter_mode    (clk1_use_even_counter_mode),
        .clk0_use_even_counter_mode    (clk0_use_even_counter_mode),
        .clk9_use_even_counter_value   (clk9_use_even_counter_value),
        .clk8_use_even_counter_value   (clk8_use_even_counter_value),
        .clk7_use_even_counter_value   (clk7_use_even_counter_value),
        .clk6_use_even_counter_value   (clk6_use_even_counter_value),
        .clk5_use_even_counter_value   (clk5_use_even_counter_value),
        .clk4_use_even_counter_value   (clk4_use_even_counter_value),
        .clk3_use_even_counter_value   (clk3_use_even_counter_value),
        .clk2_use_even_counter_value   (clk2_use_even_counter_value),
        .clk1_use_even_counter_value   (clk1_use_even_counter_value),
        .clk0_use_even_counter_value   (clk0_use_even_counter_value),

        // advanced parameters
        .vco_min                ((vco_min == 0 && m != 0)? 100 : vco_min),
        .vco_max                ((vco_max == 0 && m != 0)? 3600 : vco_max),
        .vco_center             (vco_center),
        .pfd_min                (pfd_min),
        .pfd_max                (pfd_max),
        .m_initial              (m_initial),
        .m                      (m),
        .n                      (n),
        .c0_high                (c0_high),
        .c1_high                (c1_high),
        .c2_high                (c2_high),
        .c3_high                (c3_high),
        .c4_high                (c4_high),
        .c5_high                (c5_high),
        .c6_high                (c6_high),
        .c7_high                (c7_high),
        .c8_high                (c8_high),
        .c9_high                (c9_high),
        .c0_low                 (c0_low),
        .c1_low                 (c1_low),
        .c2_low                 (c2_low),
        .c3_low                 (c3_low),
        .c4_low                 (c4_low),
        .c5_low                 (c5_low),
        .c6_low                 (c6_low),
        .c7_low                 (c7_low),
        .c8_low                 (c8_low),
        .c9_low                 (c9_low),
        .c0_initial             (c0_initial),
        .c1_initial             (c1_initial),
        .c2_initial             (c2_initial),
        .c3_initial             (c3_initial),
        .c4_initial             (c4_initial),
        .c5_initial             (c5_initial),
        .c6_initial             (c6_initial),
        .c7_initial             (c7_initial),
        .c8_initial             (c8_initial),
        .c9_initial             (c9_initial),
        .c0_mode                (c0_mode),
        .c1_mode                (c1_mode),
        .c2_mode                (c2_mode),
        .c3_mode                (c3_mode),
        .c4_mode                (c4_mode),
        .c5_mode                (c5_mode),
        .c6_mode                (c6_mode),
        .c7_mode                (c7_mode),
        .c8_mode                (c8_mode),
        .c9_mode                (c9_mode),
        .c0_ph                  (c0_ph),
        .c1_ph                  (c1_ph),
        .c2_ph                  (c2_ph),
        .c3_ph                  (c3_ph),
        .c4_ph                  (c4_ph),
        .c5_ph                  (c5_ph),
        .c6_ph                  (c6_ph),
        .c7_ph                  (c7_ph),
        .c8_ph                  (c8_ph),
        .c9_ph                  (c9_ph),
        .m_ph                   (m_ph),
        .c1_use_casc_in         (c1_use_casc_in),
        .c2_use_casc_in         (c2_use_casc_in),
        .c3_use_casc_in         (c3_use_casc_in),
        .c4_use_casc_in         (c4_use_casc_in),
        .c5_use_casc_in         (c5_use_casc_in),
        .c6_use_casc_in         (c6_use_casc_in),
        .c7_use_casc_in         (c7_use_casc_in),
        .c8_use_casc_in         (c8_use_casc_in),
        .c9_use_casc_in         (c9_use_casc_in),
        .clk9_counter           ((port_clk9 != "PORT_USED") ? "unused" : clk9_counter),
        .clk8_counter           ((port_clk8 != "PORT_USED") ? "unused" : clk8_counter),
        .clk7_counter           ((port_clk7 != "PORT_USED") ? "unused" : clk7_counter),
        .clk6_counter           ((port_clk6 != "PORT_USED") ? "unused" : clk6_counter),
        .clk5_counter           ((port_clk5 != "PORT_USED") ? "unused" : (clk5_counter == "l1") ? "c5" : clk5_counter),
        .clk4_counter           ((port_clk4 != "PORT_USED") ? "unused" : (clk4_counter == "l0") ? "c4" : clk4_counter),
        .clk3_counter           ((port_clk3 != "PORT_USED") ? "unused" : (clk3_counter == "g3") ? "c3" : clk3_counter),
        .clk2_counter           ((port_clk2 != "PORT_USED") ? "unused" : (clk2_counter == "g2") ? "c2" : clk2_counter),
        .clk1_counter           ((port_clk1 != "PORT_USED") ? "unused" : (clk1_counter == "g1") ? "c1" : clk1_counter),
        .clk0_counter           ((port_clk0 != "PORT_USED") ? "unused" : (clk0_counter == "g0") ? "c0" : clk0_counter),
        .charge_pump_current    (charge_pump_current),
        .loop_filter_r          (loop_filter_r),
        .loop_filter_c          (loop_filter_c),
        .charge_pump_current_bits (charge_pump_current_bits),
        .loop_filter_c_bits     (loop_filter_c_bits),
        .loop_filter_r_bits     (loop_filter_r_bits),
        .m_test_source          ((m_test_source == 5)  ? -1 : m_test_source),
        .c0_test_source         ((c0_test_source == 5) ? -1 : c0_test_source),
        .c1_test_source         ((c1_test_source == 5) ? -1 : c1_test_source),
        .c2_test_source         ((c2_test_source == 5) ? -1 : c2_test_source),
        .c3_test_source         ((c3_test_source == 5) ? -1 : c3_test_source),
        .c4_test_source         ((c4_test_source == 5) ? -1 : c4_test_source),
        .c5_test_source         ((c5_test_source == 5) ? -1 : c5_test_source),
        .c6_test_source         ((c6_test_source == 5) ? -1 : c6_test_source),
        .c7_test_source         ((c7_test_source == 5) ? -1 : c7_test_source),
        .c8_test_source         ((c8_test_source == 5) ? -1 : c8_test_source),
        .c9_test_source         ((c9_test_source == 5) ? -1 : c9_test_source)
)

pll2
(
    .inclk (stratix3_inclk),
    .fbin (stratix3_fbin),
    .clkswitch (stratix3_clkswitch),
    .areset (stratix3_areset),
    .pfdena (stratix3_pfdena),
    .scanclk (stratix3_scanclk),
    .scandata (scandata),
    .scanclkena (scanclkena_pullup),
    .configupdate (configupdate_pulldown),
    .clk (stratix3_clk),
    .phasecounterselect (stratix3_phasecounterselect),
    .phaseupdown (phaseupdown_pulldown),
    .phasestep (phasestep_pulldown),
    .clkbad (stratix3_clkbad),
    .activeclock (stratix3_activeclock),
    .locked (stratix3_locked),
    .scandataout (stratix3_scandataout),
    .scandone (stratix3_scandone),
    .phasedone (stratix3_phasedone),
    .vcooverrange (stratix3_vcooverrange),
    .vcounderrange (stratix3_vcounderrange),
    .fbout (stratix3_fbout)
);

end
endgenerate

// cycloneiii_msg
generate
if ((intended_device_family == "Cyclone10 LP") || (intended_device_family == "CYCLONE10 LP") || (intended_device_family == "cyclone10 lp") || (intended_device_family == "Cyclone 10LP") || (intended_device_family == "CYCLONE 10LP") || (intended_device_family == "cyclone 10lp") || (intended_device_family == "Cyclone10LP") || (intended_device_family == "CYCLONE10LP") || (intended_device_family == "cyclone10lp")|| (intended_device_family == "Cyclone 10 LP") ||(intended_device_family == "cyclone 10 lp") ||(intended_device_family == "CYCLONE 10 LP") ||(intended_device_family == "Cyclone III") || (intended_device_family == "CYCLONE III") || (intended_device_family == "cyclone iii") || (intended_device_family == "CycloneIII") || (intended_device_family == "CYCLONEIII") || (intended_device_family == "cycloneiii") || (intended_device_family == "Barracuda") || (intended_device_family == "BARRACUDA") || (intended_device_family == "barracuda") || (intended_device_family == "Cuda") || (intended_device_family == "CUDA") || (intended_device_family == "cuda") || (intended_device_family == "CIII") || (intended_device_family == "ciii")
    || (intended_device_family == "Cyclone III LS") || (intended_device_family == "CYCLONE III LS") || (intended_device_family == "cyclone iii ls") || (intended_device_family == "CycloneIIILS") || (intended_device_family == "CYCLONEIIILS") || (intended_device_family == "cycloneiiils") || (intended_device_family == "Cyclone III LPS") || (intended_device_family == "CYCLONE III LPS") || (intended_device_family == "cyclone iii lps") || (intended_device_family == "Cyclone LPS") || (intended_device_family == "CYCLONE LPS") || (intended_device_family == "cyclone lps") || (intended_device_family == "CycloneLPS") || (intended_device_family == "CYCLONELPS") || (intended_device_family == "cyclonelps") || (intended_device_family == "Tarpon") || (intended_device_family == "TARPON") || (intended_device_family == "tarpon") || (intended_device_family == "Cyclone IIIE") || (intended_device_family == "CYCLONE IIIE") || (intended_device_family == "cyclone iiie")
    || (intended_device_family == "Cyclone IV E") || (intended_device_family == "CYCLONE IV E") || (intended_device_family == "cyclone iv e") || (intended_device_family == "CycloneIV E") || (intended_device_family == "CYCLONEIV E") || (intended_device_family == "cycloneiv e") || (intended_device_family == "Cyclone IVE") || (intended_device_family == "CYCLONE IVE") || (intended_device_family == "cyclone ive") || (intended_device_family == "CycloneIVE") || (intended_device_family == "CYCLONEIVE") || (intended_device_family == "cycloneive")
	|| (intended_device_family == "MAX 10") || (intended_device_family == "MAX 10 FPGA") || (intended_device_family == "MAX10") || (intended_device_family == "max 10 fpga") || (intended_device_family == "MAX10FPGA") || (intended_device_family == "max10fpga") || (intended_device_family == "Max 10 FPGA") || (intended_device_family == "Max10FPGA"))
begin : cycloneiii_pll

MF_cycloneiii_pll
#(
        .operation_mode         (operation_mode),
        .pll_type               (pll_type),
        .compensate_clock       (compensate_clock),
        .inclk0_input_frequency (inclk0_input_frequency),
        .inclk1_input_frequency (inclk1_input_frequency),
        .self_reset_on_loss_lock (self_reset_on_loss_lock),
        .switch_over_type       (switch_over_type),
        .enable_switch_over_counter (enable_switch_over_counter),
        .switch_over_counter    (switch_over_counter),
        .bandwidth              (bandwidth),
        .bandwidth_type         (bandwidth_type),
        .lock_high              (lock_high),
        .lock_low               (lock_low),
        .lock_window_ui         (lock_window_ui),
        .simulation_type        (simulation_type),
        .vco_frequency_control  (vco_frequency_control),
        .vco_phase_shift_step   (vco_phase_shift_step),
        .family_name            (intended_device_family),

        //  internal clock specifications
        .clk4_multiply_by       (clk4_multiply_by),
        .clk3_multiply_by       (clk3_multiply_by),
        .clk2_multiply_by       (clk2_multiply_by),
        .clk1_multiply_by       (clk1_multiply_by),
        .clk0_multiply_by       (clk0_multiply_by),
        .clk4_divide_by         (clk4_divide_by),
        .clk3_divide_by         (clk3_divide_by),
        .clk2_divide_by         (clk2_divide_by),
        .clk1_divide_by         (clk1_divide_by),
        .clk0_divide_by         (clk0_divide_by),
        .clk4_phase_shift       (clk4_phase_shift),
        .clk3_phase_shift       (clk3_phase_shift),
        .clk2_phase_shift       (clk2_phase_shift),
        .clk1_phase_shift       (clk1_phase_shift),
        .clk0_phase_shift       (clk0_phase_shift),
        .clk4_duty_cycle        (clk4_duty_cycle),
        .clk3_duty_cycle        (clk3_duty_cycle),
        .clk2_duty_cycle        (clk2_duty_cycle),
        .clk1_duty_cycle        (clk1_duty_cycle),
        .clk0_duty_cycle        (clk0_duty_cycle),
        .vco_multiply_by        (vco_multiply_by),
        .vco_divide_by          (vco_divide_by),
        .clk2_output_frequency  (clk2_output_frequency),
        .clk1_output_frequency  (clk1_output_frequency),
        .clk0_output_frequency  (clk0_output_frequency),
        .clk4_use_even_counter_mode    (clk4_use_even_counter_mode),
        .clk3_use_even_counter_mode    (clk3_use_even_counter_mode),
        .clk2_use_even_counter_mode    (clk2_use_even_counter_mode),
        .clk1_use_even_counter_mode    (clk1_use_even_counter_mode),
        .clk0_use_even_counter_mode    (clk0_use_even_counter_mode),
        .clk4_use_even_counter_value   (clk4_use_even_counter_value),
        .clk3_use_even_counter_value   (clk3_use_even_counter_value),
        .clk2_use_even_counter_value   (clk2_use_even_counter_value),
        .clk1_use_even_counter_value   (clk1_use_even_counter_value),
        .clk0_use_even_counter_value   (clk0_use_even_counter_value),

        // advanced parameters
        .vco_min                ((vco_min == 0 && m != 0)? 200 : vco_min),
        .vco_max                ((vco_max == 0 && m != 0)? 3600 : vco_max),
        .vco_center             (vco_center),
        .pfd_min                (pfd_min),
        .pfd_max                (pfd_max),
        .m_initial              (m_initial),
        .m                      (m),
        .n                      (n),
        .c0_high                (c0_high),
        .c1_high                (c1_high),
        .c2_high                (c2_high),
        .c3_high                (c3_high),
        .c4_high                (c4_high),
        .c0_low                 (c0_low),
        .c1_low                 (c1_low),
        .c2_low                 (c2_low),
        .c3_low                 (c3_low),
        .c4_low                 (c4_low),
        .c0_initial             (c0_initial),
        .c1_initial             (c1_initial),
        .c2_initial             (c2_initial),
        .c3_initial             (c3_initial),
        .c4_initial             (c4_initial),
        .c0_mode                (c0_mode),
        .c1_mode                (c1_mode),
        .c2_mode                (c2_mode),
        .c3_mode                (c3_mode),
        .c4_mode                (c4_mode),
        .c0_ph                  (c0_ph),
        .c1_ph                  (c1_ph),
        .c2_ph                  (c2_ph),
        .c3_ph                  (c3_ph),
        .c4_ph                  (c4_ph),
        .m_ph                   (m_ph),
        .c1_use_casc_in         (c1_use_casc_in),
        .c2_use_casc_in         (c2_use_casc_in),
        .c3_use_casc_in         (c3_use_casc_in),
        .c4_use_casc_in         (c4_use_casc_in),
        .clk4_counter           ((port_clk4 != "PORT_USED") ? "unused" : (clk4_counter == "l0") ? "c4" : clk4_counter),
        .clk3_counter           ((port_clk3 != "PORT_USED") ? "unused" : (clk3_counter == "g3") ? "c3" : clk3_counter),
        .clk2_counter           ((port_clk2 != "PORT_USED") ? "unused" : (clk2_counter == "g2") ? "c2" : clk2_counter),
        .clk1_counter           ((port_clk1 != "PORT_USED") ? "unused" : (clk1_counter == "g1") ? "c1" : clk1_counter),
        .clk0_counter           ((port_clk0 != "PORT_USED") ? "unused" : (clk0_counter == "g0") ? "c0" : clk0_counter),
        .charge_pump_current    (charge_pump_current),
        .loop_filter_r          (loop_filter_r),
        .loop_filter_c          (loop_filter_c),
        .charge_pump_current_bits (charge_pump_current_bits),
        .loop_filter_c_bits     (loop_filter_c_bits),
        .loop_filter_r_bits     (loop_filter_r_bits),
        .m_test_source          ((m_test_source == 5)  ? -1 : m_test_source),
        .c0_test_source         ((c0_test_source == 5) ? -1 : c0_test_source),
        .c1_test_source         ((c1_test_source == 5) ? -1 : c1_test_source),
        .c2_test_source         ((c2_test_source == 5) ? -1 : c2_test_source),
        .c3_test_source         ((c3_test_source == 5) ? -1 : c3_test_source),
        .c4_test_source         ((c4_test_source == 5) ? -1 : c4_test_source)
)

pll3
(
    .inclk (cyclone3_inclk),
    .fbin (fbin),
    .clkswitch (cyclone3_clkswitch),
    .areset (cyclone3_areset),
    .pfdena (cyclone3_pfdena),
    .scanclk (cyclone3_scanclk),
    .scandata (scandata),
    .scanclkena (scanclkena_pullup),
    .configupdate (configupdate_pulldown),
    .clk (cyclone3_clk),
    .phasecounterselect (cyclone3_phasecounterselect),
    .phaseupdown (phaseupdown_pulldown),
    .phasestep (phasestep_pulldown),
    .clkbad (cyclone3_clkbad),
    .activeclock (cyclone3_activeclock),
    .locked (cyclone3_locked),
    .scandataout (cyclone3_scandataout),
    .scandone (cyclone3_scandone),
    .phasedone (cyclone3_phasedone),
    .vcooverrange (cyclone3_vcooverrange),
    .vcounderrange (cyclone3_vcounderrange),
    .fbout (cyclone3_fbout)
);

end
endgenerate
// cycloneiii_msg

generate
if ((intended_device_family == "Cyclone IV GX") || (intended_device_family == "CYCLONE IV GX") || (intended_device_family == "cyclone iv gx") || (intended_device_family == "Cyclone IVGX") || (intended_device_family == "CYCLONE IVGX") || (intended_device_family == "cyclone ivgx") || (intended_device_family == "CycloneIV GX") || (intended_device_family == "CYCLONEIV GX") || (intended_device_family == "cycloneiv gx") || (intended_device_family == "CycloneIVGX") || (intended_device_family == "CYCLONEIVGX") || (intended_device_family == "cycloneivgx") || (intended_device_family == "Cyclone IV") || (intended_device_family == "CYCLONE IV") || (intended_device_family == "cyclone iv") || (intended_device_family == "CycloneIV") || (intended_device_family == "CYCLONEIV") || (intended_device_family == "cycloneiv") || (intended_device_family == "Cyclone IV (GX)") || (intended_device_family == "CYCLONE IV (GX)") || (intended_device_family == "cyclone iv (gx)") || (intended_device_family == "CycloneIV(GX)") || (intended_device_family == "CYCLONEIV(GX)") || (intended_device_family == "cycloneiv(gx)") || (intended_device_family == "Cyclone III GX") || (intended_device_family == "CYCLONE III GX") || (intended_device_family == "cyclone iii gx") || (intended_device_family == "CycloneIII GX") || (intended_device_family == "CYCLONEIII GX") || (intended_device_family == "cycloneiii gx") || (intended_device_family == "Cyclone IIIGX") || (intended_device_family == "CYCLONE IIIGX") || (intended_device_family == "cyclone iiigx") || (intended_device_family == "CycloneIIIGX") || (intended_device_family == "CYCLONEIIIGX") || (intended_device_family == "cycloneiiigx") || (intended_device_family == "Cyclone III GL") || (intended_device_family == "CYCLONE III GL") || (intended_device_family == "cyclone iii gl") || (intended_device_family == "CycloneIII GL") || (intended_device_family == "CYCLONEIII GL") || (intended_device_family == "cycloneiii gl") || (intended_device_family == "Cyclone IIIGL") || (intended_device_family == "CYCLONE IIIGL") || (intended_device_family == "cyclone iiigl") || (intended_device_family == "CycloneIIIGL") || (intended_device_family == "CYCLONEIIIGL") || (intended_device_family == "cycloneiiigl") || (intended_device_family == "Stingray") || (intended_device_family == "STINGRAY") || (intended_device_family == "stingray"))
begin : cycloneiv_pll

MF_cycloneiiigl_pll
#(
        .operation_mode         (operation_mode),
        .pll_type               (pll_type),
        .compensate_clock       (compensate_clock),
        .inclk0_input_frequency (inclk0_input_frequency),
        .inclk1_input_frequency (inclk1_input_frequency),
        .self_reset_on_loss_lock (self_reset_on_loss_lock),
        .switch_over_type       (switch_over_type),
        .enable_switch_over_counter (enable_switch_over_counter),
        .switch_over_counter    (switch_over_counter),
        .bandwidth              (bandwidth),
        .bandwidth_type         (bandwidth_type),
        .lock_high              (lock_high),
        .lock_low               (lock_low),
        .lock_window_ui         (lock_window_ui),
        .simulation_type        (simulation_type),
        .vco_frequency_control  (vco_frequency_control),
        .vco_phase_shift_step   (vco_phase_shift_step),
        .family_name            (intended_device_family),

        //  internal clock specifications
        .clk4_multiply_by       (clk4_multiply_by),
        .clk3_multiply_by       (clk3_multiply_by),
        .clk2_multiply_by       (clk2_multiply_by),
        .clk1_multiply_by       (clk1_multiply_by),
        .clk0_multiply_by       (clk0_multiply_by),
        .clk4_divide_by         (clk4_divide_by),
        .clk3_divide_by         (clk3_divide_by),
        .clk2_divide_by         (clk2_divide_by),
        .clk1_divide_by         (clk1_divide_by),
        .clk0_divide_by         (clk0_divide_by),
        .clk4_phase_shift       (clk4_phase_shift),
        .clk3_phase_shift       (clk3_phase_shift),
        .clk2_phase_shift       (clk2_phase_shift),
        .clk1_phase_shift       (clk1_phase_shift),
        .clk0_phase_shift       (clk0_phase_shift),
        .clk4_duty_cycle        (clk4_duty_cycle),
        .clk3_duty_cycle        (clk3_duty_cycle),
        .clk2_duty_cycle        (clk2_duty_cycle),
        .clk1_duty_cycle        (clk1_duty_cycle),
        .clk0_duty_cycle        (clk0_duty_cycle),
        .dpa_multiply_by        (dpa_multiply_by),
        .dpa_divide_by          (dpa_divide_by),
        .vco_multiply_by        (vco_multiply_by),
        .vco_divide_by          (vco_divide_by),
        .clk2_output_frequency  (clk2_output_frequency),
        .clk1_output_frequency  (clk1_output_frequency),
        .clk0_output_frequency  (clk0_output_frequency),
        .clk4_use_even_counter_mode    (clk4_use_even_counter_mode),
        .clk3_use_even_counter_mode    (clk3_use_even_counter_mode),
        .clk2_use_even_counter_mode    (clk2_use_even_counter_mode),
        .clk1_use_even_counter_mode    (clk1_use_even_counter_mode),
        .clk0_use_even_counter_mode    (clk0_use_even_counter_mode),
        .clk4_use_even_counter_value   (clk4_use_even_counter_value),
        .clk3_use_even_counter_value   (clk3_use_even_counter_value),
        .clk2_use_even_counter_value   (clk2_use_even_counter_value),
        .clk1_use_even_counter_value   (clk1_use_even_counter_value),
        .clk0_use_even_counter_value   (clk0_use_even_counter_value),

        // advanced parameters
        .vco_min                ((vco_min == 0 && m != 0)? 200 : vco_min),
        .vco_max                ((vco_max == 0 && m != 0)? 3600 : vco_max),
        .vco_center             (vco_center),
        .dpa_divider            (dpa_divider),
        .pfd_min                (pfd_min),
        .pfd_max                (pfd_max),
        .m_initial              (m_initial),
        .m                      (m),
        .n                      (n),
        .c0_high                (c0_high),
        .c1_high                (c1_high),
        .c2_high                (c2_high),
        .c3_high                (c3_high),
        .c4_high                (c4_high),
        .c0_low                 (c0_low),
        .c1_low                 (c1_low),
        .c2_low                 (c2_low),
        .c3_low                 (c3_low),
        .c4_low                 (c4_low),
        .c0_initial             (c0_initial),
        .c1_initial             (c1_initial),
        .c2_initial             (c2_initial),
        .c3_initial             (c3_initial),
        .c4_initial             (c4_initial),
        .c0_mode                (c0_mode),
        .c1_mode                (c1_mode),
        .c2_mode                (c2_mode),
        .c3_mode                (c3_mode),
        .c4_mode                (c4_mode),
        .c0_ph                  (c0_ph),
        .c1_ph                  (c1_ph),
        .c2_ph                  (c2_ph),
        .c3_ph                  (c3_ph),
        .c4_ph                  (c4_ph),
        .m_ph                   (m_ph),
        .c1_use_casc_in         (c1_use_casc_in),
        .c2_use_casc_in         (c2_use_casc_in),
        .c3_use_casc_in         (c3_use_casc_in),
        .c4_use_casc_in         (c4_use_casc_in),
        .clk4_counter           ((port_clk4 !="PORT_USED") ? "unused" : (clk4_counter =="l0") ? "c4" : clk4_counter),
        .clk3_counter           ((port_clk3 !="PORT_USED") ? "unused" : (clk3_counter =="g3") ? "c3" : clk3_counter),
        .clk2_counter           ((port_clk2 !="PORT_USED") ? "unused" : (clk2_counter =="g2") ? "c2" : clk2_counter),
        .clk1_counter           ((port_clk1 !="PORT_USED") ? "unused" : (clk1_counter =="g1") ? "c1" : clk1_counter),
        .clk0_counter           ((port_clk0 !="PORT_USED") ? "unused" : (clk0_counter =="g0") ? "c0" : clk0_counter),
        .charge_pump_current    (charge_pump_current),
        .loop_filter_r          (loop_filter_r),
        .loop_filter_c          (loop_filter_c),
        .charge_pump_current_bits (charge_pump_current_bits),
        .loop_filter_c_bits     (loop_filter_c_bits),
        .loop_filter_r_bits     (loop_filter_r_bits),
        .m_test_source          ((m_test_source ==5)  ? -1 : m_test_source),
        .c0_test_source         ((c0_test_source ==5) ? -1 : c0_test_source),
        .c1_test_source         ((c1_test_source ==5) ? -1 : c1_test_source),
        .c2_test_source         ((c2_test_source ==5) ? -1 : c2_test_source),
        .c3_test_source         ((c3_test_source ==5) ? -1 : c3_test_source),
        .c4_test_source         ((c4_test_source ==5) ? -1 : c4_test_source)
)

pll4
(
    .inclk (cyclone3gl_inclk),
    .fbin (fbin),
    .clkswitch (cyclone3gl_clkswitch),
    .areset (cyclone3gl_areset),
    .pfdena (cyclone3gl_pfdena),
    .scanclk (cyclone3gl_scanclk),
    .scandata (scandata),
    .scanclkena (scanclkena_pullup),
    .configupdate (configupdate_pulldown),
    .clk (cyclone3gl_clk),
    .phasecounterselect (cyclone3gl_phasecounterselect),
    .phaseupdown (phaseupdown_pulldown),
    .phasestep (phasestep_pulldown),
    .clkbad (cyclone3gl_clkbad),
    .activeclock (cyclone3gl_activeclock),
    .locked (cyclone3gl_locked),
    .scandataout (cyclone3gl_scandataout),
    .scandone (cyclone3gl_scandone),
    .phasedone (cyclone3gl_phasedone),
    .vcooverrange (cyclone3gl_vcooverrange),
    .vcounderrange (cyclone3gl_vcounderrange),
    .fbout (cyclone3gl_fbout),
    .fref (cyclone3gl_fref),
    .icdrclk (cyclone3gl_icdrclk)
);

end
endgenerate

pll_iobuf iobuf1
(
    .i (stratix3_fbout),
    .oe (1'b1),
    .io (iobuf_io),
    .o (iobuf_o)
);

// ALWAYS CONSTRUCT BLOCK
always @(posedge pll_lock or posedge areset)
begin
    if (areset)
        pll_lock_sync <= 1'b0;
    else
        pll_lock_sync <= 1'b1;
end

// CONTINOUS ASSIGNMENT
assign ena_pullup = ((port_pllena == "PORT_CONNECTIVITY") ||
                        (port_pllena == "PORT_USED")) ? pllena : 1'b1;
assign pfdena_pullup = ((port_pfdena == "PORT_CONNECTIVITY") ||
                        (port_pfdena == "PORT_USED")) ? pfdena : 1'b1;
assign clkena_pullup[0] = (!(alpha_tolower(pll_type) == "fast") ||
                            (port_clkena0 == "PORT_USED")) &&
                            (port_clkena0 != "PORT_UNUSED") ? clkena[0] : 1'b1;
assign clkena_pullup[1] = (!(alpha_tolower(pll_type) == "fast") ||
                            (port_clkena1 == "PORT_USED")) &&
                            (port_clkena1 != "PORT_UNUSED") ? clkena[1] : 1'b1;
assign clkena_pullup[2] = (!(alpha_tolower(pll_type) == "fast") ||
                            (port_clkena2 == "PORT_USED")) &&
                            (port_clkena2 != "PORT_UNUSED") ? clkena[2] : 1'b1;
assign clkena_pullup[3] = (!(alpha_tolower(pll_type) == "fast") ||
                            (port_clkena3 == "PORT_USED")) &&
                            (port_clkena3 != "PORT_UNUSED") ? clkena[3] : 1'b1;
assign clkena_pullup[4] = (!(alpha_tolower(pll_type) == "fast") ||
                            (port_clkena4 == "PORT_USED")) &&
                            (port_clkena4 != "PORT_UNUSED") ? clkena[4] : 1'b1;
assign clkena_pullup[5] = (!(alpha_tolower(pll_type) == "fast") ||
                            (port_clkena5 == "PORT_USED")) &&
                            (port_clkena5 != "PORT_UNUSED") ? clkena[5] : 1'b1;

assign extclkena_pullup[0] = (!(alpha_tolower(pll_type) == "fast") ||
                            (port_extclkena0 == "PORT_USED")) &&
                            (port_extclkena0 != "PORT_UNUSED") ? extclkena[0] : 1'b1;
assign extclkena_pullup[1] = (!(alpha_tolower(pll_type) == "fast") ||
                            (port_extclkena1 == "PORT_USED")) &&
                            (port_extclkena1 != "PORT_UNUSED") ? extclkena[1] : 1'b1;
assign extclkena_pullup[2] = (!(alpha_tolower(pll_type) == "fast") ||
                            (port_extclkena2 == "PORT_USED")) &&
                            (port_extclkena2 != "PORT_UNUSED") ? extclkena[2] : 1'b1;
assign extclkena_pullup[3] = (!(alpha_tolower(pll_type) == "fast") ||
                            (port_extclkena3 == "PORT_USED")) &&
                            (port_extclkena3 != "PORT_UNUSED") ? extclkena[3] : 1'b1;
assign scanclkena_pullup = ((port_scanclkena == "PORT_CONNECTIVITY") ||
                            (port_scanclkena == "PORT_USED")) ? scanclkena : 1'b1;

assign fbin_pulldown = ((port_fbin == "PORT_CONNECTIVITY") ||
                        (port_fbin == "PORT_USED")) ? fbin : 1'b0;

assign phasecounterselect_pulldown[width_phasecounterselect-1 :0] = ((port_phasecounterselect == "PORT_CONNECTIVITY") ||
                            (port_phasecounterselect == "PORT_USED")) ? phasecounterselect[width_phasecounterselect-1 :0] : {width_phasecounterselect{1'b0}};
assign phaseupdown_pulldown = ((port_phaseupdown == "PORT_CONNECTIVITY") ||
                            (port_phaseupdown == "PORT_USED")) ? phaseupdown : 1'b0;
assign phasestep_pulldown = ((port_phasestep == "PORT_CONNECTIVITY") ||
                            (port_phasestep == "PORT_USED")) ? phasestep : 1'b0;
assign configupdate_pulldown = ((port_configupdate == "PORT_CONNECTIVITY") ||
                            (port_configupdate == "PORT_USED")) ? configupdate : 1'b0;
                            
assign scanclk_pulldown = ((port_scanclk != "PORT_UNUSED")) ? scanclk : 1'b0;
assign scanread_pulldown = ((port_scanread == "PORT_CONNECTIVITY") ||
                        (port_scanread == "PORT_USED")) ? scanread : 1'b0;
assign scanwrite_pulldown = ((port_scanwrite == "PORT_CONNECTIVITY") ||
                        (port_scanwrite == "PORT_USED")) ? scanwrite : 1'b0;
assign scandata_pulldown = ((port_scandata == "PORT_CONNECTIVITY") ||
                        (port_scandata == "PORT_USED")) ? scandata : 1'b0;
assign inclk_pulldown = inclk;
assign clkswitch_pulldown = ((port_clkswitch == "PORT_CONNECTIVITY") ||
                        (port_clkswitch == "PORT_USED")) ? clkswitch : 1'b0;
assign areset_pulldown = ((port_areset == "PORT_CONNECTIVITY") ||
                        (port_areset == "PORT_USED")) ? areset : 1'b0;
assign scanclr_pulldown = ((port_scanaclr == "PORT_CONNECTIVITY") ||
                        (port_scanaclr == "PORT_USED")) ? scanaclr : 1'b0;

assign stratix_inclk = (family_has_stratix_style_pll) ? inclk_pulldown : {2{1'b0}};
assign stratix_fbin  = (family_has_stratix_style_pll) ? fbin_pulldown : 1'b0;
assign stratix_ena   = (family_has_stratix_style_pll) ? ena_pullup : 1'bZ;
assign stratix_clkswitch = (family_has_stratix_style_pll) ? clkswitch_pulldown : 1'b0;
assign stratix_areset  = (family_has_stratix_style_pll) ? areset_pulldown : 1'b0;
assign stratix_pfdena = (family_has_stratix_style_pll) ? pfdena_pullup : 1'b1;
assign stratix_clkena = (family_has_stratix_style_pll) ? clkena_pullup : {5{1'b0}};
assign stratix_extclkena = (family_has_stratix_style_pll) ? extclkena_pullup : {3{1'b0}};
assign stratix_scanclk = (family_has_stratix_style_pll) ? scanclk_pulldown : 1'b0;
assign stratix_scanclr = (family_has_stratix_style_pll) ? scanclr_pulldown : 1'b0;
assign stratix_scandata = (family_has_stratix_style_pll) ? scandata_pulldown : 1'b0;
assign stratixii_inclk = (family_has_stratixii_style_pll) ? inclk_pulldown : {2{1'b0}};
assign stratixii_fbin  = (family_has_stratixii_style_pll) ? fbin_pulldown : 1'b0;
assign stratixii_ena   = (family_has_stratixii_style_pll) ? ena_pullup : 1'bZ;
assign stratixii_clkswitch = (family_has_stratixii_style_pll) ? clkswitch_pulldown : 1'b0;
assign stratixii_areset = (family_has_stratixii_style_pll) ? areset_pulldown : 1'b0;
assign stratixii_pfdena = (family_has_stratixii_style_pll) ? pfdena_pullup : 1'b1;
assign stratixii_scanread = (family_has_stratixii_style_pll) ? scanread_pulldown : 1'b0;
assign stratixii_scanwrite = (family_has_stratixii_style_pll) ? scanwrite_pulldown : 1'b0;                        
assign stratixii_scanclk = (family_has_stratixii_style_pll) ? scanclk_pulldown : 1'b0;
assign stratixii_scandata = (family_has_stratixii_style_pll) ? scandata_pulldown : 1'b0;
assign stratix3_inclk = (family_stratixiii) ? inclk_pulldown : {2{1'b0}};
assign stratix3_clkswitch =  (family_stratixiii) ? clkswitch_pulldown : 1'b0;
assign stratix3_areset   = (family_stratixiii) ? areset_pulldown : 1'b0;
assign stratix3_pfdena  = (family_stratixiii) ? pfdena_pullup : 1'b1;
assign stratix3_scanclk = (family_stratixiii) ? scanclk_pulldown : 1'b0;
assign stratix3_phasecounterselect = (family_stratixiii) ? phasecounterselect_pulldown : {4{1'b0}};
assign cyclone3_inclk = (family_cycloneiii) ? inclk_pulldown : {2{1'b0}};
assign cyclone3_clkswitch =  (family_cycloneiii) ? clkswitch_pulldown : 1'b0;
assign cyclone3_areset   = (family_cycloneiii) ? areset_pulldown : 1'b0;
assign cyclone3_pfdena  = (family_cycloneiii) ? pfdena_pullup : 1'b1;
assign cyclone3_scanclk = (family_cycloneiii) ? scanclk_pulldown : 1'b0;
assign cyclone3_phasecounterselect = (family_cycloneiii) ? phasecounterselect_pulldown[2:0] : {3{1'b0}};
assign cyclone3gl_inclk = (family_cycloneiiigl) ? inclk_pulldown : {2{1'b0}};
assign cyclone3gl_clkswitch =  (family_cycloneiiigl) ? clkswitch_pulldown : 1'b0;
assign cyclone3gl_areset   = (family_cycloneiiigl) ? areset_pulldown : 1'b0;
assign cyclone3gl_pfdena  = (family_cycloneiiigl) ? pfdena_pullup : 1'b1;
assign cyclone3gl_scanclk = (family_cycloneiiigl) ? scanclk_pulldown : 1'b0;
assign cyclone3gl_phasecounterselect = (family_cycloneiiigl) ? phasecounterselect_pulldown[2:0] : {3{1'b0}};
assign scandone_wire =  (family_has_stratixii_style_pll) ? stratixii_scandone :
                        (family_stratixiii) ? stratix3_scandone :
                        (family_cycloneiii) ? cyclone3_scandone :
                        (family_cycloneiiigl) ? cyclone3gl_scandone :
                        1'b0;
assign scandone = (port_scandone != "PORT_UNUSED") ? scandone_wire : 1'b0;
assign clk_wire = (family_base_cycloneii) ? {7'b0, stratixii_clk[2:0]} :
                (family_has_stratixii_style_pll) ? {4'b0, stratixii_clk} :
                (family_stratixiii) ? {stratix3_clk} :
                (family_cycloneiii) ? {5'b0, cyclone3_clk} :
                (family_cycloneiiigl) ? {5'b0, cyclone3gl_clk} :
                {4'b0, stratix_clk};
assign clk_tmp[0] = (port_clk0 != "PORT_UNUSED") ? clk_wire[0] : 1'b0;
assign clk_tmp[1] = (port_clk1 != "PORT_UNUSED") ? clk_wire[1] : 1'b0;
assign clk_tmp[2] = (port_clk2 != "PORT_UNUSED") ? clk_wire[2] : 1'b0;
assign clk_tmp[3] = (port_clk3 != "PORT_UNUSED") ? clk_wire[3] : 1'b0;
assign clk_tmp[4] = (port_clk4 != "PORT_UNUSED") ? clk_wire[4] : 1'b0;
assign clk_tmp[5] = (port_clk5 != "PORT_UNUSED") ? clk_wire[5] : 1'b0;
assign clk_tmp[6] = (port_clk6 != "PORT_UNUSED") ? clk_wire[6] : 1'b0;
assign clk_tmp[7] = (port_clk7 != "PORT_UNUSED") ? clk_wire[7] : 1'b0;
assign clk_tmp[8] = (port_clk8 != "PORT_UNUSED") ? clk_wire[8] : 1'b0;
assign clk_tmp[9] = (port_clk9 != "PORT_UNUSED") ? clk_wire[9] : 1'b0;
assign clk = clk_tmp[width_clock-1:0];
assign extclk[0] = (port_extclk0 != "PORT_UNUSED") ? stratix_extclk[0] : 1'b0;
assign extclk[1] = (port_extclk1 != "PORT_UNUSED") ? stratix_extclk[1] : 1'b0;
assign extclk[2] = (port_extclk2 != "PORT_UNUSED") ? stratix_extclk[2] : 1'b0;
assign extclk[3] = (port_extclk3 != "PORT_UNUSED") ? stratix_extclk[3] : 1'b0;
assign clkbad_wire = (family_base_cycloneii) ? 2'b0 :
                (family_has_stratixii_style_pll) ? stratixii_clkbad :
                (family_stratixiii) ? stratix3_clkbad :
                (family_cycloneiii) ? cyclone3_clkbad :
                (family_cycloneiiigl) ? cyclone3gl_clkbad :
                stratix_clkbad;
assign clkbad[0] = (port_clkbad0 != "PORT_UNUSED") ? clkbad_wire[0] : 1'b0;
assign clkbad[1] = (port_clkbad1 != "PORT_UNUSED") ? clkbad_wire[1] : 1'b0;
assign activeclock_wire = (family_base_cycloneii) ? 1'b0 :
                    (family_has_stratixii_style_pll) ? stratixii_activeclock :
                    (family_stratixiii) ? stratix3_activeclock :
                    (family_cycloneiii) ? cyclone3_activeclock :
                    (family_cycloneiiigl) ? cyclone3gl_activeclock :
                    stratix_activeclock;
assign activeclock = (port_activeclock != "PORT_UNUSED") ? activeclock_wire : 1'b0;

assign pll_lock    = (family_stratixiii) ? stratix3_locked :
                    (family_cycloneiii) ? cyclone3_locked :
                    (family_cycloneiiigl) ? cyclone3gl_locked : 1'b0;

assign locked_wire = (family_has_stratixii_style_pll) ? stratixii_locked :
                    (family_stratixiii) ? stratix3_locked & pll_lock_sync:
                    (family_cycloneiii) ? cyclone3_locked & pll_lock_sync: 
                    (family_cycloneiiigl) ? cyclone3gl_locked : 
                    stratix_locked;
assign locked = (port_locked != "PORT_UNUSED") ? locked_wire : 1'b0;
assign stratix_locked = (alpha_tolower(pll_type) == "fast") ? (!locked_tmp) : locked_tmp;
assign clkloss_wire = (family_base_cycloneii) ? 1'b0 :
                    (family_has_stratixii_style_pll) ? stratixii_clkloss :
                    stratix_clkloss;
assign clkloss = (port_clkloss != "PORT_UNUSED") ? clkloss_wire : 1'b0;
assign scandataout_wire = (family_base_cycloneii) ? 1'b0 :
                    (family_has_stratixii_style_pll) ? stratixii_scandataout :
                    (family_stratixiii) ? stratix3_scandataout :
                    (family_cycloneiii) ? cyclone3_scandataout :
                    (family_cycloneiiigl) ? cyclone3gl_scandataout :
                    stratix_scandataout;
assign scandataout = (port_scandataout != "PORT_UNUSED") ? scandataout_wire : 1'b0;
assign enable0 = (family_base_cycloneii) ? 1'b0 :
                    (family_has_stratixii_style_pll) ? stratixii_enable0 :
                    stratix_enable0;
assign enable1 = (family_base_cycloneii) ? 1'b0 :
                    (family_has_stratixii_style_pll) ? stratixii_enable1 :
                    stratix_enable1;
assign sclkout0_wire = (family_has_stratixii_style_pll) ? stratixii_sclkout0 : 1'b0;
assign sclkout0 = (port_sclkout0 != "PORT_UNUSED") ? sclkout0_wire : 1'b0;
assign sclkout1_wire = (family_has_stratixii_style_pll) ? stratixii_sclkout1 : 1'b0;
assign sclkout1 = (port_sclkout1 != "PORT_UNUSED") ? sclkout1_wire : 1'b0;
assign phasedone_wire =  (family_stratixiii) ? stratix3_phasedone : 
            (family_cycloneiii) ? cyclone3_phasedone :
            (family_cycloneiiigl) ? cyclone3gl_phasedone :
            1'b0;
assign phasedone = (port_phasedone != "PORT_UNUSED") ? phasedone_wire : 1'b0;
assign vcooverrange_wire =  (family_stratixiii) ? stratix3_vcooverrange : 
            (family_cycloneiii) ? cyclone3_vcooverrange :
            (family_cycloneiiigl) ? cyclone3gl_vcooverrange :
            1'b0;
assign vcooverrange = (port_vcooverrange != "PORT_UNUSED") ? vcooverrange_wire : 1'b0;
assign vcounderrange_wire = (family_stratixiii) ? stratix3_vcounderrange : 
            (family_cycloneiii) ? cyclone3_vcounderrange :
            (family_cycloneiiigl) ? cyclone3gl_vcounderrange :
            1'b0;
assign vcounderrange = (port_vcounderrange != "PORT_UNUSED") ? vcounderrange_wire : 1'b0;
assign fbout_wire =  (family_stratixiii) ? stratix3_fbout : 
            (family_cycloneiii) ? cyclone3_fbout :
            (family_cycloneiiigl) ? cyclone3gl_fbout :
            1'b0;
assign fbout = (port_fbout != "PORT_UNUSED") ? fbout_wire : 1'b0;
assign fbmimicbidir = ((using_fbmimicbidir_port == "ON") && (alpha_tolower(operation_mode) == "zero_delay_buffer") && family_stratixiii && (family_arriaii == 0)) ? iobuf_io : 1'b0;
assign stratix3_fbin = ((using_fbmimicbidir_port == "ON") && (alpha_tolower(operation_mode) == "zero_delay_buffer") && family_stratixiii && (family_arriaii == 0)) ? iobuf_o : ((alpha_tolower(operation_mode) == "zero_delay_buffer") && family_arriaii) ? fbout_wire : fbin;

assign fref = cyclone3gl_fref;
assign icdrclk = cyclone3gl_icdrclk;

endmodule //altpll

// pll_iobuf
`timescale 1 ps / 1 ps
module pll_iobuf (i, oe, io, o);
    input i;
    input oe;
    inout io;
    output o;
    reg    o;
    
    always @(io)
    begin
        o = io;
    end

    assign io = (oe == 1) ? i : 1'bz;
endmodule  

//////////////////////////////////////////////////////////////////////////////
//
// Module Name : MF_cycloneiii_pll
//
// Description : Behavioral model for CycloneIII pll.
// 
// Limitations : Does not support Spread Spectrum and Bandwidth.
//
// Outputs     : Up to 10 output clocks, each defined by its own set of
//               parameters. Locked output (active high) indicates when the
//               PLL locks. clkbad and activeclock are used for
//               clock switchover to indicate which input clock has gone
//               bad, when the clock switchover initiates and which input
//               clock is being used as the reference, respectively.
//               scandataout is the data output of the serial scan chain.
//
// New Features : The list below outlines key new features in Cyclone III:
//                1. Dynamic Phase Reconfiguration
//                2. Dynamic PLL Reconfiguration (different protocol)
//                3. More output counters
//////////////////////////////////////////////////////////////////////////////

`timescale 1 ps/1 ps
`define CYCIII_PLL_WORD_LENGTH 18

module MF_cycloneiii_pll (inclk,
                    fbin,
                    fbout,
                    clkswitch,
                    areset,
                    pfdena,
                    scanclk,
                    scandata,
                    scanclkena,
                    configupdate,
                    clk,
                    phasecounterselect,
                    phaseupdown,
                    phasestep,
                    clkbad,
                    activeclock,
                    locked,
                    scandataout,
                    scandone,
                    phasedone,
                    vcooverrange,
                    vcounderrange
                    );

    parameter operation_mode                       = "normal";
    parameter pll_type                             = "auto"; // auto,fast(left_right),enhanced(top_bottom)
    parameter compensate_clock                     = "clock0";


    parameter inclk0_input_frequency               = 0;
    parameter inclk1_input_frequency               = 0;

    parameter self_reset_on_loss_lock        = "off";
    parameter switch_over_type                     = "auto";

    parameter switch_over_counter                  = 1;
    parameter enable_switch_over_counter           = "off";

    parameter bandwidth                            = 0;
    parameter bandwidth_type                       = "auto";
    parameter use_dc_coupling                      = "false";

    parameter lock_high = 0; // 0 .. 4095
    parameter lock_low = 0;  // 0 .. 7
    parameter lock_window_ui = "0.05"; // "0.05", "0.1", "0.15", "0.2"
    parameter test_bypass_lock_detect              = "off";
    
    parameter clk0_output_frequency                = 0;
    parameter clk0_multiply_by                     = 0;
    parameter clk0_divide_by                       = 0;
    parameter clk0_phase_shift                     = "0";
    parameter clk0_duty_cycle                      = 50;

    parameter clk1_output_frequency                = 0;
    parameter clk1_multiply_by                     = 0;
    parameter clk1_divide_by                       = 0;
    parameter clk1_phase_shift                     = "0";
    parameter clk1_duty_cycle                      = 50;

    parameter clk2_output_frequency                = 0;
    parameter clk2_multiply_by                     = 0;
    parameter clk2_divide_by                       = 0;
    parameter clk2_phase_shift                     = "0";
    parameter clk2_duty_cycle                      = 50;

    parameter clk3_output_frequency                = 0;
    parameter clk3_multiply_by                     = 0;
    parameter clk3_divide_by                       = 0;
    parameter clk3_phase_shift                     = "0";
    parameter clk3_duty_cycle                      = 50;

    parameter clk4_output_frequency                = 0;
    parameter clk4_multiply_by                     = 0;
    parameter clk4_divide_by                       = 0;
    parameter clk4_phase_shift                     = "0";
    parameter clk4_duty_cycle                      = 50;

    
    
    
    
    

    parameter pfd_min                              = 0;
    parameter pfd_max                              = 0;
    parameter vco_min                              = 0;
    parameter vco_max                              = 0;
    parameter vco_center                           = 0;

    // ADVANCED USE PARAMETERS
    parameter m_initial = 1;
    parameter m = 0;
    parameter n = 1;

    parameter c0_high = 1;
    parameter c0_low = 1;
    parameter c0_initial = 1;
    parameter c0_mode = "bypass";
    parameter c0_ph = 0;

    parameter c1_high = 1;
    parameter c1_low = 1;
    parameter c1_initial = 1;
    parameter c1_mode = "bypass";
    parameter c1_ph = 0;

    parameter c2_high = 1;
    parameter c2_low = 1;
    parameter c2_initial = 1;
    parameter c2_mode = "bypass";
    parameter c2_ph = 0;

    parameter c3_high = 1;
    parameter c3_low = 1;
    parameter c3_initial = 1;
    parameter c3_mode = "bypass";
    parameter c3_ph = 0;

    parameter c4_high = 1;
    parameter c4_low = 1;
    parameter c4_initial = 1;
    parameter c4_mode = "bypass";
    parameter c4_ph = 0;

    
    
    
    
    

    parameter m_ph = 0;

    parameter clk0_counter = "unused";
    parameter clk1_counter = "unused";
    parameter clk2_counter = "unused";
    parameter clk3_counter = "unused";
    parameter clk4_counter = "unused";

    parameter c1_use_casc_in = "off";
    parameter c2_use_casc_in = "off";
    parameter c3_use_casc_in = "off";
    parameter c4_use_casc_in = "off";

    parameter m_test_source  = -1;
    parameter c0_test_source = -1;
    parameter c1_test_source = -1;
    parameter c2_test_source = -1;
    parameter c3_test_source = -1;
    parameter c4_test_source = -1;

    parameter vco_multiply_by = 0;
    parameter vco_divide_by = 0;
    parameter vco_post_scale = 1; // 1 .. 2
    parameter vco_frequency_control = "auto";
    parameter vco_phase_shift_step = 0;
    
    parameter charge_pump_current = 10;
    parameter loop_filter_r = "1.0";    // "1.0", "2.0", "4.0", "6.0", "8.0", "12.0", "16.0", "20.0"
    parameter loop_filter_c = 0;        // 0 , 2 , 4

    parameter pll_compensation_delay = 0;
    parameter simulation_type = "functional";

// SIMULATION_ONLY_PARAMETERS_BEGIN

    parameter down_spread                          = "0.0";
    parameter lock_c = 4;

    parameter sim_gate_lock_device_behavior        = "off";

    parameter clk0_phase_shift_num = 0;
    parameter clk1_phase_shift_num = 0;
    parameter clk2_phase_shift_num = 0;
    parameter clk3_phase_shift_num = 0;
    parameter clk4_phase_shift_num = 0;
    parameter family_name = "StratixIII";

    parameter clk0_use_even_counter_mode = "off";
    parameter clk1_use_even_counter_mode = "off";
    parameter clk2_use_even_counter_mode = "off";
    parameter clk3_use_even_counter_mode = "off";
    parameter clk4_use_even_counter_mode = "off";

    parameter clk0_use_even_counter_value = "off";
    parameter clk1_use_even_counter_value = "off";
    parameter clk2_use_even_counter_value = "off";
    parameter clk3_use_even_counter_value = "off";
    parameter clk4_use_even_counter_value = "off";

    // TEST ONLY
    
    parameter init_block_reset_a_count = 1;
    parameter init_block_reset_b_count = 1;

// SIMULATION_ONLY_PARAMETERS_END
    
// LOCAL_PARAMETERS_BEGIN

    parameter phase_counter_select_width = 3;
    parameter lock_window = 5;
    parameter inclk0_freq = inclk0_input_frequency;
    parameter inclk1_freq = inclk1_input_frequency;
   
parameter charge_pump_current_bits = 0;
parameter lock_window_ui_bits = 0;
parameter loop_filter_c_bits = 0;
parameter loop_filter_r_bits = 0;
parameter test_counter_c0_delay_chain_bits = 0;
parameter test_counter_c1_delay_chain_bits = 0;
parameter test_counter_c2_delay_chain_bits = 0;
parameter test_counter_c3_delay_chain_bits = 0;
parameter test_counter_c4_delay_chain_bits = 0;
parameter test_counter_c5_delay_chain_bits = 0;
parameter test_counter_m_delay_chain_bits = 0;
parameter test_counter_n_delay_chain_bits = 0;
parameter test_feedback_comp_delay_chain_bits = 0;
parameter test_input_comp_delay_chain_bits = 0;
parameter test_volt_reg_output_mode_bits = 0;
parameter test_volt_reg_output_voltage_bits = 0;
parameter test_volt_reg_test_mode = "false";
parameter vco_range_detector_high_bits = -1;
parameter vco_range_detector_low_bits = -1;
parameter scan_chain_mif_file = ""; 


parameter auto_settings = "true";

// LOCAL_PARAMETERS_END
 
    // INPUT PORTS
    input [1:0] inclk;
    input fbin;
    input clkswitch;
    input areset;
    input pfdena;
    input [phase_counter_select_width - 1:0] phasecounterselect;
    input phaseupdown;
    input phasestep;
    input scanclk;
    input scanclkena;
    input scandata;
    input configupdate;

    // OUTPUT PORTS
    output [4:0] clk;
    output [1:0] clkbad;
    output activeclock;
    output locked;
    output scandataout;
    output scandone;
    output fbout;
    output phasedone;
    output vcooverrange;
    output vcounderrange;
    
        

    // INTERNAL VARIABLES AND NETS
    reg [8*6:1] clk_num[0:4];
    integer scan_chain_length;
    integer i;
    integer j;
    integer k;
    integer x;
    integer y;
    integer l_index;
    integer gate_count;
    integer egpp_offset;
    integer sched_time;
    integer delay_chain;
    integer low;
    integer high;
    integer initial_delay;
    integer fbk_phase;
    integer fbk_delay;
    integer phase_shift[0:7];
    integer last_phase_shift[0:7];

    integer m_times_vco_period;
    integer new_m_times_vco_period;
    integer refclk_period;
    integer fbclk_period;
    integer high_time;
    integer low_time;
    integer my_rem;
    integer tmp_rem;
    integer rem;
    integer tmp_vco_per;
    integer vco_per;
    integer offset;
    integer temp_offset;
    integer cycles_to_lock;
    integer cycles_to_unlock;
    integer loop_xplier;
    integer loop_initial;
    integer loop_ph;
    integer cycle_to_adjust;
    integer total_pull_back;
    integer pull_back_M;

    time    fbclk_time;
    time    first_fbclk_time;
    time    refclk_time;

    reg switch_clock;

    reg [31:0] real_lock_high;

    reg got_first_refclk;
    reg got_second_refclk;
    reg got_first_fbclk;
    reg refclk_last_value;
    reg fbclk_last_value;
    reg inclk_last_value;
    reg pll_is_locked;
    reg locked_tmp;
    reg areset_last_value;
    reg pfdena_last_value;
    reg inclk_out_of_range;
    reg schedule_vco_last_value;
    
    // Test bypass lock detect
    reg pfd_locked;
    integer cycles_pfd_low, cycles_pfd_high;

    reg gate_out;
    reg vco_val;

    reg [31:0] m_initial_val;
    reg [31:0] m_val[0:1];
    reg [31:0] n_val[0:1];
    reg [31:0] m_delay;
    reg [8*6:1] m_mode_val[0:1];
    reg [8*6:1] n_mode_val[0:1];

    reg [31:0] c_high_val[0:9];
    reg [31:0] c_low_val[0:9];
    reg [8*6:1] c_mode_val[0:9];
    reg [31:0] c_initial_val[0:9];
    integer c_ph_val[0:9];

    reg [31:0] c_val; // placeholder for c_high,c_low values

    // VCO Frequency Range control
    reg vco_over, vco_under;
   
    // temporary registers for reprogramming
    integer c_ph_val_tmp[0:9];
    reg [31:0] c_high_val_tmp[0:9];
    reg [31:0] c_hval[0:9];
    reg [31:0] c_low_val_tmp[0:9];
    reg [31:0] c_lval[0:9];
    reg [8*6:1] c_mode_val_tmp[0:9];

    // hold registers for reprogramming
    integer c_ph_val_hold[0:9];
    reg [31:0] c_high_val_hold[0:9];
    reg [31:0] c_low_val_hold[0:9];
    reg [8*6:1] c_mode_val_hold[0:9];

    // old values
    reg [31:0] m_val_old[0:1];
    reg [31:0] m_val_tmp[0:1];
    reg [31:0] n_val_old[0:1];
    reg [8*6:1] m_mode_val_old[0:1];
    reg [8*6:1] n_mode_val_old[0:1];
    reg [31:0] c_high_val_old[0:9];
    reg [31:0] c_low_val_old[0:9];
    reg [8*6:1] c_mode_val_old[0:9];
    integer c_ph_val_old[0:9];
    integer   m_ph_val_old;
    integer   m_ph_val_tmp;

    integer cp_curr_old;
    integer cp_curr_val;
    integer lfc_old;
    integer lfc_val;
    integer vco_cur;
    integer vco_old;
    reg [9*8:1] lfr_val;
    reg [9*8:1] lfr_old;
    reg [1:2] lfc_val_bit_setting, lfc_val_old_bit_setting;
    reg vco_val_bit_setting, vco_val_old_bit_setting;
    reg [3:7] lfr_val_bit_setting, lfr_val_old_bit_setting;
    reg [14:16] cp_curr_bit_setting, cp_curr_old_bit_setting;
    
    // Setting on  - display real values
    // Setting off - display only bits
    reg pll_reconfig_display_full_setting;

    reg [7:0] m_hi;
    reg [7:0] m_lo;
    reg [7:0] n_hi;
    reg [7:0] n_lo;

    // ph tap orig values (POF)
    integer c_ph_val_orig[0:9];
    integer m_ph_val_orig;

    reg schedule_vco;
    reg stop_vco;
    reg inclk_n;
    reg inclk_man;
    reg inclk_es;

    reg [7:0] vco_out;
    reg [7:0] vco_tap;
    reg [7:0] vco_out_last_value;
    reg [7:0] vco_tap_last_value;
    wire inclk_c0;
    wire inclk_c1;
    wire inclk_c2;
    wire inclk_c3;
    wire inclk_c4;
    
    wire  inclk_c0_from_vco;
    wire  inclk_c1_from_vco;
    wire  inclk_c2_from_vco;
    wire  inclk_c3_from_vco;
    wire  inclk_c4_from_vco;
    
    wire  inclk_m_from_vco;

    wire inclk_m;
    wire pfdena_wire;
    wire [4:0] clk_tmp, clk_out_pfd;


    wire [4:0] clk_out;

    wire c0_clk;
    wire c1_clk;
    wire c2_clk;
    wire c3_clk;
    wire c4_clk;

    reg first_schedule;

    reg vco_period_was_phase_adjusted;
    reg phase_adjust_was_scheduled;

    wire refclk;
    wire fbclk;
    
    wire pllena_reg;
    wire test_mode_inclk;
 
    // Self Reset
    wire reset_self;

    // Clock Switchover
    reg clk0_is_bad;
    reg clk1_is_bad;
    reg inclk0_last_value;
    reg inclk1_last_value;
    reg other_clock_value;
    reg other_clock_last_value;
    reg primary_clk_is_bad;
    reg current_clk_is_bad;
    reg external_switch;
    reg active_clock;
    reg got_curr_clk_falling_edge_after_clkswitch;

    integer clk0_count;
    integer clk1_count;
    integer switch_over_count;

    wire scandataout_tmp;
    reg scandata_in, scandata_out; // hold scan data in negative-edge triggered ff (on either side on chain)
    reg scandone_tmp;
    reg initiate_reconfig;
    integer quiet_time;
    integer slowest_clk_old;
    integer slowest_clk_new;

    reg reconfig_err;
    reg error;
    time    scanclk_last_rising_edge;
    time    scanread_active_edge;
    reg got_first_scanclk;
    reg got_first_gated_scanclk;
    reg gated_scanclk;
    integer scanclk_period;
    reg scanclk_last_value;
    wire update_conf_latches;
    reg  update_conf_latches_reg;
    reg [-1:142]  scan_data;
    reg scanclkena_reg; // register scanclkena on negative edge of scanclk
    reg c0_rising_edge_transfer_done;
    reg c1_rising_edge_transfer_done;
    reg c2_rising_edge_transfer_done;
    reg c3_rising_edge_transfer_done;
    reg c4_rising_edge_transfer_done;
    reg scanread_setup_violation;
    integer index;
    integer scanclk_cycles;
    reg d_msg;

    integer num_output_cntrs;
    reg no_warn;
    
    // Phase reconfig
    
    reg [2:0] phasecounterselect_reg;
    reg phaseupdown_reg;
    reg phasestep_reg;
    integer select_counter;
    integer phasestep_high_count;
    reg update_phase;
    

// LOCAL_PARAMETERS_BEGIN

    parameter SCAN_CHAIN = 144;
    parameter GPP_SCAN_CHAIN  = 234;
    parameter FAST_SCAN_CHAIN = 180;
    // primary clk is always inclk0
    parameter num_phase_taps = 8;

// LOCAL_PARAMETERS_END


    // internal variables for scaling of multiply_by and divide_by values
    integer i_clk0_mult_by;
    integer i_clk0_div_by;
    integer i_clk1_mult_by;
    integer i_clk1_div_by;
    integer i_clk2_mult_by;
    integer i_clk2_div_by;
    integer i_clk3_mult_by;
    integer i_clk3_div_by;
    integer i_clk4_mult_by;
    integer i_clk4_div_by;
    integer i_clk5_mult_by;
    integer i_clk5_div_by;
    integer i_clk6_mult_by;
    integer i_clk6_div_by;
    integer i_clk7_mult_by;
    integer i_clk7_div_by;
    integer i_clk8_mult_by;
    integer i_clk8_div_by;
    integer i_clk9_mult_by;
    integer i_clk9_div_by;
    integer max_d_value;
    integer new_multiplier;

    // internal variables for storing the phase shift number.(used in lvds mode only)
    integer i_clk0_phase_shift;
    integer i_clk1_phase_shift;
    integer i_clk2_phase_shift;
    integer i_clk3_phase_shift;
    integer i_clk4_phase_shift;

    // user to advanced internal signals

    integer   i_m_initial;
    integer   i_m;
    integer   i_n;
    integer   i_c_high[0:9];
    integer   i_c_low[0:9];
    integer   i_c_initial[0:9];
    integer   i_c_ph[0:9];
    reg       [8*6:1] i_c_mode[0:9];

    integer   i_vco_min;
    integer   i_vco_max;
    integer   i_vco_min_no_division;
    integer   i_vco_max_no_division;
    integer   i_vco_center;
    integer   i_pfd_min;
    integer   i_pfd_max;
    integer   i_m_ph;
    integer   m_ph_val;
    reg [8*2:1] i_clk4_counter;
    reg [8*2:1] i_clk3_counter;
    reg [8*2:1] i_clk2_counter;
    reg [8*2:1] i_clk1_counter;
    reg [8*2:1] i_clk0_counter;
    integer   i_charge_pump_current;
    integer   i_loop_filter_r;
    integer   max_neg_abs;
    integer   output_count;
    integer   new_divisor;

    integer loop_filter_c_arr[0:3];
    integer fpll_loop_filter_c_arr[0:3];
    integer charge_pump_curr_arr[0:15];

    reg pll_in_test_mode;
    reg pll_is_in_reset;
    reg pll_has_just_been_reconfigured;

    // uppercase to lowercase parameter values
    reg [8*`CYCIII_PLL_WORD_LENGTH:1] l_operation_mode;
    reg [8*`CYCIII_PLL_WORD_LENGTH:1] l_pll_type;
    reg [8*`CYCIII_PLL_WORD_LENGTH:1] l_compensate_clock;
    reg [8*`CYCIII_PLL_WORD_LENGTH:1] l_scan_chain;
    reg [8*`CYCIII_PLL_WORD_LENGTH:1] l_switch_over_type;
    reg [8*`CYCIII_PLL_WORD_LENGTH:1] l_bandwidth_type;
    reg [8*`CYCIII_PLL_WORD_LENGTH:1] l_simulation_type;
    reg [8*`CYCIII_PLL_WORD_LENGTH:1] l_sim_gate_lock_device_behavior;
    reg [8*`CYCIII_PLL_WORD_LENGTH:1] l_vco_frequency_control;
    reg [8*`CYCIII_PLL_WORD_LENGTH:1] l_enable_switch_over_counter;
    reg [8*`CYCIII_PLL_WORD_LENGTH:1] l_self_reset_on_loss_lock;
    


    integer current_clock;
    integer current_clock_man;
    reg is_fast_pll;
    reg ic1_use_casc_in;
    reg ic2_use_casc_in;
    reg ic3_use_casc_in;
    reg ic4_use_casc_in;

    reg init;
    reg tap0_is_active;

    real inclk0_period, last_inclk0_period,inclk1_period, last_inclk1_period;
    real last_inclk0_edge,last_inclk1_edge,diff_percent_period;
    reg first_inclk0_edge_detect,first_inclk1_edge_detect;



    // finds the closest integer fraction of a given pair of numerator and denominator. 
    task find_simple_integer_fraction;
        input numerator;
        input denominator;
        input max_denom;
        output fraction_num; 
        output fraction_div; 
        parameter max_iter = 20;
        
        integer numerator;
        integer denominator;
        integer max_denom;
        integer fraction_num; 
        integer fraction_div; 
        
        integer quotient_array[max_iter-1:0];
        integer int_loop_iter;
        integer int_quot;
        integer m_value;
        integer d_value;
        integer old_m_value;
        integer swap;

        integer loop_iter;
        integer num;
        integer den;
        integer i_max_iter;

    begin      
        loop_iter = 0;
        num = (numerator == 0) ? 1 : numerator;
        den = (denominator == 0) ? 1 : denominator;
        i_max_iter = max_iter;
       
        while (loop_iter < i_max_iter)
        begin
            int_quot = num / den;
            quotient_array[loop_iter] = int_quot;
            num = num - (den*int_quot);
            loop_iter=loop_iter+1;
            
            if ((num == 0) || (max_denom != -1) || (loop_iter == i_max_iter)) 
            begin
                // calculate the numerator and denominator if there is a restriction on the
                // max denom value or if the loop is ending
                m_value = 0;
                d_value = 1;
                // get the rounded value at this stage for the remaining fraction
                if (den != 0)
                begin
                    m_value = (2*num/den);
                end
                // calculate the fraction numerator and denominator at this stage
                for (int_loop_iter = loop_iter-1; int_loop_iter >= 0; int_loop_iter=int_loop_iter-1)
                begin
                    if (m_value == 0)
                    begin
                        m_value = quotient_array[int_loop_iter];
                        d_value = 1;
                    end
                    else
                    begin
                        old_m_value = m_value;
                        m_value = quotient_array[int_loop_iter]*m_value + d_value;
                        d_value = old_m_value;
                    end
                end
                // if the denominator is less than the maximum denom_value or if there is no restriction save it
                if ((d_value <= max_denom) || (max_denom == -1))
                begin
                    fraction_num = m_value;
                    fraction_div = d_value;
                end
                // end the loop if the denomitor has overflown or the numerator is zero (no remainder during this round)
                if (((d_value > max_denom) && (max_denom != -1)) || (num == 0))
                begin
                    i_max_iter = loop_iter;
                end
            end
            // swap the numerator and denominator for the next round
            swap = den;
            den = num;
            num = swap;
        end
    end
    endtask // find_simple_integer_fraction

    // get the absolute value
    function integer abs;
    input value;
    integer value;
    begin
        if (value < 0)
            abs = value * -1;
        else abs = value;
    end
    endfunction

    // find twice the period of the slowest clock
    function integer slowest_clk;
    input C0, C0_mode, C1, C1_mode, C2, C2_mode, C3, C3_mode, C4, C4_mode, C5, C5_mode, C6, C6_mode, C7, C7_mode, C8, C8_mode, C9, C9_mode, refclk, m_mod;
    integer C0, C1, C2, C3, C4, C5, C6, C7, C8, C9;
    reg [8*6:1] C0_mode, C1_mode, C2_mode, C3_mode, C4_mode, C5_mode, C6_mode, C7_mode, C8_mode, C9_mode;
    integer refclk;
    reg [31:0] m_mod;
    integer max_modulus;
    begin
        max_modulus = 1;
        if (C0_mode != "bypass" && C0_mode != "   off")
            max_modulus = C0;
        if (C1 > max_modulus && C1_mode != "bypass" && C1_mode != "   off")
            max_modulus = C1;
        if (C2 > max_modulus && C2_mode != "bypass" && C2_mode != "   off")
            max_modulus = C2;
        if (C3 > max_modulus && C3_mode != "bypass" && C3_mode != "   off")
            max_modulus = C3;
        if (C4 > max_modulus && C4_mode != "bypass" && C4_mode != "   off")
            max_modulus = C4;
        if (C5 > max_modulus && C5_mode != "bypass" && C5_mode != "   off")
            max_modulus = C5;
        if (C6 > max_modulus && C6_mode != "bypass" && C6_mode != "   off")
            max_modulus = C6;
        if (C7 > max_modulus && C7_mode != "bypass" && C7_mode != "   off")
            max_modulus = C7;
        if (C8 > max_modulus && C8_mode != "bypass" && C8_mode != "   off")
            max_modulus = C8;
        if (C9 > max_modulus && C9_mode != "bypass" && C9_mode != "   off")
            max_modulus = C9;

        slowest_clk = (refclk * max_modulus *2 / m_mod);
    end
    endfunction

    // count the number of digits in the given integer
    function integer count_digit;
    input X;
    integer X;
    integer count, result;
    begin
        count = 0;
        result = X;
        while (result != 0)
        begin
            result = (result / 10);
            count = count + 1;
        end
        
        count_digit = count;
    end
    endfunction

    // reduce the given huge number(X) to Y significant digits
    function integer scale_num;
    input X, Y;
    integer X, Y;
    integer count;
    integer fac_ten, lc;
    begin
        fac_ten = 1;
        count = count_digit(X);
        
        for (lc = 0; lc < (count-Y); lc = lc + 1)
            fac_ten = fac_ten * 10;

        scale_num = (X / fac_ten);
    end
    endfunction

    // find the greatest common denominator of X and Y
    function integer gcd;
    input X,Y;
    integer X,Y;
    integer L, S, R, G;
    begin
        if (X < Y) // find which is smaller.
        begin
            S = X;
            L = Y;
        end
        else
        begin
            S = Y;
            L = X;
        end

        R = S;
        while ( R > 1)
        begin
            S = L;
            L = R;
            R = S % L;  // divide bigger number by smaller.
                        // remainder becomes smaller number.
        end
        if (R == 0)     // if evenly divisible then L is gcd else it is 1.
            G = L;
        else
            G = R;
        gcd = G;
    end
    endfunction

    // find the least common multiple of A1 to A10
    function integer lcm;
    input A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, P;
    integer A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, P;
    integer M1, M2, M3, M4, M5 , M6, M7, M8, M9, R;
    begin
        M1 = (A1 * A2)/gcd(A1, A2);
        M2 = (M1 * A3)/gcd(M1, A3);
        M3 = (M2 * A4)/gcd(M2, A4);
        M4 = (M3 * A5)/gcd(M3, A5);
        M5 = (M4 * A6)/gcd(M4, A6);
        M6 = (M5 * A7)/gcd(M5, A7);
        M7 = (M6 * A8)/gcd(M6, A8);
        M8 = (M7 * A9)/gcd(M7, A9);
        M9 = (M8 * A10)/gcd(M8, A10);
        if (M9 < 3)
            R = 10;
        else if ((M9 <= 10) && (M9 >= 3))
            R = 4 * M9;
        else if (M9 > 1000)
            R = scale_num(M9, 3);
        else
            R = M9;
        lcm = R; 
    end
    endfunction

    // find the M and N values for Manual phase based on the following 5 criterias:
    // 1. The PFD frequency (i.e. Fin / N) must be in the range 5 MHz to 720 MHz
    // 2. The VCO frequency (i.e. Fin * M / N) must be in the range 300 MHz to 1300 MHz
    // 3. M is less than 512
    // 4. N is less than 512
    // 5. It's the smallest M/N which satisfies all the above constraints, and is within 2ps
    //    of the desired vco-phase-shift-step
    task find_m_and_n_4_manual_phase;
        input inclock_period;
        input vco_phase_shift_step;
        input clk0_mult, clk1_mult, clk2_mult, clk3_mult, clk4_mult;
        input clk5_mult, clk6_mult, clk7_mult, clk8_mult, clk9_mult;
        input clk0_div,  clk1_div,  clk2_div,  clk3_div,  clk4_div;
        input clk5_div,  clk6_div,  clk7_div,  clk8_div,  clk9_div;
        input clk0_used,  clk1_used,  clk2_used,  clk3_used,  clk4_used;
        input clk5_used,  clk6_used,  clk7_used,  clk8_used,  clk9_used;
        output m; 
        output n; 

        parameter max_m = 511;
        parameter max_n = 511;
        parameter max_pfd = 720;
        parameter min_pfd = 5;
        parameter max_vco = 1600; // max vco frequency. (in mHz)
        parameter min_vco = 300;  // min vco frequency. (in mHz)
        parameter max_offset = 0.004;
        
        reg[160:1] clk0_used,  clk1_used,  clk2_used,  clk3_used,  clk4_used;
        reg[160:1] clk5_used,  clk6_used,  clk7_used,  clk8_used,  clk9_used;
        
        integer inclock_period;
        integer vco_phase_shift_step;
        integer clk0_mult, clk1_mult, clk2_mult, clk3_mult, clk4_mult;
        integer clk5_mult, clk6_mult, clk7_mult, clk8_mult, clk9_mult;
        integer clk0_div,  clk1_div,  clk2_div,  clk3_div,  clk4_div;
        integer clk5_div,  clk6_div,  clk7_div,  clk8_div,  clk9_div;
        integer m; 
        integer n;
        integer pre_m;
        integer pre_n;
        integer m_out;
        integer n_out;
        integer closest_vco_step_value;
        
        integer vco_period;
        integer pfd_freq;
        integer vco_freq;
        integer vco_ps_step_value;
        real    clk0_div_factor_real;
        real    clk1_div_factor_real;
        real    clk2_div_factor_real;
        real    clk3_div_factor_real;
        real    clk4_div_factor_real;
        real    clk5_div_factor_real;
        real    clk6_div_factor_real;
        real    clk7_div_factor_real;
        real    clk8_div_factor_real;
        real    clk9_div_factor_real;
        real    clk0_div_factor_diff;
        real    clk1_div_factor_diff;
        real    clk2_div_factor_diff;
        real    clk3_div_factor_diff;
        real    clk4_div_factor_diff;
        real    clk5_div_factor_diff;
        real    clk6_div_factor_diff;
        real    clk7_div_factor_diff;
        real    clk8_div_factor_diff;
        real    clk9_div_factor_diff;
        integer clk0_div_factor_int;
        integer clk1_div_factor_int;
        integer clk2_div_factor_int;
        integer clk3_div_factor_int;
        integer clk4_div_factor_int;
        integer clk5_div_factor_int;
        integer clk6_div_factor_int;
        integer clk7_div_factor_int;
        integer clk8_div_factor_int;
        integer clk9_div_factor_int;
    begin

        vco_period = vco_phase_shift_step * 8;

        pre_m = 0;
        pre_n = 0;
        closest_vco_step_value = 0;

        begin : LOOP_1
                for (n_out = 1; n_out < max_n; n_out = n_out +1)
                begin
                    for (m_out = 1; m_out < max_m; m_out = m_out +1)
                    begin
                        clk0_div_factor_real = (clk0_div * m_out * 1.0 ) / (clk0_mult * n_out);
                        clk1_div_factor_real = (clk1_div * m_out * 1.0) / (clk1_mult * n_out);
                        clk2_div_factor_real = (clk2_div * m_out * 1.0) / (clk2_mult * n_out);
                        clk3_div_factor_real = (clk3_div * m_out * 1.0) / (clk3_mult * n_out);
                        clk4_div_factor_real = (clk4_div * m_out * 1.0) / (clk4_mult * n_out);
                        clk5_div_factor_real = (clk5_div * m_out * 1.0) / (clk5_mult * n_out);
                        clk6_div_factor_real = (clk6_div * m_out * 1.0) / (clk6_mult * n_out);
                        clk7_div_factor_real = (clk7_div * m_out * 1.0) / (clk7_mult * n_out);
                        clk8_div_factor_real = (clk8_div * m_out * 1.0) / (clk8_mult * n_out);
                        clk9_div_factor_real = (clk9_div * m_out * 1.0) / (clk9_mult * n_out);
        
                        clk0_div_factor_int = clk0_div_factor_real;
                        clk1_div_factor_int = clk1_div_factor_real;
                        clk2_div_factor_int = clk2_div_factor_real;
                        clk3_div_factor_int = clk3_div_factor_real;
                        clk4_div_factor_int = clk4_div_factor_real;
                        clk5_div_factor_int = clk5_div_factor_real;
                        clk6_div_factor_int = clk6_div_factor_real;
                        clk7_div_factor_int = clk7_div_factor_real;
                        clk8_div_factor_int = clk8_div_factor_real;
                        clk9_div_factor_int = clk9_div_factor_real;
                        
                        clk0_div_factor_diff = (clk0_div_factor_real - clk0_div_factor_int < 0) ? (clk0_div_factor_real - clk0_div_factor_int) * -1.0 : clk0_div_factor_real - clk0_div_factor_int;
                        clk1_div_factor_diff = (clk1_div_factor_real - clk1_div_factor_int < 0) ? (clk1_div_factor_real - clk1_div_factor_int) * -1.0 : clk1_div_factor_real - clk1_div_factor_int;
                        clk2_div_factor_diff = (clk2_div_factor_real - clk2_div_factor_int < 0) ? (clk2_div_factor_real - clk2_div_factor_int) * -1.0 : clk2_div_factor_real - clk2_div_factor_int;
                        clk3_div_factor_diff = (clk3_div_factor_real - clk3_div_factor_int < 0) ? (clk3_div_factor_real - clk3_div_factor_int) * -1.0 : clk3_div_factor_real - clk3_div_factor_int;
                        clk4_div_factor_diff = (clk4_div_factor_real - clk4_div_factor_int < 0) ? (clk4_div_factor_real - clk4_div_factor_int) * -1.0 : clk4_div_factor_real - clk4_div_factor_int;
                        clk5_div_factor_diff = (clk5_div_factor_real - clk5_div_factor_int < 0) ? (clk5_div_factor_real - clk5_div_factor_int) * -1.0 : clk5_div_factor_real - clk5_div_factor_int;
                        clk6_div_factor_diff = (clk6_div_factor_real - clk6_div_factor_int < 0) ? (clk6_div_factor_real - clk6_div_factor_int) * -1.0 : clk6_div_factor_real - clk6_div_factor_int;
                        clk7_div_factor_diff = (clk7_div_factor_real - clk7_div_factor_int < 0) ? (clk7_div_factor_real - clk7_div_factor_int) * -1.0 : clk7_div_factor_real - clk7_div_factor_int;
                        clk8_div_factor_diff = (clk8_div_factor_real - clk8_div_factor_int < 0) ? (clk8_div_factor_real - clk8_div_factor_int) * -1.0 : clk8_div_factor_real - clk8_div_factor_int;
                        clk9_div_factor_diff = (clk9_div_factor_real - clk9_div_factor_int < 0) ? (clk9_div_factor_real - clk9_div_factor_int) * -1.0 : clk9_div_factor_real - clk9_div_factor_int;
                        
        
                        if (((clk0_div_factor_diff < max_offset) || (clk0_used == "unused")) &&
                            ((clk1_div_factor_diff < max_offset) || (clk1_used == "unused")) &&
                            ((clk2_div_factor_diff < max_offset) || (clk2_used == "unused")) &&
                            ((clk3_div_factor_diff < max_offset) || (clk3_used == "unused")) &&
                            ((clk4_div_factor_diff < max_offset) || (clk4_used == "unused")) &&
                            ((clk5_div_factor_diff < max_offset) || (clk5_used == "unused")) &&
                            ((clk6_div_factor_diff < max_offset) || (clk6_used == "unused")) &&
                            ((clk7_div_factor_diff < max_offset) || (clk7_used == "unused")) &&
                            ((clk8_div_factor_diff < max_offset) || (clk8_used == "unused")) &&
                            ((clk9_div_factor_diff < max_offset) || (clk9_used == "unused")) )
                        begin                
                            if ((m_out != 0) && (n_out != 0))
                            begin
                                pfd_freq = 1000000 / (inclock_period * n_out);
                                vco_freq = (1000000 * m_out) / (inclock_period * n_out);
                                vco_ps_step_value = (inclock_period * n_out) / (8 * m_out);
                
                                if ( (m_out < max_m) && (n_out < max_n) && (pfd_freq >= min_pfd) && (pfd_freq <= max_pfd) &&
                                    (vco_freq >= min_vco) && (vco_freq <= max_vco) )
                                begin
                                    if (abs(vco_ps_step_value - vco_phase_shift_step) <= 2)
                                    begin
                                        pre_m = m_out;
                                        pre_n = n_out;
                                        disable LOOP_1;
                                    end
                                    else
                                    begin
                                        if ((closest_vco_step_value == 0) || (abs(vco_ps_step_value - vco_phase_shift_step) < abs(closest_vco_step_value - vco_phase_shift_step)))
                                        begin
                                            pre_m = m_out;
                                            pre_n = n_out;
                                            closest_vco_step_value = vco_ps_step_value;
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
        end
        
        if ((pre_m != 0) && (pre_n != 0))
        begin
            find_simple_integer_fraction(pre_m, pre_n,
                        max_n, m, n);
        end
        else
        begin
            n = 1;
            m = lcm  (clk0_mult, clk1_mult, clk2_mult, clk3_mult,
                    clk4_mult, clk5_mult, clk6_mult,
                    clk7_mult, clk8_mult, clk9_mult, inclock_period);           
        end
    end
    endtask // find_m_and_n_4_manual_phase

    // find the factor of division of the output clock frequency
    // compared to the VCO
    function integer output_counter_value;
    input clk_divide, clk_mult, M, N;
    integer clk_divide, clk_mult, M, N;
    real r;
    integer r_int;
    begin
        r = (clk_divide * M * 1.0)/(clk_mult * N);
        r_int = r;
        output_counter_value = r_int;
    end
    endfunction

    // find the mode of each of the PLL counters - bypass, even or odd
    function [8*6:1] counter_mode;
    input duty_cycle;
    input output_counter_value;
    integer duty_cycle;
    integer output_counter_value;
    integer half_cycle_high;
    reg [8*6:1] R;
    begin
        half_cycle_high = (2*duty_cycle*output_counter_value)/100.0;
        if (output_counter_value == 1)
            R = "bypass";
        else if ((half_cycle_high % 2) == 0)
            R = "  even";
        else
            R = "   odd";
        counter_mode = R;
    end
    endfunction

    // find the number of VCO clock cycles to hold the output clock high
    function integer counter_high;
    input output_counter_value, duty_cycle;
    integer output_counter_value, duty_cycle;
    integer half_cycle_high;
    integer tmp_counter_high;
    integer mode;
    begin
        half_cycle_high = (2*duty_cycle*output_counter_value)/100.0;
        mode = ((half_cycle_high % 2) == 0);
        tmp_counter_high = half_cycle_high/2;
        counter_high = tmp_counter_high + !mode;
    end
    endfunction

    // find the number of VCO clock cycles to hold the output clock low
    function integer counter_low;
    input output_counter_value, duty_cycle;
    integer output_counter_value, duty_cycle, counter_h;
    integer half_cycle_high;
    integer mode;
    integer tmp_counter_high;
    begin
        half_cycle_high = (2*duty_cycle*output_counter_value)/100.0;
        mode = ((half_cycle_high % 2) == 0);
        tmp_counter_high = half_cycle_high/2;
        counter_h = tmp_counter_high + !mode;
        counter_low =  output_counter_value - counter_h;
    end
    endfunction

    // find the smallest time delay amongst t1 to t10
    function integer mintimedelay;
    input t1, t2, t3, t4, t5, t6, t7, t8, t9, t10;
    integer t1, t2, t3, t4, t5, t6, t7, t8, t9, t10;
    integer m1,m2,m3,m4,m5,m6,m7,m8,m9;
    begin
        if (t1 < t2)
            m1 = t1;
        else
            m1 = t2;
        if (m1 < t3)
            m2 = m1;
        else
            m2 = t3;
        if (m2 < t4)
            m3 = m2;
        else
            m3 = t4;
        if (m3 < t5)
            m4 = m3;
        else
            m4 = t5;
        if (m4 < t6)
            m5 = m4;
        else
            m5 = t6;
        if (m5 < t7)
            m6 = m5;
        else
            m6 = t7;
        if (m6 < t8)
            m7 = m6;
        else
            m7 = t8;
        if (m7 < t9)
            m8 = m7;
        else
            m8 = t9;
        if (m8 < t10)
            m9 = m8;
        else
            m9 = t10;
        if (m9 > 0)
            mintimedelay = m9;
        else
            mintimedelay = 0;
    end
    endfunction

    // find the numerically largest negative number, and return its absolute value
    function integer maxnegabs;
    input t1, t2, t3, t4, t5, t6, t7, t8, t9, t10;
    integer t1, t2, t3, t4, t5, t6, t7, t8, t9, t10;
    integer m1,m2,m3,m4,m5,m6,m7,m8,m9;
    begin
        if (t1 < t2) m1 = t1; else m1 = t2;
        if (m1 < t3) m2 = m1; else m2 = t3;
        if (m2 < t4) m3 = m2; else m3 = t4;
        if (m3 < t5) m4 = m3; else m4 = t5;
        if (m4 < t6) m5 = m4; else m5 = t6;
        if (m5 < t7) m6 = m5; else m6 = t7;
        if (m6 < t8) m7 = m6; else m7 = t8;
        if (m7 < t9) m8 = m7; else m8 = t9;
        if (m8 < t10) m9 = m8; else m9 = t10;
        maxnegabs = (m9 < 0) ? 0 - m9 : 0;
    end
    endfunction

    // adjust the given tap_phase by adding the largest negative number (ph_base) 
    function integer ph_adjust;
    input tap_phase, ph_base;
    integer tap_phase, ph_base;
    begin
        ph_adjust = tap_phase + ph_base;
    end
    endfunction

    // find the number of VCO clock cycles to wait initially before the first 
    // rising edge of the output clock
    function integer counter_initial;
    input tap_phase, m, n;
    integer tap_phase, m, n, phase;
    begin
        if (tap_phase < 0) tap_phase = 0 - tap_phase;
        // adding 0.5 for rounding correction (required in order to round
        // to the nearest integer instead of truncating)
        phase = ((tap_phase * m) / (360.0 * n)) + 0.6;
        counter_initial = phase;
    end
    endfunction

    // find which VCO phase tap to align the rising edge of the output clock to
    function integer counter_ph;
    input tap_phase;
    input m,n;
    integer m,n, phase;
    integer tap_phase;
    begin
    // adding 0.5 for rounding correction
        phase = (tap_phase * m / n) + 0.5;
        counter_ph = (phase % 360) / 45.0;

        if (counter_ph == 8)
            counter_ph = 0;
    end
    endfunction

    // convert the given string to length 6 by padding with spaces
    function [8*6:1] translate_string;
    input [8*6:1] mode;
    reg [8*6:1] new_mode;
    begin
        if (mode == "bypass")
            new_mode = "bypass";
        else if (mode == "even")
            new_mode = "  even";
        else if (mode == "odd")
            new_mode = "   odd";

        translate_string = new_mode;
    end
    endfunction

    // convert string to integer with sign
    function integer str2int; 
    input [8*16:1] s;

    reg [8*16:1] reg_s;
    reg [8:1] digit;
    reg [8:1] tmp;
    integer m, magnitude;
    integer sign;

    begin
        sign = 1;
        magnitude = 0;
        reg_s = s;
        for (m=1; m<=16; m=m+1)
        begin
            tmp = reg_s[128:121];
            digit = tmp & 8'b00001111;
            reg_s = reg_s << 8;
            // Accumulate ascii digits 0-9 only.
            if ((tmp>=48) && (tmp<=57)) 
                magnitude = (magnitude * 10) + digit;
            if (tmp == 45)
                sign = -1;  // Found a '-' character, i.e. number is negative.
        end
        str2int = sign*magnitude;
    end
    endfunction

    // this is for cycloneiii lvds only
    // convert phase delay to integer
    function integer get_int_phase_shift; 
    input [8*16:1] s;
    input i_phase_shift;
    integer i_phase_shift;

    begin
        if (i_phase_shift != 0)
        begin                   
            get_int_phase_shift = i_phase_shift;
        end       
        else
        begin
            get_int_phase_shift = str2int(s);
        end        
    end
    endfunction

    // calculate the given phase shift (in ps) in terms of degrees
    function integer get_phase_degree; 
    input phase_shift;
    integer phase_shift, result;
    begin
        result = (phase_shift * 360) / inclk0_freq;
        // this is to round up the calculation result
        if ( result > 0 )
            result = result + 1;
        else if ( result < 0 )
            result = result - 1;
        else
            result = 0;

        // assign the rounded up result
        get_phase_degree = result;
    end
    endfunction

    // convert uppercase parameter values to lowercase
    // assumes that the maximum character length of a parameter is 18
    function [8*`CYCIII_PLL_WORD_LENGTH:1] alpha_tolower;
    input [8*`CYCIII_PLL_WORD_LENGTH:1] given_string;

    reg [8*`CYCIII_PLL_WORD_LENGTH:1] return_string;
    reg [8*`CYCIII_PLL_WORD_LENGTH:1] reg_string;
    reg [8:1] tmp;
    reg [8:1] conv_char;
    integer byte_count;
    begin
        return_string = "                    "; // initialise strings to spaces
        conv_char = "        ";
        reg_string = given_string;
        for (byte_count = `CYCIII_PLL_WORD_LENGTH; byte_count >= 1; byte_count = byte_count - 1)
        begin
            tmp = reg_string[8*`CYCIII_PLL_WORD_LENGTH:(8*(`CYCIII_PLL_WORD_LENGTH-1)+1)];
            reg_string = reg_string << 8;
            if ((tmp >= 65) && (tmp <= 90)) // ASCII number of 'A' is 65, 'Z' is 90
            begin
                conv_char = tmp + 32; // 32 is the difference in the position of 'A' and 'a' in the ASCII char set
                return_string = {return_string, conv_char};
            end
            else
                return_string = {return_string, tmp};
        end
    
        alpha_tolower = return_string;
    end
    endfunction

    function integer display_msg;
    input [8*2:1] cntr_name;
    input msg_code;
    integer msg_code;
    begin
        if (msg_code == 1)
            $display ("Warning : %s counter switched from BYPASS mode to enabled. PLL may lose lock.", cntr_name);
        else if (msg_code == 2)
            $display ("Warning : Illegal 1 value for %s counter. Instead, the %s counter should be BYPASSED. Reconfiguration may not work.", cntr_name, cntr_name);
        else if (msg_code == 3)
            $display ("Warning : Illegal value for counter %s in BYPASS mode. The LSB of the counter should be set to 0 in order to operate the counter in BYPASS mode. Reconfiguration may not work.", cntr_name);
        else if (msg_code == 4)
            $display ("Warning : %s counter switched from enabled to BYPASS mode. PLL may lose lock.", cntr_name);
        $display ("Time: %0t  Instance: %m", $time);
        display_msg = 1;
    end
    endfunction

    initial
    begin
        scandata_out = 1'b0;
        first_inclk0_edge_detect = 1'b0;
        first_inclk1_edge_detect = 1'b0;
        pll_reconfig_display_full_setting = 1'b0;
        initiate_reconfig = 1'b0;
    switch_over_count = 0;
        // convert string parameter values from uppercase to lowercase,
        // as expected in this model
        l_operation_mode             = alpha_tolower(operation_mode);
        l_pll_type                   = alpha_tolower(pll_type);
        l_compensate_clock           = alpha_tolower(compensate_clock);
        l_switch_over_type           = alpha_tolower(switch_over_type);
        l_bandwidth_type             = alpha_tolower(bandwidth_type);
        l_simulation_type            = alpha_tolower(simulation_type);
        l_sim_gate_lock_device_behavior = alpha_tolower(sim_gate_lock_device_behavior);
        l_vco_frequency_control      = alpha_tolower(vco_frequency_control);
        l_enable_switch_over_counter = alpha_tolower(enable_switch_over_counter);
        l_self_reset_on_loss_lock    = alpha_tolower(self_reset_on_loss_lock);
    
        real_lock_high = (l_sim_gate_lock_device_behavior == "on") ? lock_high : 0;    
        // initialize charge_pump_current, and loop_filter tables
        loop_filter_c_arr[0] = 0;
        loop_filter_c_arr[1] = 0;
        loop_filter_c_arr[2] = 0;
        loop_filter_c_arr[3] = 0;
        
        fpll_loop_filter_c_arr[0] = 0;
        fpll_loop_filter_c_arr[1] = 0;
        fpll_loop_filter_c_arr[2] = 0;
        fpll_loop_filter_c_arr[3] = 0;
        
        charge_pump_curr_arr[0] = 0;
        charge_pump_curr_arr[1] = 0;
        charge_pump_curr_arr[2] = 0;
        charge_pump_curr_arr[3] = 0;
        charge_pump_curr_arr[4] = 0;
        charge_pump_curr_arr[5] = 0;
        charge_pump_curr_arr[6] = 0;
        charge_pump_curr_arr[7] = 0;
        charge_pump_curr_arr[8] = 0;
        charge_pump_curr_arr[9] = 0;
        charge_pump_curr_arr[10] = 0;
        charge_pump_curr_arr[11] = 0;
        charge_pump_curr_arr[12] = 0;
        charge_pump_curr_arr[13] = 0;
        charge_pump_curr_arr[14] = 0;
        charge_pump_curr_arr[15] = 0;

        i_vco_max = vco_max;
        i_vco_min = vco_min; 

        if(vco_post_scale == 1)
        begin
            i_vco_max_no_division = vco_max * 2;
            i_vco_min_no_division = vco_min * 2;    
        end
        else
        begin
            i_vco_max_no_division = vco_max;
            i_vco_min_no_division = vco_min;    
        end


        if (m == 0)
        begin
            i_clk4_counter    = "c4" ;
            i_clk3_counter    = "c3" ;
            i_clk2_counter    = "c2" ;
            i_clk1_counter    = "c1" ;
            i_clk0_counter    = "c0" ;
        end
        else begin
            i_clk4_counter    = alpha_tolower(clk4_counter);
            i_clk3_counter    = alpha_tolower(clk3_counter);
            i_clk2_counter    = alpha_tolower(clk2_counter);
            i_clk1_counter    = alpha_tolower(clk1_counter);
            i_clk0_counter    = alpha_tolower(clk0_counter);
        end

        if (m == 0)
        begin 

            // set the limit of the divide_by value that can be returned by
            // the following function.
            max_d_value = 1500;
            
            // scale down the multiply_by and divide_by values provided by the design
            // before attempting to use them in the calculations below
            find_simple_integer_fraction(clk0_multiply_by, clk0_divide_by,
                            max_d_value, i_clk0_mult_by, i_clk0_div_by);
            find_simple_integer_fraction(clk1_multiply_by, clk1_divide_by,
                            max_d_value, i_clk1_mult_by, i_clk1_div_by);
            find_simple_integer_fraction(clk2_multiply_by, clk2_divide_by,
                            max_d_value, i_clk2_mult_by, i_clk2_div_by);
            find_simple_integer_fraction(clk3_multiply_by, clk3_divide_by,
                            max_d_value, i_clk3_mult_by, i_clk3_div_by);
            find_simple_integer_fraction(clk4_multiply_by, clk4_divide_by,
                            max_d_value, i_clk4_mult_by, i_clk4_div_by);

            // convert user parameters to advanced
            if (l_vco_frequency_control == "manual_phase")
            begin
                find_m_and_n_4_manual_phase(inclk0_freq, vco_phase_shift_step,
                            i_clk0_mult_by, i_clk1_mult_by,
                            i_clk2_mult_by, i_clk3_mult_by,i_clk4_mult_by,
                1, 1, 1, 1, 1, 
                            i_clk0_div_by, i_clk1_div_by,
                            i_clk2_div_by, i_clk3_div_by,i_clk4_div_by,
                1, 1, 1, 1, 1, 
                            clk0_counter, clk1_counter,
                            clk2_counter, clk3_counter,clk4_counter,
                "unused", "unused", "unused", "unused", "unused", 
                            i_m, i_n);
            end
            else if (((l_pll_type == "fast") || (l_pll_type == "lvds") || (l_pll_type == "left_right")) && (vco_multiply_by != 0) && (vco_divide_by != 0))
            begin
                i_n = vco_divide_by;
                i_m = vco_multiply_by;
            end
            else begin
                i_n = 1;
                if (((l_pll_type == "fast") || (l_pll_type == "left_right")) && (l_compensate_clock == "lvdsclk"))
                    i_m = i_clk0_mult_by;
                else
                    i_m = lcm  (i_clk0_mult_by, i_clk1_mult_by,
                            i_clk2_mult_by, i_clk3_mult_by,i_clk4_mult_by,
                1, 1, 1, 1, 1, 
                            inclk0_freq);
            end

            i_c_high[0] = counter_high (output_counter_value(i_clk0_div_by,
                                        i_clk0_mult_by, i_m, i_n), clk0_duty_cycle);
            i_c_high[1] = counter_high (output_counter_value(i_clk1_div_by,
                                        i_clk1_mult_by, i_m, i_n), clk1_duty_cycle);
            i_c_high[2] = counter_high (output_counter_value(i_clk2_div_by,
                                        i_clk2_mult_by, i_m, i_n), clk2_duty_cycle);
            i_c_high[3] = counter_high (output_counter_value(i_clk3_div_by,
                                        i_clk3_mult_by, i_m, i_n), clk3_duty_cycle);
            i_c_high[4] = counter_high (output_counter_value(i_clk4_div_by,
                                        i_clk4_mult_by,  i_m, i_n), clk4_duty_cycle);

            i_c_low[0]  = counter_low  (output_counter_value(i_clk0_div_by,
                                        i_clk0_mult_by,  i_m, i_n), clk0_duty_cycle);
            i_c_low[1]  = counter_low  (output_counter_value(i_clk1_div_by,
                                        i_clk1_mult_by,  i_m, i_n), clk1_duty_cycle);
            i_c_low[2]  = counter_low  (output_counter_value(i_clk2_div_by,
                                        i_clk2_mult_by,  i_m, i_n), clk2_duty_cycle);
            i_c_low[3]  = counter_low  (output_counter_value(i_clk3_div_by,
                                        i_clk3_mult_by,  i_m, i_n), clk3_duty_cycle);
            i_c_low[4]  = counter_low  (output_counter_value(i_clk4_div_by,
                                        i_clk4_mult_by,  i_m, i_n), clk4_duty_cycle);

            if (l_pll_type == "flvds")
            begin
                // Need to readjust phase shift values when the clock multiply value has been readjusted.
                new_multiplier = clk0_multiply_by / i_clk0_mult_by;
                i_clk0_phase_shift = (clk0_phase_shift_num * new_multiplier);
                i_clk1_phase_shift = (clk1_phase_shift_num * new_multiplier);
                i_clk2_phase_shift = (clk2_phase_shift_num * new_multiplier);
                i_clk3_phase_shift = 0;
                i_clk4_phase_shift = 0;
            end
            else
            begin
                i_clk0_phase_shift = get_int_phase_shift(clk0_phase_shift, clk0_phase_shift_num);
                i_clk1_phase_shift = get_int_phase_shift(clk1_phase_shift, clk1_phase_shift_num);
                i_clk2_phase_shift = get_int_phase_shift(clk2_phase_shift, clk2_phase_shift_num);
                i_clk3_phase_shift = get_int_phase_shift(clk3_phase_shift, clk3_phase_shift_num);
                i_clk4_phase_shift = get_int_phase_shift(clk4_phase_shift, clk4_phase_shift_num);
            end

            max_neg_abs = maxnegabs   ( i_clk0_phase_shift,
                                        i_clk1_phase_shift,
                                        i_clk2_phase_shift,
                                        i_clk3_phase_shift,
                                        i_clk4_phase_shift,
                                            0,
                                            0,
                                            0,
                                            0,
                                            0
                                        );

            i_c_initial[0] = counter_initial(get_phase_degree(ph_adjust(i_clk0_phase_shift, max_neg_abs)), i_m, i_n);
            i_c_initial[1] = counter_initial(get_phase_degree(ph_adjust(i_clk1_phase_shift, max_neg_abs)), i_m, i_n);
            i_c_initial[2] = counter_initial(get_phase_degree(ph_adjust(i_clk2_phase_shift, max_neg_abs)), i_m, i_n);
            i_c_initial[3] = counter_initial(get_phase_degree(ph_adjust(i_clk3_phase_shift, max_neg_abs)), i_m, i_n);
            i_c_initial[4] = counter_initial(get_phase_degree(ph_adjust(i_clk4_phase_shift, max_neg_abs)), i_m, i_n);

            i_c_mode[0] = counter_mode(clk0_duty_cycle,output_counter_value(i_clk0_div_by, i_clk0_mult_by,  i_m, i_n));
            i_c_mode[1] = counter_mode(clk1_duty_cycle,output_counter_value(i_clk1_div_by, i_clk1_mult_by,  i_m, i_n));
            i_c_mode[2] = counter_mode(clk2_duty_cycle,output_counter_value(i_clk2_div_by, i_clk2_mult_by,  i_m, i_n));
            i_c_mode[3] = counter_mode(clk3_duty_cycle,output_counter_value(i_clk3_div_by, i_clk3_mult_by,  i_m, i_n));
            i_c_mode[4] = counter_mode(clk4_duty_cycle,output_counter_value(i_clk4_div_by, i_clk4_mult_by,  i_m, i_n));

            i_m_ph    = counter_ph(get_phase_degree(max_neg_abs), i_m, i_n);
            i_m_initial = counter_initial(get_phase_degree(max_neg_abs), i_m, i_n);
            
            i_c_ph[0] = counter_ph(get_phase_degree(ph_adjust(i_clk0_phase_shift, max_neg_abs)), i_m, i_n);
            i_c_ph[1] = counter_ph(get_phase_degree(ph_adjust(i_clk1_phase_shift, max_neg_abs)), i_m, i_n);
            i_c_ph[2] = counter_ph(get_phase_degree(ph_adjust(i_clk2_phase_shift, max_neg_abs)), i_m, i_n);
            i_c_ph[3] = counter_ph(get_phase_degree(ph_adjust(i_clk3_phase_shift,max_neg_abs)), i_m, i_n);
            i_c_ph[4] = counter_ph(get_phase_degree(ph_adjust(i_clk4_phase_shift,max_neg_abs)), i_m, i_n);


        end
        else 
        begin //  m != 0

            i_n = n;
            i_m = m;
            i_c_high[0] = c0_high;
            i_c_high[1] = c1_high;
            i_c_high[2] = c2_high;
            i_c_high[3] = c3_high;
            i_c_high[4] = c4_high;
            i_c_low[0]  = c0_low;
            i_c_low[1]  = c1_low;
            i_c_low[2]  = c2_low;
            i_c_low[3]  = c3_low;
            i_c_low[4]  = c4_low;
            i_c_initial[0] = c0_initial;
            i_c_initial[1] = c1_initial;
            i_c_initial[2] = c2_initial;
            i_c_initial[3] = c3_initial;
            i_c_initial[4] = c4_initial;
            i_c_mode[0] = translate_string(alpha_tolower(c0_mode));
            i_c_mode[1] = translate_string(alpha_tolower(c1_mode));
            i_c_mode[2] = translate_string(alpha_tolower(c2_mode));
            i_c_mode[3] = translate_string(alpha_tolower(c3_mode));
            i_c_mode[4] = translate_string(alpha_tolower(c4_mode));
            i_c_ph[0]  = c0_ph;
            i_c_ph[1]  = c1_ph;
            i_c_ph[2]  = c2_ph;
            i_c_ph[3]  = c3_ph;
            i_c_ph[4]  = c4_ph;
            i_m_ph   = m_ph;        // default
            i_m_initial = m_initial;

        end // user to advanced conversion
        
        switch_clock = 1'b0;

        refclk_period = inclk0_freq * i_n;

        m_times_vco_period = refclk_period;
        new_m_times_vco_period = refclk_period;

        fbclk_period = 0;
        high_time = 0;
        low_time = 0;
        schedule_vco = 0;
        vco_out[7:0] = 8'b0;
        vco_tap[7:0] = 8'b0;
        fbclk_last_value = 0;
        offset = 0;
        temp_offset = 0;
        got_first_refclk = 0;
        got_first_fbclk = 0;
        fbclk_time = 0;
        first_fbclk_time = 0;
        refclk_time = 0;
        first_schedule = 1;
        sched_time = 0;
        vco_val = 0;
        gate_count = 0;
        gate_out = 0;
        initial_delay = 0;
        fbk_phase = 0;
        for (i = 0; i <= 7; i = i + 1)
        begin
            phase_shift[i] = 0;
            last_phase_shift[i] = 0;
        end
        fbk_delay = 0;
        inclk_n = 0;
        inclk_es = 0;
        inclk_man = 0;
        cycle_to_adjust = 0;
        m_delay = 0;
        total_pull_back = 0;
        pull_back_M = 0;
        vco_period_was_phase_adjusted = 0;
        phase_adjust_was_scheduled = 0;
        inclk_out_of_range = 0;
        scandone_tmp = 1'b0;
        schedule_vco_last_value = 0;

        scan_chain_length = SCAN_CHAIN;
        num_output_cntrs  = 5;

        
        phasestep_high_count = 0;
        update_phase = 0;
        // set initial values for counter parameters
        m_initial_val = i_m_initial;
        m_val[0] = i_m;
        n_val[0] = i_n;
        m_ph_val = i_m_ph;
        m_ph_val_orig = i_m_ph;
        m_ph_val_tmp = i_m_ph;
        m_val_tmp[0] = i_m;


        if (m_val[0] == 1)
            m_mode_val[0] = "bypass";
        else m_mode_val[0] = "";
        if (m_val[1] == 1)
            m_mode_val[1] = "bypass";
        if (n_val[0] == 1)
            n_mode_val[0] = "bypass";
        if (n_val[1] == 1)
            n_mode_val[1] = "bypass";

        for (i = 0; i < 10; i=i+1)
        begin
            c_high_val[i] = i_c_high[i];
            c_low_val[i] = i_c_low[i];
            c_initial_val[i] = i_c_initial[i];
            c_mode_val[i] = i_c_mode[i];
            c_ph_val[i] = i_c_ph[i];
            c_high_val_tmp[i] = i_c_high[i];
            c_hval[i] = i_c_high[i];
            c_low_val_tmp[i] = i_c_low[i];
            c_lval[i] = i_c_low[i];
            if (c_mode_val[i] == "bypass")
            begin
                if (l_pll_type == "fast" || l_pll_type == "lvds" || l_pll_type == "left_right")
                begin
                    c_high_val[i] = 5'b10000;
                    c_low_val[i] = 5'b10000;
                    c_high_val_tmp[i] = 5'b10000;
                    c_low_val_tmp[i] = 5'b10000;
                end
                else begin
                    c_high_val[i] = 9'b100000000;
                    c_low_val[i] = 9'b100000000;
                    c_high_val_tmp[i] = 9'b100000000;
                    c_low_val_tmp[i] = 9'b100000000;
                end
            end

            c_mode_val_tmp[i] = i_c_mode[i];
            c_ph_val_tmp[i] = i_c_ph[i];

            c_ph_val_orig[i] = i_c_ph[i];
            c_high_val_hold[i] = i_c_high[i];
            c_low_val_hold[i] = i_c_low[i];
            c_mode_val_hold[i] = i_c_mode[i];
        end

        lfc_val = loop_filter_c;
        lfr_val = loop_filter_r;
        cp_curr_val = charge_pump_current;
        vco_cur = vco_post_scale;

        i = 0;
        j = 0;
        inclk_last_value = 0;

    
        // initialize clkswitch variables

        clk0_is_bad = 0;
        clk1_is_bad = 0;
        inclk0_last_value = 0;
        inclk1_last_value = 0;
        other_clock_value = 0;
        other_clock_last_value = 0;
        primary_clk_is_bad = 0;
        current_clk_is_bad = 0;
        external_switch = 0;
        current_clock = 0;
        current_clock_man = 0;

        active_clock = 0;   // primary_clk is always inclk0
        if (l_pll_type == "fast" || (l_pll_type == "left_right"))
            l_switch_over_type = "manual";

        if (l_switch_over_type == "manual" && clkswitch === 1'b1)
        begin
            current_clock_man = 1;
            active_clock = 1;
        end
        got_curr_clk_falling_edge_after_clkswitch = 0;
        clk0_count = 0;
        clk1_count = 0;

        // initialize reconfiguration variables
        // quiet_time
        quiet_time = slowest_clk  ( c_high_val[0]+c_low_val[0], c_mode_val[0],
                                    c_high_val[1]+c_low_val[1], c_mode_val[1],
                                    c_high_val[2]+c_low_val[2], c_mode_val[2],
                                    c_high_val[3]+c_low_val[3], c_mode_val[3],
                                    c_high_val[4]+c_low_val[4], c_mode_val[4],
                                    c_high_val[5]+c_low_val[5], c_mode_val[5],
                                    c_high_val[6]+c_low_val[6], c_mode_val[6],
                                    c_high_val[7]+c_low_val[7], c_mode_val[7],
                                    c_high_val[8]+c_low_val[8], c_mode_val[8],
                                    c_high_val[9]+c_low_val[9], c_mode_val[9],
                                    refclk_period, m_val[0]);
        reconfig_err = 0;
        error = 0;
        
        
        c0_rising_edge_transfer_done = 0;
        c1_rising_edge_transfer_done = 0;
        c2_rising_edge_transfer_done = 0;
        c3_rising_edge_transfer_done = 0;
        c4_rising_edge_transfer_done = 0;
        got_first_scanclk = 0;
        got_first_gated_scanclk = 0;
        gated_scanclk = 1;
        scanread_setup_violation = 0;
        index = 0;

        vco_over  = 1'b0;
        vco_under = 1'b0;
        
        // Initialize the scan chain 
        
        // LF unused : bit 1
        scan_data[-1:0] = 2'b00;
        // LF Capacitance : bits 1,2 : all values are legal
        scan_data[1:2] = loop_filter_c_bits;
        // LF Resistance : bits 3-7
        scan_data[3:7] = loop_filter_r_bits;
        
        // VCO post scale
        if(vco_post_scale == 1)
        begin
            scan_data[8] = 1'b1;
            vco_val_old_bit_setting = 1'b1;
        end
        else
        begin
            scan_data[8] = 1'b0;
            vco_val_old_bit_setting = 1'b0;
        end
            
        scan_data[9:13] = 5'b00000;
        // CP
        // Bit 8 : CRBYPASS
        // Bit 9-13 : unused
        // Bits 14-16 : all values are legal                 
                scan_data[14:16] = charge_pump_current_bits;
        // store as old values
        
        cp_curr_old_bit_setting = charge_pump_current_bits;
        lfc_val_old_bit_setting = loop_filter_c_bits;
        lfr_val_old_bit_setting = loop_filter_r_bits;
            
        // C counters (start bit 53) bit 1:mode(bypass),bit 2-9:high,bit 10:mode(odd/even),bit 11-18:low
        for (i = 0; i < num_output_cntrs; i = i + 1)
        begin
            // 1. Mode - bypass
            if (c_mode_val[i] == "bypass")
            begin
                scan_data[53 + i*18 + 0] = 1'b1;
                if (c_mode_val[i] == "   odd")
                    scan_data[53 + i*18 + 9] = 1'b1;
                else
                    scan_data[53 + i*18 + 9] = 1'b0;
            end
            else
            begin
                scan_data[53 + i*18 + 0] = 1'b0;
                // 3. Mode - odd/even
                if (c_mode_val[i] == "   odd")
                    scan_data[53 + i*18 + 9] = 1'b1;
                else
                    scan_data[53 + i*18 + 9] = 1'b0;
            end
            // 2. Hi
            c_val = c_high_val[i];
            for (j = 1; j <= 8; j = j + 1)
                scan_data[53 + i*18 + j]  = c_val[8 - j];
   
            // 4. Low
            c_val = c_low_val[i];
            for (j = 10; j <= 17; j = j + 1)
                scan_data[53 + i*18 + j] = c_val[17 - j];
        end
            
        // M counter
        // 1. Mode - bypass (bit 17)
        if (m_mode_val[0] == "bypass")
                scan_data[35] = 1'b1;
        else
                scan_data[35] = 1'b0;
       
        // 2. High (bit 18-25)
        // 3. Mode - odd/even (bit 26)
        if (m_val[0] % 2 == 0)
        begin
            // M is an even no. : set M high = low,
            // set odd/even bit to 0
                scan_data[36:43]= m_val[0]/2;
                scan_data[44] = 1'b0;
        end
        else 
        begin 
            // M is odd : M high = low + 1
                scan_data[36:43] = m_val[0]/2 + 1;
                scan_data[44] = 1'b1;             
        end
        // 4. Low (bit 27-34)
            scan_data[45:52] = m_val[0]/2;

        
        // N counter
        // 1. Mode - bypass (bit 35)
        if (n_mode_val[0] == "bypass")
                scan_data[17] = 1'b1;
        else 
                scan_data[17] = 1'b0;
        // 2. High (bit 36-43)
        // 3. Mode - odd/even (bit 44)
        if (n_val[0] % 2 == 0)
        begin
            // N is an even no. : set N high = low,
            // set odd/even bit to 0
                scan_data[18:25] = n_val[0]/2;
                scan_data[26] = 1'b0;         
        end
        else 
        begin // N is odd : N high = N low + 1
                scan_data[18:25] = n_val[0]/2+ 1;
                scan_data[26] = 1'b1;         
        end
        // 4. Low (bit 45-52)
                scan_data[27:34] = n_val[0]/2;


        l_index = 1;
        stop_vco = 0;
        cycles_to_lock = 0;
        cycles_to_unlock = 0;
        locked_tmp = 0;
        pll_is_locked = 0;
        no_warn = 1'b0;
        
        pfd_locked = 1'b0;
        cycles_pfd_high = 0;
        cycles_pfd_low  = 0;

        // check if pll is in test mode
        if (m_test_source != -1 || c0_test_source != -1 || c1_test_source != -1 || c2_test_source != -1 || c3_test_source != -1 || c4_test_source != -1)
            pll_in_test_mode = 1'b1;
        else
            pll_in_test_mode = 1'b0;

        pll_is_in_reset = 0;
        pll_has_just_been_reconfigured = 0;
        if (l_pll_type == "fast" || l_pll_type == "lvds" || l_pll_type == "left_right")
            is_fast_pll = 1;
        else is_fast_pll = 0;

        if (c1_use_casc_in == "on")
            ic1_use_casc_in = 1;
        else
            ic1_use_casc_in = 0;
        if (c2_use_casc_in == "on")
            ic2_use_casc_in = 1;
        else
            ic2_use_casc_in = 0;
        if (c3_use_casc_in == "on")
            ic3_use_casc_in = 1;
        else
            ic3_use_casc_in = 0;
        if (c4_use_casc_in == "on")
            ic4_use_casc_in = 1;
        else
            ic4_use_casc_in = 0;

        tap0_is_active = 1;
        
// To display clock mapping       
    case( i_clk0_counter)
            "c0" : clk_num[0] = "  clk0";
            "c1" : clk_num[0] = "  clk1";
            "c2" : clk_num[0] = "  clk2";
            "c3" : clk_num[0] = "  clk3";
            "c4" : clk_num[0] = "  clk4";
            default:clk_num[0] = "unused";
    endcase
    
        case( i_clk1_counter)
            "c0" : clk_num[1] = "  clk0";
            "c1" : clk_num[1] = "  clk1";
            "c2" : clk_num[1] = "  clk2";
            "c3" : clk_num[1] = "  clk3";
            "c4" : clk_num[1] = "  clk4";
            default:clk_num[1] = "unused";
    endcase
        
    case( i_clk2_counter)
            "c0" : clk_num[2] = "  clk0";
            "c1" : clk_num[2] = "  clk1";
            "c2" : clk_num[2] = "  clk2";
            "c3" : clk_num[2] = "  clk3";
            "c4" : clk_num[2] = "  clk4";
            default:clk_num[2] = "unused";
    endcase
        
    case( i_clk3_counter)
            "c0" : clk_num[3] = "  clk0";
            "c1" : clk_num[3] = "  clk1";
            "c2" : clk_num[3] = "  clk2";
            "c3" : clk_num[3] = "  clk3";
            "c4" : clk_num[3] = "  clk4";
            default:clk_num[3] = "unused";
    endcase
        
    case( i_clk4_counter)
            "c0" : clk_num[4] = "  clk0";
            "c1" : clk_num[4] = "  clk1";
            "c2" : clk_num[4] = "  clk2";
            "c3" : clk_num[4] = "  clk3";
            "c4" : clk_num[4] = "  clk4";
            default:clk_num[4] = "unused";
    endcase
        

        end


// Clock Switchover

always @(clkswitch)
begin
    if (clkswitch === 1'b1 && l_switch_over_type == "auto")
        external_switch = 1;
    else if (l_switch_over_type == "manual") 
    begin
        if(clkswitch === 1'b1)
            switch_clock = 1'b1;
        else
            switch_clock = 1'b0;
    end
end


always @(posedge inclk[0])
begin
// Determine the inclk0 frequency
    if (first_inclk0_edge_detect == 1'b0)
        begin
            first_inclk0_edge_detect = 1'b1;
        end
    else
        begin
            last_inclk0_period = inclk0_period;
            inclk0_period = $realtime - last_inclk0_edge;
        end
    last_inclk0_edge = $realtime;

end

always @(posedge inclk[1])
begin
// Determine the inclk1 frequency
    if (first_inclk1_edge_detect == 1'b0)
        begin
            first_inclk1_edge_detect = 1'b1;
        end
    else
        begin
            last_inclk1_period = inclk1_period;
            inclk1_period = $realtime - last_inclk1_edge;
        end
    last_inclk1_edge = $realtime;

end

    always @(inclk[0] or inclk[1])
    begin
        if(switch_clock == 1'b1)
        begin
                if(current_clock_man == 0)
                begin
                    current_clock_man = 1;
                    active_clock = 1;
                end
                else
                begin
                    current_clock_man = 0;
                    active_clock = 0;
                end
                switch_clock = 1'b0;
            end

        if (current_clock_man == 0)
            inclk_man = inclk[0];
        else
            inclk_man = inclk[1];


        // save the inclk event value
        if (inclk[0] !== inclk0_last_value)
        begin
            if (current_clock != 0)
                other_clock_value = inclk[0];
        end
        if (inclk[1] !== inclk1_last_value)
        begin
            if (current_clock != 1)
                other_clock_value = inclk[1];
        end

        // check if either input clk is bad
        if (inclk[0] === 1'b1 && inclk[0] !== inclk0_last_value)
        begin
            clk0_count = clk0_count + 1;
            clk0_is_bad = 0;
            clk1_count = 0;
            if (clk0_count > 2)
            begin
                // no event on other clk for 2 cycles
                clk1_is_bad = 1;
                if (current_clock == 1)
                    current_clk_is_bad = 1;
            end
        end
        if (inclk[1] === 1'b1 && inclk[1] !== inclk1_last_value)
        begin
            clk1_count = clk1_count + 1;
            clk1_is_bad = 0;
            clk0_count = 0;
            if (clk1_count > 2)
            begin
                // no event on other clk for 2 cycles
                clk0_is_bad = 1;
                if (current_clock == 0)
                    current_clk_is_bad = 1;
            end
        end

        // check if the bad clk is the primary clock, which is always clk0
        if (clk0_is_bad == 1'b1)
            primary_clk_is_bad = 1;
        else
            primary_clk_is_bad = 0;

        // actual switching -- manual switch
        if ((inclk[0] !== inclk0_last_value) && current_clock == 0)
        begin
            if (external_switch == 1'b1)
            begin
                if (!got_curr_clk_falling_edge_after_clkswitch)
                begin
                    if (inclk[0] === 1'b0)
                        got_curr_clk_falling_edge_after_clkswitch = 1;
                    inclk_es = inclk[0];
                end
            end
            else inclk_es = inclk[0];
        end
        if ((inclk[1] !== inclk1_last_value) && current_clock == 1)
        begin
            if (external_switch == 1'b1)
            begin
                if (!got_curr_clk_falling_edge_after_clkswitch)
                begin
                    if (inclk[1] === 1'b0)
                        got_curr_clk_falling_edge_after_clkswitch = 1;
                    inclk_es = inclk[1];
                end
            end
            else inclk_es = inclk[1];
        end

        // actual switching -- automatic switch
        if ((other_clock_value == 1'b1) && (other_clock_value != other_clock_last_value) && l_enable_switch_over_counter == "on" && primary_clk_is_bad)
            switch_over_count = switch_over_count + 1;
        
        if ((other_clock_value == 1'b0) && (other_clock_value != other_clock_last_value))
        begin
            if ((external_switch && (got_curr_clk_falling_edge_after_clkswitch || current_clk_is_bad)) || (primary_clk_is_bad && (clkswitch !== 1'b1) && ((l_enable_switch_over_counter == "off" || switch_over_count == switch_over_counter))))
            begin
                if (areset === 1'b0)
                begin
                    if ((inclk0_period > inclk1_period) && (inclk1_period != 0))
                        diff_percent_period = (( inclk0_period - inclk1_period ) * 100) / inclk1_period;
                    else if (inclk0_period != 0)
                        diff_percent_period = (( inclk1_period - inclk0_period ) * 100) / inclk0_period;

                    if((diff_percent_period > 20)&& (l_switch_over_type == "auto"))
                    begin
                        $display ("Warning : The input clock frequencies specified for the specified PLL are too far apart for auto-switch-over feature to work properly. Please make sure that the clock frequencies are 20 percent apart for correct functionality.");
                        $display ("Time: %0t  Instance: %m", $time);
                    end
                end

                got_curr_clk_falling_edge_after_clkswitch = 0;
                if (current_clock == 0)
                    current_clock = 1;
                else
                    current_clock = 0;
                    
                active_clock = ~active_clock;
                switch_over_count = 0;
                external_switch = 0;
                current_clk_is_bad = 0;
            end
            else if(l_switch_over_type == "auto")
                begin
                    if(current_clock == 0 && clk0_is_bad == 1'b1 && clk1_is_bad == 1'b0 )
                        begin
                            current_clock = 1;
                            active_clock = ~active_clock;
                        end 
                
                    if(current_clock == 1 && clk1_is_bad == 1'b1 && clk0_is_bad == 1'b0 )
                        begin
                            current_clock = 0;
                            active_clock = ~active_clock;
                        end
                end     
        end
        
        if(l_switch_over_type == "manual")
            inclk_n = inclk_man;
        else
            inclk_n = inclk_es;
            
        inclk0_last_value = inclk[0];
        inclk1_last_value = inclk[1];
        other_clock_last_value = other_clock_value;

    end

    and (clkbad[0], clk0_is_bad, 1'b1);
    and (clkbad[1], clk1_is_bad, 1'b1);
    and (activeclock, active_clock, 1'b1);


    assign inclk_m = (m_test_source == 0) ? fbclk : (m_test_source == 1) ? refclk : inclk_m_from_vco; 
                       

    cda_m_cntr m1 (.clk(inclk_m),
                        .reset(areset || stop_vco),
                        .cout(fbclk),
                        .initial_value(m_initial_val),
                        .modulus(m_val[0]),
                        .time_delay(m_delay));

    cda_n_cntr n1 (.clk(inclk_n),
                        .reset(areset),
                        .cout(refclk),
                        .modulus(n_val[0]));



    // Update clock on /o counters from corresponding VCO tap
    assign inclk_m_from_vco  = vco_tap[m_ph_val];
    assign inclk_c0_from_vco = vco_tap[c_ph_val[0]];
    assign inclk_c1_from_vco = vco_tap[c_ph_val[1]];
    assign inclk_c2_from_vco = vco_tap[c_ph_val[2]];
    assign inclk_c3_from_vco = vco_tap[c_ph_val[3]];
    assign inclk_c4_from_vco = vco_tap[c_ph_val[4]];
always @(vco_out)
    begin
        // check which VCO TAP has event
        for (x = 0; x <= 7; x = x + 1)
        begin
            if (vco_out[x] !== vco_out_last_value[x])
            begin
                // TAP 'X' has event
                if ((x == 0) && (!pll_is_in_reset) && (stop_vco !== 1'b1))
                begin
                    if (vco_out[0] == 1'b1)
                        tap0_is_active = 1;
                    if (tap0_is_active == 1'b1)
                        vco_tap[0] <= vco_out[0];
                end
                else if (tap0_is_active == 1'b1)
                    vco_tap[x] <= vco_out[x];
                if (stop_vco === 1'b1)
                    vco_out[x] <= 1'b0;
            end
        end
        vco_out_last_value = vco_out;
    end

    always @(vco_tap)
    begin
        // Update phase taps for C/M counters on negative edge of VCO clock output
        
        if (update_phase == 1'b1)
        begin
            for (x = 0; x <= 7; x = x + 1)
            begin
                if ((vco_tap[x] === 1'b0) && (vco_tap[x] !== vco_tap_last_value[x]))
                begin
                    for (y = 0; y < 10; y = y + 1)
                    begin
                        if (c_ph_val_tmp[y] == x)
                            c_ph_val[y] = c_ph_val_tmp[y];
                    end
                    if (m_ph_val_tmp == x)
                        m_ph_val = m_ph_val_tmp;
                end
            end
            update_phase <= #(0.5*scanclk_period) 1'b0;
        end

        // On reset, set all C/M counter phase taps to POF programmed values
        if (areset === 1'b1)
        begin
            m_ph_val = m_ph_val_orig;
            m_ph_val_tmp = m_ph_val_orig;
            for (i=0; i<= 9; i=i+1)
            begin
                c_ph_val[i] = c_ph_val_orig[i];
                c_ph_val_tmp[i] = c_ph_val_orig[i];
            end
        end

        vco_tap_last_value = vco_tap;
    end

    assign inclk_c0 = (c0_test_source == 0) ? fbclk : (c0_test_source == 1) ? refclk : inclk_c0_from_vco;

    cda_scale_cntr c0 (.clk(inclk_c0),
                            .reset(areset  || stop_vco),
                            .cout(c0_clk),
                            .high(c_high_val[0]),
                            .low(c_low_val[0]),
                            .initial_value(c_initial_val[0]),
                            .mode(c_mode_val[0]),
                            .ph_tap(c_ph_val[0]));

    // Update /o counters mode and duty cycle immediately after configupdate is asserted
    always @(posedge scanclk)
    begin
        if (update_conf_latches_reg == 1'b1)
        begin
            c_high_val[0] <= c_high_val_tmp[0];
            c_mode_val[0] <= c_mode_val_tmp[0];
            c0_rising_edge_transfer_done = 1;
        end
    end
    always @(negedge scanclk)
    begin
        if (c0_rising_edge_transfer_done)
        begin
            c_low_val[0] <= c_low_val_tmp[0];
        end
    end

    assign inclk_c1 = (c1_test_source == 0) ? fbclk : (c1_test_source == 1) ? refclk : (ic1_use_casc_in == 1) ? c0_clk : inclk_c1_from_vco;
    
    cda_scale_cntr c1 (.clk(inclk_c1),
                            .reset(areset || stop_vco),
                            .cout(c1_clk),
                            .high(c_high_val[1]),
                            .low(c_low_val[1]),
                            .initial_value(c_initial_val[1]),
                            .mode(c_mode_val[1]),
                            .ph_tap(c_ph_val[1]));

    always @(posedge scanclk)
    begin
        if (update_conf_latches_reg == 1'b1)
        begin
            c_high_val[1] <= c_high_val_tmp[1];
            c_mode_val[1] <= c_mode_val_tmp[1];
            c1_rising_edge_transfer_done = 1;
        end
    end
    always @(negedge scanclk)
    begin
        if (c1_rising_edge_transfer_done)
        begin
            c_low_val[1] <= c_low_val_tmp[1];
        end
    end

    assign inclk_c2 = (c2_test_source == 0) ? fbclk : (c2_test_source == 1) ? refclk :(ic2_use_casc_in == 1) ? c1_clk : inclk_c2_from_vco;

    cda_scale_cntr c2 (.clk(inclk_c2),
                            .reset(areset || stop_vco),
                            .cout(c2_clk),
                            .high(c_high_val[2]),
                            .low(c_low_val[2]),
                            .initial_value(c_initial_val[2]),
                            .mode(c_mode_val[2]),
                            .ph_tap(c_ph_val[2]));

    always @(posedge scanclk)
    begin
        if (update_conf_latches_reg == 1'b1)
        begin
            c_high_val[2] <= c_high_val_tmp[2];
            c_mode_val[2] <= c_mode_val_tmp[2];
            c2_rising_edge_transfer_done = 1;
        end
    end
    always @(negedge scanclk)
    begin
        if (c2_rising_edge_transfer_done)
        begin
            c_low_val[2] <= c_low_val_tmp[2];
        end
    end

    assign inclk_c3 = (c3_test_source == 0) ? fbclk : (c3_test_source == 1) ? refclk : (ic3_use_casc_in == 1) ? c2_clk : inclk_c3_from_vco;
    
    cda_scale_cntr c3 (.clk(inclk_c3),
                            .reset(areset  || stop_vco),
                            .cout(c3_clk),
                            .high(c_high_val[3]),
                            .low(c_low_val[3]),
                            .initial_value(c_initial_val[3]),
                            .mode(c_mode_val[3]),
                            .ph_tap(c_ph_val[3]));

    always @(posedge scanclk)
    begin
        if (update_conf_latches_reg == 1'b1)
        begin
            c_high_val[3] <= c_high_val_tmp[3];
            c_mode_val[3] <= c_mode_val_tmp[3];
            c3_rising_edge_transfer_done = 1;
        end
    end
    always @(negedge scanclk)
    begin
        if (c3_rising_edge_transfer_done)
        begin
            c_low_val[3] <= c_low_val_tmp[3];
        end
    end

    assign inclk_c4 = ((c4_test_source == 0) ? fbclk : (c4_test_source == 1) ? refclk :  (ic4_use_casc_in == 1) ? c3_clk : inclk_c4_from_vco);
    cda_scale_cntr c4 (.clk(inclk_c4),
                            .reset(areset || stop_vco),
                            .cout(c4_clk),
                            .high(c_high_val[4]),
                            .low(c_low_val[4]),
                            .initial_value(c_initial_val[4]),
                            .mode(c_mode_val[4]),
                            .ph_tap(c_ph_val[4]));

    always @(posedge scanclk)
    begin
        if (update_conf_latches_reg == 1'b1)
        begin
            c_high_val[4] <= c_high_val_tmp[4];
            c_mode_val[4] <= c_mode_val_tmp[4];
            c4_rising_edge_transfer_done = 1;
        end
    end
    always @(negedge scanclk)
    begin
        if (c4_rising_edge_transfer_done)
        begin
            c_low_val[4] <= c_low_val_tmp[4];
        end
    end

    
assign locked = (test_bypass_lock_detect == "on") ? pfd_locked : locked_tmp;

// Register scanclk enable
    always @(negedge scanclk)
        scanclkena_reg <= scanclkena;
        
// Negative edge flip-flop in front of scan-chain

    always @(negedge scanclk)
    begin
        if (scanclkena_reg)
        begin
            scandata_in <= scandata;
        end
    end
   
// Scan chain
    always @(posedge scanclk)
    begin
        if (got_first_scanclk === 1'b0)
                got_first_scanclk = 1'b1;
        else
                scanclk_period = $time - scanclk_last_rising_edge;
        if (scanclkena_reg) 
        begin        
            for (j = scan_chain_length-2; j >= 0; j = j - 1)
                scan_data[j] = scan_data[j - 1];
            scan_data[-1] <= scandata_in;
        end
        scanclk_last_rising_edge = $realtime;
    end
    
// Scan output
    assign scandataout_tmp = scan_data[SCAN_CHAIN - 2];

// Negative edge flip-flop in rear of scan-chain

    always @(negedge scanclk)
    begin
        if (scanclkena_reg)
        begin
            scandata_out <= scandataout_tmp;
        end
    end
    
// Scan complete
    always @(negedge scandone_tmp)
    begin
            if (got_first_scanclk === 1'b1)
            begin
            if (reconfig_err == 1'b0)
            begin
                $display("NOTE : PLL Reprogramming completed with the following values (Values in parantheses are original values) : ");
                $display ("Time: %0t  Instance: %m", $time);

                $display("               N modulus =   %0d (%0d) ", n_val[0], n_val_old[0]);
                $display("               M modulus =   %0d (%0d) ", m_val[0], m_val_old[0]);
                

                for (i = 0; i < num_output_cntrs; i=i+1)
                begin
                    $display("              %s :    C%0d  high = %0d (%0d),       C%0d  low = %0d (%0d),       C%0d  mode = %s (%s)", clk_num[i],i, c_high_val[i], c_high_val_old[i], i, c_low_val_tmp[i], c_low_val_old[i], i, c_mode_val[i], c_mode_val_old[i]);
                end

                // display Charge pump and loop filter values
                if (pll_reconfig_display_full_setting == 1'b1)
                begin
                    $display ("               Charge Pump Current (uA) =   %0d (%0d) ", cp_curr_val, cp_curr_old);
                    $display ("               Loop Filter Capacitor (pF) =   %0d (%0d) ", lfc_val, lfc_old);
                    $display ("               Loop Filter Resistor (Kohm) =   %s (%s) ", lfr_val, lfr_old);
                    $display ("               VCO_Post_Scale  =   %0d (%0d) ", vco_cur, vco_old);
                end
                else
                begin
                    $display ("               Charge Pump Current  =   %0d (%0d) ", cp_curr_bit_setting, cp_curr_old_bit_setting);
                    $display ("               Loop Filter Capacitor  =   %0d (%0d) ", lfc_val_bit_setting, lfc_val_old_bit_setting);
                    $display ("               Loop Filter Resistor   =   %0d (%0d) ", lfr_val_bit_setting, lfr_val_old_bit_setting);
                    $display ("               VCO_Post_Scale   =   %b (%b) ", vco_val_bit_setting, vco_val_old_bit_setting);
                end
                cp_curr_old_bit_setting = cp_curr_bit_setting;
                lfc_val_old_bit_setting = lfc_val_bit_setting;
                lfr_val_old_bit_setting = lfr_val_bit_setting;
                vco_val_old_bit_setting = vco_val_bit_setting;
            end
            else begin
                $display("Warning : Errors were encountered during PLL reprogramming. Please refer to error/warning messages above.");
                $display ("Time: %0t  Instance: %m", $time);
            end
            end
    end

// ************ PLL Phase Reconfiguration ************* //

// Latch updown,counter values at pos edge of scan clock
always @(posedge scanclk)
begin
    if (phasestep_reg == 1'b1)
    begin
        if (phasestep_high_count == 1)
        begin
            phasecounterselect_reg <= phasecounterselect;
            phaseupdown_reg <= phaseupdown;
            // start reconfiguration
            if (phasecounterselect < 3'b111) // no counters selected
            begin
                if (phasecounterselect == 0) // all output counters selected
                begin
                    for (i = 0; i < num_output_cntrs; i = i + 1)
                        c_ph_val_tmp[i] = (phaseupdown == 1'b1) ? 
                                    (c_ph_val_tmp[i] + 1) % num_phase_taps :
                                    (c_ph_val_tmp[i] == 0) ? num_phase_taps - 1 : (c_ph_val_tmp[i] - 1) % num_phase_taps ;
                end
                else if (phasecounterselect == 1) // select M counter
                begin
                    m_ph_val_tmp = (phaseupdown == 1'b1) ? 
                                (m_ph_val + 1) % num_phase_taps :
                                (m_ph_val == 0) ? num_phase_taps - 1 : (m_ph_val - 1) % num_phase_taps ;
                end
                else // select C counters
                begin
                    select_counter = phasecounterselect - 2;
                    c_ph_val_tmp[select_counter] =  (phaseupdown == 1'b1) ? 
                                            (c_ph_val_tmp[select_counter] + 1) % num_phase_taps :
                                            (c_ph_val_tmp[select_counter] == 0) ? num_phase_taps - 1 : (c_ph_val_tmp[select_counter] - 1) % num_phase_taps ;
                end
                update_phase <= 1'b1;
            end 
           
        end
        phasestep_high_count = phasestep_high_count + 1;
       
    end
end

// Latch phase enable (same as phasestep) on neg edge of scan clock
always @(negedge scanclk)
begin
    phasestep_reg <= phasestep;
end

always @(posedge phasestep) 
begin
    if (update_phase == 1'b0) phasestep_high_count = 0; // phase adjustments must be 1 cycle apart
                                                        // if not, next phasestep cycle is skipped
end

// ************ PLL Full Reconfiguration ************* //
assign update_conf_latches = configupdate;


        // reset counter transfer flags
    always @(negedge scandone_tmp)
    begin
        c0_rising_edge_transfer_done = 0;
        c1_rising_edge_transfer_done = 0;
        c2_rising_edge_transfer_done = 0;
        c3_rising_edge_transfer_done = 0;
        c4_rising_edge_transfer_done = 0;
        update_conf_latches_reg <= 1'b0;
    end


    always @(posedge update_conf_latches)
    begin
        initiate_reconfig <= 1'b1;
    end
   
    always @(posedge areset)
    begin
        if (scandone_tmp == 1'b1) scandone_tmp = 1'b0;
    end
   
    always @(posedge scanclk)
    begin
        if (initiate_reconfig == 1'b1) 
        begin
            initiate_reconfig <= 1'b0;
            $display ("NOTE : PLL Reprogramming initiated ....");
            $display ("Time: %0t  Instance: %m", $time);

            scandone_tmp <= #(scanclk_period) 1'b1;
            update_conf_latches_reg <= update_conf_latches;

            error = 0;
            reconfig_err = 0;
            scanread_setup_violation = 0;

            // save old values
            cp_curr_old = cp_curr_val;
            lfc_old = lfc_val;
            lfr_old = lfr_val;
            vco_old = vco_cur;
            // save old values of bit settings
            cp_curr_bit_setting = scan_data[14:16];
            lfc_val_bit_setting = scan_data[1:2];
            lfr_val_bit_setting = scan_data[3:7];
            vco_val_bit_setting = scan_data[8];

            // LF unused : bit 1
            // LF Capacitance : bits 1,2 : all values are legal
            if ((l_pll_type == "fast") || (l_pll_type == "lvds") || (l_pll_type == "left_right"))
                lfc_val = fpll_loop_filter_c_arr[scan_data[1:2]];
            else
                lfc_val = loop_filter_c_arr[scan_data[1:2]];

            // LF Resistance : bits 3-7
            // valid values - 00000,00100,10000,10100,11000,11011,11100,11110
            if (((scan_data[3:7] == 5'b00000) || (scan_data[3:7] == 5'b00100)) || 
                ((scan_data[3:7] == 5'b10000) || (scan_data[3:7] == 5'b10100)) ||
                ((scan_data[3:7] == 5'b11000) || (scan_data[3:7] == 5'b11011)) ||
                ((scan_data[3:7] == 5'b11100) || (scan_data[3:7] == 5'b11110))
            )
            begin
                lfr_val =   (scan_data[3:7] == 5'b00000) ? "20" :
                            (scan_data[3:7] == 5'b00100) ? "16" :
                            (scan_data[3:7] == 5'b10000) ? "12" :
                            (scan_data[3:7] == 5'b10100) ? "8" :
                            (scan_data[3:7] == 5'b11000) ? "6" :
                            (scan_data[3:7] == 5'b11011) ? "4" : 
                            (scan_data[3:7] == 5'b11100) ? "2" : "1";
            end

            //VCO post scale value
            if (scan_data[8] === 1'b1)  // vco_post_scale = 1
            begin
                i_vco_max = i_vco_max_no_division/2;
                i_vco_min = i_vco_min_no_division/2;
                vco_cur = 1;
            end
            else
            begin
                i_vco_max = vco_max;
                i_vco_min = vco_min; 
                vco_cur = 2;
            end          

            // CP
            // Bit 8 : CRBYPASS
            // Bit 9-13 : unused
            // Bits 14-16 : all values are legal
            cp_curr_val = scan_data[14:16];

            // save old values for display info.
            for (i=0; i<=1; i=i+1)
            begin
                m_val_old[i] = m_val[i];
                n_val_old[i] = n_val[i];
                m_mode_val_old[i] = m_mode_val[i];
                n_mode_val_old[i] = n_mode_val[i];
            end
            for (i=0; i< num_output_cntrs; i=i+1)
            begin
                c_high_val_old[i] = c_high_val[i];
                c_low_val_old[i] = c_low_val[i];
                c_mode_val_old[i] = c_mode_val[i];
            end

            // M counter
            // 1. Mode - bypass (bit 17)
            if (scan_data[17] == 1'b1)
                n_mode_val[0] = "bypass";
            // 3. Mode - odd/even (bit 26)
            else if (scan_data[26] == 1'b1)
                n_mode_val[0] = "   odd";         
            else
                n_mode_val[0] = "  even";         
            // 2. High (bit 18-25)
                n_hi = scan_data[18:25];
            // 4. Low (bit 27-34)
                n_lo = scan_data[27:34]; 


            // N counter
            // 1. Mode - bypass (bit 35)
            if (scan_data[35] == 1'b1)
                m_mode_val[0] = "bypass";
            // 3. Mode - odd/even (bit 44)
            else if (scan_data[44] == 1'b1)
                m_mode_val[0] = "   odd";
            else
                m_mode_val[0] = "  even";
            
            // 2. High (bit 36-43)
                m_hi = scan_data[36:43];
            
            // 4. Low (bit 45-52)
                m_lo = scan_data[45:52]; 


            
//Update the current M and N counter values if the counters are NOT bypassed

if (m_mode_val[0] != "bypass")
m_val[0] = m_hi + m_lo;
if (n_mode_val[0] != "bypass")  
n_val[0] = n_hi + n_lo;
            


            // C counters (start bit 53) bit 1:mode(bypass),bit 2-9:high,bit 10:mode(odd/even),bit 11-18:low

            for (i = 0; i < num_output_cntrs; i = i + 1)
            begin
                // 1. Mode - bypass
                if (scan_data[53 + i*18 + 0] == 1'b1)
                        c_mode_val_tmp[i] = "bypass";
                // 3. Mode - odd/even
                else if (scan_data[53 + i*18 + 9] == 1'b1)
                    c_mode_val_tmp[i] = "   odd";
                else
                    c_mode_val_tmp[i] = "  even";
                    
                // 2. Hi
                for (j = 1; j <= 8; j = j + 1)
                    c_val[8-j] = scan_data[53 + i*18 + j];
                c_hval[i] = c_val[7:0];
                if (c_hval[i] !== 32'h00000000)
                    c_high_val_tmp[i] = c_hval[i];
                else
                    c_high_val_tmp[i] = 9'b100000000;
                // 4. Low 
                for (j = 10; j <= 17; j = j + 1)
                    c_val[17 - j] = scan_data[53 + i*18 + j]; 
                c_lval[i] = c_val[7:0];
                if (c_lval[i] !== 32'h00000000)
                    c_low_val_tmp[i] = c_lval[i];  
                else
                    c_low_val_tmp[i] = 9'b100000000; 
            end

            // Legality Checks
            
            if (m_mode_val[0] != "bypass")
            begin
            if ((m_hi !== m_lo) && (m_mode_val[0] != "   odd"))
            begin
                    reconfig_err = 1;
                    $display ("Warning : The M counter of the %s Fast PLL should be configured for 50%% duty cycle only. In this case the HIGH and LOW moduli programmed will result in a duty cycle other than 50%%, which is illegal. Reconfiguration may not work", family_name);
                    $display ("Time: %0t  Instance: %m", $time);
            end
            else if (m_hi !== 8'b00000000)
            begin
                    // counter value
                    m_val_tmp[0] = m_hi + m_lo;
            end
            else
                m_val_tmp[0] =  9'b100000000; 
            end
            else
                m_val_tmp[0] = 8'b00000001;
                
            if (n_mode_val[0] != "bypass")
            begin
            if ((n_hi !== n_lo) && (n_mode_val[0] != "   odd"))
            begin
                    reconfig_err = 1;
                    $display ("Warning : The N counter of the %s Fast PLL should be configured for 50%% duty cycle only. In this case the HIGH and LOW moduli programmed will result in a duty cycle other than 50%%, which is illegal. Reconfiguration may not work", family_name);
                    $display ("Time: %0t  Instance: %m", $time);
            end
            else if (n_hi !== 8'b00000000)
            begin
                    // counter value
                    n_val[0] = n_hi + n_lo;
            end
            else
                n_val[0] =  9'b100000000; 
            end
            else
                n_val[0] = 8'b00000001;
                           
                 

// TODO : Give warnings/errors in the following cases?
// 1. Illegal counter values (error)
// 2. Change of mode (warning)
// 3. Only 50% duty cycle allowed for M counter (odd mode - hi-lo=1,even - hi-lo=0)

        end
    end
    
    // Self reset on loss of lock
    assign reset_self = (l_self_reset_on_loss_lock == "on") ? ~pll_is_locked : 1'b0;

    always @(posedge reset_self)
    begin
        $display (" Note : %s PLL self reset due to loss of lock", family_name);
        $display ("Time: %0t  Instance: %m", $time);
    end
    
    // Phase shift on /o counters
    
    always @(schedule_vco or areset)
    begin
        sched_time = 0;
    
        for (i = 0; i <= 7; i=i+1)
            last_phase_shift[i] = phase_shift[i];
     
        cycle_to_adjust = 0;
        l_index = 1;
        m_times_vco_period = new_m_times_vco_period;
            
        // give appropriate messages
        // if areset was asserted
        if (areset === 1'b1 && areset_last_value !== areset)
        begin
            $display (" Note : %s PLL was reset", family_name);
            $display ("Time: %0t  Instance: %m", $time);
            // reset lock parameters
            pll_is_locked = 0;
            cycles_to_lock = 0;
            cycles_to_unlock = 0;
            tap0_is_active = 0;
            phase_adjust_was_scheduled = 0;
            for (x = 0; x <= 7; x=x+1)
                vco_tap[x] <= 1'b0;
        end
    
        // illegal value on areset
        if (areset === 1'bx && (areset_last_value === 1'b0 || areset_last_value === 1'b1))
        begin
            $display("Warning : Illegal value 'X' detected on ARESET input");
            $display ("Time: %0t  Instance: %m", $time);
        end
    
        if ((areset == 1'b1))
        begin
            pll_is_in_reset = 1;
            got_first_refclk = 0;
            got_second_refclk = 0;
        end
                            
        if ((schedule_vco !== schedule_vco_last_value) && (areset == 1'b1 || stop_vco == 1'b1))
        begin
   
            // drop VCO taps to 0
            for (i = 0; i <= 7; i=i+1)
            begin
                for (j = 0; j <= last_phase_shift[i] + 1; j=j+1)
                    vco_out[i] <= #(j) 1'b0;
                phase_shift[i] = 0;
                last_phase_shift[i] = 0;
            end
    
            // reset lock parameters
            pll_is_locked = 0;
            cycles_to_lock = 0;
            cycles_to_unlock = 0;
    
            got_first_refclk = 0;
            got_second_refclk = 0;
            refclk_time = 0;
            got_first_fbclk = 0;
            fbclk_time = 0;
            first_fbclk_time = 0;
            fbclk_period = 0;
    
            first_schedule = 1;
            vco_val = 0;
            vco_period_was_phase_adjusted = 0;
            phase_adjust_was_scheduled = 0;

            // reset all counter phase tap values to POF programmed values
            m_ph_val = m_ph_val_orig;
            for (i=0; i<= 5; i=i+1)
                c_ph_val[i] = c_ph_val_orig[i];
    
        end else if (areset === 1'b0 && stop_vco === 1'b0)
        begin
            // else note areset deassert time
            // note it as refclk_time to prevent false triggering
            // of stop_vco after areset
            if (areset === 1'b0 && areset_last_value === 1'b1 && pll_is_in_reset === 1'b1)
            begin
                refclk_time = $time;
                locked_tmp = 1'b0;
            end
            pll_is_in_reset = 0;
    
            // calculate loop_xplier : this will be different from m_val in ext. fbk mode
            loop_xplier = m_val[0];
            loop_initial = i_m_initial - 1;
            loop_ph = m_ph_val;
    
            // convert initial value to delay
            initial_delay = (loop_initial * m_times_vco_period)/loop_xplier;
    
            // convert loop ph_tap to delay
            rem = m_times_vco_period % loop_xplier;
            vco_per = m_times_vco_period/loop_xplier;
            if (rem != 0)
                vco_per = vco_per + 1;
            fbk_phase = (loop_ph * vco_per)/8;
    
            pull_back_M = initial_delay + fbk_phase;
    
            total_pull_back = pull_back_M;
            if (l_simulation_type == "timing")
                total_pull_back = total_pull_back + pll_compensation_delay;
    
            while (total_pull_back > refclk_period)
                total_pull_back = total_pull_back - refclk_period;
    
            if (total_pull_back > 0)
                offset = refclk_period - total_pull_back;
            else
                offset = 0;
    
            fbk_delay = total_pull_back - fbk_phase;
            if (fbk_delay < 0)
            begin
                offset = offset - fbk_phase;
                fbk_delay = total_pull_back;
            end
    
            // assign m_delay
            m_delay = fbk_delay;
    
            for (i = 1; i <= loop_xplier; i=i+1)
            begin
                // adjust cycles
                tmp_vco_per = m_times_vco_period/loop_xplier;
                if (rem != 0 && l_index <= rem)
                begin
                    tmp_rem = (loop_xplier * l_index) % rem;
                    cycle_to_adjust = (loop_xplier * l_index) / rem;
                    if (tmp_rem != 0)
                        cycle_to_adjust = cycle_to_adjust + 1;
                end
                if (cycle_to_adjust == i)
                begin
                    tmp_vco_per = tmp_vco_per + 1;
                    l_index = l_index + 1;
                end
    
                // calculate high and low periods
                high_time = tmp_vco_per/2;
                if (tmp_vco_per % 2 != 0)
                    high_time = high_time + 1;
                low_time = tmp_vco_per - high_time;
    
                // schedule the rising and falling egdes
                for (j=0; j<=1; j=j+1)
                begin
                    vco_val = ~vco_val;
                    if (vco_val == 1'b0)
                        sched_time = sched_time + high_time;
                    else
                        sched_time = sched_time + low_time;
    
                    // schedule taps with appropriate phase shifts
                    for (k = 0; k <= 7; k=k+1)
                    begin
                        phase_shift[k] = (k*tmp_vco_per)/8;
                        if (first_schedule)
                            vco_out[k] <= #(sched_time + phase_shift[k]) vco_val;
                        else
                            vco_out[k] <= #(sched_time + last_phase_shift[k]) vco_val;
                    end
                end
            end
            if (first_schedule)
            begin
                vco_val = ~vco_val;
                if (vco_val == 1'b0)
                    sched_time = sched_time + high_time;
                else
                    sched_time = sched_time + low_time;
                for (k = 0; k <= 7; k=k+1)
                begin
                    phase_shift[k] = (k*tmp_vco_per)/8;
                    vco_out[k] <= #(sched_time+phase_shift[k]) vco_val;
                end
                first_schedule = 0;
            end

            schedule_vco <= #(sched_time) ~schedule_vco;
            if (vco_period_was_phase_adjusted)
            begin
                m_times_vco_period = refclk_period;
                new_m_times_vco_period = refclk_period;
                vco_period_was_phase_adjusted = 0;
                phase_adjust_was_scheduled = 1;
    
                tmp_vco_per = m_times_vco_period/loop_xplier;
                for (k = 0; k <= 7; k=k+1)
                    phase_shift[k] = (k*tmp_vco_per)/8;
            end
        end
    
        areset_last_value = areset;
        schedule_vco_last_value = schedule_vco;
    
    end

    assign pfdena_wire = (pfdena === 1'b0) ? 1'b0 : 1'b1; 
    // PFD enable
    always @(pfdena_wire)
    begin
        if (pfdena_wire === 1'b0)
        begin
            if (pll_is_locked)
                locked_tmp = 1'bx;
            pll_is_locked = 0;
            cycles_to_lock = 0;
            $display (" Note : PFDENA was deasserted");
            $display ("Time: %0t  Instance: %m", $time);
        end
        else if (pfdena_wire === 1'b1 && pfdena_last_value === 1'b0)
        begin
            // PFD was disabled, now enabled again
            got_first_refclk = 0;
            got_second_refclk = 0;
            refclk_time = $time;
        end
        pfdena_last_value = pfdena_wire;
    end

    always @(negedge refclk or negedge fbclk)
    begin
        refclk_last_value = refclk;
        fbclk_last_value = fbclk;
    end

    // Bypass lock detect
        
    always @(posedge refclk)
    begin
    if (test_bypass_lock_detect == "on")
        begin
            if (pfdena_wire === 1'b1)
            begin
                    cycles_pfd_low = 0;
                    if (pfd_locked == 1'b0)
                    begin
                    if (cycles_pfd_high == lock_high)
                    begin
                        $display ("Note : %s PLL locked in test mode on PFD enable assert", family_name);
                        $display ("Time: %0t  Instance: %m", $time);
                        pfd_locked <= 1'b1;
                    end
                    cycles_pfd_high = cycles_pfd_high + 1;
                        end
                end
            if (pfdena_wire === 1'b0)
            begin
                    cycles_pfd_high = 0;
                    if (pfd_locked == 1'b1)
                    begin
                    if (cycles_pfd_low == lock_low)
                    begin
                        $display ("Note : %s PLL lost lock in test mode on PFD enable deassert", family_name);
                        $display ("Time: %0t  Instance: %m", $time);
                        pfd_locked <= 1'b0;
                    end
                    cycles_pfd_low = cycles_pfd_low + 1;
                        end
                end
        end
    end
    
    always @(posedge scandone_tmp or posedge locked_tmp)
    begin
        if(scandone_tmp == 1)
            pll_has_just_been_reconfigured <= 1;
        else
            pll_has_just_been_reconfigured <= 0;
    end
    
    // VCO Frequency Range check
    always @(posedge refclk or posedge fbclk)
    begin
        if (refclk == 1'b1 && refclk_last_value !== refclk && areset === 1'b0)
        begin
            if (! got_first_refclk)
            begin
                got_first_refclk = 1;
            end else
            begin
                got_second_refclk = 1;
                refclk_period = $time - refclk_time;

                // check if incoming freq. will cause VCO range to be
                // exceeded
                if ((i_vco_max != 0 && i_vco_min != 0) && (pfdena_wire === 1'b1) &&        
                    ((refclk_period/loop_xplier > i_vco_max) || 
                    (refclk_period/loop_xplier < i_vco_min)) ) 
                begin
                    if (pll_is_locked == 1'b1)
                    begin
                        if (refclk_period/loop_xplier > i_vco_max)
                        begin
                            $display ("Warning : Input clock freq. is over VCO range. %s PLL may lose lock", family_name);
                            vco_over = 1'b1;
                        end
                        if (refclk_period/loop_xplier < i_vco_min)
                        begin
                            $display ("Warning : Input clock freq. is under VCO range. %s PLL may lose lock", family_name);
                            vco_under = 1'b1;
                        end

                        $display ("Time: %0t  Instance: %m", $time);
                        if (inclk_out_of_range === 1'b1)
                        begin
                            // unlock
                            pll_is_locked = 0;
                            locked_tmp = 0;
                            cycles_to_lock = 0;
                            $display ("Note : %s PLL lost lock", family_name);
                            $display ("Time: %0t  Instance: %m", $time);
                            vco_period_was_phase_adjusted = 0;
                            phase_adjust_was_scheduled = 0;
                        end
                    end
                    else begin
                        if (no_warn == 1'b0)
                        begin
                            if (refclk_period/loop_xplier > i_vco_max)
                            begin
                                $display ("Warning : Input clock freq. is over VCO range. %s PLL may lose lock", family_name);
                                vco_over = 1'b1;
                            end
                            if (refclk_period/loop_xplier < i_vco_min)
                            begin
                                $display ("Warning : Input clock freq. is under VCO range. %s PLL may lose lock", family_name);
                                vco_under = 1'b1;
                            end
                            $display ("Time: %0t  Instance: %m", $time);
                            no_warn = 1'b1;
                        end
                    end
                    inclk_out_of_range = 1;
                end
                else begin
                    vco_over  = 1'b0;
                    vco_under = 1'b0;
                    inclk_out_of_range = 0;
                    no_warn = 1'b0;
                end

            end
            if (stop_vco == 1'b1)
            begin
                stop_vco = 0;
                schedule_vco = ~schedule_vco;
            end
            refclk_time = $time;
        end

        // Update M counter value on feedback clock edge
        
        if (fbclk == 1'b1 && fbclk_last_value !== fbclk)
        begin
            if (update_conf_latches === 1'b1)
            begin
                m_val[0] <= m_val_tmp[0];
                m_val[1] <= m_val_tmp[1];
            end
            if (!got_first_fbclk)
            begin
                got_first_fbclk = 1;
                first_fbclk_time = $time;
            end
            else
                fbclk_period = $time - fbclk_time;

            // need refclk_period here, so initialized to proper value above
            if ( ( ($time - refclk_time > 1.5 * refclk_period) && pfdena_wire === 1'b1 && pll_is_locked === 1'b1) ||
                ( ($time - refclk_time > 5 * refclk_period) && (pfdena_wire === 1'b1) && (pll_has_just_been_reconfigured == 0) ) ||
                ( ($time - refclk_time > 50 * refclk_period) && (pfdena_wire === 1'b1) && (pll_has_just_been_reconfigured == 1) ) )
            begin
                stop_vco = 1;
                // reset
                got_first_refclk = 0;
                got_first_fbclk = 0;
                got_second_refclk = 0;
                if (pll_is_locked == 1'b1)
                begin
                    pll_is_locked = 0;
                    locked_tmp = 0;
                    $display ("Note : %s PLL lost lock due to loss of input clock or the input clock is not detected within the allowed time frame.", family_name);
                    if ((i_vco_max == 0) && (i_vco_min == 0))
                        $display ("Note : Please run timing simulation to check whether the input clock is operating within the supported VCO range or not.");
                    $display ("Time: %0t  Instance: %m", $time);
                end
                cycles_to_lock = 0;
                cycles_to_unlock = 0;
                first_schedule = 1;
                vco_period_was_phase_adjusted = 0;
                phase_adjust_was_scheduled = 0;
                tap0_is_active = 0;
                for (x = 0; x <= 7; x=x+1)
                    vco_tap[x] <= 1'b0;
            end
            fbclk_time = $time;
        end
        
                
        // Core lock functionality
        
        if (got_second_refclk && pfdena_wire === 1'b1 && (!inclk_out_of_range))
        begin
            // now we know actual incoming period
            if (abs(fbclk_time - refclk_time) <= lock_window || (got_first_fbclk && abs(refclk_period - abs(fbclk_time - refclk_time)) <= lock_window))
            begin
                // considered in phase
                if (cycles_to_lock == real_lock_high)
                begin
                    if (pll_is_locked === 1'b0)
                    begin
                        $display (" Note : %s PLL locked to incoming clock", family_name);
                        $display ("Time: %0t  Instance: %m", $time);
                    end
                    pll_is_locked = 1;
                    locked_tmp = 1;
                    cycles_to_unlock = 0;
                end
                // increment lock counter only if the second part of the above
                // time check is not true
                if (!(abs(refclk_period - abs(fbclk_time - refclk_time)) <= lock_window))
                begin
                    cycles_to_lock = cycles_to_lock + 1;
                end

                // adjust m_times_vco_period
                new_m_times_vco_period = refclk_period;

            end else
            begin
                // if locked, begin unlock
                if (pll_is_locked)
                begin
                    cycles_to_unlock = cycles_to_unlock + 1;
                    if (cycles_to_unlock == lock_low)
                    begin
                        pll_is_locked = 0;
                        locked_tmp = 0;
                        cycles_to_lock = 0;
                        $display ("Note : %s PLL lost lock", family_name);
                        $display ("Time: %0t  Instance: %m", $time);
                        vco_period_was_phase_adjusted = 0;
                        phase_adjust_was_scheduled = 0;
                        got_first_refclk = 0;
                        got_first_fbclk = 0;
                        got_second_refclk = 0;
                    end
                end
                if (abs(refclk_period - fbclk_period) <= 2)
                begin
                    // frequency is still good
                    if ($time == fbclk_time && (!phase_adjust_was_scheduled))
                    begin
                        if (abs(fbclk_time - refclk_time) > refclk_period/2)
                        begin
                            new_m_times_vco_period = abs(m_times_vco_period + (refclk_period - abs(fbclk_time - refclk_time)));
                            vco_period_was_phase_adjusted = 1;
                        end else
                        begin
                            new_m_times_vco_period = abs(m_times_vco_period - abs(fbclk_time - refclk_time));
                            vco_period_was_phase_adjusted = 1;
                        end
                    end
                end else
                begin
                    new_m_times_vco_period = refclk_period;
                    phase_adjust_was_scheduled = 0;
                end
            end
        end

        if (reconfig_err == 1'b1)
        begin
            locked_tmp = 0;
        end

        refclk_last_value = refclk;
        fbclk_last_value = fbclk;
    end

    assign clk_tmp[0] = i_clk0_counter == "c0" ? c0_clk : i_clk0_counter == "c1" ? c1_clk : i_clk0_counter == "c2" ? c2_clk : i_clk0_counter == "c3" ? c3_clk : i_clk0_counter == "c4" ? c4_clk : 1'b0;
    assign clk_tmp[1] = i_clk1_counter == "c0" ? c0_clk : i_clk1_counter == "c1" ? c1_clk : i_clk1_counter == "c2" ? c2_clk : i_clk1_counter == "c3" ? c3_clk : i_clk1_counter == "c4" ? c4_clk : 1'b0;
    assign clk_tmp[2] = i_clk2_counter == "c0" ? c0_clk : i_clk2_counter == "c1" ? c1_clk : i_clk2_counter == "c2" ? c2_clk : i_clk2_counter == "c3" ? c3_clk : i_clk2_counter == "c4" ? c4_clk : 1'b0;
    assign clk_tmp[3] = i_clk3_counter == "c0" ? c0_clk : i_clk3_counter == "c1" ? c1_clk : i_clk3_counter == "c2" ? c2_clk : i_clk3_counter == "c3" ? c3_clk : i_clk3_counter == "c4" ? c4_clk : 1'b0;
    assign clk_tmp[4] = i_clk4_counter == "c0" ? c0_clk : i_clk4_counter == "c1" ? c1_clk : i_clk4_counter == "c2" ? c2_clk : i_clk4_counter == "c3" ? c3_clk : i_clk4_counter == "c4" ? c4_clk : 1'b0;

assign clk_out_pfd[0] = (pfd_locked == 1'b1) ? clk_tmp[0] : 1'bx;
assign clk_out_pfd[1] = (pfd_locked == 1'b1) ? clk_tmp[1] : 1'bx;
assign clk_out_pfd[2] = (pfd_locked == 1'b1) ? clk_tmp[2] : 1'bx;
assign clk_out_pfd[3] = (pfd_locked == 1'b1) ? clk_tmp[3] : 1'bx;
assign clk_out_pfd[4] = (pfd_locked == 1'b1) ? clk_tmp[4] : 1'bx;

    assign clk_out[0] = (test_bypass_lock_detect == "on") ? clk_out_pfd[0] : ((areset === 1'b1 || pll_in_test_mode === 1'b1) || (locked == 1'b1 && !reconfig_err) ? clk_tmp[0] : 1'bx);
    assign clk_out[1] = (test_bypass_lock_detect == "on") ? clk_out_pfd[1] : ((areset === 1'b1 || pll_in_test_mode === 1'b1) || (locked == 1'b1 && !reconfig_err) ? clk_tmp[1] : 1'bx);
    assign clk_out[2] = (test_bypass_lock_detect == "on") ? clk_out_pfd[2] : ((areset === 1'b1 || pll_in_test_mode === 1'b1) || (locked == 1'b1 && !reconfig_err) ? clk_tmp[2] : 1'bx);
    assign clk_out[3] = (test_bypass_lock_detect == "on") ? clk_out_pfd[3] : ((areset === 1'b1 || pll_in_test_mode === 1'b1) || (locked == 1'b1 && !reconfig_err) ? clk_tmp[3] : 1'bx);
    assign clk_out[4] = (test_bypass_lock_detect == "on") ? clk_out_pfd[4] : ((areset === 1'b1 || pll_in_test_mode === 1'b1) || (locked == 1'b1 && !reconfig_err) ? clk_tmp[4] : 1'bx);

    // ACCELERATE OUTPUTS
    and (clk[0], 1'b1, clk_out[0]);
    and (clk[1], 1'b1, clk_out[1]);
    and (clk[2], 1'b1, clk_out[2]);
    and (clk[3], 1'b1, clk_out[3]);
    and (clk[4], 1'b1, clk_out[4]);

    and (scandataout, 1'b1, scandata_out);
    and (scandone, 1'b1, scandone_tmp);

assign fbout = fbclk;
assign vcooverrange  = (vco_range_detector_high_bits == -1) ? 1'bz : vco_over;
assign vcounderrange = (vco_range_detector_low_bits == -1) ? 1'bz :vco_under;
assign phasedone = ~update_phase;

endmodule // MF_cycloneiii_pll

///////////////////////////////////////////////////////////////////////////////
//
// Module Name : cda_m_cntr
//
// Description : Simulation model for the M counter. This is the
//               loop feedback counter for the Cyclone III PLL.
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps
module cda_m_cntr   ( clk,
                            reset,
                            cout,
                            initial_value,
                            modulus,
                            time_delay);

    // INPUT PORTS
    input clk;
    input reset;
    input [31:0] initial_value;
    input [31:0] modulus;
    input [31:0] time_delay;

    // OUTPUT PORTS
    output cout;

    // INTERNAL VARIABLES AND NETS
    integer count;
    reg tmp_cout;
    reg first_rising_edge;
    reg clk_last_value;
    reg cout_tmp;

    initial
    begin
        count = 1;
        first_rising_edge = 1;
        clk_last_value = 0;
    end

    always @(reset or clk)
    begin
        if (reset)
        begin
            count = 1;
            tmp_cout = 0;
            first_rising_edge = 1;
            cout_tmp <= tmp_cout;
        end
        else begin
            if (clk_last_value !== clk)
            begin
                if (clk === 1'b1 && first_rising_edge)
            begin
                first_rising_edge = 0;
                tmp_cout = clk;
                cout_tmp <= #(time_delay) tmp_cout;
            end
            else if (first_rising_edge == 0)
            begin
                if (count < modulus)
                    count = count + 1;
                else
                begin
                    count = 1;
                    tmp_cout = ~tmp_cout;
                    cout_tmp <= #(time_delay) tmp_cout;
                end
            end
        end
        end
        clk_last_value = clk;

//        cout_tmp <= #(time_delay) tmp_cout;
    end

    and (cout, cout_tmp, 1'b1);

endmodule // cda_m_cntr

///////////////////////////////////////////////////////////////////////////////
//
// Module Name : cda_scale_cntr
//
// Description : Simulation model for the output scale-down counters.
//               This is a common model for the C0-C9
//               output counters of the Cyclone III PLL.
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps
module cda_scale_cntr   ( clk,
                                reset,
                                cout,
                                high,
                                low,
                                initial_value,
                                mode,
                                ph_tap);

    // INPUT PORTS
    input clk;
    input reset;
    input [31:0] high;
    input [31:0] low;
    input [31:0] initial_value;
    input [8*6:1] mode;
    input [31:0] ph_tap;

    // OUTPUT PORTS
    output cout;

    // INTERNAL VARIABLES AND NETS
    reg tmp_cout;
    reg first_rising_edge;
    reg clk_last_value;
    reg init;
    integer count;
    integer output_shift_count;
    reg cout_tmp;

    initial
    begin
        count = 1;
        first_rising_edge = 0;
        tmp_cout = 0;
        output_shift_count = 1;
    end

    always @(clk or reset)
    begin
        if (init !== 1'b1)
        begin
            clk_last_value = 0;
            init = 1'b1;
        end
        if (reset)
        begin
            count = 1;
            output_shift_count = 1;
            tmp_cout = 0;
            first_rising_edge = 0;
        end
        else if (clk_last_value !== clk)
        begin
            if (mode == "   off")
                tmp_cout = 0;
            else if (mode == "bypass")
            begin
                tmp_cout = clk;
                first_rising_edge = 1;
            end
            else if (first_rising_edge == 0)
            begin
                if (clk == 1)
                begin
                    if (output_shift_count == initial_value)
                    begin
                        tmp_cout = clk;
                        first_rising_edge = 1;
                    end
                    else
                        output_shift_count = output_shift_count + 1;
                end
            end
            else if (output_shift_count < initial_value)
            begin
                if (clk == 1)
                    output_shift_count = output_shift_count + 1;
            end
            else
            begin
                count = count + 1;
                if (mode == "  even" && (count == (high*2) + 1))
                    tmp_cout = 0;
                else if (mode == "   odd" && (count == (high*2)))
                    tmp_cout = 0;
                else if (count == (high + low)*2 + 1)
                begin
                    tmp_cout = 1;
                    count = 1;        // reset count
                end
            end
        end
        clk_last_value = clk;
        cout_tmp <= tmp_cout;
    end

    and (cout, cout_tmp, 1'b1);

endmodule // cda_scale_cntr

///////////////////////////////////////////////////////////////////////////////
//
// Module Name : cda_n_cntr
//
// Description : Simulation model for the N counter. This is the
//               input clock divide counter for the Cyclone III PLL.
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps
module cda_n_cntr   ( clk,
                            reset,
                            cout,
                            modulus);

    // INPUT PORTS
    input clk;
    input reset;
    input [31:0] modulus;

    // OUTPUT PORTS
    output cout;

    // INTERNAL VARIABLES AND NETS
    integer count;
    reg tmp_cout;
    reg first_rising_edge;
    reg clk_last_value;
    reg cout_tmp;

    initial
    begin
        count = 1;
        first_rising_edge = 1;
        clk_last_value = 0;
    end

    always @(reset or clk)
    begin
        if (reset)
        begin
            count = 1;
            tmp_cout = 0;
            first_rising_edge = 1;
        end
        else begin
            if (clk == 1 && clk_last_value !== clk && first_rising_edge)
            begin
                first_rising_edge = 0;
                tmp_cout = clk;
            end
            else if (first_rising_edge == 0)
            begin
                if (count < modulus)
                    count = count + 1;
                else
                begin
                    count = 1;
                    tmp_cout = ~tmp_cout;
                end
            end
        end
        clk_last_value = clk;

    end

    assign cout = tmp_cout;

endmodule // cda_n_cntr

//START_MODULE_NAME------------------------------------------------------------
//
// Module Name     :  ALTERA_DEVICE_FAMILIES
//
// Description     :  Common Altera device families comparison
//
// Limitation      :
//
// Results expected:
//
//END_MODULE_NAME--------------------------------------------------------------

// BEGINNING OF MODULE
`timescale 1 ps / 1 ps

// MODULE DECLARATION
module ALTERA_DEVICE_FAMILIES_2;

function IS_FAMILY_ARRIA10;
    input[8*20:1] device;
    reg is_arria10;
begin
    if ((device == "Arria 10") || (device == "ARRIA 10") || (device == "arria 10") || (device == "Arria10") || (device == "ARRIA10") || (device == "arria10") || (device == "Arria VI") || (device == "ARRIA VI") || (device == "arria vi") || (device == "ArriaVI") || (device == "ARRIAVI") || (device == "arriavi") || (device == "Night Fury") || (device == "NIGHT FURY") || (device == "night fury") || (device == "nightfury") || (device == "NIGHTFURY") || (device == "Arria 10 (GX/SX/GT)") || (device == "ARRIA 10 (GX/SX/GT)") || (device == "arria 10 (gx/sx/gt)") || (device == "Arria10(GX/SX/GT)") || (device == "ARRIA10(GX/SX/GT)") || (device == "arria10(gx/sx/gt)") || (device == "Arria 10 (GX)") || (device == "ARRIA 10 (GX)") || (device == "arria 10 (gx)") || (device == "Arria10(GX)") || (device == "ARRIA10(GX)") || (device == "arria10(gx)") || (device == "Arria 10 (SX)") || (device == "ARRIA 10 (SX)") || (device == "arria 10 (sx)") || (device == "Arria10(SX)") || (device == "ARRIA10(SX)") || (device == "arria10(sx)") || (device == "Arria 10 (GT)") || (device == "ARRIA 10 (GT)") || (device == "arria 10 (gt)") || (device == "Arria10(GT)") || (device == "ARRIA10(GT)") || (device == "arria10(gt)"))
        is_arria10 = 1;
    else
        is_arria10 = 0;

    IS_FAMILY_ARRIA10  = is_arria10;
end
endfunction //IS_FAMILY_ARRIA10

function IS_FAMILY_ARRIAGX;
    input[8*20:1] device;
    reg is_arriagx;
begin
    if ((device == "Arria GX") || (device == "ARRIA GX") || (device == "arria gx") || (device == "ArriaGX") || (device == "ARRIAGX") || (device == "arriagx") || (device == "Stratix II GX Lite") || (device == "STRATIX II GX LITE") || (device == "stratix ii gx lite") || (device == "StratixIIGXLite") || (device == "STRATIXIIGXLITE") || (device == "stratixiigxlite"))
        is_arriagx = 1;
    else
        is_arriagx = 0;

    IS_FAMILY_ARRIAGX  = is_arriagx;
end
endfunction //IS_FAMILY_ARRIAGX

function IS_FAMILY_ARRIAIIGX;
    input[8*20:1] device;
    reg is_arriaiigx;
begin
    if ((device == "Arria II GX") || (device == "ARRIA II GX") || (device == "arria ii gx") || (device == "ArriaIIGX") || (device == "ARRIAIIGX") || (device == "arriaiigx") || (device == "Arria IIGX") || (device == "ARRIA IIGX") || (device == "arria iigx") || (device == "ArriaII GX") || (device == "ARRIAII GX") || (device == "arriaii gx") || (device == "Arria II") || (device == "ARRIA II") || (device == "arria ii") || (device == "ArriaII") || (device == "ARRIAII") || (device == "arriaii") || (device == "Arria II (GX/E)") || (device == "ARRIA II (GX/E)") || (device == "arria ii (gx/e)") || (device == "ArriaII(GX/E)") || (device == "ARRIAII(GX/E)") || (device == "arriaii(gx/e)") || (device == "PIRANHA") || (device == "piranha"))
        is_arriaiigx = 1;
    else
        is_arriaiigx = 0;

    IS_FAMILY_ARRIAIIGX  = is_arriaiigx;
end
endfunction //IS_FAMILY_ARRIAIIGX

function IS_FAMILY_ARRIAIIGZ;
    input[8*20:1] device;
    reg is_arriaiigz;
begin
    if ((device == "Arria II GZ") || (device == "ARRIA II GZ") || (device == "arria ii gz") || (device == "ArriaII GZ") || (device == "ARRIAII GZ") || (device == "arriaii gz") || (device == "Arria IIGZ") || (device == "ARRIA IIGZ") || (device == "arria iigz") || (device == "ArriaIIGZ") || (device == "ARRIAIIGZ") || (device == "arriaiigz"))
        is_arriaiigz = 1;
    else
        is_arriaiigz = 0;

    IS_FAMILY_ARRIAIIGZ  = is_arriaiigz;
end
endfunction //IS_FAMILY_ARRIAIIGZ

function IS_FAMILY_ARRIAVGZ;
    input[8*20:1] device;
    reg is_arriavgz;
begin
    if ((device == "Arria V GZ") || (device == "ARRIA V GZ") || (device == "arria v gz") || (device == "ArriaVGZ") || (device == "ARRIAVGZ") || (device == "arriavgz"))
        is_arriavgz = 1;
    else
        is_arriavgz = 0;

    IS_FAMILY_ARRIAVGZ  = is_arriavgz;
end
endfunction //IS_FAMILY_ARRIAVGZ

function IS_FAMILY_ARRIAV;
    input[8*20:1] device;
    reg is_arriav;
begin
    if ((device == "Arria V") || (device == "ARRIA V") || (device == "arria v") || (device == "Arria V (GT/GX)") || (device == "ARRIA V (GT/GX)") || (device == "arria v (gt/gx)") || (device == "ArriaV(GT/GX)") || (device == "ARRIAV(GT/GX)") || (device == "arriav(gt/gx)") || (device == "ArriaV") || (device == "ARRIAV") || (device == "arriav") || (device == "Arria V (GT/GX/ST/SX)") || (device == "ARRIA V (GT/GX/ST/SX)") || (device == "arria v (gt/gx/st/sx)") || (device == "ArriaV(GT/GX/ST/SX)") || (device == "ARRIAV(GT/GX/ST/SX)") || (device == "arriav(gt/gx/st/sx)") || (device == "Arria V (GT)") || (device == "ARRIA V (GT)") || (device == "arria v (gt)") || (device == "ArriaV(GT)") || (device == "ARRIAV(GT)") || (device == "arriav(gt)") || (device == "Arria V (GX)") || (device == "ARRIA V (GX)") || (device == "arria v (gx)") || (device == "ArriaV(GX)") || (device == "ARRIAV(GX)") || (device == "arriav(gx)") || (device == "Arria V (ST)") || (device == "ARRIA V (ST)") || (device == "arria v (st)") || (device == "ArriaV(ST)") || (device == "ARRIAV(ST)") || (device == "arriav(st)") || (device == "Arria V (SX)") || (device == "ARRIA V (SX)") || (device == "arria v (sx)") || (device == "ArriaV(SX)") || (device == "ARRIAV(SX)") || (device == "arriav(sx)"))
        is_arriav = 1;
    else
        is_arriav = 0;

    IS_FAMILY_ARRIAV  = is_arriav;
end
endfunction //IS_FAMILY_ARRIAV

function IS_FAMILY_CYCLONE10LP;
    input[8*20:1] device;
    reg is_cyclone10lp;
begin
    if ((device == "Cyclone 10 LP") || (device == "CYCLONE 10 LP") || (device == "cyclone 10 lp") || (device == "cyclone10lp") || (device == "CYCLONE10LP") || (device == "Cyclone10lp") || (device == "CYCLONE10LP") || (device == "cyclone10lp") || (device == "C10LP") || (device == "c10lp") || (device == "Cyclone10LP") || (device == "CYCLONE10LP") || (device == "cyclone10lp"))
        is_cyclone10lp = 1;
    else
        is_cyclone10lp = 0;

    IS_FAMILY_CYCLONE10LP  = is_cyclone10lp;
end
endfunction //IS_FAMILY_CYCLONE10LP

function IS_FAMILY_CYCLONEII;
    input[8*20:1] device;
    reg is_cycloneii;
begin
    if ((device == "Cyclone II") || (device == "CYCLONE II") || (device == "cyclone ii") || (device == "Cycloneii") || (device == "CYCLONEII") || (device == "cycloneii") || (device == "Magellan") || (device == "MAGELLAN") || (device == "magellan") || (device == "CycloneII") || (device == "CYCLONEII") || (device == "cycloneii"))
        is_cycloneii = 1;
    else
        is_cycloneii = 0;

    IS_FAMILY_CYCLONEII  = is_cycloneii;
end
endfunction //IS_FAMILY_CYCLONEII

function IS_FAMILY_CYCLONEIIILS;
    input[8*20:1] device;
    reg is_cycloneiiils;
begin
    if ((device == "Cyclone III LS") || (device == "CYCLONE III LS") || (device == "cyclone iii ls") || (device == "CycloneIIILS") || (device == "CYCLONEIIILS") || (device == "cycloneiiils") || (device == "Cyclone III LPS") || (device == "CYCLONE III LPS") || (device == "cyclone iii lps") || (device == "Cyclone LPS") || (device == "CYCLONE LPS") || (device == "cyclone lps") || (device == "CycloneLPS") || (device == "CYCLONELPS") || (device == "cyclonelps") || (device == "Tarpon") || (device == "TARPON") || (device == "tarpon") || (device == "Cyclone IIIE") || (device == "CYCLONE IIIE") || (device == "cyclone iiie"))
        is_cycloneiiils = 1;
    else
        is_cycloneiiils = 0;

    IS_FAMILY_CYCLONEIIILS  = is_cycloneiiils;
end
endfunction //IS_FAMILY_CYCLONEIIILS

function IS_FAMILY_CYCLONEIII;
    input[8*20:1] device;
    reg is_cycloneiii;
begin
    if ((device == "Cyclone III") || (device == "CYCLONE III") || (device == "cyclone iii") || (device == "CycloneIII") || (device == "CYCLONEIII") || (device == "cycloneiii") || (device == "Barracuda") || (device == "BARRACUDA") || (device == "barracuda") || (device == "Cuda") || (device == "CUDA") || (device == "cuda") || (device == "CIII") || (device == "ciii"))
        is_cycloneiii = 1;
    else
        is_cycloneiii = 0;

    IS_FAMILY_CYCLONEIII  = is_cycloneiii;
end
endfunction //IS_FAMILY_CYCLONEIII

function IS_FAMILY_CYCLONEIVE;
    input[8*20:1] device;
    reg is_cycloneive;
begin
    if ((device == "Cyclone IV E") || (device == "CYCLONE IV E") || (device == "cyclone iv e") || (device == "CycloneIV E") || (device == "CYCLONEIV E") || (device == "cycloneiv e") || (device == "Cyclone IVE") || (device == "CYCLONE IVE") || (device == "cyclone ive") || (device == "CycloneIVE") || (device == "CYCLONEIVE") || (device == "cycloneive"))
        is_cycloneive = 1;
    else
        is_cycloneive = 0;

    IS_FAMILY_CYCLONEIVE  = is_cycloneive;
end
endfunction //IS_FAMILY_CYCLONEIVE

function IS_FAMILY_CYCLONEIVGX;
    input[8*20:1] device;
    reg is_cycloneivgx;
begin
    if ((device == "Cyclone IV GX") || (device == "CYCLONE IV GX") || (device == "cyclone iv gx") || (device == "Cyclone IVGX") || (device == "CYCLONE IVGX") || (device == "cyclone ivgx") || (device == "CycloneIV GX") || (device == "CYCLONEIV GX") || (device == "cycloneiv gx") || (device == "CycloneIVGX") || (device == "CYCLONEIVGX") || (device == "cycloneivgx") || (device == "Cyclone IV") || (device == "CYCLONE IV") || (device == "cyclone iv") || (device == "CycloneIV") || (device == "CYCLONEIV") || (device == "cycloneiv") || (device == "Cyclone IV (GX)") || (device == "CYCLONE IV (GX)") || (device == "cyclone iv (gx)") || (device == "CycloneIV(GX)") || (device == "CYCLONEIV(GX)") || (device == "cycloneiv(gx)") || (device == "Cyclone III GX") || (device == "CYCLONE III GX") || (device == "cyclone iii gx") || (device == "CycloneIII GX") || (device == "CYCLONEIII GX") || (device == "cycloneiii gx") || (device == "Cyclone IIIGX") || (device == "CYCLONE IIIGX") || (device == "cyclone iiigx") || (device == "CycloneIIIGX") || (device == "CYCLONEIIIGX") || (device == "cycloneiiigx") || (device == "Cyclone III GL") || (device == "CYCLONE III GL") || (device == "cyclone iii gl") || (device == "CycloneIII GL") || (device == "CYCLONEIII GL") || (device == "cycloneiii gl") || (device == "Cyclone IIIGL") || (device == "CYCLONE IIIGL") || (device == "cyclone iiigl") || (device == "CycloneIIIGL") || (device == "CYCLONEIIIGL") || (device == "cycloneiiigl") || (device == "Stingray") || (device == "STINGRAY") || (device == "stingray"))
        is_cycloneivgx = 1;
    else
        is_cycloneivgx = 0;

    IS_FAMILY_CYCLONEIVGX  = is_cycloneivgx;
end
endfunction //IS_FAMILY_CYCLONEIVGX

function IS_FAMILY_CYCLONEV;
    input[8*20:1] device;
    reg is_cyclonev;
begin
    if ((device == "Cyclone V") || (device == "CYCLONE V") || (device == "cyclone v") || (device == "CycloneV") || (device == "CYCLONEV") || (device == "cyclonev") || (device == "Cyclone V (GT/GX/E/SX)") || (device == "CYCLONE V (GT/GX/E/SX)") || (device == "cyclone v (gt/gx/e/sx)") || (device == "CycloneV(GT/GX/E/SX)") || (device == "CYCLONEV(GT/GX/E/SX)") || (device == "cyclonev(gt/gx/e/sx)") || (device == "Cyclone V (E/GX/GT/SX/SE/ST)") || (device == "CYCLONE V (E/GX/GT/SX/SE/ST)") || (device == "cyclone v (e/gx/gt/sx/se/st)") || (device == "CycloneV(E/GX/GT/SX/SE/ST)") || (device == "CYCLONEV(E/GX/GT/SX/SE/ST)") || (device == "cyclonev(e/gx/gt/sx/se/st)") || (device == "Cyclone V (E)") || (device == "CYCLONE V (E)") || (device == "cyclone v (e)") || (device == "CycloneV(E)") || (device == "CYCLONEV(E)") || (device == "cyclonev(e)") || (device == "Cyclone V (GX)") || (device == "CYCLONE V (GX)") || (device == "cyclone v (gx)") || (device == "CycloneV(GX)") || (device == "CYCLONEV(GX)") || (device == "cyclonev(gx)") || (device == "Cyclone V (GT)") || (device == "CYCLONE V (GT)") || (device == "cyclone v (gt)") || (device == "CycloneV(GT)") || (device == "CYCLONEV(GT)") || (device == "cyclonev(gt)") || (device == "Cyclone V (SX)") || (device == "CYCLONE V (SX)") || (device == "cyclone v (sx)") || (device == "CycloneV(SX)") || (device == "CYCLONEV(SX)") || (device == "cyclonev(sx)") || (device == "Cyclone V (SE)") || (device == "CYCLONE V (SE)") || (device == "cyclone v (se)") || (device == "CycloneV(SE)") || (device == "CYCLONEV(SE)") || (device == "cyclonev(se)") || (device == "Cyclone V (ST)") || (device == "CYCLONE V (ST)") || (device == "cyclone v (st)") || (device == "CycloneV(ST)") || (device == "CYCLONEV(ST)") || (device == "cyclonev(st)"))
        is_cyclonev = 1;
    else
        is_cyclonev = 0;

    IS_FAMILY_CYCLONEV  = is_cyclonev;
end
endfunction //IS_FAMILY_CYCLONEV

function IS_FAMILY_CYCLONE;
    input[8*20:1] device;
    reg is_cyclone;
begin
    if ((device == "Cyclone") || (device == "CYCLONE") || (device == "cyclone") || (device == "ACEX2K") || (device == "acex2k") || (device == "ACEX 2K") || (device == "acex 2k") || (device == "Tornado") || (device == "TORNADO") || (device == "tornado"))
        is_cyclone = 1;
    else
        is_cyclone = 0;

    IS_FAMILY_CYCLONE  = is_cyclone;
end
endfunction //IS_FAMILY_CYCLONE

function IS_FAMILY_HARDCOPYII;
    input[8*20:1] device;
    reg is_hardcopyii;
begin
    if ((device == "HardCopy II") || (device == "HARDCOPY II") || (device == "hardcopy ii") || (device == "HardCopyII") || (device == "HARDCOPYII") || (device == "hardcopyii") || (device == "Fusion") || (device == "FUSION") || (device == "fusion"))
        is_hardcopyii = 1;
    else
        is_hardcopyii = 0;

    IS_FAMILY_HARDCOPYII  = is_hardcopyii;
end
endfunction //IS_FAMILY_HARDCOPYII

function IS_FAMILY_HARDCOPYIII;
    input[8*20:1] device;
    reg is_hardcopyiii;
begin
    if ((device == "HardCopy III") || (device == "HARDCOPY III") || (device == "hardcopy iii") || (device == "HardCopyIII") || (device == "HARDCOPYIII") || (device == "hardcopyiii") || (device == "HCX") || (device == "hcx"))
        is_hardcopyiii = 1;
    else
        is_hardcopyiii = 0;

    IS_FAMILY_HARDCOPYIII  = is_hardcopyiii;
end
endfunction //IS_FAMILY_HARDCOPYIII

function IS_FAMILY_HARDCOPYIV;
    input[8*20:1] device;
    reg is_hardcopyiv;
begin
    if ((device == "HardCopy IV") || (device == "HARDCOPY IV") || (device == "hardcopy iv") || (device == "HardCopyIV") || (device == "HARDCOPYIV") || (device == "hardcopyiv") || (device == "HardCopy IV (GX)") || (device == "HARDCOPY IV (GX)") || (device == "hardcopy iv (gx)") || (device == "HardCopy IV (E)") || (device == "HARDCOPY IV (E)") || (device == "hardcopy iv (e)") || (device == "HardCopyIV(GX)") || (device == "HARDCOPYIV(GX)") || (device == "hardcopyiv(gx)") || (device == "HardCopyIV(E)") || (device == "HARDCOPYIV(E)") || (device == "hardcopyiv(e)") || (device == "HCXIV") || (device == "hcxiv") || (device == "HardCopy IV (GX/E)") || (device == "HARDCOPY IV (GX/E)") || (device == "hardcopy iv (gx/e)") || (device == "HardCopy IV (E/GX)") || (device == "HARDCOPY IV (E/GX)") || (device == "hardcopy iv (e/gx)") || (device == "HardCopyIV(GX/E)") || (device == "HARDCOPYIV(GX/E)") || (device == "hardcopyiv(gx/e)") || (device == "HardCopyIV(E/GX)") || (device == "HARDCOPYIV(E/GX)") || (device == "hardcopyiv(e/gx)"))
        is_hardcopyiv = 1;
    else
        is_hardcopyiv = 0;

    IS_FAMILY_HARDCOPYIV  = is_hardcopyiv;
end
endfunction //IS_FAMILY_HARDCOPYIV

function IS_FAMILY_MAX10;
    input[8*20:1] device;
    reg is_max10;
begin
    if ((device == "MAX 10") || (device == "max 10") || (device == "MAX 10 FPGA") || (device == "max 10 fpga") || (device == "Zippleback") || (device == "ZIPPLEBACK") || (device == "zippleback") || (device == "MAX10") || (device == "max10") || (device == "MAX 10 (DA/DF/DC/SA/SC)") || (device == "max 10 (da/df/dc/sa/sc)") || (device == "MAX10(DA/DF/DC/SA/SC)") || (device == "max10(da/df/dc/sa/sc)") || (device == "MAX 10 (DA)") || (device == "max 10 (da)") || (device == "MAX10(DA)") || (device == "max10(da)") || (device == "MAX 10 (DF)") || (device == "max 10 (df)") || (device == "MAX10(DF)") || (device == "max10(df)") || (device == "MAX 10 (DC)") || (device == "max 10 (dc)") || (device == "MAX10(DC)") || (device == "max10(dc)") || (device == "MAX 10 (SA)") || (device == "max 10 (sa)") || (device == "MAX10(SA)") || (device == "max10(sa)") || (device == "MAX 10 (SC)") || (device == "max 10 (sc)") || (device == "MAX10(SC)") || (device == "max10(sc)"))
        is_max10 = 1;
    else
        is_max10 = 0;

    IS_FAMILY_MAX10  = is_max10;
end
endfunction //IS_FAMILY_MAX10

function IS_FAMILY_MAXII;
    input[8*20:1] device;
    reg is_maxii;
begin
    if ((device == "MAX II") || (device == "max ii") || (device == "MAXII") || (device == "maxii") || (device == "Tsunami") || (device == "TSUNAMI") || (device == "tsunami"))
        is_maxii = 1;
    else
        is_maxii = 0;

    IS_FAMILY_MAXII  = is_maxii;
end
endfunction //IS_FAMILY_MAXII

function IS_FAMILY_MAXV;
    input[8*20:1] device;
    reg is_maxv;
begin
    if ((device == "MAX V") || (device == "max v") || (device == "MAXV") || (device == "maxv") || (device == "Jade") || (device == "JADE") || (device == "jade"))
        is_maxv = 1;
    else
        is_maxv = 0;

    IS_FAMILY_MAXV  = is_maxv;
end
endfunction //IS_FAMILY_MAXV

function IS_FAMILY_STRATIX10;
    input[8*20:1] device;
    reg is_stratix10;
begin
    if ((device == "Stratix 10") || (device == "STRATIX 10") || (device == "stratix 10") || (device == "Stratix10") || (device == "STRATIX10") || (device == "stratix10") || (device == "nadder") || (device == "NADDER") || (device == "Stratix 10 (GX/SX)") || (device == "STRATIX 10 (GX/SX)") || (device == "stratix 10 (gx/sx)") || (device == "Stratix10(GX/SX)") || (device == "STRATIX10(GX/SX)") || (device == "stratix10(gx/sx)") || (device == "Stratix 10 (GX)") || (device == "STRATIX 10 (GX)") || (device == "stratix 10 (gx)") || (device == "Stratix10(GX)") || (device == "STRATIX10(GX)") || (device == "stratix10(gx)") || (device == "Stratix 10 (SX)") || (device == "STRATIX 10 (SX)") || (device == "stratix 10 (sx)") || (device == "Stratix10(SX)") || (device == "STRATIX10(SX)") || (device == "stratix10(sx)"))
        is_stratix10 = 1;
    else
        is_stratix10 = 0;

    IS_FAMILY_STRATIX10  = is_stratix10;
end
endfunction //IS_FAMILY_STRATIX10

function IS_FAMILY_STRATIXGX;
    input[8*20:1] device;
    reg is_stratixgx;
begin
    if ((device == "Stratix GX") || (device == "STRATIX GX") || (device == "stratix gx") || (device == "Stratix-GX") || (device == "STRATIX-GX") || (device == "stratix-gx") || (device == "StratixGX") || (device == "STRATIXGX") || (device == "stratixgx") || (device == "Aurora") || (device == "AURORA") || (device == "aurora"))
        is_stratixgx = 1;
    else
        is_stratixgx = 0;

    IS_FAMILY_STRATIXGX  = is_stratixgx;
end
endfunction //IS_FAMILY_STRATIXGX

function IS_FAMILY_STRATIXIIGX;
    input[8*20:1] device;
    reg is_stratixiigx;
begin
    if ((device == "Stratix II GX") || (device == "STRATIX II GX") || (device == "stratix ii gx") || (device == "StratixIIGX") || (device == "STRATIXIIGX") || (device == "stratixiigx"))
        is_stratixiigx = 1;
    else
        is_stratixiigx = 0;

    IS_FAMILY_STRATIXIIGX  = is_stratixiigx;
end
endfunction //IS_FAMILY_STRATIXIIGX

function IS_FAMILY_STRATIXII;
    input[8*20:1] device;
    reg is_stratixii;
begin
    if ((device == "Stratix II") || (device == "STRATIX II") || (device == "stratix ii") || (device == "StratixII") || (device == "STRATIXII") || (device == "stratixii") || (device == "Armstrong") || (device == "ARMSTRONG") || (device == "armstrong"))
        is_stratixii = 1;
    else
        is_stratixii = 0;

    IS_FAMILY_STRATIXII  = is_stratixii;
end
endfunction //IS_FAMILY_STRATIXII

function IS_FAMILY_STRATIXIII;
    input[8*20:1] device;
    reg is_stratixiii;
begin
    if ((device == "Stratix III") || (device == "STRATIX III") || (device == "stratix iii") || (device == "StratixIII") || (device == "STRATIXIII") || (device == "stratixiii") || (device == "Titan") || (device == "TITAN") || (device == "titan") || (device == "SIII") || (device == "siii"))
        is_stratixiii = 1;
    else
        is_stratixiii = 0;

    IS_FAMILY_STRATIXIII  = is_stratixiii;
end
endfunction //IS_FAMILY_STRATIXIII

function IS_FAMILY_STRATIXIV;
    input[8*20:1] device;
    reg is_stratixiv;
begin
    if ((device == "Stratix IV") || (device == "STRATIX IV") || (device == "stratix iv") || (device == "TGX") || (device == "tgx") || (device == "StratixIV") || (device == "STRATIXIV") || (device == "stratixiv") || (device == "Stratix IV (GT)") || (device == "STRATIX IV (GT)") || (device == "stratix iv (gt)") || (device == "Stratix IV (GX)") || (device == "STRATIX IV (GX)") || (device == "stratix iv (gx)") || (device == "Stratix IV (E)") || (device == "STRATIX IV (E)") || (device == "stratix iv (e)") || (device == "StratixIV(GT)") || (device == "STRATIXIV(GT)") || (device == "stratixiv(gt)") || (device == "StratixIV(GX)") || (device == "STRATIXIV(GX)") || (device == "stratixiv(gx)") || (device == "StratixIV(E)") || (device == "STRATIXIV(E)") || (device == "stratixiv(e)") || (device == "StratixIIIGX") || (device == "STRATIXIIIGX") || (device == "stratixiiigx") || (device == "Stratix IV (GT/GX/E)") || (device == "STRATIX IV (GT/GX/E)") || (device == "stratix iv (gt/gx/e)") || (device == "Stratix IV (GT/E/GX)") || (device == "STRATIX IV (GT/E/GX)") || (device == "stratix iv (gt/e/gx)") || (device == "Stratix IV (E/GT/GX)") || (device == "STRATIX IV (E/GT/GX)") || (device == "stratix iv (e/gt/gx)") || (device == "Stratix IV (E/GX/GT)") || (device == "STRATIX IV (E/GX/GT)") || (device == "stratix iv (e/gx/gt)") || (device == "StratixIV(GT/GX/E)") || (device == "STRATIXIV(GT/GX/E)") || (device == "stratixiv(gt/gx/e)") || (device == "StratixIV(GT/E/GX)") || (device == "STRATIXIV(GT/E/GX)") || (device == "stratixiv(gt/e/gx)") || (device == "StratixIV(E/GX/GT)") || (device == "STRATIXIV(E/GX/GT)") || (device == "stratixiv(e/gx/gt)") || (device == "StratixIV(E/GT/GX)") || (device == "STRATIXIV(E/GT/GX)") || (device == "stratixiv(e/gt/gx)") || (device == "Stratix IV (GX/E)") || (device == "STRATIX IV (GX/E)") || (device == "stratix iv (gx/e)") || (device == "StratixIV(GX/E)") || (device == "STRATIXIV(GX/E)") || (device == "stratixiv(gx/e)"))
        is_stratixiv = 1;
    else
        is_stratixiv = 0;

    IS_FAMILY_STRATIXIV  = is_stratixiv;
end
endfunction //IS_FAMILY_STRATIXIV

function IS_FAMILY_STRATIXV;
    input[8*20:1] device;
    reg is_stratixv;
begin
    if ((device == "Stratix V") || (device == "STRATIX V") || (device == "stratix v") || (device == "StratixV") || (device == "STRATIXV") || (device == "stratixv") || (device == "Stratix V (GS)") || (device == "STRATIX V (GS)") || (device == "stratix v (gs)") || (device == "StratixV(GS)") || (device == "STRATIXV(GS)") || (device == "stratixv(gs)") || (device == "Stratix V (GT)") || (device == "STRATIX V (GT)") || (device == "stratix v (gt)") || (device == "StratixV(GT)") || (device == "STRATIXV(GT)") || (device == "stratixv(gt)") || (device == "Stratix V (GX)") || (device == "STRATIX V (GX)") || (device == "stratix v (gx)") || (device == "StratixV(GX)") || (device == "STRATIXV(GX)") || (device == "stratixv(gx)") || (device == "Stratix V (GS/GX)") || (device == "STRATIX V (GS/GX)") || (device == "stratix v (gs/gx)") || (device == "StratixV(GS/GX)") || (device == "STRATIXV(GS/GX)") || (device == "stratixv(gs/gx)") || (device == "Stratix V (GS/GT)") || (device == "STRATIX V (GS/GT)") || (device == "stratix v (gs/gt)") || (device == "StratixV(GS/GT)") || (device == "STRATIXV(GS/GT)") || (device == "stratixv(gs/gt)") || (device == "Stratix V (GT/GX)") || (device == "STRATIX V (GT/GX)") || (device == "stratix v (gt/gx)") || (device == "StratixV(GT/GX)") || (device == "STRATIXV(GT/GX)") || (device == "stratixv(gt/gx)") || (device == "Stratix V (GX/GS)") || (device == "STRATIX V (GX/GS)") || (device == "stratix v (gx/gs)") || (device == "StratixV(GX/GS)") || (device == "STRATIXV(GX/GS)") || (device == "stratixv(gx/gs)") || (device == "Stratix V (GT/GS)") || (device == "STRATIX V (GT/GS)") || (device == "stratix v (gt/gs)") || (device == "StratixV(GT/GS)") || (device == "STRATIXV(GT/GS)") || (device == "stratixv(gt/gs)") || (device == "Stratix V (GX/GT)") || (device == "STRATIX V (GX/GT)") || (device == "stratix v (gx/gt)") || (device == "StratixV(GX/GT)") || (device == "STRATIXV(GX/GT)") || (device == "stratixv(gx/gt)") || (device == "Stratix V (GS/GT/GX)") || (device == "STRATIX V (GS/GT/GX)") || (device == "stratix v (gs/gt/gx)") || (device == "Stratix V (GS/GX/GT)") || (device == "STRATIX V (GS/GX/GT)") || (device == "stratix v (gs/gx/gt)") || (device == "Stratix V (GT/GS/GX)") || (device == "STRATIX V (GT/GS/GX)") || (device == "stratix v (gt/gs/gx)") || (device == "Stratix V (GT/GX/GS)") || (device == "STRATIX V (GT/GX/GS)") || (device == "stratix v (gt/gx/gs)") || (device == "Stratix V (GX/GS/GT)") || (device == "STRATIX V (GX/GS/GT)") || (device == "stratix v (gx/gs/gt)") || (device == "Stratix V (GX/GT/GS)") || (device == "STRATIX V (GX/GT/GS)") || (device == "stratix v (gx/gt/gs)") || (device == "StratixV(GS/GT/GX)") || (device == "STRATIXV(GS/GT/GX)") || (device == "stratixv(gs/gt/gx)") || (device == "StratixV(GS/GX/GT)") || (device == "STRATIXV(GS/GX/GT)") || (device == "stratixv(gs/gx/gt)") || (device == "StratixV(GT/GS/GX)") || (device == "STRATIXV(GT/GS/GX)") || (device == "stratixv(gt/gs/gx)") || (device == "StratixV(GT/GX/GS)") || (device == "STRATIXV(GT/GX/GS)") || (device == "stratixv(gt/gx/gs)") || (device == "StratixV(GX/GS/GT)") || (device == "STRATIXV(GX/GS/GT)") || (device == "stratixv(gx/gs/gt)") || (device == "StratixV(GX/GT/GS)") || (device == "STRATIXV(GX/GT/GS)") || (device == "stratixv(gx/gt/gs)") || (device == "Stratix V (GS/GT/GX/E)") || (device == "STRATIX V (GS/GT/GX/E)") || (device == "stratix v (gs/gt/gx/e)") || (device == "StratixV(GS/GT/GX/E)") || (device == "STRATIXV(GS/GT/GX/E)") || (device == "stratixv(gs/gt/gx/e)") || (device == "Stratix V (E)") || (device == "STRATIX V (E)") || (device == "stratix v (e)") || (device == "StratixV(E)") || (device == "STRATIXV(E)") || (device == "stratixv(e)"))
        is_stratixv = 1;
    else
        is_stratixv = 0;

    IS_FAMILY_STRATIXV  = is_stratixv;
end
endfunction //IS_FAMILY_STRATIXV

function IS_FAMILY_STRATIX;
    input[8*20:1] device;
    reg is_stratix;
begin
    if ((device == "Stratix") || (device == "STRATIX") || (device == "stratix") || (device == "Yeager") || (device == "YEAGER") || (device == "yeager"))
        is_stratix = 1;
    else
        is_stratix = 0;

    IS_FAMILY_STRATIX  = is_stratix;
end
endfunction //IS_FAMILY_STRATIX

function FEATURE_FAMILY_STRATIXGX;
    input[8*20:1] device;
    reg var_family_stratixgx;
begin
    if (IS_FAMILY_STRATIXGX(device) )
        var_family_stratixgx = 1;
    else
        var_family_stratixgx = 0;

    FEATURE_FAMILY_STRATIXGX  = var_family_stratixgx;
end
endfunction //FEATURE_FAMILY_STRATIXGX

function FEATURE_FAMILY_CYCLONE;
    input[8*20:1] device;
    reg var_family_cyclone;
begin
    if (IS_FAMILY_CYCLONE(device) )
        var_family_cyclone = 1;
    else
        var_family_cyclone = 0;

    FEATURE_FAMILY_CYCLONE  = var_family_cyclone;
end
endfunction //FEATURE_FAMILY_CYCLONE

function FEATURE_FAMILY_STRATIXIIGX;
    input[8*20:1] device;
    reg var_family_stratixiigx;
begin
    if (IS_FAMILY_STRATIXIIGX(device) || IS_FAMILY_ARRIAGX(device) )
        var_family_stratixiigx = 1;
    else
        var_family_stratixiigx = 0;

    FEATURE_FAMILY_STRATIXIIGX  = var_family_stratixiigx;
end
endfunction //FEATURE_FAMILY_STRATIXIIGX

function FEATURE_FAMILY_STRATIXIII;
    input[8*20:1] device;
    reg var_family_stratixiii;
begin
    if (IS_FAMILY_STRATIXIII(device) || FEATURE_FAMILY_STRATIXIV(device) || FEATURE_FAMILY_HARDCOPYIII(device) )
        var_family_stratixiii = 1;
    else
        var_family_stratixiii = 0;

    FEATURE_FAMILY_STRATIXIII  = var_family_stratixiii;
end
endfunction //FEATURE_FAMILY_STRATIXIII

function FEATURE_FAMILY_ARRIAVGZ;
    input[8*20:1] device;
    reg var_family_arriavgz;
begin
    if (IS_FAMILY_ARRIAVGZ(device) )
        var_family_arriavgz = 1;
    else
        var_family_arriavgz = 0;

    FEATURE_FAMILY_ARRIAVGZ  = var_family_arriavgz;
end
endfunction //FEATURE_FAMILY_ARRIAVGZ

function FEATURE_FAMILY_STRATIXV;
    input[8*20:1] device;
    reg var_family_stratixv;
begin
    if (IS_FAMILY_STRATIXV(device) || FEATURE_FAMILY_ARRIAVGZ(device) )
        var_family_stratixv = 1;
    else
        var_family_stratixv = 0;

    FEATURE_FAMILY_STRATIXV  = var_family_stratixv;
end
endfunction //FEATURE_FAMILY_STRATIXV

function FEATURE_FAMILY_ARRIA10;
    input[8*20:1] device;
    reg var_family_arria10;
begin
    if (IS_FAMILY_ARRIA10(device) || IS_FAMILY_ARRIA10(device) )
        var_family_arria10 = 1;
    else
        var_family_arria10 = 0;

    FEATURE_FAMILY_ARRIA10  = var_family_arria10;
end
endfunction //FEATURE_FAMILY_ARRIA10

function FEATURE_FAMILY_CYCLONE10LP;
    input[8*20:1] device;
    reg var_family_cyclone10lp;
begin
    if (IS_FAMILY_CYCLONE10LP(device) || IS_FAMILY_CYCLONE10LP(device) )
        var_family_cyclone10lp = 1;
    else
        var_family_cyclone10lp = 0;

    FEATURE_FAMILY_CYCLONE10LP  = var_family_cyclone10lp;
end
endfunction //FEATURE_FAMILY_CYCLONE10LP

function FEATURE_FAMILY_STRATIXII;
    input[8*20:1] device;
    reg var_family_stratixii;
begin
    if (IS_FAMILY_STRATIXII(device) || IS_FAMILY_HARDCOPYII(device) || FEATURE_FAMILY_STRATIXIIGX(device) || FEATURE_FAMILY_STRATIXIII(device) )
        var_family_stratixii = 1;
    else
        var_family_stratixii = 0;

    FEATURE_FAMILY_STRATIXII  = var_family_stratixii;
end
endfunction //FEATURE_FAMILY_STRATIXII

function FEATURE_FAMILY_CYCLONEIVGX;
    input[8*20:1] device;
    reg var_family_cycloneivgx;
begin
    if (IS_FAMILY_CYCLONEIVGX(device) || IS_FAMILY_CYCLONEIVGX(device) )
        var_family_cycloneivgx = 1;
    else
        var_family_cycloneivgx = 0;

    FEATURE_FAMILY_CYCLONEIVGX  = var_family_cycloneivgx;
end
endfunction //FEATURE_FAMILY_CYCLONEIVGX

function FEATURE_FAMILY_CYCLONEIVE;
    input[8*20:1] device;
    reg var_family_cycloneive;
begin
    if (IS_FAMILY_CYCLONEIVE(device) || FEATURE_FAMILY_CYCLONE10LP(device) )
        var_family_cycloneive = 1;
    else
        var_family_cycloneive = 0;

    FEATURE_FAMILY_CYCLONEIVE  = var_family_cycloneive;
end
endfunction //FEATURE_FAMILY_CYCLONEIVE

function FEATURE_FAMILY_CYCLONEIII;
    input[8*20:1] device;
    reg var_family_cycloneiii;
begin
    if (IS_FAMILY_CYCLONEIII(device) || IS_FAMILY_CYCLONEIIILS(device) || FEATURE_FAMILY_CYCLONEIVGX(device) || FEATURE_FAMILY_CYCLONEIVE(device) || FEATURE_FAMILY_MAX10(device) || FEATURE_FAMILY_CYCLONE10LP(device) )
        var_family_cycloneiii = 1;
    else
        var_family_cycloneiii = 0;

    FEATURE_FAMILY_CYCLONEIII  = var_family_cycloneiii;
end
endfunction //FEATURE_FAMILY_CYCLONEIII

function FEATURE_FAMILY_STRATIX_HC;
    input[8*20:1] device;
    reg var_family_stratix_hc;
begin
    if ((device == "StratixHC") )
        var_family_stratix_hc = 1;
    else
        var_family_stratix_hc = 0;

    FEATURE_FAMILY_STRATIX_HC  = var_family_stratix_hc;
end
endfunction //FEATURE_FAMILY_STRATIX_HC

function FEATURE_FAMILY_STRATIX;
    input[8*20:1] device;
    reg var_family_stratix;
begin
    if (IS_FAMILY_STRATIX(device) || FEATURE_FAMILY_STRATIX_HC(device) || FEATURE_FAMILY_STRATIXGX(device) || FEATURE_FAMILY_CYCLONE(device) || FEATURE_FAMILY_STRATIXII(device) || FEATURE_FAMILY_MAXII(device) || FEATURE_FAMILY_CYCLONEII(device) )
        var_family_stratix = 1;
    else
        var_family_stratix = 0;

    FEATURE_FAMILY_STRATIX  = var_family_stratix;
end
endfunction //FEATURE_FAMILY_STRATIX

function FEATURE_FAMILY_MAXII;
    input[8*20:1] device;
    reg var_family_maxii;
begin
    if (IS_FAMILY_MAXII(device) || FEATURE_FAMILY_MAXV(device) )
        var_family_maxii = 1;
    else
        var_family_maxii = 0;

    FEATURE_FAMILY_MAXII  = var_family_maxii;
end
endfunction //FEATURE_FAMILY_MAXII

function FEATURE_FAMILY_MAXV;
    input[8*20:1] device;
    reg var_family_maxv;
begin
    if (IS_FAMILY_MAXV(device) )
        var_family_maxv = 1;
    else
        var_family_maxv = 0;

    FEATURE_FAMILY_MAXV  = var_family_maxv;
end
endfunction //FEATURE_FAMILY_MAXV

function FEATURE_FAMILY_CYCLONEII;
    input[8*20:1] device;
    reg var_family_cycloneii;
begin
    if (IS_FAMILY_CYCLONEII(device) || FEATURE_FAMILY_CYCLONEIII(device) )
        var_family_cycloneii = 1;
    else
        var_family_cycloneii = 0;

    FEATURE_FAMILY_CYCLONEII  = var_family_cycloneii;
end
endfunction //FEATURE_FAMILY_CYCLONEII

function FEATURE_FAMILY_STRATIXIV;
    input[8*20:1] device;
    reg var_family_stratixiv;
begin
    if (IS_FAMILY_STRATIXIV(device) || IS_FAMILY_ARRIAIIGX(device) || FEATURE_FAMILY_HARDCOPYIV(device) || FEATURE_FAMILY_STRATIXV(device) || FEATURE_FAMILY_ARRIAV(device) || FEATURE_FAMILY_ARRIAIIGZ(device) || FEATURE_FAMILY_ARRIA10(device) || FEATURE_FAMILY_STRATIX10(device) )
        var_family_stratixiv = 1;
    else
        var_family_stratixiv = 0;

    FEATURE_FAMILY_STRATIXIV  = var_family_stratixiv;
end
endfunction //FEATURE_FAMILY_STRATIXIV

function FEATURE_FAMILY_ARRIAIIGZ;
    input[8*20:1] device;
    reg var_family_arriaiigz;
begin
    if (IS_FAMILY_ARRIAIIGZ(device) )
        var_family_arriaiigz = 1;
    else
        var_family_arriaiigz = 0;

    FEATURE_FAMILY_ARRIAIIGZ  = var_family_arriaiigz;
end
endfunction //FEATURE_FAMILY_ARRIAIIGZ

function FEATURE_FAMILY_ARRIAIIGX;
    input[8*20:1] device;
    reg var_family_arriaiigx;
begin
    if (IS_FAMILY_ARRIAIIGX(device) )
        var_family_arriaiigx = 1;
    else
        var_family_arriaiigx = 0;

    FEATURE_FAMILY_ARRIAIIGX  = var_family_arriaiigx;
end
endfunction //FEATURE_FAMILY_ARRIAIIGX

function FEATURE_FAMILY_HARDCOPYIII;
    input[8*20:1] device;
    reg var_family_hardcopyiii;
begin
    if (IS_FAMILY_HARDCOPYIII(device) || IS_FAMILY_HARDCOPYIII(device) )
        var_family_hardcopyiii = 1;
    else
        var_family_hardcopyiii = 0;

    FEATURE_FAMILY_HARDCOPYIII  = var_family_hardcopyiii;
end
endfunction //FEATURE_FAMILY_HARDCOPYIII

function FEATURE_FAMILY_HARDCOPYIV;
    input[8*20:1] device;
    reg var_family_hardcopyiv;
begin
    if (IS_FAMILY_HARDCOPYIV(device) || IS_FAMILY_HARDCOPYIV(device) )
        var_family_hardcopyiv = 1;
    else
        var_family_hardcopyiv = 0;

    FEATURE_FAMILY_HARDCOPYIV  = var_family_hardcopyiv;
end
endfunction //FEATURE_FAMILY_HARDCOPYIV

function FEATURE_FAMILY_CYCLONEV;
    input[8*20:1] device;
    reg var_family_cyclonev;
begin
    if (IS_FAMILY_CYCLONEV(device) )
        var_family_cyclonev = 1;
    else
        var_family_cyclonev = 0;

    FEATURE_FAMILY_CYCLONEV  = var_family_cyclonev;
end
endfunction //FEATURE_FAMILY_CYCLONEV

function FEATURE_FAMILY_ARRIAV;
    input[8*20:1] device;
    reg var_family_arriav;
begin
    if (IS_FAMILY_ARRIAV(device) || FEATURE_FAMILY_CYCLONEV(device) )
        var_family_arriav = 1;
    else
        var_family_arriav = 0;

    FEATURE_FAMILY_ARRIAV  = var_family_arriav;
end
endfunction //FEATURE_FAMILY_ARRIAV

function FEATURE_FAMILY_MAX10;
    input[8*20:1] device;
    reg var_family_max10;
begin
    if (IS_FAMILY_MAX10(device) )
        var_family_max10 = 1;
    else
        var_family_max10 = 0;

    FEATURE_FAMILY_MAX10  = var_family_max10;
end
endfunction //FEATURE_FAMILY_MAX10

function FEATURE_FAMILY_STRATIX10;
    input[8*20:1] device;
    reg var_family_stratix10;
begin
    if (IS_FAMILY_STRATIX10(device) || IS_FAMILY_STRATIX10(device) )
        var_family_stratix10 = 1;
    else
        var_family_stratix10 = 0;

    FEATURE_FAMILY_STRATIX10  = var_family_stratix10;
end
endfunction //FEATURE_FAMILY_STRATIX10

function FEATURE_FAMILY_BASE_STRATIXII;
    input[8*20:1] device;
    reg var_family_base_stratixii;
begin
    if (IS_FAMILY_STRATIXII(device) || IS_FAMILY_HARDCOPYII(device) || FEATURE_FAMILY_STRATIXIIGX(device) )
        var_family_base_stratixii = 1;
    else
        var_family_base_stratixii = 0;

    FEATURE_FAMILY_BASE_STRATIXII  = var_family_base_stratixii;
end
endfunction //FEATURE_FAMILY_BASE_STRATIXII

function FEATURE_FAMILY_BASE_STRATIX;
    input[8*20:1] device;
    reg var_family_base_stratix;
begin
    if (IS_FAMILY_STRATIX(device) || IS_FAMILY_STRATIXGX(device) )
        var_family_base_stratix = 1;
    else
        var_family_base_stratix = 0;

    FEATURE_FAMILY_BASE_STRATIX  = var_family_base_stratix;
end
endfunction //FEATURE_FAMILY_BASE_STRATIX

function FEATURE_FAMILY_BASE_CYCLONEII;
    input[8*20:1] device;
    reg var_family_base_cycloneii;
begin
    if (IS_FAMILY_CYCLONEII(device) )
        var_family_base_cycloneii = 1;
    else
        var_family_base_cycloneii = 0;

    FEATURE_FAMILY_BASE_CYCLONEII  = var_family_base_cycloneii;
end
endfunction //FEATURE_FAMILY_BASE_CYCLONEII

function FEATURE_FAMILY_BASE_CYCLONE;
    input[8*20:1] device;
    reg var_family_base_cyclone;
begin
    if (IS_FAMILY_CYCLONE(device) )
        var_family_base_cyclone = 1;
    else
        var_family_base_cyclone = 0;

    FEATURE_FAMILY_BASE_CYCLONE  = var_family_base_cyclone;
end
endfunction //FEATURE_FAMILY_BASE_CYCLONE

function FEATURE_FAMILY_HAS_ALTERA_MULT_ADD_FLOW;
    input[8*20:1] device;
    reg var_family_has_altera_mult_add_flow;
begin
    if (FEATURE_FAMILY_STRATIXV(device) || FEATURE_FAMILY_ARRIAV(device) || FEATURE_FAMILY_CYCLONEV(device) || FEATURE_FAMILY_ARRIA10(device) || FEATURE_FAMILY_STRATIX10(device) )
        var_family_has_altera_mult_add_flow = 1;
    else
        var_family_has_altera_mult_add_flow = 0;

    FEATURE_FAMILY_HAS_ALTERA_MULT_ADD_FLOW  = var_family_has_altera_mult_add_flow;
end
endfunction //FEATURE_FAMILY_HAS_ALTERA_MULT_ADD_FLOW

function FEATURE_FAMILY_IS_ALTMULT_ADD_EOL;
    input[8*20:1] device;
    reg var_family_is_altmult_add_eol;
begin
    if (FEATURE_FAMILY_ARRIA10(device) || FEATURE_FAMILY_STRATIX10(device) )
        var_family_is_altmult_add_eol = 1;
    else
        var_family_is_altmult_add_eol = 0;

    FEATURE_FAMILY_IS_ALTMULT_ADD_EOL  = var_family_is_altmult_add_eol;
end
endfunction //FEATURE_FAMILY_IS_ALTMULT_ADD_EOL

function FEATURE_FAMILY_HAS_STRATIXII_STYLE_RAM;
    input[8*20:1] device;
    reg var_family_has_stratixii_style_ram;
begin
    if (FEATURE_FAMILY_STRATIXII(device) || FEATURE_FAMILY_CYCLONEII(device) )
        var_family_has_stratixii_style_ram = 1;
    else
        var_family_has_stratixii_style_ram = 0;

    FEATURE_FAMILY_HAS_STRATIXII_STYLE_RAM  = var_family_has_stratixii_style_ram;
end
endfunction //FEATURE_FAMILY_HAS_STRATIXII_STYLE_RAM

function FEATURE_FAMILY_HAS_STRATIXIII_STYLE_RAM;
    input[8*20:1] device;
    reg var_family_has_stratixiii_style_ram;
begin
    if (FEATURE_FAMILY_STRATIXIII(device) || FEATURE_FAMILY_CYCLONEIII(device) )
        var_family_has_stratixiii_style_ram = 1;
    else
        var_family_has_stratixiii_style_ram = 0;

    FEATURE_FAMILY_HAS_STRATIXIII_STYLE_RAM  = var_family_has_stratixiii_style_ram;
end
endfunction //FEATURE_FAMILY_HAS_STRATIXIII_STYLE_RAM

function FEATURE_FAMILY_HAS_STRATIX_STYLE_PLL;
    input[8*20:1] device;
    reg var_family_has_stratix_style_pll;
begin
    if (FEATURE_FAMILY_CYCLONE(device) || FEATURE_FAMILY_STRATIX_HC(device) || IS_FAMILY_STRATIX(device) || FEATURE_FAMILY_STRATIXGX(device) )
        var_family_has_stratix_style_pll = 1;
    else
        var_family_has_stratix_style_pll = 0;

    FEATURE_FAMILY_HAS_STRATIX_STYLE_PLL  = var_family_has_stratix_style_pll;
end
endfunction //FEATURE_FAMILY_HAS_STRATIX_STYLE_PLL

function FEATURE_FAMILY_HAS_STRATIXII_STYLE_PLL;
    input[8*20:1] device;
    reg var_family_has_stratixii_style_pll;
begin
    if (FEATURE_FAMILY_STRATIXII(device) && ! FEATURE_FAMILY_STRATIXIII(device) || FEATURE_FAMILY_CYCLONEII(device) && ! FEATURE_FAMILY_CYCLONEIII(device) )
        var_family_has_stratixii_style_pll = 1;
    else
        var_family_has_stratixii_style_pll = 0;

    FEATURE_FAMILY_HAS_STRATIXII_STYLE_PLL  = var_family_has_stratixii_style_pll;
end
endfunction //FEATURE_FAMILY_HAS_STRATIXII_STYLE_PLL

function FEATURE_FAMILY_HAS_INVERTED_OUTPUT_DDIO;
    input[8*20:1] device;
    reg var_family_has_inverted_output_ddio;
begin
    if (FEATURE_FAMILY_CYCLONEII(device) )
        var_family_has_inverted_output_ddio = 1;
    else
        var_family_has_inverted_output_ddio = 0;

    FEATURE_FAMILY_HAS_INVERTED_OUTPUT_DDIO  = var_family_has_inverted_output_ddio;
end
endfunction //FEATURE_FAMILY_HAS_INVERTED_OUTPUT_DDIO

function IS_VALID_FAMILY;
    input[8*20:1] device;
    reg is_valid;
begin
    if (((device == "Arria 10") || (device == "ARRIA 10") || (device == "arria 10") || (device == "Arria10") || (device == "ARRIA10") || (device == "arria10") || (device == "Arria VI") || (device == "ARRIA VI") || (device == "arria vi") || (device == "ArriaVI") || (device == "ARRIAVI") || (device == "arriavi") || (device == "Night Fury") || (device == "NIGHT FURY") || (device == "night fury") || (device == "nightfury") || (device == "NIGHTFURY") || (device == "Arria 10 (GX/SX/GT)") || (device == "ARRIA 10 (GX/SX/GT)") || (device == "arria 10 (gx/sx/gt)") || (device == "Arria10(GX/SX/GT)") || (device == "ARRIA10(GX/SX/GT)") || (device == "arria10(gx/sx/gt)") || (device == "Arria 10 (GX)") || (device == "ARRIA 10 (GX)") || (device == "arria 10 (gx)") || (device == "Arria10(GX)") || (device == "ARRIA10(GX)") || (device == "arria10(gx)") || (device == "Arria 10 (SX)") || (device == "ARRIA 10 (SX)") || (device == "arria 10 (sx)") || (device == "Arria10(SX)") || (device == "ARRIA10(SX)") || (device == "arria10(sx)") || (device == "Arria 10 (GT)") || (device == "ARRIA 10 (GT)") || (device == "arria 10 (gt)") || (device == "Arria10(GT)") || (device == "ARRIA10(GT)") || (device == "arria10(gt)"))
    || ((device == "Arria GX") || (device == "ARRIA GX") || (device == "arria gx") || (device == "ArriaGX") || (device == "ARRIAGX") || (device == "arriagx") || (device == "Stratix II GX Lite") || (device == "STRATIX II GX LITE") || (device == "stratix ii gx lite") || (device == "StratixIIGXLite") || (device == "STRATIXIIGXLITE") || (device == "stratixiigxlite"))
    || ((device == "Arria II GX") || (device == "ARRIA II GX") || (device == "arria ii gx") || (device == "ArriaIIGX") || (device == "ARRIAIIGX") || (device == "arriaiigx") || (device == "Arria IIGX") || (device == "ARRIA IIGX") || (device == "arria iigx") || (device == "ArriaII GX") || (device == "ARRIAII GX") || (device == "arriaii gx") || (device == "Arria II") || (device == "ARRIA II") || (device == "arria ii") || (device == "ArriaII") || (device == "ARRIAII") || (device == "arriaii") || (device == "Arria II (GX/E)") || (device == "ARRIA II (GX/E)") || (device == "arria ii (gx/e)") || (device == "ArriaII(GX/E)") || (device == "ARRIAII(GX/E)") || (device == "arriaii(gx/e)") || (device == "PIRANHA") || (device == "piranha"))
    || ((device == "Arria II GZ") || (device == "ARRIA II GZ") || (device == "arria ii gz") || (device == "ArriaII GZ") || (device == "ARRIAII GZ") || (device == "arriaii gz") || (device == "Arria IIGZ") || (device == "ARRIA IIGZ") || (device == "arria iigz") || (device == "ArriaIIGZ") || (device == "ARRIAIIGZ") || (device == "arriaiigz"))
    || ((device == "Arria V GZ") || (device == "ARRIA V GZ") || (device == "arria v gz") || (device == "ArriaVGZ") || (device == "ARRIAVGZ") || (device == "arriavgz"))
    || ((device == "Arria V") || (device == "ARRIA V") || (device == "arria v") || (device == "Arria V (GT/GX)") || (device == "ARRIA V (GT/GX)") || (device == "arria v (gt/gx)") || (device == "ArriaV(GT/GX)") || (device == "ARRIAV(GT/GX)") || (device == "arriav(gt/gx)") || (device == "ArriaV") || (device == "ARRIAV") || (device == "arriav") || (device == "Arria V (GT/GX/ST/SX)") || (device == "ARRIA V (GT/GX/ST/SX)") || (device == "arria v (gt/gx/st/sx)") || (device == "ArriaV(GT/GX/ST/SX)") || (device == "ARRIAV(GT/GX/ST/SX)") || (device == "arriav(gt/gx/st/sx)") || (device == "Arria V (GT)") || (device == "ARRIA V (GT)") || (device == "arria v (gt)") || (device == "ArriaV(GT)") || (device == "ARRIAV(GT)") || (device == "arriav(gt)") || (device == "Arria V (GX)") || (device == "ARRIA V (GX)") || (device == "arria v (gx)") || (device == "ArriaV(GX)") || (device == "ARRIAV(GX)") || (device == "arriav(gx)") || (device == "Arria V (ST)") || (device == "ARRIA V (ST)") || (device == "arria v (st)") || (device == "ArriaV(ST)") || (device == "ARRIAV(ST)") || (device == "arriav(st)") || (device == "Arria V (SX)") || (device == "ARRIA V (SX)") || (device == "arria v (sx)") || (device == "ArriaV(SX)") || (device == "ARRIAV(SX)") || (device == "arriav(sx)"))
    || ((device == "BS") || (device == "bs"))
    || ((device == "Cyclone 10 LP") || (device == "CYCLONE 10 LP") || (device == "cyclone 10 lp") || (device == "cyclone10lp") || (device == "CYCLONE10LP") || (device == "Cyclone10lp") || (device == "CYCLONE10LP") || (device == "cyclone10lp") || (device == "C10LP") || (device == "c10lp") || (device == "Cyclone10LP") || (device == "CYCLONE10LP") || (device == "cyclone10lp"))
    || ((device == "Cyclone II") || (device == "CYCLONE II") || (device == "cyclone ii") || (device == "Cycloneii") || (device == "CYCLONEII") || (device == "cycloneii") || (device == "Magellan") || (device == "MAGELLAN") || (device == "magellan") || (device == "CycloneII") || (device == "CYCLONEII") || (device == "cycloneii"))
    || ((device == "Cyclone III LS") || (device == "CYCLONE III LS") || (device == "cyclone iii ls") || (device == "CycloneIIILS") || (device == "CYCLONEIIILS") || (device == "cycloneiiils") || (device == "Cyclone III LPS") || (device == "CYCLONE III LPS") || (device == "cyclone iii lps") || (device == "Cyclone LPS") || (device == "CYCLONE LPS") || (device == "cyclone lps") || (device == "CycloneLPS") || (device == "CYCLONELPS") || (device == "cyclonelps") || (device == "Tarpon") || (device == "TARPON") || (device == "tarpon") || (device == "Cyclone IIIE") || (device == "CYCLONE IIIE") || (device == "cyclone iiie"))
    || ((device == "Cyclone III") || (device == "CYCLONE III") || (device == "cyclone iii") || (device == "CycloneIII") || (device == "CYCLONEIII") || (device == "cycloneiii") || (device == "Barracuda") || (device == "BARRACUDA") || (device == "barracuda") || (device == "Cuda") || (device == "CUDA") || (device == "cuda") || (device == "CIII") || (device == "ciii"))
    || ((device == "Cyclone IV E") || (device == "CYCLONE IV E") || (device == "cyclone iv e") || (device == "CycloneIV E") || (device == "CYCLONEIV E") || (device == "cycloneiv e") || (device == "Cyclone IVE") || (device == "CYCLONE IVE") || (device == "cyclone ive") || (device == "CycloneIVE") || (device == "CYCLONEIVE") || (device == "cycloneive"))
    || ((device == "Cyclone IV GX") || (device == "CYCLONE IV GX") || (device == "cyclone iv gx") || (device == "Cyclone IVGX") || (device == "CYCLONE IVGX") || (device == "cyclone ivgx") || (device == "CycloneIV GX") || (device == "CYCLONEIV GX") || (device == "cycloneiv gx") || (device == "CycloneIVGX") || (device == "CYCLONEIVGX") || (device == "cycloneivgx") || (device == "Cyclone IV") || (device == "CYCLONE IV") || (device == "cyclone iv") || (device == "CycloneIV") || (device == "CYCLONEIV") || (device == "cycloneiv") || (device == "Cyclone IV (GX)") || (device == "CYCLONE IV (GX)") || (device == "cyclone iv (gx)") || (device == "CycloneIV(GX)") || (device == "CYCLONEIV(GX)") || (device == "cycloneiv(gx)") || (device == "Cyclone III GX") || (device == "CYCLONE III GX") || (device == "cyclone iii gx") || (device == "CycloneIII GX") || (device == "CYCLONEIII GX") || (device == "cycloneiii gx") || (device == "Cyclone IIIGX") || (device == "CYCLONE IIIGX") || (device == "cyclone iiigx") || (device == "CycloneIIIGX") || (device == "CYCLONEIIIGX") || (device == "cycloneiiigx") || (device == "Cyclone III GL") || (device == "CYCLONE III GL") || (device == "cyclone iii gl") || (device == "CycloneIII GL") || (device == "CYCLONEIII GL") || (device == "cycloneiii gl") || (device == "Cyclone IIIGL") || (device == "CYCLONE IIIGL") || (device == "cyclone iiigl") || (device == "CycloneIIIGL") || (device == "CYCLONEIIIGL") || (device == "cycloneiiigl") || (device == "Stingray") || (device == "STINGRAY") || (device == "stingray"))
    || ((device == "Cyclone V") || (device == "CYCLONE V") || (device == "cyclone v") || (device == "CycloneV") || (device == "CYCLONEV") || (device == "cyclonev") || (device == "Cyclone V (GT/GX/E/SX)") || (device == "CYCLONE V (GT/GX/E/SX)") || (device == "cyclone v (gt/gx/e/sx)") || (device == "CycloneV(GT/GX/E/SX)") || (device == "CYCLONEV(GT/GX/E/SX)") || (device == "cyclonev(gt/gx/e/sx)") || (device == "Cyclone V (E/GX/GT/SX/SE/ST)") || (device == "CYCLONE V (E/GX/GT/SX/SE/ST)") || (device == "cyclone v (e/gx/gt/sx/se/st)") || (device == "CycloneV(E/GX/GT/SX/SE/ST)") || (device == "CYCLONEV(E/GX/GT/SX/SE/ST)") || (device == "cyclonev(e/gx/gt/sx/se/st)") || (device == "Cyclone V (E)") || (device == "CYCLONE V (E)") || (device == "cyclone v (e)") || (device == "CycloneV(E)") || (device == "CYCLONEV(E)") || (device == "cyclonev(e)") || (device == "Cyclone V (GX)") || (device == "CYCLONE V (GX)") || (device == "cyclone v (gx)") || (device == "CycloneV(GX)") || (device == "CYCLONEV(GX)") || (device == "cyclonev(gx)") || (device == "Cyclone V (GT)") || (device == "CYCLONE V (GT)") || (device == "cyclone v (gt)") || (device == "CycloneV(GT)") || (device == "CYCLONEV(GT)") || (device == "cyclonev(gt)") || (device == "Cyclone V (SX)") || (device == "CYCLONE V (SX)") || (device == "cyclone v (sx)") || (device == "CycloneV(SX)") || (device == "CYCLONEV(SX)") || (device == "cyclonev(sx)") || (device == "Cyclone V (SE)") || (device == "CYCLONE V (SE)") || (device == "cyclone v (se)") || (device == "CycloneV(SE)") || (device == "CYCLONEV(SE)") || (device == "cyclonev(se)") || (device == "Cyclone V (ST)") || (device == "CYCLONE V (ST)") || (device == "cyclone v (st)") || (device == "CycloneV(ST)") || (device == "CYCLONEV(ST)") || (device == "cyclonev(st)"))
    || ((device == "Cyclone") || (device == "CYCLONE") || (device == "cyclone") || (device == "ACEX2K") || (device == "acex2k") || (device == "ACEX 2K") || (device == "acex 2k") || (device == "Tornado") || (device == "TORNADO") || (device == "tornado"))
    || ((device == "HardCopy II") || (device == "HARDCOPY II") || (device == "hardcopy ii") || (device == "HardCopyII") || (device == "HARDCOPYII") || (device == "hardcopyii") || (device == "Fusion") || (device == "FUSION") || (device == "fusion"))
    || ((device == "HardCopy III") || (device == "HARDCOPY III") || (device == "hardcopy iii") || (device == "HardCopyIII") || (device == "HARDCOPYIII") || (device == "hardcopyiii") || (device == "HCX") || (device == "hcx"))
    || ((device == "HardCopy IV") || (device == "HARDCOPY IV") || (device == "hardcopy iv") || (device == "HardCopyIV") || (device == "HARDCOPYIV") || (device == "hardcopyiv") || (device == "HardCopy IV (GX)") || (device == "HARDCOPY IV (GX)") || (device == "hardcopy iv (gx)") || (device == "HardCopy IV (E)") || (device == "HARDCOPY IV (E)") || (device == "hardcopy iv (e)") || (device == "HardCopyIV(GX)") || (device == "HARDCOPYIV(GX)") || (device == "hardcopyiv(gx)") || (device == "HardCopyIV(E)") || (device == "HARDCOPYIV(E)") || (device == "hardcopyiv(e)") || (device == "HCXIV") || (device == "hcxiv") || (device == "HardCopy IV (GX/E)") || (device == "HARDCOPY IV (GX/E)") || (device == "hardcopy iv (gx/e)") || (device == "HardCopy IV (E/GX)") || (device == "HARDCOPY IV (E/GX)") || (device == "hardcopy iv (e/gx)") || (device == "HardCopyIV(GX/E)") || (device == "HARDCOPYIV(GX/E)") || (device == "hardcopyiv(gx/e)") || (device == "HardCopyIV(E/GX)") || (device == "HARDCOPYIV(E/GX)") || (device == "hardcopyiv(e/gx)"))
    || ((device == "MAX 10") || (device == "max 10") || (device == "MAX 10 FPGA") || (device == "max 10 fpga") || (device == "Zippleback") || (device == "ZIPPLEBACK") || (device == "zippleback") || (device == "MAX10") || (device == "max10") || (device == "MAX 10 (DA/DF/DC/SA/SC)") || (device == "max 10 (da/df/dc/sa/sc)") || (device == "MAX10(DA/DF/DC/SA/SC)") || (device == "max10(da/df/dc/sa/sc)") || (device == "MAX 10 (DA)") || (device == "max 10 (da)") || (device == "MAX10(DA)") || (device == "max10(da)") || (device == "MAX 10 (DF)") || (device == "max 10 (df)") || (device == "MAX10(DF)") || (device == "max10(df)") || (device == "MAX 10 (DC)") || (device == "max 10 (dc)") || (device == "MAX10(DC)") || (device == "max10(dc)") || (device == "MAX 10 (SA)") || (device == "max 10 (sa)") || (device == "MAX10(SA)") || (device == "max10(sa)") || (device == "MAX 10 (SC)") || (device == "max 10 (sc)") || (device == "MAX10(SC)") || (device == "max10(sc)"))
    || ((device == "MAX II") || (device == "max ii") || (device == "MAXII") || (device == "maxii") || (device == "Tsunami") || (device == "TSUNAMI") || (device == "tsunami"))
    || ((device == "MAX V") || (device == "max v") || (device == "MAXV") || (device == "maxv") || (device == "Jade") || (device == "JADE") || (device == "jade"))
    || ((device == "MAX3000A") || (device == "max3000a") || (device == "MAX 3000A") || (device == "max 3000a"))
    || ((device == "MAX7000A") || (device == "max7000a") || (device == "MAX 7000A") || (device == "max 7000a"))
    || ((device == "MAX7000AE") || (device == "max7000ae") || (device == "MAX 7000AE") || (device == "max 7000ae"))
    || ((device == "MAX7000B") || (device == "max7000b") || (device == "MAX 7000B") || (device == "max 7000b"))
    || ((device == "MAX7000S") || (device == "max7000s") || (device == "MAX 7000S") || (device == "max 7000s"))
    || ((device == "Stratix 10") || (device == "STRATIX 10") || (device == "stratix 10") || (device == "Stratix10") || (device == "STRATIX10") || (device == "stratix10") || (device == "nadder") || (device == "NADDER") || (device == "Stratix 10 (GX/SX)") || (device == "STRATIX 10 (GX/SX)") || (device == "stratix 10 (gx/sx)") || (device == "Stratix10(GX/SX)") || (device == "STRATIX10(GX/SX)") || (device == "stratix10(gx/sx)") || (device == "Stratix 10 (GX)") || (device == "STRATIX 10 (GX)") || (device == "stratix 10 (gx)") || (device == "Stratix10(GX)") || (device == "STRATIX10(GX)") || (device == "stratix10(gx)") || (device == "Stratix 10 (SX)") || (device == "STRATIX 10 (SX)") || (device == "stratix 10 (sx)") || (device == "Stratix10(SX)") || (device == "STRATIX10(SX)") || (device == "stratix10(sx)"))
    || ((device == "Stratix GX") || (device == "STRATIX GX") || (device == "stratix gx") || (device == "Stratix-GX") || (device == "STRATIX-GX") || (device == "stratix-gx") || (device == "StratixGX") || (device == "STRATIXGX") || (device == "stratixgx") || (device == "Aurora") || (device == "AURORA") || (device == "aurora"))
    || ((device == "Stratix II GX") || (device == "STRATIX II GX") || (device == "stratix ii gx") || (device == "StratixIIGX") || (device == "STRATIXIIGX") || (device == "stratixiigx"))
    || ((device == "Stratix II") || (device == "STRATIX II") || (device == "stratix ii") || (device == "StratixII") || (device == "STRATIXII") || (device == "stratixii") || (device == "Armstrong") || (device == "ARMSTRONG") || (device == "armstrong"))
    || ((device == "Stratix III") || (device == "STRATIX III") || (device == "stratix iii") || (device == "StratixIII") || (device == "STRATIXIII") || (device == "stratixiii") || (device == "Titan") || (device == "TITAN") || (device == "titan") || (device == "SIII") || (device == "siii"))
    || ((device == "Stratix IV") || (device == "STRATIX IV") || (device == "stratix iv") || (device == "TGX") || (device == "tgx") || (device == "StratixIV") || (device == "STRATIXIV") || (device == "stratixiv") || (device == "Stratix IV (GT)") || (device == "STRATIX IV (GT)") || (device == "stratix iv (gt)") || (device == "Stratix IV (GX)") || (device == "STRATIX IV (GX)") || (device == "stratix iv (gx)") || (device == "Stratix IV (E)") || (device == "STRATIX IV (E)") || (device == "stratix iv (e)") || (device == "StratixIV(GT)") || (device == "STRATIXIV(GT)") || (device == "stratixiv(gt)") || (device == "StratixIV(GX)") || (device == "STRATIXIV(GX)") || (device == "stratixiv(gx)") || (device == "StratixIV(E)") || (device == "STRATIXIV(E)") || (device == "stratixiv(e)") || (device == "StratixIIIGX") || (device == "STRATIXIIIGX") || (device == "stratixiiigx") || (device == "Stratix IV (GT/GX/E)") || (device == "STRATIX IV (GT/GX/E)") || (device == "stratix iv (gt/gx/e)") || (device == "Stratix IV (GT/E/GX)") || (device == "STRATIX IV (GT/E/GX)") || (device == "stratix iv (gt/e/gx)") || (device == "Stratix IV (E/GT/GX)") || (device == "STRATIX IV (E/GT/GX)") || (device == "stratix iv (e/gt/gx)") || (device == "Stratix IV (E/GX/GT)") || (device == "STRATIX IV (E/GX/GT)") || (device == "stratix iv (e/gx/gt)") || (device == "StratixIV(GT/GX/E)") || (device == "STRATIXIV(GT/GX/E)") || (device == "stratixiv(gt/gx/e)") || (device == "StratixIV(GT/E/GX)") || (device == "STRATIXIV(GT/E/GX)") || (device == "stratixiv(gt/e/gx)") || (device == "StratixIV(E/GX/GT)") || (device == "STRATIXIV(E/GX/GT)") || (device == "stratixiv(e/gx/gt)") || (device == "StratixIV(E/GT/GX)") || (device == "STRATIXIV(E/GT/GX)") || (device == "stratixiv(e/gt/gx)") || (device == "Stratix IV (GX/E)") || (device == "STRATIX IV (GX/E)") || (device == "stratix iv (gx/e)") || (device == "StratixIV(GX/E)") || (device == "STRATIXIV(GX/E)") || (device == "stratixiv(gx/e)"))
    || ((device == "Stratix V") || (device == "STRATIX V") || (device == "stratix v") || (device == "StratixV") || (device == "STRATIXV") || (device == "stratixv") || (device == "Stratix V (GS)") || (device == "STRATIX V (GS)") || (device == "stratix v (gs)") || (device == "StratixV(GS)") || (device == "STRATIXV(GS)") || (device == "stratixv(gs)") || (device == "Stratix V (GT)") || (device == "STRATIX V (GT)") || (device == "stratix v (gt)") || (device == "StratixV(GT)") || (device == "STRATIXV(GT)") || (device == "stratixv(gt)") || (device == "Stratix V (GX)") || (device == "STRATIX V (GX)") || (device == "stratix v (gx)") || (device == "StratixV(GX)") || (device == "STRATIXV(GX)") || (device == "stratixv(gx)") || (device == "Stratix V (GS/GX)") || (device == "STRATIX V (GS/GX)") || (device == "stratix v (gs/gx)") || (device == "StratixV(GS/GX)") || (device == "STRATIXV(GS/GX)") || (device == "stratixv(gs/gx)") || (device == "Stratix V (GS/GT)") || (device == "STRATIX V (GS/GT)") || (device == "stratix v (gs/gt)") || (device == "StratixV(GS/GT)") || (device == "STRATIXV(GS/GT)") || (device == "stratixv(gs/gt)") || (device == "Stratix V (GT/GX)") || (device == "STRATIX V (GT/GX)") || (device == "stratix v (gt/gx)") || (device == "StratixV(GT/GX)") || (device == "STRATIXV(GT/GX)") || (device == "stratixv(gt/gx)") || (device == "Stratix V (GX/GS)") || (device == "STRATIX V (GX/GS)") || (device == "stratix v (gx/gs)") || (device == "StratixV(GX/GS)") || (device == "STRATIXV(GX/GS)") || (device == "stratixv(gx/gs)") || (device == "Stratix V (GT/GS)") || (device == "STRATIX V (GT/GS)") || (device == "stratix v (gt/gs)") || (device == "StratixV(GT/GS)") || (device == "STRATIXV(GT/GS)") || (device == "stratixv(gt/gs)") || (device == "Stratix V (GX/GT)") || (device == "STRATIX V (GX/GT)") || (device == "stratix v (gx/gt)") || (device == "StratixV(GX/GT)") || (device == "STRATIXV(GX/GT)") || (device == "stratixv(gx/gt)") || (device == "Stratix V (GS/GT/GX)") || (device == "STRATIX V (GS/GT/GX)") || (device == "stratix v (gs/gt/gx)") || (device == "Stratix V (GS/GX/GT)") || (device == "STRATIX V (GS/GX/GT)") || (device == "stratix v (gs/gx/gt)") || (device == "Stratix V (GT/GS/GX)") || (device == "STRATIX V (GT/GS/GX)") || (device == "stratix v (gt/gs/gx)") || (device == "Stratix V (GT/GX/GS)") || (device == "STRATIX V (GT/GX/GS)") || (device == "stratix v (gt/gx/gs)") || (device == "Stratix V (GX/GS/GT)") || (device == "STRATIX V (GX/GS/GT)") || (device == "stratix v (gx/gs/gt)") || (device == "Stratix V (GX/GT/GS)") || (device == "STRATIX V (GX/GT/GS)") || (device == "stratix v (gx/gt/gs)") || (device == "StratixV(GS/GT/GX)") || (device == "STRATIXV(GS/GT/GX)") || (device == "stratixv(gs/gt/gx)") || (device == "StratixV(GS/GX/GT)") || (device == "STRATIXV(GS/GX/GT)") || (device == "stratixv(gs/gx/gt)") || (device == "StratixV(GT/GS/GX)") || (device == "STRATIXV(GT/GS/GX)") || (device == "stratixv(gt/gs/gx)") || (device == "StratixV(GT/GX/GS)") || (device == "STRATIXV(GT/GX/GS)") || (device == "stratixv(gt/gx/gs)") || (device == "StratixV(GX/GS/GT)") || (device == "STRATIXV(GX/GS/GT)") || (device == "stratixv(gx/gs/gt)") || (device == "StratixV(GX/GT/GS)") || (device == "STRATIXV(GX/GT/GS)") || (device == "stratixv(gx/gt/gs)") || (device == "Stratix V (GS/GT/GX/E)") || (device == "STRATIX V (GS/GT/GX/E)") || (device == "stratix v (gs/gt/gx/e)") || (device == "StratixV(GS/GT/GX/E)") || (device == "STRATIXV(GS/GT/GX/E)") || (device == "stratixv(gs/gt/gx/e)") || (device == "Stratix V (E)") || (device == "STRATIX V (E)") || (device == "stratix v (e)") || (device == "StratixV(E)") || (device == "STRATIXV(E)") || (device == "stratixv(e)"))
    || ((device == "Stratix") || (device == "STRATIX") || (device == "stratix") || (device == "Yeager") || (device == "YEAGER") || (device == "yeager"))
    || ((device == "eFPGA 28 HPM") || (device == "EFPGA 28 HPM") || (device == "efpga 28 hpm") || (device == "eFPGA28HPM") || (device == "EFPGA28HPM") || (device == "efpga28hpm") || (device == "Bedrock") || (device == "BEDROCK") || (device == "bedrock")))
        is_valid = 1;
    else
        is_valid = 0;

    IS_VALID_FAMILY = is_valid;
end
endfunction // IS_VALID_FAMILY


endmodule // ALTERA_DEVICE_FAMILIES

