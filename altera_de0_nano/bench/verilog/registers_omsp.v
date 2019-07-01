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
// *File Name: registers.v
//
// *Module Description:
//                      Direct connections to internal registers & memory.
//
//
// *Author(s):
//              - Olivier Girard,    olgirard@gmail.com
//
//----------------------------------------------------------------------------
// $Rev: 143 $
// $LastChangedBy: olivier.girard $
// $LastChangedDate: 2012-05-09 22:20:03 +0200 (Wed, 09 May 2012) $
//----------------------------------------------------------------------------

// CPU registers
//======================

wire       [15:0] omsp_r0     = dut.openmsp430_0.execution_unit_0.register_file_0.r0;
wire       [15:0] omsp_r1     = dut.openmsp430_0.execution_unit_0.register_file_0.r1;
wire       [15:0] omsp_r2     = dut.openmsp430_0.execution_unit_0.register_file_0.r2;
wire       [15:0] omsp_r3     = dut.openmsp430_0.execution_unit_0.register_file_0.r3;
wire       [15:0] omsp_r4     = dut.openmsp430_0.execution_unit_0.register_file_0.r4;
wire       [15:0] omsp_r5     = dut.openmsp430_0.execution_unit_0.register_file_0.r5;
wire       [15:0] omsp_r6     = dut.openmsp430_0.execution_unit_0.register_file_0.r6;
wire       [15:0] omsp_r7     = dut.openmsp430_0.execution_unit_0.register_file_0.r7;
wire       [15:0] omsp_r8     = dut.openmsp430_0.execution_unit_0.register_file_0.r8;
wire       [15:0] omsp_r9     = dut.openmsp430_0.execution_unit_0.register_file_0.r9;
wire       [15:0] omsp_r10    = dut.openmsp430_0.execution_unit_0.register_file_0.r10;
wire       [15:0] omsp_r11    = dut.openmsp430_0.execution_unit_0.register_file_0.r11;
wire       [15:0] omsp_r12    = dut.openmsp430_0.execution_unit_0.register_file_0.r12;
wire       [15:0] omsp_r13    = dut.openmsp430_0.execution_unit_0.register_file_0.r13;
wire       [15:0] omsp_r14    = dut.openmsp430_0.execution_unit_0.register_file_0.r14;
wire       [15:0] omsp_r15    = dut.openmsp430_0.execution_unit_0.register_file_0.r15;


// Data Memory cells
//======================

wire       [15:0] omsp_mem200 = dut.pmem_0.altsyncram_component.mem_data[0];
wire       [15:0] omsp_mem202 = dut.pmem_0.altsyncram_component.mem_data[1];
wire       [15:0] omsp_mem204 = dut.pmem_0.altsyncram_component.mem_data[2];
wire       [15:0] omsp_mem206 = dut.pmem_0.altsyncram_component.mem_data[3];
wire       [15:0] omsp_mem208 = dut.pmem_0.altsyncram_component.mem_data[4];
wire       [15:0] omsp_mem20A = dut.pmem_0.altsyncram_component.mem_data[5];
wire       [15:0] omsp_mem20C = dut.pmem_0.altsyncram_component.mem_data[6];
wire       [15:0] omsp_mem20E = dut.pmem_0.altsyncram_component.mem_data[7];
wire       [15:0] omsp_mem210 = dut.pmem_0.altsyncram_component.mem_data[8];
wire       [15:0] omsp_mem212 = dut.pmem_0.altsyncram_component.mem_data[9];
wire       [15:0] omsp_mem214 = dut.pmem_0.altsyncram_component.mem_data[10];
wire       [15:0] omsp_mem216 = dut.pmem_0.altsyncram_component.mem_data[11];
wire       [15:0] omsp_mem218 = dut.pmem_0.altsyncram_component.mem_data[12];
wire       [15:0] omsp_mem21A = dut.pmem_0.altsyncram_component.mem_data[13];
wire       [15:0] omsp_mem21C = dut.pmem_0.altsyncram_component.mem_data[14];
wire       [15:0] omsp_mem21E = dut.pmem_0.altsyncram_component.mem_data[15];
wire       [15:0] omsp_mem220 = dut.pmem_0.altsyncram_component.mem_data[16];
wire       [15:0] omsp_mem222 = dut.pmem_0.altsyncram_component.mem_data[17];
wire       [15:0] omsp_mem224 = dut.pmem_0.altsyncram_component.mem_data[18];
wire       [15:0] omsp_mem226 = dut.pmem_0.altsyncram_component.mem_data[19];
wire       [15:0] omsp_mem228 = dut.pmem_0.altsyncram_component.mem_data[20];
wire       [15:0] omsp_mem22A = dut.pmem_0.altsyncram_component.mem_data[21];
wire       [15:0] omsp_mem22C = dut.pmem_0.altsyncram_component.mem_data[22];
wire       [15:0] omsp_mem22E = dut.pmem_0.altsyncram_component.mem_data[23];
wire       [15:0] omsp_mem230 = dut.pmem_0.altsyncram_component.mem_data[24];
wire       [15:0] omsp_mem232 = dut.pmem_0.altsyncram_component.mem_data[25];
wire       [15:0] omsp_mem234 = dut.pmem_0.altsyncram_component.mem_data[26];
wire       [15:0] omsp_mem236 = dut.pmem_0.altsyncram_component.mem_data[27];
wire       [15:0] omsp_mem238 = dut.pmem_0.altsyncram_component.mem_data[28];
wire       [15:0] omsp_mem23A = dut.pmem_0.altsyncram_component.mem_data[29];
wire       [15:0] omsp_mem23C = dut.pmem_0.altsyncram_component.mem_data[30];
wire       [15:0] omsp_mem23E = dut.pmem_0.altsyncram_component.mem_data[31];
wire       [15:0] omsp_mem240 = dut.pmem_0.altsyncram_component.mem_data[32];
wire       [15:0] omsp_mem242 = dut.pmem_0.altsyncram_component.mem_data[33];
wire       [15:0] omsp_mem244 = dut.pmem_0.altsyncram_component.mem_data[34];
wire       [15:0] omsp_mem246 = dut.pmem_0.altsyncram_component.mem_data[35];
wire       [15:0] omsp_mem248 = dut.pmem_0.altsyncram_component.mem_data[36];
wire       [15:0] omsp_mem24A = dut.pmem_0.altsyncram_component.mem_data[37];
wire       [15:0] omsp_mem24C = dut.pmem_0.altsyncram_component.mem_data[38];
wire       [15:0] omsp_mem24E = dut.pmem_0.altsyncram_component.mem_data[39];
wire       [15:0] omsp_mem250 = dut.pmem_0.altsyncram_component.mem_data[40];
wire       [15:0] omsp_mem252 = dut.pmem_0.altsyncram_component.mem_data[41];
wire       [15:0] omsp_mem254 = dut.pmem_0.altsyncram_component.mem_data[42];
wire       [15:0] omsp_mem256 = dut.pmem_0.altsyncram_component.mem_data[43];
wire       [15:0] omsp_mem258 = dut.pmem_0.altsyncram_component.mem_data[44];
wire       [15:0] omsp_mem25A = dut.pmem_0.altsyncram_component.mem_data[45];
wire       [15:0] omsp_mem25C = dut.pmem_0.altsyncram_component.mem_data[46];
wire       [15:0] omsp_mem25E = dut.pmem_0.altsyncram_component.mem_data[47];
wire       [15:0] omsp_mem260 = dut.pmem_0.altsyncram_component.mem_data[48];
wire       [15:0] omsp_mem262 = dut.pmem_0.altsyncram_component.mem_data[49];
wire       [15:0] omsp_mem264 = dut.pmem_0.altsyncram_component.mem_data[50];
wire       [15:0] omsp_mem266 = dut.pmem_0.altsyncram_component.mem_data[51];
wire       [15:0] omsp_mem268 = dut.pmem_0.altsyncram_component.mem_data[52];
wire       [15:0] omsp_mem26A = dut.pmem_0.altsyncram_component.mem_data[53];
wire       [15:0] omsp_mem26C = dut.pmem_0.altsyncram_component.mem_data[54];
wire       [15:0] omsp_mem26E = dut.pmem_0.altsyncram_component.mem_data[55];
wire       [15:0] omsp_mem270 = dut.pmem_0.altsyncram_component.mem_data[56];
wire       [15:0] omsp_mem272 = dut.pmem_0.altsyncram_component.mem_data[57];
wire       [15:0] omsp_mem274 = dut.pmem_0.altsyncram_component.mem_data[58];
wire       [15:0] omsp_mem276 = dut.pmem_0.altsyncram_component.mem_data[59];
wire       [15:0] omsp_mem278 = dut.pmem_0.altsyncram_component.mem_data[60];
wire       [15:0] omsp_mem27A = dut.pmem_0.altsyncram_component.mem_data[61];
wire       [15:0] omsp_mem27C = dut.pmem_0.altsyncram_component.mem_data[62];
wire       [15:0] omsp_mem27E = dut.pmem_0.altsyncram_component.mem_data[63];
wire       [15:0] omsp_mem280 = dut.pmem_0.altsyncram_component.mem_data[64];

wire       [15:0] omsp_dmem4000 = dut.dmem_0.altsyncram_component.mem_data[0];
wire       [15:0] omsp_dmem4002 = dut.dmem_0.altsyncram_component.mem_data[1];
wire       [15:0] omsp_dmem4004 = dut.dmem_0.altsyncram_component.mem_data[2];
wire       [15:0] omsp_dmem4006 = dut.dmem_0.altsyncram_component.mem_data[3];
wire       [15:0] omsp_dmem4008 = dut.dmem_0.altsyncram_component.mem_data[4];
wire       [15:0] omsp_dmem400A = dut.dmem_0.altsyncram_component.mem_data[5];
wire       [15:0] omsp_dmem400C = dut.dmem_0.altsyncram_component.mem_data[6];
wire       [15:0] omsp_dmem400E = dut.dmem_0.altsyncram_component.mem_data[7];
wire       [15:0] omsp_dmem4010 = dut.dmem_0.altsyncram_component.mem_data[8];
wire       [15:0] omsp_dmem4012 = dut.dmem_0.altsyncram_component.mem_data[9];
wire       [15:0] omsp_dmem4014 = dut.dmem_0.altsyncram_component.mem_data[10];
wire       [15:0] omsp_dmem4016 = dut.dmem_0.altsyncram_component.mem_data[11];
wire       [15:0] omsp_dmem4018 = dut.dmem_0.altsyncram_component.mem_data[12];
wire       [15:0] omsp_dmem401A = dut.dmem_0.altsyncram_component.mem_data[13];
wire       [15:0] omsp_dmem401C = dut.dmem_0.altsyncram_component.mem_data[14];
wire       [15:0] omsp_dmem401E = dut.dmem_0.altsyncram_component.mem_data[15];
wire       [15:0] omsp_dmem4020 = dut.dmem_0.altsyncram_component.mem_data[16];
wire       [15:0] omsp_dmem4022 = dut.dmem_0.altsyncram_component.mem_data[17];
wire       [15:0] omsp_dmem4024 = dut.dmem_0.altsyncram_component.mem_data[18];
wire       [15:0] omsp_dmem4026 = dut.dmem_0.altsyncram_component.mem_data[19];
wire       [15:0] omsp_dmem4028 = dut.dmem_0.altsyncram_component.mem_data[20];
wire       [15:0] omsp_dmem402A = dut.dmem_0.altsyncram_component.mem_data[21];
wire       [15:0] omsp_dmem402C = dut.dmem_0.altsyncram_component.mem_data[22];
wire       [15:0] omsp_dmem402E = dut.dmem_0.altsyncram_component.mem_data[23];
wire       [15:0] omsp_dmem4030 = dut.dmem_0.altsyncram_component.mem_data[24];
wire       [15:0] omsp_dmem4032 = dut.dmem_0.altsyncram_component.mem_data[25];
wire       [15:0] omsp_dmem4034 = dut.dmem_0.altsyncram_component.mem_data[26];
wire       [15:0] omsp_dmem4036 = dut.dmem_0.altsyncram_component.mem_data[27];
wire       [15:0] omsp_dmem4038 = dut.dmem_0.altsyncram_component.mem_data[28];
wire       [15:0] omsp_dmem403A = dut.dmem_0.altsyncram_component.mem_data[29];
wire       [15:0] omsp_dmem403C = dut.dmem_0.altsyncram_component.mem_data[30];
wire       [15:0] omsp_dmem403E = dut.dmem_0.altsyncram_component.mem_data[31];
wire       [15:0] omsp_dmem4040 = dut.dmem_0.altsyncram_component.mem_data[32];

wire       [15:0] omsp_dmem4050 = dut.dmem_0.altsyncram_component.mem_data[40];
wire       [15:0] omsp_dmem4060 = dut.dmem_0.altsyncram_component.mem_data[48];
wire       [15:0] omsp_dmem4070 = dut.dmem_0.altsyncram_component.mem_data[56];
wire       [15:0] omsp_dmem4080 = dut.dmem_0.altsyncram_component.mem_data[64];
wire       [15:0] omsp_dmem4090 = dut.dmem_0.altsyncram_component.mem_data[72];
wire       [15:0] omsp_dmem40A0 = dut.dmem_0.altsyncram_component.mem_data[80];
wire       [15:0] omsp_dmem40B0 = dut.dmem_0.altsyncram_component.mem_data[88];
wire       [15:0] omsp_dmem40C0 = dut.dmem_0.altsyncram_component.mem_data[96];
wire       [15:0] omsp_dmem40D0 = dut.dmem_0.altsyncram_component.mem_data[104];
wire       [15:0] omsp_dmem40D2 = dut.dmem_0.altsyncram_component.mem_data[105];
wire       [15:0] omsp_dmem40D4 = dut.dmem_0.altsyncram_component.mem_data[106];
wire       [15:0] omsp_dmem40D6 = dut.dmem_0.altsyncram_component.mem_data[107];
wire       [15:0] omsp_dmem40D8 = dut.dmem_0.altsyncram_component.mem_data[108];
wire       [15:0] omsp_dmem40DA = dut.dmem_0.altsyncram_component.mem_data[109];
wire       [15:0] omsp_dmem40DC = dut.dmem_0.altsyncram_component.mem_data[110];
wire       [15:0] omsp_dmem40DE = dut.dmem_0.altsyncram_component.mem_data[111];
wire       [15:0] omsp_dmem40E0 = dut.dmem_0.altsyncram_component.mem_data[112];
wire       [15:0] omsp_dmem40E2 = dut.dmem_0.altsyncram_component.mem_data[113];
wire       [15:0] omsp_dmem40E4 = dut.dmem_0.altsyncram_component.mem_data[114];
wire       [15:0] omsp_dmem40E6 = dut.dmem_0.altsyncram_component.mem_data[115];
wire       [15:0] omsp_dmem40E8 = dut.dmem_0.altsyncram_component.mem_data[116];
wire       [15:0] omsp_dmem40EA = dut.dmem_0.altsyncram_component.mem_data[117];
wire       [15:0] omsp_dmem40EC = dut.dmem_0.altsyncram_component.mem_data[118];
wire       [15:0] omsp_dmem40EE = dut.dmem_0.altsyncram_component.mem_data[119];
wire       [15:0] omsp_dmem40F0 = dut.dmem_0.altsyncram_component.mem_data[120];
wire       [15:0] omsp_dmem40F2 = dut.dmem_0.altsyncram_component.mem_data[121];
wire       [15:0] omsp_dmem40F4 = dut.dmem_0.altsyncram_component.mem_data[122];
wire       [15:0] omsp_dmem40F6 = dut.dmem_0.altsyncram_component.mem_data[123];
wire       [15:0] omsp_dmem40F8 = dut.dmem_0.altsyncram_component.mem_data[124];
wire       [15:0] omsp_dmem40FA = dut.dmem_0.altsyncram_component.mem_data[125];
wire       [15:0] omsp_dmem40FC = dut.dmem_0.altsyncram_component.mem_data[126];
wire       [15:0] omsp_dmem40FE = dut.dmem_0.altsyncram_component.mem_data[127];
wire       [15:0] omsp_dmem4100 = dut.dmem_0.altsyncram_component.mem_data[128];
wire       [15:0] omsp_dmem4102 = dut.dmem_0.altsyncram_component.mem_data[129];
wire       [15:0] omsp_dmem4104 = dut.dmem_0.altsyncram_component.mem_data[130];
wire       [15:0] omsp_dmem4106 = dut.dmem_0.altsyncram_component.mem_data[131];
wire       [15:0] omsp_dmem4108 = dut.dmem_0.altsyncram_component.mem_data[132];
wire       [15:0] omsp_dmem410A = dut.dmem_0.altsyncram_component.mem_data[133];
wire       [15:0] omsp_dmem410C = dut.dmem_0.altsyncram_component.mem_data[134];
wire       [15:0] omsp_dmem410E = dut.dmem_0.altsyncram_component.mem_data[135];
wire       [15:0] omsp_dmem4110 = dut.dmem_0.altsyncram_component.mem_data[136];
wire       [15:0] omsp_dmem4112 = dut.dmem_0.altsyncram_component.mem_data[137];
wire       [15:0] omsp_dmem4114 = dut.dmem_0.altsyncram_component.mem_data[138];
wire       [15:0] omsp_dmem4116 = dut.dmem_0.altsyncram_component.mem_data[139];
wire       [15:0] omsp_dmem4118 = dut.dmem_0.altsyncram_component.mem_data[140];

wire       [15:0] omsp_dmem6000 = dut.dmem_0.altsyncram_component.mem_data[4096];
wire       [15:0] omsp_dmem6002 = dut.dmem_0.altsyncram_component.mem_data[4097];
wire       [15:0] omsp_dmem6004 = dut.dmem_0.altsyncram_component.mem_data[4098];
wire       [15:0] omsp_dmem6006 = dut.dmem_0.altsyncram_component.mem_data[4099];
wire       [15:0] omsp_dmem6008 = dut.dmem_0.altsyncram_component.mem_data[4100];
wire       [15:0] omsp_dmem600A = dut.dmem_0.altsyncram_component.mem_data[4101];
wire       [15:0] omsp_dmem600C = dut.dmem_0.altsyncram_component.mem_data[4102];
wire       [15:0] omsp_dmem600E = dut.dmem_0.altsyncram_component.mem_data[4103];


wire       [15:0] omsp_dmem6075 = dut.dmem_0.altsyncram_component.mem_data[4154];
wire       [15:0] omsp_dmem6076 = dut.dmem_0.altsyncram_component.mem_data[4155];
wire       [15:0] omsp_dmem6078 = dut.dmem_0.altsyncram_component.mem_data[4156];


wire       [15:0] omsp_dmem7FAE = dut.dmem_0.altsyncram_component.mem_data[8151];
wire       [15:0] omsp_dmem7FB0 = dut.dmem_0.altsyncram_component.mem_data[8152];
wire       [15:0] omsp_dmem7FB2 = dut.dmem_0.altsyncram_component.mem_data[8153];
wire       [15:0] omsp_dmem7FB4 = dut.dmem_0.altsyncram_component.mem_data[8154];
wire       [15:0] omsp_dmem7FB6 = dut.dmem_0.altsyncram_component.mem_data[8155];
wire       [15:0] omsp_dmem7FB8 = dut.dmem_0.altsyncram_component.mem_data[8156];
wire       [15:0] omsp_dmem7FBA = dut.dmem_0.altsyncram_component.mem_data[8157];
wire       [15:0] omsp_dmem7FBC = dut.dmem_0.altsyncram_component.mem_data[8158];
wire       [15:0] omsp_dmem7FBE = dut.dmem_0.altsyncram_component.mem_data[8159];

wire       [15:0] omsp_dmem7FC0 = dut.dmem_0.altsyncram_component.mem_data[8160];
wire       [15:0] omsp_dmem7FC2 = dut.dmem_0.altsyncram_component.mem_data[8161];
wire       [15:0] omsp_dmem7FC4 = dut.dmem_0.altsyncram_component.mem_data[8162];
wire       [15:0] omsp_dmem7FC6 = dut.dmem_0.altsyncram_component.mem_data[8163];
wire       [15:0] omsp_dmem7FC8 = dut.dmem_0.altsyncram_component.mem_data[8164];
wire       [15:0] omsp_dmem7FCA = dut.dmem_0.altsyncram_component.mem_data[8165];
wire       [15:0] omsp_dmem7FCC = dut.dmem_0.altsyncram_component.mem_data[8166];
wire       [15:0] omsp_dmem7FCE = dut.dmem_0.altsyncram_component.mem_data[8167];
wire       [15:0] omsp_dmem7FD0 = dut.dmem_0.altsyncram_component.mem_data[8168];
wire       [15:0] omsp_dmem7FD2 = dut.dmem_0.altsyncram_component.mem_data[8169];
wire       [15:0] omsp_dmem7FD4 = dut.dmem_0.altsyncram_component.mem_data[8170];
wire       [15:0] omsp_dmem7FD6 = dut.dmem_0.altsyncram_component.mem_data[8171];
wire       [15:0] omsp_dmem7FD8 = dut.dmem_0.altsyncram_component.mem_data[8172];
wire       [15:0] omsp_dmem7FDA = dut.dmem_0.altsyncram_component.mem_data[8173];
wire       [15:0] omsp_dmem7FDC = dut.dmem_0.altsyncram_component.mem_data[8174];
wire       [15:0] omsp_dmem7FDE = dut.dmem_0.altsyncram_component.mem_data[8175];

wire       [15:0] omsp_dmem7FE0 = dut.dmem_0.altsyncram_component.mem_data[8176];
wire       [15:0] omsp_dmem7FE2 = dut.dmem_0.altsyncram_component.mem_data[8177];


wire       [15:0] omsp_dmem7FE4 = dut.dmem_0.altsyncram_component.mem_data[8178];
wire       [15:0] omsp_dmem7FE6 = dut.dmem_0.altsyncram_component.mem_data[8179];

wire       [15:0] omsp_dmem7FE8 = dut.dmem_0.altsyncram_component.mem_data[8180];
wire       [15:0] omsp_dmem7FEA = dut.dmem_0.altsyncram_component.mem_data[8181];

wire       [15:0] omsp_dmem7FEC = dut.dmem_0.altsyncram_component.mem_data[8182];
wire       [15:0] omsp_dmem7FEE = dut.dmem_0.altsyncram_component.mem_data[8183];
wire       [15:0] omsp_dmem7FF0 = dut.dmem_0.altsyncram_component.mem_data[8184];
wire       [15:0] omsp_dmem7FF2 = dut.dmem_0.altsyncram_component.mem_data[8185];
wire       [15:0] omsp_dmem7FF4 = dut.dmem_0.altsyncram_component.mem_data[8186];
wire       [15:0] omsp_dmem7FF6 = dut.dmem_0.altsyncram_component.mem_data[8187];
wire       [15:0] omsp_dmem7FF8 = dut.dmem_0.altsyncram_component.mem_data[8188];
wire       [15:0] omsp_dmem7FFA = dut.dmem_0.altsyncram_component.mem_data[8189];
wire       [15:0] omsp_dmem7FFC = dut.dmem_0.altsyncram_component.mem_data[8190];
wire       [15:0] omsp_dmem7FFE = dut.dmem_0.altsyncram_component.mem_data[8191];


wire       [15:0] omsp_dmem6FAE = dut.dmem_0.altsyncram_component.mem_data[6103];
wire       [15:0] omsp_dmem6FB0 = dut.dmem_0.altsyncram_component.mem_data[6104];
wire       [15:0] omsp_dmem6FB2 = dut.dmem_0.altsyncram_component.mem_data[6105];
wire       [15:0] omsp_dmem6FB4 = dut.dmem_0.altsyncram_component.mem_data[6106];
wire       [15:0] omsp_dmem6FB6 = dut.dmem_0.altsyncram_component.mem_data[6107];
wire       [15:0] omsp_dmem6FB8 = dut.dmem_0.altsyncram_component.mem_data[6108];
wire       [15:0] omsp_dmem6FBA = dut.dmem_0.altsyncram_component.mem_data[6109];
wire       [15:0] omsp_dmem6FBC = dut.dmem_0.altsyncram_component.mem_data[6110];
wire       [15:0] omsp_dmem6FBE = dut.dmem_0.altsyncram_component.mem_data[6111];
wire       [15:0] omsp_dmem6FC0 = dut.dmem_0.altsyncram_component.mem_data[6112];
wire       [15:0] omsp_dmem6FC2 = dut.dmem_0.altsyncram_component.mem_data[6113];
wire       [15:0] omsp_dmem6FC4 = dut.dmem_0.altsyncram_component.mem_data[6114];
wire       [15:0] omsp_dmem6FC6 = dut.dmem_0.altsyncram_component.mem_data[6115];
wire       [15:0] omsp_dmem6FC8 = dut.dmem_0.altsyncram_component.mem_data[6116];
wire       [15:0] omsp_dmem6FCA = dut.dmem_0.altsyncram_component.mem_data[6117];
wire       [15:0] omsp_dmem6FCC = dut.dmem_0.altsyncram_component.mem_data[6118];
wire       [15:0] omsp_dmem6FCE = dut.dmem_0.altsyncram_component.mem_data[6119];
wire       [15:0] omsp_dmem6FD0 = dut.dmem_0.altsyncram_component.mem_data[6120];
wire       [15:0] omsp_dmem6FD2 = dut.dmem_0.altsyncram_component.mem_data[6121];
wire       [15:0] omsp_dmem6FD4 = dut.dmem_0.altsyncram_component.mem_data[6122];
wire       [15:0] omsp_dmem6FD6 = dut.dmem_0.altsyncram_component.mem_data[6123];
wire       [15:0] omsp_dmem6FD8 = dut.dmem_0.altsyncram_component.mem_data[6124];
wire       [15:0] omsp_dmem6FDA = dut.dmem_0.altsyncram_component.mem_data[6125];
wire       [15:0] omsp_dmem6FDC = dut.dmem_0.altsyncram_component.mem_data[6126];
wire       [15:0] omsp_dmem6FDE = dut.dmem_0.altsyncram_component.mem_data[6127];
wire       [15:0] omsp_dmem6FE0 = dut.dmem_0.altsyncram_component.mem_data[6128];
wire       [15:0] omsp_dmem6FE2 = dut.dmem_0.altsyncram_component.mem_data[6129];
wire       [15:0] omsp_dmem6FE4 = dut.dmem_0.altsyncram_component.mem_data[6130];
wire       [15:0] omsp_dmem6FE6 = dut.dmem_0.altsyncram_component.mem_data[6131];
wire       [15:0] omsp_dmem6FE8 = dut.dmem_0.altsyncram_component.mem_data[6132];
wire       [15:0] omsp_dmem6FEA = dut.dmem_0.altsyncram_component.mem_data[6133];
wire       [15:0] omsp_dmem6FEC = dut.dmem_0.altsyncram_component.mem_data[6134];
wire       [15:0] omsp_dmem6FEE = dut.dmem_0.altsyncram_component.mem_data[6135];
wire       [15:0] omsp_dmem6FF0 = dut.dmem_0.altsyncram_component.mem_data[6136];
wire       [15:0] omsp_dmem6FF2 = dut.dmem_0.altsyncram_component.mem_data[6137];
wire       [15:0] omsp_dmem6FF4 = dut.dmem_0.altsyncram_component.mem_data[6138];
wire       [15:0] omsp_dmem6FF6 = dut.dmem_0.altsyncram_component.mem_data[6139];
wire       [15:0] omsp_dmem6FF8 = dut.dmem_0.altsyncram_component.mem_data[6140];
wire       [15:0] omsp_dmem6FFA = dut.dmem_0.altsyncram_component.mem_data[6141];
wire       [15:0] omsp_dmem6FFC = dut.dmem_0.altsyncram_component.mem_data[6142];
wire       [15:0] omsp_dmem6FFE = dut.dmem_0.altsyncram_component.mem_data[6143];
wire       [15:0] omsp_dmem7000 = dut.dmem_0.altsyncram_component.mem_data[6144];



wire       [15:0] omsp_dmem6BE0 = dut.dmem_0.altsyncram_component.mem_data[5616];
wire       [15:0] omsp_dmem6BE2 = dut.dmem_0.altsyncram_component.mem_data[5617];
wire       [15:0] omsp_dmem6BE4 = dut.dmem_0.altsyncram_component.mem_data[5618];
wire       [15:0] omsp_dmem6BE6 = dut.dmem_0.altsyncram_component.mem_data[5619];
wire       [15:0] omsp_dmem6BE8 = dut.dmem_0.altsyncram_component.mem_data[5620];
wire       [15:0] omsp_dmem6BEA = dut.dmem_0.altsyncram_component.mem_data[5621];
wire       [15:0] omsp_dmem6BEC = dut.dmem_0.altsyncram_component.mem_data[5622];
wire       [15:0] omsp_dmem6BEE = dut.dmem_0.altsyncram_component.mem_data[5623];
wire       [15:0] omsp_dmem6BF0 = dut.dmem_0.altsyncram_component.mem_data[5624];
wire       [15:0] omsp_dmem6BF2 = dut.dmem_0.altsyncram_component.mem_data[5625];
wire       [15:0] omsp_dmem6BF4 = dut.dmem_0.altsyncram_component.mem_data[5626];
wire       [15:0] omsp_dmem6BF6 = dut.dmem_0.altsyncram_component.mem_data[5627];
wire       [15:0] omsp_dmem6BF8 = dut.dmem_0.altsyncram_component.mem_data[5628];
wire       [15:0] omsp_dmem6BFA = dut.dmem_0.altsyncram_component.mem_data[5629];
wire       [15:0] omsp_dmem6BFC = dut.dmem_0.altsyncram_component.mem_data[5630];
wire       [15:0] omsp_dmem6BFE = dut.dmem_0.altsyncram_component.mem_data[5631];
wire       [15:0] omsp_dmem6BFF = dut.dmem_0.altsyncram_component.mem_data[5632];


// Program Memory cells
//======================
reg   [15:0] pmem [0:`PMEM_SIZE-1];
reg   [15:0] dmem [0:`DMEM_SIZE-1];

// Interrupt vectors
wire  [15:0] irq_vect_15      = pmem[(1<<(`PMEM_MSB+1))-1];  // RESET Vector
wire  [15:0] irq_vect_14      = pmem[(1<<(`PMEM_MSB+1))-2];  // NMI
wire  [15:0] irq_vect_13      = pmem[(1<<(`PMEM_MSB+1))-3];  // IRQ 13
wire  [15:0] irq_vect_12      = pmem[(1<<(`PMEM_MSB+1))-4];  // IRQ 12
wire  [15:0] irq_vect_11      = pmem[(1<<(`PMEM_MSB+1))-5];  // IRQ 11
wire  [15:0] irq_vect_10      = pmem[(1<<(`PMEM_MSB+1))-6];  // IRQ 10
wire  [15:0] irq_vect_09      = pmem[(1<<(`PMEM_MSB+1))-7];  // IRQ  9
wire  [15:0] irq_vect_08      = pmem[(1<<(`PMEM_MSB+1))-8];  // IRQ  8
wire  [15:0] irq_vect_07      = pmem[(1<<(`PMEM_MSB+1))-9];  // IRQ  7
wire  [15:0] irq_vect_06      = pmem[(1<<(`PMEM_MSB+1))-10]; // IRQ  6
wire  [15:0] irq_vect_05      = pmem[(1<<(`PMEM_MSB+1))-11]; // IRQ  5
wire  [15:0] irq_vect_04      = pmem[(1<<(`PMEM_MSB+1))-12]; // IRQ  4
wire  [15:0] irq_vect_03      = pmem[(1<<(`PMEM_MSB+1))-13]; // IRQ  3
wire  [15:0] irq_vect_02      = pmem[(1<<(`PMEM_MSB+1))-14]; // IRQ  2
wire  [15:0] irq_vect_01      = pmem[(1<<(`PMEM_MSB+1))-15]; // IRQ  1
wire  [15:0] irq_vect_00      = pmem[(1<<(`PMEM_MSB+1))-16]; // IRQ  0

// Interrupt detection
wire         omsp_nmi_detect  = dut.openmsp430_0.frontend_0.nmi_pnd;
wire         omsp_irq_detect  = dut.openmsp430_0.frontend_0.irq_detect;

// Debug interface
wire         omsp_dbg_en      = dut.openmsp430_0.dbg_en;
wire         omsp_dbg_clk     = dut.openmsp430_0.clock_module_0.dbg_clk;
wire         omsp_dbg_rst     = dut.openmsp430_0.clock_module_0.dbg_rst;


// CPU internals
//======================

wire         omsp_mclk        = dut.openmsp430_0.mclk;
wire         omsp_puc_rst     = dut.openmsp430_0.puc_rst;
