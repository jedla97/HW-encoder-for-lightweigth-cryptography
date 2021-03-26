// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Thu Mar 18 18:29:12 2021
// Host        : jedla running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_axi_stream_wrapper_0_2_sim_netlist.v
// Design      : design_1_axi_stream_wrapper_0_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_stream_wrapper
   (ACLK,
    ARESETN,
    S_AXIS_READY,
    S_AXIS_DATA,
    S_AXIS_LAST,
    S_AXIS_VALID,
    M_AXIS_VALID,
    M_AXIS_DATA,
    M_AXIS_LAST,
    M_AXIS_READY);
  input ACLK;
  input ARESETN;
  output S_AXIS_READY;
  input [31:0]S_AXIS_DATA;
  input S_AXIS_LAST;
  input S_AXIS_VALID;
  output M_AXIS_VALID;
  output [31:0]M_AXIS_DATA;
  output M_AXIS_LAST;
  input M_AXIS_READY;

  wire \<const0> ;
  wire ACLK;
  wire ARESETN;
  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_2_n_0 ;
  wire \FSM_sequential_state[2]_i_3_n_0 ;
  wire \FSM_sequential_state[2]_i_4_n_0 ;
  wire \FSM_sequential_state[2]_i_5_n_0 ;
  wire \FSM_sequential_state[2]_i_6_n_0 ;
  wire S_AXIS_READY;
  wire S_AXIS_VALID;
  wire [5:0]counter;
  wire \counter[1]_i_2_n_0 ;
  wire \counter[4]_i_2_n_0 ;
  wire \counter[5]_i_1_n_0 ;
  wire \counter[5]_i_2_n_0 ;
  wire \counter[5]_i_4_n_0 ;
  wire \counter_reg_n_0_[0] ;
  wire \counter_reg_n_0_[1] ;
  wire \counter_reg_n_0_[2] ;
  wire \counter_reg_n_0_[3] ;
  wire \counter_reg_n_0_[4] ;
  wire \counter_reg_n_0_[5] ;
  wire [2:0]state__0;

  assign M_AXIS_DATA[31] = \<const0> ;
  assign M_AXIS_DATA[30] = \<const0> ;
  assign M_AXIS_DATA[29] = \<const0> ;
  assign M_AXIS_DATA[28] = \<const0> ;
  assign M_AXIS_DATA[27] = \<const0> ;
  assign M_AXIS_DATA[26] = \<const0> ;
  assign M_AXIS_DATA[25] = \<const0> ;
  assign M_AXIS_DATA[24] = \<const0> ;
  assign M_AXIS_DATA[23] = \<const0> ;
  assign M_AXIS_DATA[22] = \<const0> ;
  assign M_AXIS_DATA[21] = \<const0> ;
  assign M_AXIS_DATA[20] = \<const0> ;
  assign M_AXIS_DATA[19] = \<const0> ;
  assign M_AXIS_DATA[18] = \<const0> ;
  assign M_AXIS_DATA[17] = \<const0> ;
  assign M_AXIS_DATA[16] = \<const0> ;
  assign M_AXIS_DATA[15] = \<const0> ;
  assign M_AXIS_DATA[14] = \<const0> ;
  assign M_AXIS_DATA[13] = \<const0> ;
  assign M_AXIS_DATA[12] = \<const0> ;
  assign M_AXIS_DATA[11] = \<const0> ;
  assign M_AXIS_DATA[10] = \<const0> ;
  assign M_AXIS_DATA[9] = \<const0> ;
  assign M_AXIS_DATA[8] = \<const0> ;
  assign M_AXIS_DATA[7] = \<const0> ;
  assign M_AXIS_DATA[6] = \<const0> ;
  assign M_AXIS_DATA[5] = \<const0> ;
  assign M_AXIS_DATA[4] = \<const0> ;
  assign M_AXIS_DATA[3] = \<const0> ;
  assign M_AXIS_DATA[2] = \<const0> ;
  assign M_AXIS_DATA[1] = \<const0> ;
  assign M_AXIS_DATA[0] = \<const0> ;
  assign M_AXIS_LAST = \<const0> ;
  assign M_AXIS_VALID = \<const0> ;
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h2600)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(state__0[0]),
        .I1(\FSM_sequential_state[2]_i_2_n_0 ),
        .I2(state__0[2]),
        .I3(ARESETN),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h262A0000)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(state__0[1]),
        .I1(\FSM_sequential_state[2]_i_2_n_0 ),
        .I2(state__0[2]),
        .I3(state__0[0]),
        .I4(ARESETN),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h62220000)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(state__0[2]),
        .I1(\FSM_sequential_state[2]_i_2_n_0 ),
        .I2(state__0[0]),
        .I3(state__0[1]),
        .I4(ARESETN),
        .O(\FSM_sequential_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEE22FFFFEE22EEA2)) 
    \FSM_sequential_state[2]_i_2 
       (.I0(\FSM_sequential_state[2]_i_3_n_0 ),
        .I1(state__0[0]),
        .I2(\FSM_sequential_state[2]_i_4_n_0 ),
        .I3(\FSM_sequential_state[2]_i_5_n_0 ),
        .I4(\counter[1]_i_2_n_0 ),
        .I5(\FSM_sequential_state[2]_i_6_n_0 ),
        .O(\FSM_sequential_state[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h10)) 
    \FSM_sequential_state[2]_i_3 
       (.I0(state__0[2]),
        .I1(state__0[1]),
        .I2(S_AXIS_VALID),
        .O(\FSM_sequential_state[2]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_state[2]_i_4 
       (.I0(\counter_reg_n_0_[0] ),
        .I1(\counter_reg_n_0_[1] ),
        .O(\FSM_sequential_state[2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_state[2]_i_5 
       (.I0(state__0[1]),
        .I1(state__0[2]),
        .O(\FSM_sequential_state[2]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00080000)) 
    \FSM_sequential_state[2]_i_6 
       (.I0(S_AXIS_VALID),
        .I1(\counter_reg_n_0_[1] ),
        .I2(\counter_reg_n_0_[0] ),
        .I3(state__0[2]),
        .I4(state__0[1]),
        .O(\FSM_sequential_state[2]_i_6_n_0 ));
  (* FSM_ENCODED_STATES = "idle:000,read_data_in:001,read_key:010,stabilize:011,active:100,write_data_out:101," *) 
  FDRE \FSM_sequential_state_reg[0] 
       (.C(ACLK),
        .CE(1'b1),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state__0[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "idle:000,read_data_in:001,read_key:010,stabilize:011,active:100,write_data_out:101," *) 
  FDRE \FSM_sequential_state_reg[1] 
       (.C(ACLK),
        .CE(1'b1),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state__0[1]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "idle:000,read_data_in:001,read_key:010,stabilize:011,active:100,write_data_out:101," *) 
  FDRE \FSM_sequential_state_reg[2] 
       (.C(ACLK),
        .CE(1'b1),
        .D(\FSM_sequential_state[2]_i_1_n_0 ),
        .Q(state__0[2]),
        .R(1'b0));
  GND GND
       (.G(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h06)) 
    S_AXIS_READY_INST_0
       (.I0(state__0[0]),
        .I1(state__0[1]),
        .I2(state__0[2]),
        .O(S_AXIS_READY));
  LUT6 #(
    .INIT(64'h0000333100333300)) 
    \counter[0]_i_1 
       (.I0(\counter_reg_n_0_[1] ),
        .I1(\counter_reg_n_0_[0] ),
        .I2(\counter[1]_i_2_n_0 ),
        .I3(state__0[0]),
        .I4(state__0[2]),
        .I5(state__0[1]),
        .O(counter[0]));
  LUT6 #(
    .INIT(64'h00000E5A0F580000)) 
    \counter[1]_i_1 
       (.I0(state__0[0]),
        .I1(\counter[1]_i_2_n_0 ),
        .I2(state__0[2]),
        .I3(state__0[1]),
        .I4(\counter_reg_n_0_[0] ),
        .I5(\counter_reg_n_0_[1] ),
        .O(counter[1]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \counter[1]_i_2 
       (.I0(\counter_reg_n_0_[5] ),
        .I1(\counter_reg_n_0_[4] ),
        .I2(\counter_reg_n_0_[3] ),
        .I3(\counter_reg_n_0_[2] ),
        .O(\counter[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0036363636000000)) 
    \counter[2]_i_1 
       (.I0(state__0[0]),
        .I1(state__0[2]),
        .I2(state__0[1]),
        .I3(\counter_reg_n_0_[1] ),
        .I4(\counter_reg_n_0_[0] ),
        .I5(\counter_reg_n_0_[2] ),
        .O(counter[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h7F008000)) 
    \counter[3]_i_1 
       (.I0(\counter_reg_n_0_[1] ),
        .I1(\counter_reg_n_0_[0] ),
        .I2(\counter_reg_n_0_[2] ),
        .I3(\counter[4]_i_2_n_0 ),
        .I4(\counter_reg_n_0_[3] ),
        .O(counter[3]));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \counter[4]_i_1 
       (.I0(\counter_reg_n_0_[2] ),
        .I1(\counter_reg_n_0_[0] ),
        .I2(\counter_reg_n_0_[1] ),
        .I3(\counter_reg_n_0_[3] ),
        .I4(\counter[4]_i_2_n_0 ),
        .I5(\counter_reg_n_0_[4] ),
        .O(counter[4]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h36)) 
    \counter[4]_i_2 
       (.I0(state__0[0]),
        .I1(state__0[2]),
        .I2(state__0[1]),
        .O(\counter[4]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[5]_i_1 
       (.I0(ARESETN),
        .O(\counter[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h1170)) 
    \counter[5]_i_2 
       (.I0(state__0[0]),
        .I1(state__0[1]),
        .I2(S_AXIS_VALID),
        .I3(state__0[2]),
        .O(\counter[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00BB0BB000440440)) 
    \counter[5]_i_3 
       (.I0(\counter[5]_i_4_n_0 ),
        .I1(\counter_reg_n_0_[4] ),
        .I2(state__0[1]),
        .I3(state__0[2]),
        .I4(state__0[0]),
        .I5(\counter_reg_n_0_[5] ),
        .O(counter[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \counter[5]_i_4 
       (.I0(\counter_reg_n_0_[2] ),
        .I1(\counter_reg_n_0_[0] ),
        .I2(\counter_reg_n_0_[1] ),
        .I3(\counter_reg_n_0_[3] ),
        .O(\counter[5]_i_4_n_0 ));
  FDRE \counter_reg[0] 
       (.C(ACLK),
        .CE(\counter[5]_i_2_n_0 ),
        .D(counter[0]),
        .Q(\counter_reg_n_0_[0] ),
        .R(\counter[5]_i_1_n_0 ));
  FDRE \counter_reg[1] 
       (.C(ACLK),
        .CE(\counter[5]_i_2_n_0 ),
        .D(counter[1]),
        .Q(\counter_reg_n_0_[1] ),
        .R(\counter[5]_i_1_n_0 ));
  FDRE \counter_reg[2] 
       (.C(ACLK),
        .CE(\counter[5]_i_2_n_0 ),
        .D(counter[2]),
        .Q(\counter_reg_n_0_[2] ),
        .R(\counter[5]_i_1_n_0 ));
  FDRE \counter_reg[3] 
       (.C(ACLK),
        .CE(\counter[5]_i_2_n_0 ),
        .D(counter[3]),
        .Q(\counter_reg_n_0_[3] ),
        .R(\counter[5]_i_1_n_0 ));
  FDRE \counter_reg[4] 
       (.C(ACLK),
        .CE(\counter[5]_i_2_n_0 ),
        .D(counter[4]),
        .Q(\counter_reg_n_0_[4] ),
        .R(\counter[5]_i_1_n_0 ));
  FDRE \counter_reg[5] 
       (.C(ACLK),
        .CE(\counter[5]_i_2_n_0 ),
        .D(counter[5]),
        .Q(\counter_reg_n_0_[5] ),
        .R(\counter[5]_i_1_n_0 ));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_axi_stream_wrapper_0_2,axi_stream_wrapper,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "package_project" *) 
(* x_core_info = "axi_stream_wrapper,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (ACLK,
    ARESETN,
    S_AXIS_READY,
    S_AXIS_DATA,
    S_AXIS_LAST,
    S_AXIS_VALID,
    M_AXIS_VALID,
    M_AXIS_DATA,
    M_AXIS_LAST,
    M_AXIS_READY);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 ACLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME ACLK, ASSOCIATED_RESET ARESETN, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input ACLK;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 ARESETN RST" *) (* x_interface_parameter = "XIL_INTERFACENAME ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input ARESETN;
  output S_AXIS_READY;
  input [31:0]S_AXIS_DATA;
  input S_AXIS_LAST;
  input S_AXIS_VALID;
  output M_AXIS_VALID;
  output [31:0]M_AXIS_DATA;
  output M_AXIS_LAST;
  input M_AXIS_READY;

  wire ACLK;
  wire ARESETN;
  wire [31:0]M_AXIS_DATA;
  wire M_AXIS_LAST;
  wire M_AXIS_READY;
  wire M_AXIS_VALID;
  wire [31:0]S_AXIS_DATA;
  wire S_AXIS_LAST;
  wire S_AXIS_READY;
  wire S_AXIS_VALID;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_stream_wrapper U0
       (.ACLK(ACLK),
        .ARESETN(ARESETN),
        .M_AXIS_DATA(M_AXIS_DATA),
        .M_AXIS_LAST(M_AXIS_LAST),
        .M_AXIS_READY(M_AXIS_READY),
        .M_AXIS_VALID(M_AXIS_VALID),
        .S_AXIS_DATA(S_AXIS_DATA),
        .S_AXIS_LAST(S_AXIS_LAST),
        .S_AXIS_READY(S_AXIS_READY),
        .S_AXIS_VALID(S_AXIS_VALID));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
