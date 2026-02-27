// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Thu Feb 26 17:01:24 2026
// Host        : badhak-Precision-7720 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_axi_interconnect_hp0_imp_auto_pc_0_sim_netlist.v
// Design      : design_1_axi_interconnect_hp0_imp_auto_pc_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_data_fifo_v2_1_32_axic_fifo
   (dout,
    empty,
    SR,
    aresetn_0,
    m_axi_awvalid,
    length_counter_1_reg_1_sp_1,
    empty_fwft_i_reg,
    m_axi_wvalid,
    S_AXI_AREADY_I_reg,
    \areset_d_reg[1] ,
    aclk,
    m_axi_awlen,
    rd_en,
    aresetn,
    m_axi_awvalid_0,
    command_ongoing,
    m_axi_awready,
    length_counter_1_reg,
    first_mi_word,
    s_axi_wvalid,
    m_axi_wready,
    E,
    s_axi_awvalid,
    Q);
  output [3:0]dout;
  output empty;
  output [0:0]SR;
  output aresetn_0;
  output m_axi_awvalid;
  output length_counter_1_reg_1_sp_1;
  output empty_fwft_i_reg;
  output m_axi_wvalid;
  output S_AXI_AREADY_I_reg;
  output \areset_d_reg[1] ;
  input aclk;
  input [3:0]m_axi_awlen;
  input rd_en;
  input aresetn;
  input m_axi_awvalid_0;
  input command_ongoing;
  input m_axi_awready;
  input [1:0]length_counter_1_reg;
  input first_mi_word;
  input s_axi_wvalid;
  input m_axi_wready;
  input [0:0]E;
  input s_axi_awvalid;
  input [1:0]Q;

  wire [0:0]E;
  wire [1:0]Q;
  wire [0:0]SR;
  wire S_AXI_AREADY_I_reg;
  wire aclk;
  wire \areset_d_reg[1] ;
  wire aresetn;
  wire aresetn_0;
  wire command_ongoing;
  wire [3:0]dout;
  wire empty;
  wire empty_fwft_i_reg;
  wire first_mi_word;
  wire [1:0]length_counter_1_reg;
  wire length_counter_1_reg_1_sn_1;
  wire [3:0]m_axi_awlen;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire m_axi_awvalid_0;
  wire m_axi_wready;
  wire m_axi_wvalid;
  wire rd_en;
  wire s_axi_awvalid;
  wire s_axi_wvalid;

  assign length_counter_1_reg_1_sp_1 = length_counter_1_reg_1_sn_1;
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_data_fifo_v2_1_32_fifo_gen inst
       (.E(E),
        .Q(Q),
        .SR(SR),
        .S_AXI_AREADY_I_reg(S_AXI_AREADY_I_reg),
        .aclk(aclk),
        .\areset_d_reg[1] (\areset_d_reg[1] ),
        .aresetn(aresetn),
        .aresetn_0(aresetn_0),
        .command_ongoing(command_ongoing),
        .dout(dout),
        .empty(empty),
        .empty_fwft_i_reg(empty_fwft_i_reg),
        .first_mi_word(first_mi_word),
        .length_counter_1_reg(length_counter_1_reg),
        .length_counter_1_reg_1_sp_1(length_counter_1_reg_1_sn_1),
        .m_axi_awlen(m_axi_awlen),
        .m_axi_awready(m_axi_awready),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_awvalid_0(m_axi_awvalid_0),
        .m_axi_wready(m_axi_wready),
        .m_axi_wvalid(m_axi_wvalid),
        .rd_en(rd_en),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_data_fifo_v2_1_32_fifo_gen
   (dout,
    empty,
    SR,
    aresetn_0,
    m_axi_awvalid,
    length_counter_1_reg_1_sp_1,
    empty_fwft_i_reg,
    m_axi_wvalid,
    S_AXI_AREADY_I_reg,
    \areset_d_reg[1] ,
    aclk,
    m_axi_awlen,
    rd_en,
    aresetn,
    m_axi_awvalid_0,
    command_ongoing,
    m_axi_awready,
    length_counter_1_reg,
    first_mi_word,
    s_axi_wvalid,
    m_axi_wready,
    E,
    s_axi_awvalid,
    Q);
  output [3:0]dout;
  output empty;
  output [0:0]SR;
  output aresetn_0;
  output m_axi_awvalid;
  output length_counter_1_reg_1_sp_1;
  output empty_fwft_i_reg;
  output m_axi_wvalid;
  output S_AXI_AREADY_I_reg;
  output \areset_d_reg[1] ;
  input aclk;
  input [3:0]m_axi_awlen;
  input rd_en;
  input aresetn;
  input m_axi_awvalid_0;
  input command_ongoing;
  input m_axi_awready;
  input [1:0]length_counter_1_reg;
  input first_mi_word;
  input s_axi_wvalid;
  input m_axi_wready;
  input [0:0]E;
  input s_axi_awvalid;
  input [1:0]Q;

  wire [0:0]E;
  wire [1:0]Q;
  wire [0:0]SR;
  wire S_AXI_AREADY_I_i_3_n_0;
  wire S_AXI_AREADY_I_reg;
  wire aclk;
  wire \areset_d_reg[1] ;
  wire aresetn;
  wire aresetn_0;
  wire cmd_push;
  wire command_ongoing;
  wire command_ongoing_i_2_n_0;
  wire [3:0]dout;
  wire empty;
  wire empty_fwft_i_reg;
  wire first_mi_word;
  wire full;
  wire [1:0]length_counter_1_reg;
  wire length_counter_1_reg_1_sn_1;
  wire [3:0]m_axi_awlen;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire m_axi_awvalid_0;
  wire m_axi_wready;
  wire m_axi_wvalid;
  wire rd_en;
  wire s_axi_awvalid;
  wire s_axi_wvalid;
  wire NLW_fifo_gen_inst_almost_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_almost_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_ar_overflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_ar_prog_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_ar_underflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_aw_overflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_aw_prog_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_aw_underflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_b_dbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_b_overflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_b_prog_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_b_prog_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_b_sbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_b_underflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_r_dbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_r_overflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_r_prog_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_r_prog_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_r_sbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_r_underflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_w_dbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_w_overflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_w_prog_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_w_prog_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_w_sbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_w_underflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axis_dbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axis_overflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axis_prog_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_axis_prog_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_axis_sbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axis_underflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_dbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axi_arvalid_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axi_awvalid_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axi_bready_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axi_rready_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axi_wlast_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axi_wvalid_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axis_tlast_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axis_tvalid_UNCONNECTED;
  wire NLW_fifo_gen_inst_overflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_prog_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_prog_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_rd_rst_busy_UNCONNECTED;
  wire NLW_fifo_gen_inst_s_axi_arready_UNCONNECTED;
  wire NLW_fifo_gen_inst_s_axi_awready_UNCONNECTED;
  wire NLW_fifo_gen_inst_s_axi_bvalid_UNCONNECTED;
  wire NLW_fifo_gen_inst_s_axi_rlast_UNCONNECTED;
  wire NLW_fifo_gen_inst_s_axi_rvalid_UNCONNECTED;
  wire NLW_fifo_gen_inst_s_axi_wready_UNCONNECTED;
  wire NLW_fifo_gen_inst_s_axis_tready_UNCONNECTED;
  wire NLW_fifo_gen_inst_sbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_underflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_valid_UNCONNECTED;
  wire NLW_fifo_gen_inst_wr_ack_UNCONNECTED;
  wire NLW_fifo_gen_inst_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axis_wr_data_count_UNCONNECTED;
  wire [5:0]NLW_fifo_gen_inst_data_count_UNCONNECTED;
  wire [4:4]NLW_fifo_gen_inst_dout_UNCONNECTED;
  wire [31:0]NLW_fifo_gen_inst_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_fifo_gen_inst_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_arcache_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_fifo_gen_inst_m_axi_arlen_UNCONNECTED;
  wire [1:0]NLW_fifo_gen_inst_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_fifo_gen_inst_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_fifo_gen_inst_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_fifo_gen_inst_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_fifo_gen_inst_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_fifo_gen_inst_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_awcache_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_fifo_gen_inst_m_axi_awlen_UNCONNECTED;
  wire [1:0]NLW_fifo_gen_inst_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_fifo_gen_inst_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_fifo_gen_inst_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_fifo_gen_inst_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_fifo_gen_inst_m_axi_wdata_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_fifo_gen_inst_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_fifo_gen_inst_m_axi_wuser_UNCONNECTED;
  wire [63:0]NLW_fifo_gen_inst_m_axis_tdata_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axis_tdest_UNCONNECTED;
  wire [7:0]NLW_fifo_gen_inst_m_axis_tid_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axis_tkeep_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axis_tuser_UNCONNECTED;
  wire [5:0]NLW_fifo_gen_inst_rd_data_count_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_fifo_gen_inst_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_fifo_gen_inst_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_fifo_gen_inst_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_fifo_gen_inst_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_fifo_gen_inst_s_axi_ruser_UNCONNECTED;
  wire [5:0]NLW_fifo_gen_inst_wr_data_count_UNCONNECTED;

  assign length_counter_1_reg_1_sp_1 = length_counter_1_reg_1_sn_1;
  LUT1 #(
    .INIT(2'h1)) 
    S_AXI_AREADY_I_i_1
       (.I0(aresetn),
        .O(SR));
  LUT6 #(
    .INIT(64'h22722272FFFF2272)) 
    S_AXI_AREADY_I_i_2
       (.I0(E),
        .I1(s_axi_awvalid),
        .I2(m_axi_awready),
        .I3(S_AXI_AREADY_I_i_3_n_0),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(S_AXI_AREADY_I_reg));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h4F)) 
    S_AXI_AREADY_I_i_3
       (.I0(m_axi_awvalid_0),
        .I1(full),
        .I2(command_ongoing),
        .O(S_AXI_AREADY_I_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h00888A88)) 
    cmd_push_block_i_1
       (.I0(aresetn),
        .I1(m_axi_awvalid_0),
        .I2(full),
        .I3(command_ongoing),
        .I4(m_axi_awready),
        .O(aresetn_0));
  LUT6 #(
    .INIT(64'hF222FFFFD000D000)) 
    command_ongoing_i_1
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(E),
        .I3(s_axi_awvalid),
        .I4(command_ongoing_i_2_n_0),
        .I5(command_ongoing),
        .O(\areset_d_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h8808)) 
    command_ongoing_i_2
       (.I0(m_axi_awready),
        .I1(command_ongoing),
        .I2(full),
        .I3(m_axi_awvalid_0),
        .O(command_ongoing_i_2_n_0));
  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "64" *) 
  (* C_AXIS_TDEST_WIDTH = "4" *) 
  (* C_AXIS_TID_WIDTH = "8" *) 
  (* C_AXIS_TKEEP_WIDTH = "4" *) 
  (* C_AXIS_TSTRB_WIDTH = "4" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "2" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "0" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "1" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "6" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "5" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "32" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "5" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "0" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "0" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "0" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "0" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "0" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "2" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "31" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "30" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "6" *) 
  (* C_RD_DEPTH = "32" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "5" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "3" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "1" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "6" *) 
  (* C_WR_DEPTH = "32" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "5" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_11 fifo_gen_inst
       (.almost_empty(NLW_fifo_gen_inst_almost_empty_UNCONNECTED),
        .almost_full(NLW_fifo_gen_inst_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_fifo_gen_inst_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_fifo_gen_inst_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_fifo_gen_inst_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_fifo_gen_inst_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_fifo_gen_inst_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_fifo_gen_inst_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_fifo_gen_inst_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_fifo_gen_inst_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_fifo_gen_inst_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_fifo_gen_inst_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_fifo_gen_inst_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_fifo_gen_inst_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_fifo_gen_inst_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_fifo_gen_inst_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_fifo_gen_inst_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_fifo_gen_inst_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_fifo_gen_inst_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_fifo_gen_inst_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_fifo_gen_inst_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_fifo_gen_inst_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_fifo_gen_inst_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_fifo_gen_inst_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_fifo_gen_inst_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_fifo_gen_inst_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_fifo_gen_inst_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_fifo_gen_inst_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_fifo_gen_inst_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_fifo_gen_inst_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_fifo_gen_inst_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_fifo_gen_inst_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_fifo_gen_inst_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_fifo_gen_inst_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_fifo_gen_inst_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_fifo_gen_inst_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_fifo_gen_inst_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_fifo_gen_inst_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_fifo_gen_inst_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_fifo_gen_inst_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_fifo_gen_inst_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_fifo_gen_inst_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_fifo_gen_inst_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_fifo_gen_inst_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_fifo_gen_inst_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_fifo_gen_inst_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_fifo_gen_inst_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_fifo_gen_inst_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_fifo_gen_inst_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_fifo_gen_inst_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_fifo_gen_inst_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_fifo_gen_inst_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_fifo_gen_inst_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_fifo_gen_inst_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_fifo_gen_inst_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_fifo_gen_inst_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(aclk),
        .data_count(NLW_fifo_gen_inst_data_count_UNCONNECTED[5:0]),
        .dbiterr(NLW_fifo_gen_inst_dbiterr_UNCONNECTED),
        .din({1'b0,m_axi_awlen}),
        .dout({NLW_fifo_gen_inst_dout_UNCONNECTED[4],dout}),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_fifo_gen_inst_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_fifo_gen_inst_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_fifo_gen_inst_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_fifo_gen_inst_m_axi_arid_UNCONNECTED[3:0]),
        .m_axi_arlen(NLW_fifo_gen_inst_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_fifo_gen_inst_m_axi_arlock_UNCONNECTED[1:0]),
        .m_axi_arprot(NLW_fifo_gen_inst_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_fifo_gen_inst_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_fifo_gen_inst_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_fifo_gen_inst_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_fifo_gen_inst_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_fifo_gen_inst_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_fifo_gen_inst_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_fifo_gen_inst_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_fifo_gen_inst_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_fifo_gen_inst_m_axi_awid_UNCONNECTED[3:0]),
        .m_axi_awlen(NLW_fifo_gen_inst_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_fifo_gen_inst_m_axi_awlock_UNCONNECTED[1:0]),
        .m_axi_awprot(NLW_fifo_gen_inst_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_fifo_gen_inst_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_fifo_gen_inst_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_fifo_gen_inst_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_fifo_gen_inst_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_fifo_gen_inst_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid({1'b0,1'b0,1'b0,1'b0}),
        .m_axi_bready(NLW_fifo_gen_inst_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid({1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_fifo_gen_inst_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_fifo_gen_inst_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_fifo_gen_inst_m_axi_wid_UNCONNECTED[3:0]),
        .m_axi_wlast(NLW_fifo_gen_inst_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_fifo_gen_inst_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_fifo_gen_inst_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_fifo_gen_inst_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_fifo_gen_inst_m_axis_tdata_UNCONNECTED[63:0]),
        .m_axis_tdest(NLW_fifo_gen_inst_m_axis_tdest_UNCONNECTED[3:0]),
        .m_axis_tid(NLW_fifo_gen_inst_m_axis_tid_UNCONNECTED[7:0]),
        .m_axis_tkeep(NLW_fifo_gen_inst_m_axis_tkeep_UNCONNECTED[3:0]),
        .m_axis_tlast(NLW_fifo_gen_inst_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_fifo_gen_inst_m_axis_tstrb_UNCONNECTED[3:0]),
        .m_axis_tuser(NLW_fifo_gen_inst_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_fifo_gen_inst_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_fifo_gen_inst_overflow_UNCONNECTED),
        .prog_empty(NLW_fifo_gen_inst_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_fifo_gen_inst_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_fifo_gen_inst_rd_data_count_UNCONNECTED[5:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_fifo_gen_inst_rd_rst_busy_UNCONNECTED),
        .rst(SR),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock({1'b0,1'b0}),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_fifo_gen_inst_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock({1'b0,1'b0}),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_fifo_gen_inst_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_fifo_gen_inst_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_fifo_gen_inst_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_fifo_gen_inst_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_fifo_gen_inst_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_fifo_gen_inst_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_fifo_gen_inst_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_fifo_gen_inst_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_fifo_gen_inst_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_fifo_gen_inst_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_fifo_gen_inst_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_fifo_gen_inst_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tkeep({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_fifo_gen_inst_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_fifo_gen_inst_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_fifo_gen_inst_underflow_UNCONNECTED),
        .valid(NLW_fifo_gen_inst_valid_UNCONNECTED),
        .wr_ack(NLW_fifo_gen_inst_wr_ack_UNCONNECTED),
        .wr_clk(1'b0),
        .wr_data_count(NLW_fifo_gen_inst_wr_data_count_UNCONNECTED[5:0]),
        .wr_en(cmd_push),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_fifo_gen_inst_wr_rst_busy_UNCONNECTED));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h02)) 
    fifo_gen_inst_i_1
       (.I0(command_ongoing),
        .I1(full),
        .I2(m_axi_awvalid_0),
        .O(cmd_push));
  LUT6 #(
    .INIT(64'hE4E4CC664E4ECC66)) 
    \length_counter_1[1]_i_1 
       (.I0(empty_fwft_i_reg),
        .I1(length_counter_1_reg[1]),
        .I2(dout[1]),
        .I3(length_counter_1_reg[0]),
        .I4(first_mi_word),
        .I5(dout[0]),
        .O(length_counter_1_reg_1_sn_1));
  LUT3 #(
    .INIT(8'hA2)) 
    m_axi_awvalid_INST_0
       (.I0(command_ongoing),
        .I1(full),
        .I2(m_axi_awvalid_0),
        .O(m_axi_awvalid));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    m_axi_wvalid_INST_0
       (.I0(s_axi_wvalid),
        .I1(empty),
        .O(m_axi_wvalid));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h40)) 
    s_axi_wready_INST_0
       (.I0(empty),
        .I1(s_axi_wvalid),
        .I2(m_axi_wready),
        .O(empty_fwft_i_reg));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_protocol_converter_v2_1_33_a_axi3_conv
   (dout,
    empty,
    SR,
    m_axi_awlen,
    m_axi_awlock,
    E,
    m_axi_awvalid,
    length_counter_1_reg_1_sp_1,
    empty_fwft_i_reg,
    m_axi_wvalid,
    m_axi_awaddr,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    aclk,
    rd_en,
    s_axi_awlock,
    aresetn,
    m_axi_awready,
    length_counter_1_reg,
    first_mi_word,
    s_axi_wvalid,
    m_axi_wready,
    s_axi_awvalid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos);
  output [3:0]dout;
  output empty;
  output [0:0]SR;
  output [3:0]m_axi_awlen;
  output [0:0]m_axi_awlock;
  output [0:0]E;
  output m_axi_awvalid;
  output length_counter_1_reg_1_sp_1;
  output empty_fwft_i_reg;
  output m_axi_wvalid;
  output [31:0]m_axi_awaddr;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  input aclk;
  input rd_en;
  input [0:0]s_axi_awlock;
  input aresetn;
  input m_axi_awready;
  input [1:0]length_counter_1_reg;
  input first_mi_word;
  input s_axi_wvalid;
  input m_axi_wready;
  input s_axi_awvalid;
  input [31:0]s_axi_awaddr;
  input [3:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;

  wire [0:0]E;
  wire [0:0]SR;
  wire \USE_BURSTS.cmd_queue_n_11 ;
  wire \USE_BURSTS.cmd_queue_n_12 ;
  wire \USE_BURSTS.cmd_queue_n_6 ;
  wire aclk;
  wire [1:0]areset_d;
  wire aresetn;
  wire cmd_push_block_reg_n_0;
  wire command_ongoing;
  wire [3:0]dout;
  wire empty;
  wire empty_fwft_i_reg;
  wire first_mi_word;
  wire [1:0]length_counter_1_reg;
  wire length_counter_1_reg_1_sn_1;
  wire [31:0]m_axi_awaddr;
  wire [1:0]m_axi_awburst;
  wire [3:0]m_axi_awcache;
  wire [3:0]m_axi_awlen;
  wire [0:0]m_axi_awlock;
  wire [2:0]m_axi_awprot;
  wire [3:0]m_axi_awqos;
  wire m_axi_awready;
  wire [2:0]m_axi_awsize;
  wire m_axi_awvalid;
  wire m_axi_wready;
  wire m_axi_wvalid;
  wire rd_en;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
  wire [3:0]s_axi_awlen;
  wire [0:0]s_axi_awlock;
  wire [2:0]s_axi_awprot;
  wire [3:0]s_axi_awqos;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_wvalid;

  assign length_counter_1_reg_1_sp_1 = length_counter_1_reg_1_sn_1;
  FDRE \S_AXI_AADDR_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[0]),
        .Q(m_axi_awaddr[0]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[10]),
        .Q(m_axi_awaddr[10]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[11]),
        .Q(m_axi_awaddr[11]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[12] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[12]),
        .Q(m_axi_awaddr[12]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[13] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[13]),
        .Q(m_axi_awaddr[13]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[14] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[14]),
        .Q(m_axi_awaddr[14]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[15] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[15]),
        .Q(m_axi_awaddr[15]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[16] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[16]),
        .Q(m_axi_awaddr[16]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[17] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[17]),
        .Q(m_axi_awaddr[17]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[18] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[18]),
        .Q(m_axi_awaddr[18]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[19] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[19]),
        .Q(m_axi_awaddr[19]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[1]),
        .Q(m_axi_awaddr[1]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[20] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[20]),
        .Q(m_axi_awaddr[20]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[21] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[21]),
        .Q(m_axi_awaddr[21]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[22] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[22]),
        .Q(m_axi_awaddr[22]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[23] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[23]),
        .Q(m_axi_awaddr[23]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[24] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[24]),
        .Q(m_axi_awaddr[24]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[25] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[25]),
        .Q(m_axi_awaddr[25]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[26] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[26]),
        .Q(m_axi_awaddr[26]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[27] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[27]),
        .Q(m_axi_awaddr[27]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[28] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[28]),
        .Q(m_axi_awaddr[28]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[29] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[29]),
        .Q(m_axi_awaddr[29]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[2]),
        .Q(m_axi_awaddr[2]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[30] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[30]),
        .Q(m_axi_awaddr[30]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[31] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[31]),
        .Q(m_axi_awaddr[31]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[3]),
        .Q(m_axi_awaddr[3]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[4]),
        .Q(m_axi_awaddr[4]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[5]),
        .Q(m_axi_awaddr[5]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[6]),
        .Q(m_axi_awaddr[6]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[7]),
        .Q(m_axi_awaddr[7]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[8]),
        .Q(m_axi_awaddr[8]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[9]),
        .Q(m_axi_awaddr[9]),
        .R(SR));
  FDRE \S_AXI_ABURST_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awburst[0]),
        .Q(m_axi_awburst[0]),
        .R(SR));
  FDRE \S_AXI_ABURST_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awburst[1]),
        .Q(m_axi_awburst[1]),
        .R(SR));
  FDRE \S_AXI_ACACHE_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awcache[0]),
        .Q(m_axi_awcache[0]),
        .R(SR));
  FDRE \S_AXI_ACACHE_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awcache[1]),
        .Q(m_axi_awcache[1]),
        .R(SR));
  FDRE \S_AXI_ACACHE_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awcache[2]),
        .Q(m_axi_awcache[2]),
        .R(SR));
  FDRE \S_AXI_ACACHE_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awcache[3]),
        .Q(m_axi_awcache[3]),
        .R(SR));
  FDRE \S_AXI_ALEN_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[0]),
        .Q(m_axi_awlen[0]),
        .R(SR));
  FDRE \S_AXI_ALEN_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[1]),
        .Q(m_axi_awlen[1]),
        .R(SR));
  FDRE \S_AXI_ALEN_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[2]),
        .Q(m_axi_awlen[2]),
        .R(SR));
  FDRE \S_AXI_ALEN_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[3]),
        .Q(m_axi_awlen[3]),
        .R(SR));
  FDRE \S_AXI_ALOCK_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlock),
        .Q(m_axi_awlock),
        .R(SR));
  FDRE \S_AXI_APROT_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awprot[0]),
        .Q(m_axi_awprot[0]),
        .R(SR));
  FDRE \S_AXI_APROT_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awprot[1]),
        .Q(m_axi_awprot[1]),
        .R(SR));
  FDRE \S_AXI_APROT_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awprot[2]),
        .Q(m_axi_awprot[2]),
        .R(SR));
  FDRE \S_AXI_AQOS_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awqos[0]),
        .Q(m_axi_awqos[0]),
        .R(SR));
  FDRE \S_AXI_AQOS_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awqos[1]),
        .Q(m_axi_awqos[1]),
        .R(SR));
  FDRE \S_AXI_AQOS_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awqos[2]),
        .Q(m_axi_awqos[2]),
        .R(SR));
  FDRE \S_AXI_AQOS_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awqos[3]),
        .Q(m_axi_awqos[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    S_AXI_AREADY_I_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_BURSTS.cmd_queue_n_11 ),
        .Q(E),
        .R(SR));
  FDRE \S_AXI_ASIZE_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awsize[0]),
        .Q(m_axi_awsize[0]),
        .R(SR));
  FDRE \S_AXI_ASIZE_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awsize[1]),
        .Q(m_axi_awsize[1]),
        .R(SR));
  FDRE \S_AXI_ASIZE_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awsize[2]),
        .Q(m_axi_awsize[2]),
        .R(SR));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_data_fifo_v2_1_32_axic_fifo \USE_BURSTS.cmd_queue 
       (.E(E),
        .Q(areset_d),
        .SR(SR),
        .S_AXI_AREADY_I_reg(\USE_BURSTS.cmd_queue_n_11 ),
        .aclk(aclk),
        .\areset_d_reg[1] (\USE_BURSTS.cmd_queue_n_12 ),
        .aresetn(aresetn),
        .aresetn_0(\USE_BURSTS.cmd_queue_n_6 ),
        .command_ongoing(command_ongoing),
        .dout(dout),
        .empty(empty),
        .empty_fwft_i_reg(empty_fwft_i_reg),
        .first_mi_word(first_mi_word),
        .length_counter_1_reg(length_counter_1_reg),
        .length_counter_1_reg_1_sp_1(length_counter_1_reg_1_sn_1),
        .m_axi_awlen(m_axi_awlen),
        .m_axi_awready(m_axi_awready),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_awvalid_0(cmd_push_block_reg_n_0),
        .m_axi_wready(m_axi_wready),
        .m_axi_wvalid(m_axi_wvalid),
        .rd_en(rd_en),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_wvalid(s_axi_wvalid));
  FDRE #(
    .INIT(1'b0)) 
    \areset_d_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(SR),
        .Q(areset_d[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \areset_d_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(areset_d[0]),
        .Q(areset_d[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    cmd_push_block_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_BURSTS.cmd_queue_n_6 ),
        .Q(cmd_push_block_reg_n_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    command_ongoing_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_BURSTS.cmd_queue_n_12 ),
        .Q(command_ongoing),
        .R(SR));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_protocol_converter_v2_1_33_axi3_conv
   (m_axi_awlen,
    m_axi_awaddr,
    E,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awvalid,
    empty_fwft_i_reg,
    m_axi_wvalid,
    m_axi_wlast,
    aresetn,
    m_axi_awready,
    aclk,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    m_axi_wready,
    s_axi_wvalid,
    s_axi_awvalid);
  output [3:0]m_axi_awlen;
  output [31:0]m_axi_awaddr;
  output [0:0]E;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [0:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output m_axi_awvalid;
  output empty_fwft_i_reg;
  output m_axi_wvalid;
  output m_axi_wlast;
  input aresetn;
  input m_axi_awready;
  input aclk;
  input [31:0]s_axi_awaddr;
  input [3:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [0:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input m_axi_wready;
  input s_axi_wvalid;
  input s_axi_awvalid;

  wire [0:0]E;
  wire \USE_BURSTS.cmd_queue/inst/empty ;
  wire [3:0]\USE_WRITE.wr_cmd_length ;
  wire \USE_WRITE.wr_cmd_ready ;
  wire \USE_WRITE.write_addr_inst_n_13 ;
  wire \USE_WRITE.write_addr_inst_n_5 ;
  wire aclk;
  wire aresetn;
  wire empty_fwft_i_reg;
  wire first_mi_word;
  wire [1:0]length_counter_1_reg;
  wire [31:0]m_axi_awaddr;
  wire [1:0]m_axi_awburst;
  wire [3:0]m_axi_awcache;
  wire [3:0]m_axi_awlen;
  wire [0:0]m_axi_awlock;
  wire [2:0]m_axi_awprot;
  wire [3:0]m_axi_awqos;
  wire m_axi_awready;
  wire [2:0]m_axi_awsize;
  wire m_axi_awvalid;
  wire m_axi_wlast;
  wire m_axi_wready;
  wire m_axi_wvalid;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
  wire [3:0]s_axi_awlen;
  wire [0:0]s_axi_awlock;
  wire [2:0]s_axi_awprot;
  wire [3:0]s_axi_awqos;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_wvalid;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_protocol_converter_v2_1_33_a_axi3_conv \USE_WRITE.write_addr_inst 
       (.E(E),
        .SR(\USE_WRITE.write_addr_inst_n_5 ),
        .aclk(aclk),
        .aresetn(aresetn),
        .dout(\USE_WRITE.wr_cmd_length ),
        .empty(\USE_BURSTS.cmd_queue/inst/empty ),
        .empty_fwft_i_reg(empty_fwft_i_reg),
        .first_mi_word(first_mi_word),
        .length_counter_1_reg(length_counter_1_reg),
        .length_counter_1_reg_1_sp_1(\USE_WRITE.write_addr_inst_n_13 ),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awburst(m_axi_awburst),
        .m_axi_awcache(m_axi_awcache),
        .m_axi_awlen(m_axi_awlen),
        .m_axi_awlock(m_axi_awlock),
        .m_axi_awprot(m_axi_awprot),
        .m_axi_awqos(m_axi_awqos),
        .m_axi_awready(m_axi_awready),
        .m_axi_awsize(m_axi_awsize),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_wready(m_axi_wready),
        .m_axi_wvalid(m_axi_wvalid),
        .rd_en(\USE_WRITE.wr_cmd_ready ),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awcache(s_axi_awcache),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awlock(s_axi_awlock),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awqos(s_axi_awqos),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_wvalid(s_axi_wvalid));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_protocol_converter_v2_1_33_w_axi3_conv \USE_WRITE.write_data_inst 
       (.SR(\USE_WRITE.write_addr_inst_n_5 ),
        .aclk(aclk),
        .dout(\USE_WRITE.wr_cmd_length ),
        .empty(\USE_BURSTS.cmd_queue/inst/empty ),
        .first_mi_word(first_mi_word),
        .\length_counter_1_reg[1]_0 (length_counter_1_reg),
        .\length_counter_1_reg[1]_1 (\USE_WRITE.write_addr_inst_n_13 ),
        .\length_counter_1_reg[2]_0 (empty_fwft_i_reg),
        .m_axi_wlast(m_axi_wlast),
        .m_axi_wready(m_axi_wready),
        .rd_en(\USE_WRITE.wr_cmd_ready ),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* C_AXI_ADDR_WIDTH = "32" *) (* C_AXI_ARUSER_WIDTH = "1" *) (* C_AXI_AWUSER_WIDTH = "1" *) 
(* C_AXI_BUSER_WIDTH = "1" *) (* C_AXI_DATA_WIDTH = "64" *) (* C_AXI_ID_WIDTH = "1" *) 
(* C_AXI_RUSER_WIDTH = "1" *) (* C_AXI_SUPPORTS_READ = "1" *) (* C_AXI_SUPPORTS_USER_SIGNALS = "0" *) 
(* C_AXI_SUPPORTS_WRITE = "1" *) (* C_AXI_WUSER_WIDTH = "1" *) (* C_FAMILY = "zynq" *) 
(* C_IGNORE_ID = "1" *) (* C_M_AXI_PROTOCOL = "1" *) (* C_S_AXI_PROTOCOL = "0" *) 
(* C_TRANSLATION_MODE = "0" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* P_AXI3 = "1" *) 
(* P_AXI4 = "0" *) (* P_AXILITE = "2" *) (* P_AXILITE_SIZE = "3'b011" *) 
(* P_CONVERSION = "2" *) (* P_DECERR = "2'b11" *) (* P_INCR = "2'b01" *) 
(* P_PROTECTION = "1" *) (* P_SLVERR = "2'b10" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_protocol_converter_v2_1_33_axi_protocol_converter
   (aclk,
    aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awregion,
    s_axi_awqos,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wuser,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arregion,
    s_axi_arqos,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awregion,
    m_axi_awqos,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wuser,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bid,
    m_axi_bresp,
    m_axi_buser,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_arid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arregion,
    m_axi_arqos,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_ruser,
    m_axi_rvalid,
    m_axi_rready);
  input aclk;
  input aresetn;
  input [0:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [0:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awregion;
  input [3:0]s_axi_awqos;
  input [0:0]s_axi_awuser;
  input s_axi_awvalid;
  output s_axi_awready;
  input [0:0]s_axi_wid;
  input [63:0]s_axi_wdata;
  input [7:0]s_axi_wstrb;
  input s_axi_wlast;
  input [0:0]s_axi_wuser;
  input s_axi_wvalid;
  output s_axi_wready;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output [0:0]s_axi_buser;
  output s_axi_bvalid;
  input s_axi_bready;
  input [0:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [0:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arregion;
  input [3:0]s_axi_arqos;
  input [0:0]s_axi_aruser;
  input s_axi_arvalid;
  output s_axi_arready;
  output [0:0]s_axi_rid;
  output [63:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output [0:0]s_axi_ruser;
  output s_axi_rvalid;
  input s_axi_rready;
  output [0:0]m_axi_awid;
  output [31:0]m_axi_awaddr;
  output [3:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [1:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awregion;
  output [3:0]m_axi_awqos;
  output [0:0]m_axi_awuser;
  output m_axi_awvalid;
  input m_axi_awready;
  output [0:0]m_axi_wid;
  output [63:0]m_axi_wdata;
  output [7:0]m_axi_wstrb;
  output m_axi_wlast;
  output [0:0]m_axi_wuser;
  output m_axi_wvalid;
  input m_axi_wready;
  input [0:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input [0:0]m_axi_buser;
  input m_axi_bvalid;
  output m_axi_bready;
  output [0:0]m_axi_arid;
  output [31:0]m_axi_araddr;
  output [3:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [1:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arregion;
  output [3:0]m_axi_arqos;
  output [0:0]m_axi_aruser;
  output m_axi_arvalid;
  input m_axi_arready;
  input [0:0]m_axi_rid;
  input [63:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input [0:0]m_axi_ruser;
  input m_axi_rvalid;
  output m_axi_rready;

  wire \<const0> ;
  wire aclk;
  wire aresetn;
  wire m_axi_arready;
  wire [31:0]m_axi_awaddr;
  wire [1:0]m_axi_awburst;
  wire [3:0]m_axi_awcache;
  wire [3:0]m_axi_awlen;
  wire [0:0]\^m_axi_awlock ;
  wire [2:0]m_axi_awprot;
  wire [3:0]m_axi_awqos;
  wire m_axi_awready;
  wire [2:0]m_axi_awsize;
  wire m_axi_awvalid;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire [63:0]m_axi_rdata;
  wire m_axi_rlast;
  wire [1:0]m_axi_rresp;
  wire m_axi_rvalid;
  wire m_axi_wlast;
  wire m_axi_wready;
  wire m_axi_wvalid;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [3:0]s_axi_arcache;
  wire [7:0]s_axi_arlen;
  wire [0:0]s_axi_arlock;
  wire [2:0]s_axi_arprot;
  wire [3:0]s_axi_arqos;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
  wire [7:0]s_axi_awlen;
  wire [0:0]s_axi_awlock;
  wire [2:0]s_axi_awprot;
  wire [3:0]s_axi_awqos;
  wire s_axi_awready;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_rready;
  wire [63:0]s_axi_wdata;
  wire s_axi_wready;
  wire [7:0]s_axi_wstrb;
  wire s_axi_wvalid;

  assign m_axi_araddr[31:0] = s_axi_araddr;
  assign m_axi_arburst[1:0] = s_axi_arburst;
  assign m_axi_arcache[3:0] = s_axi_arcache;
  assign m_axi_arid[0] = \<const0> ;
  assign m_axi_arlen[3:0] = s_axi_arlen[3:0];
  assign m_axi_arlock[1] = \<const0> ;
  assign m_axi_arlock[0] = s_axi_arlock;
  assign m_axi_arprot[2:0] = s_axi_arprot;
  assign m_axi_arqos[3:0] = s_axi_arqos;
  assign m_axi_arregion[3] = \<const0> ;
  assign m_axi_arregion[2] = \<const0> ;
  assign m_axi_arregion[1] = \<const0> ;
  assign m_axi_arregion[0] = \<const0> ;
  assign m_axi_arsize[2:0] = s_axi_arsize;
  assign m_axi_aruser[0] = \<const0> ;
  assign m_axi_arvalid = s_axi_arvalid;
  assign m_axi_awid[0] = \<const0> ;
  assign m_axi_awlock[1] = \<const0> ;
  assign m_axi_awlock[0] = \^m_axi_awlock [0];
  assign m_axi_awregion[3] = \<const0> ;
  assign m_axi_awregion[2] = \<const0> ;
  assign m_axi_awregion[1] = \<const0> ;
  assign m_axi_awregion[0] = \<const0> ;
  assign m_axi_awuser[0] = \<const0> ;
  assign m_axi_bready = s_axi_bready;
  assign m_axi_rready = s_axi_rready;
  assign m_axi_wdata[63:0] = s_axi_wdata;
  assign m_axi_wid[0] = \<const0> ;
  assign m_axi_wstrb[7:0] = s_axi_wstrb;
  assign m_axi_wuser[0] = \<const0> ;
  assign s_axi_arready = m_axi_arready;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1:0] = m_axi_bresp;
  assign s_axi_buser[0] = \<const0> ;
  assign s_axi_bvalid = m_axi_bvalid;
  assign s_axi_rdata[63:0] = m_axi_rdata;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = m_axi_rlast;
  assign s_axi_rresp[1:0] = m_axi_rresp;
  assign s_axi_ruser[0] = \<const0> ;
  assign s_axi_rvalid = m_axi_rvalid;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_protocol_converter_v2_1_33_axi3_conv \gen_axi4_axi3.axi3_conv_inst 
       (.E(s_axi_awready),
        .aclk(aclk),
        .aresetn(aresetn),
        .empty_fwft_i_reg(s_axi_wready),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awburst(m_axi_awburst),
        .m_axi_awcache(m_axi_awcache),
        .m_axi_awlen(m_axi_awlen),
        .m_axi_awlock(\^m_axi_awlock ),
        .m_axi_awprot(m_axi_awprot),
        .m_axi_awqos(m_axi_awqos),
        .m_axi_awready(m_axi_awready),
        .m_axi_awsize(m_axi_awsize),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_wlast(m_axi_wlast),
        .m_axi_wready(m_axi_wready),
        .m_axi_wvalid(m_axi_wvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awcache(s_axi_awcache),
        .s_axi_awlen(s_axi_awlen[3:0]),
        .s_axi_awlock(s_axi_awlock),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awqos(s_axi_awqos),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_protocol_converter_v2_1_33_w_axi3_conv
   (\length_counter_1_reg[1]_0 ,
    first_mi_word,
    rd_en,
    m_axi_wlast,
    SR,
    aclk,
    \length_counter_1_reg[1]_1 ,
    \length_counter_1_reg[2]_0 ,
    m_axi_wready,
    s_axi_wvalid,
    empty,
    dout);
  output [1:0]\length_counter_1_reg[1]_0 ;
  output first_mi_word;
  output rd_en;
  output m_axi_wlast;
  input [0:0]SR;
  input aclk;
  input \length_counter_1_reg[1]_1 ;
  input \length_counter_1_reg[2]_0 ;
  input m_axi_wready;
  input s_axi_wvalid;
  input empty;
  input [3:0]dout;

  wire [0:0]SR;
  wire aclk;
  wire [3:0]dout;
  wire empty;
  wire first_mi_word;
  wire first_mi_word_i_1_n_0;
  wire \length_counter_1[0]_i_1_n_0 ;
  wire \length_counter_1[2]_i_1_n_0 ;
  wire \length_counter_1[3]_i_1_n_0 ;
  wire \length_counter_1[4]_i_1_n_0 ;
  wire \length_counter_1[4]_i_2_n_0 ;
  wire \length_counter_1[5]_i_1_n_0 ;
  wire \length_counter_1[6]_i_1_n_0 ;
  wire \length_counter_1[7]_i_1_n_0 ;
  wire [7:2]length_counter_1_reg;
  wire [1:0]\length_counter_1_reg[1]_0 ;
  wire \length_counter_1_reg[1]_1 ;
  wire \length_counter_1_reg[2]_0 ;
  wire m_axi_wlast;
  wire m_axi_wlast_INST_0_i_1_n_0;
  wire m_axi_wlast_INST_0_i_2_n_0;
  wire m_axi_wlast_INST_0_i_3_n_0;
  wire m_axi_wready;
  wire rd_en;
  wire s_axi_wvalid;

  LUT6 #(
    .INIT(64'h0000CC000000CC04)) 
    fifo_gen_inst_i_2
       (.I0(length_counter_1_reg[7]),
        .I1(\length_counter_1_reg[2]_0 ),
        .I2(length_counter_1_reg[5]),
        .I3(first_mi_word),
        .I4(m_axi_wlast_INST_0_i_1_n_0),
        .I5(length_counter_1_reg[6]),
        .O(rd_en));
  LUT6 #(
    .INIT(64'h0F0FFFFF00010000)) 
    first_mi_word_i_1
       (.I0(length_counter_1_reg[7]),
        .I1(length_counter_1_reg[5]),
        .I2(m_axi_wlast_INST_0_i_1_n_0),
        .I3(length_counter_1_reg[6]),
        .I4(\length_counter_1_reg[2]_0 ),
        .I5(first_mi_word),
        .O(first_mi_word_i_1_n_0));
  FDSE #(
    .INIT(1'b0)) 
    first_mi_word_reg
       (.C(aclk),
        .CE(1'b1),
        .D(first_mi_word_i_1_n_0),
        .Q(first_mi_word),
        .S(SR));
  LUT6 #(
    .INIT(64'hF2FFFFFF07000000)) 
    \length_counter_1[0]_i_1 
       (.I0(first_mi_word),
        .I1(dout[0]),
        .I2(empty),
        .I3(s_axi_wvalid),
        .I4(m_axi_wready),
        .I5(\length_counter_1_reg[1]_0 [0]),
        .O(\length_counter_1[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'hD8D272D2)) 
    \length_counter_1[2]_i_1 
       (.I0(\length_counter_1_reg[2]_0 ),
        .I1(m_axi_wlast_INST_0_i_3_n_0),
        .I2(length_counter_1_reg[2]),
        .I3(first_mi_word),
        .I4(dout[2]),
        .O(\length_counter_1[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hB8B474B4)) 
    \length_counter_1[3]_i_1 
       (.I0(\length_counter_1[4]_i_2_n_0 ),
        .I1(\length_counter_1_reg[2]_0 ),
        .I2(length_counter_1_reg[3]),
        .I3(first_mi_word),
        .I4(dout[3]),
        .O(\length_counter_1[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0A0A3A35AAAAAAAA)) 
    \length_counter_1[4]_i_1 
       (.I0(length_counter_1_reg[4]),
        .I1(dout[3]),
        .I2(first_mi_word),
        .I3(length_counter_1_reg[3]),
        .I4(\length_counter_1[4]_i_2_n_0 ),
        .I5(\length_counter_1_reg[2]_0 ),
        .O(\length_counter_1[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hFEAE)) 
    \length_counter_1[4]_i_2 
       (.I0(m_axi_wlast_INST_0_i_3_n_0),
        .I1(length_counter_1_reg[2]),
        .I2(first_mi_word),
        .I3(dout[2]),
        .O(\length_counter_1[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF7FF0000FFF70808)) 
    \length_counter_1[5]_i_1 
       (.I0(m_axi_wready),
        .I1(s_axi_wvalid),
        .I2(empty),
        .I3(first_mi_word),
        .I4(length_counter_1_reg[5]),
        .I5(m_axi_wlast_INST_0_i_1_n_0),
        .O(\length_counter_1[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h3EFF0D00)) 
    \length_counter_1[6]_i_1 
       (.I0(length_counter_1_reg[5]),
        .I1(first_mi_word),
        .I2(m_axi_wlast_INST_0_i_1_n_0),
        .I3(\length_counter_1_reg[2]_0 ),
        .I4(length_counter_1_reg[6]),
        .O(\length_counter_1[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3F3EFFFF30310000)) 
    \length_counter_1[7]_i_1 
       (.I0(length_counter_1_reg[6]),
        .I1(m_axi_wlast_INST_0_i_1_n_0),
        .I2(first_mi_word),
        .I3(length_counter_1_reg[5]),
        .I4(\length_counter_1_reg[2]_0 ),
        .I5(length_counter_1_reg[7]),
        .O(\length_counter_1[7]_i_1_n_0 ));
  FDRE \length_counter_1_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[0]_i_1_n_0 ),
        .Q(\length_counter_1_reg[1]_0 [0]),
        .R(SR));
  FDRE \length_counter_1_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1_reg[1]_1 ),
        .Q(\length_counter_1_reg[1]_0 [1]),
        .R(SR));
  FDRE \length_counter_1_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[2]_i_1_n_0 ),
        .Q(length_counter_1_reg[2]),
        .R(SR));
  FDRE \length_counter_1_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[3]_i_1_n_0 ),
        .Q(length_counter_1_reg[3]),
        .R(SR));
  FDRE \length_counter_1_reg[4] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[4]_i_1_n_0 ),
        .Q(length_counter_1_reg[4]),
        .R(SR));
  FDRE \length_counter_1_reg[5] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[5]_i_1_n_0 ),
        .Q(length_counter_1_reg[5]),
        .R(SR));
  FDRE \length_counter_1_reg[6] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[6]_i_1_n_0 ),
        .Q(length_counter_1_reg[6]),
        .R(SR));
  FDRE \length_counter_1_reg[7] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[7]_i_1_n_0 ),
        .Q(length_counter_1_reg[7]),
        .R(SR));
  LUT5 #(
    .INIT(32'h00F000F1)) 
    m_axi_wlast_INST_0
       (.I0(length_counter_1_reg[7]),
        .I1(length_counter_1_reg[5]),
        .I2(first_mi_word),
        .I3(m_axi_wlast_INST_0_i_1_n_0),
        .I4(length_counter_1_reg[6]),
        .O(m_axi_wlast));
  LUT6 #(
    .INIT(64'hFFFFFFFEFCFCFFFE)) 
    m_axi_wlast_INST_0_i_1
       (.I0(length_counter_1_reg[4]),
        .I1(m_axi_wlast_INST_0_i_2_n_0),
        .I2(m_axi_wlast_INST_0_i_3_n_0),
        .I3(length_counter_1_reg[2]),
        .I4(first_mi_word),
        .I5(dout[2]),
        .O(m_axi_wlast_INST_0_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    m_axi_wlast_INST_0_i_2
       (.I0(dout[3]),
        .I1(first_mi_word),
        .I2(length_counter_1_reg[3]),
        .O(m_axi_wlast_INST_0_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFACCFA)) 
    m_axi_wlast_INST_0_i_3
       (.I0(\length_counter_1_reg[1]_0 [1]),
        .I1(dout[1]),
        .I2(\length_counter_1_reg[1]_0 [0]),
        .I3(first_mi_word),
        .I4(dout[0]),
        .O(m_axi_wlast_INST_0_i_3_n_0));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_axi_interconnect_hp0_imp_auto_pc_0,axi_protocol_converter_v2_1_33_axi_protocol_converter,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "axi_protocol_converter_v2_1_33_axi_protocol_converter,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (aclk,
    aresetn,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awregion,
    s_axi_awqos,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arregion,
    s_axi_arqos,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_rvalid,
    m_axi_rready);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK, ASSOCIATED_BUSIF S_AXI:M_AXI, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST, POLARITY ACTIVE_LOW, INSERT_VIP 0, TYPE INTERCONNECT" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 64, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [31:0]s_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWLEN" *) input [7:0]s_axi_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWSIZE" *) input [2:0]s_axi_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWBURST" *) input [1:0]s_axi_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWLOCK" *) input [0:0]s_axi_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWCACHE" *) input [3:0]s_axi_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWPROT" *) input [2:0]s_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREGION" *) input [3:0]s_axi_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWQOS" *) input [3:0]s_axi_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input s_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output s_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [63:0]s_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [7:0]s_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WLAST" *) input s_axi_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input s_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output s_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]s_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output s_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input s_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) input [31:0]s_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARLEN" *) input [7:0]s_axi_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARSIZE" *) input [2:0]s_axi_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARBURST" *) input [1:0]s_axi_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARLOCK" *) input [0:0]s_axi_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARCACHE" *) input [3:0]s_axi_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARPROT" *) input [2:0]s_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREGION" *) input [3:0]s_axi_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARQOS" *) input [3:0]s_axi_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input s_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output s_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [63:0]s_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]s_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RLAST" *) output s_axi_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output s_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) input s_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWADDR" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXI, DATA_WIDTH 64, PROTOCOL AXI3, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 16, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output [31:0]m_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWLEN" *) output [3:0]m_axi_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWSIZE" *) output [2:0]m_axi_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWBURST" *) output [1:0]m_axi_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWLOCK" *) output [1:0]m_axi_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWCACHE" *) output [3:0]m_axi_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWPROT" *) output [2:0]m_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWQOS" *) output [3:0]m_axi_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWVALID" *) output m_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWREADY" *) input m_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WDATA" *) output [63:0]m_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WSTRB" *) output [7:0]m_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WLAST" *) output m_axi_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WVALID" *) output m_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WREADY" *) input m_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BRESP" *) input [1:0]m_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BVALID" *) input m_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BREADY" *) output m_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARADDR" *) output [31:0]m_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARLEN" *) output [3:0]m_axi_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARSIZE" *) output [2:0]m_axi_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARBURST" *) output [1:0]m_axi_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARLOCK" *) output [1:0]m_axi_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARCACHE" *) output [3:0]m_axi_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARPROT" *) output [2:0]m_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARQOS" *) output [3:0]m_axi_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARVALID" *) output m_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARREADY" *) input m_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RDATA" *) input [63:0]m_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RRESP" *) input [1:0]m_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RLAST" *) input m_axi_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RVALID" *) input m_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RREADY" *) output m_axi_rready;

  wire \<const0> ;
  wire aclk;
  wire aresetn;
  wire [31:0]m_axi_araddr;
  wire [1:0]m_axi_arburst;
  wire [3:0]m_axi_arcache;
  wire [3:0]m_axi_arlen;
  wire [0:0]\^m_axi_arlock ;
  wire [2:0]m_axi_arprot;
  wire [3:0]m_axi_arqos;
  wire m_axi_arready;
  wire [2:0]m_axi_arsize;
  wire m_axi_arvalid;
  wire [31:0]m_axi_awaddr;
  wire [1:0]m_axi_awburst;
  wire [3:0]m_axi_awcache;
  wire [3:0]m_axi_awlen;
  wire [0:0]\^m_axi_awlock ;
  wire [2:0]m_axi_awprot;
  wire [3:0]m_axi_awqos;
  wire m_axi_awready;
  wire [2:0]m_axi_awsize;
  wire m_axi_awvalid;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire [63:0]m_axi_rdata;
  wire m_axi_rlast;
  wire m_axi_rready;
  wire [1:0]m_axi_rresp;
  wire m_axi_rvalid;
  wire [63:0]m_axi_wdata;
  wire m_axi_wlast;
  wire m_axi_wready;
  wire [7:0]m_axi_wstrb;
  wire m_axi_wvalid;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [3:0]s_axi_arcache;
  wire [7:0]s_axi_arlen;
  wire [0:0]s_axi_arlock;
  wire [2:0]s_axi_arprot;
  wire [3:0]s_axi_arqos;
  wire s_axi_arready;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
  wire [7:0]s_axi_awlen;
  wire [0:0]s_axi_awlock;
  wire [2:0]s_axi_awprot;
  wire [3:0]s_axi_awqos;
  wire s_axi_awready;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_bvalid;
  wire [63:0]s_axi_rdata;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire [1:0]s_axi_rresp;
  wire s_axi_rvalid;
  wire [63:0]s_axi_wdata;
  wire s_axi_wready;
  wire [7:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire [0:0]NLW_inst_m_axi_arid_UNCONNECTED;
  wire [1:1]NLW_inst_m_axi_arlock_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_arregion_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_aruser_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_awid_UNCONNECTED;
  wire [1:1]NLW_inst_m_axi_awlock_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_awregion_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_awuser_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_wid_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_wuser_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_bid_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_buser_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_rid_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_ruser_UNCONNECTED;

  assign m_axi_arlock[1] = \<const0> ;
  assign m_axi_arlock[0] = \^m_axi_arlock [0];
  assign m_axi_awlock[1] = \<const0> ;
  assign m_axi_awlock[0] = \^m_axi_awlock [0];
  GND GND
       (.G(\<const0> ));
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_SUPPORTS_READ = "1" *) 
  (* C_AXI_SUPPORTS_USER_SIGNALS = "0" *) 
  (* C_AXI_SUPPORTS_WRITE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_IGNORE_ID = "1" *) 
  (* C_M_AXI_PROTOCOL = "1" *) 
  (* C_S_AXI_PROTOCOL = "0" *) 
  (* C_TRANSLATION_MODE = "0" *) 
  (* P_AXI3 = "1" *) 
  (* P_AXI4 = "0" *) 
  (* P_AXILITE = "2" *) 
  (* P_AXILITE_SIZE = "3'b011" *) 
  (* P_CONVERSION = "2" *) 
  (* P_DECERR = "2'b11" *) 
  (* P_INCR = "2'b01" *) 
  (* P_PROTECTION = "1" *) 
  (* P_SLVERR = "2'b10" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_protocol_converter_v2_1_33_axi_protocol_converter inst
       (.aclk(aclk),
        .aresetn(aresetn),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_arburst(m_axi_arburst),
        .m_axi_arcache(m_axi_arcache),
        .m_axi_arid(NLW_inst_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(m_axi_arlen),
        .m_axi_arlock({NLW_inst_m_axi_arlock_UNCONNECTED[1],\^m_axi_arlock }),
        .m_axi_arprot(m_axi_arprot),
        .m_axi_arqos(m_axi_arqos),
        .m_axi_arready(m_axi_arready),
        .m_axi_arregion(NLW_inst_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(m_axi_arsize),
        .m_axi_aruser(NLW_inst_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awburst(m_axi_awburst),
        .m_axi_awcache(m_axi_awcache),
        .m_axi_awid(NLW_inst_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(m_axi_awlen),
        .m_axi_awlock({NLW_inst_m_axi_awlock_UNCONNECTED[1],\^m_axi_awlock }),
        .m_axi_awprot(m_axi_awprot),
        .m_axi_awqos(m_axi_awqos),
        .m_axi_awready(m_axi_awready),
        .m_axi_awregion(NLW_inst_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(m_axi_awsize),
        .m_axi_awuser(NLW_inst_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_bid(1'b0),
        .m_axi_bready(m_axi_bready),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_rdata(m_axi_rdata),
        .m_axi_rid(1'b0),
        .m_axi_rlast(m_axi_rlast),
        .m_axi_rready(m_axi_rready),
        .m_axi_rresp(m_axi_rresp),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(m_axi_rvalid),
        .m_axi_wdata(m_axi_wdata),
        .m_axi_wid(NLW_inst_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(m_axi_wlast),
        .m_axi_wready(m_axi_wready),
        .m_axi_wstrb(m_axi_wstrb),
        .m_axi_wuser(NLW_inst_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(m_axi_wvalid),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arcache(s_axi_arcache),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,s_axi_arlen[3:0]}),
        .s_axi_arlock(s_axi_arlock),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arqos(s_axi_arqos),
        .s_axi_arready(s_axi_arready),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awcache(s_axi_awcache),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,s_axi_awlen[3:0]}),
        .s_axi_awlock(s_axi_awlock),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awqos(s_axi_awqos),
        .s_axi_awready(s_axi_awready),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(NLW_inst_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_buser(NLW_inst_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rid(NLW_inst_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_ruser(NLW_inst_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) 
(* INV_DEF_VAL = "1'b1" *) (* RST_ACTIVE_HIGH = "1" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "ASYNC_RST" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_async_rst
   (src_arst,
    dest_clk,
    dest_arst);
  input src_arst;
  input dest_clk;
  output dest_arst;

  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ASYNC_RST" *) wire [1:0]arststages_ff;
  wire dest_clk;
  wire src_arst;

  assign dest_arst = arststages_ff[1];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(src_arst),
        .Q(arststages_ff[0]));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(arststages_ff[0]),
        .PRE(src_arst),
        .Q(arststages_ff[1]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
md0AksSCeI3fOZtF7nrw91OgSzGoACBon4GH9ENTzaI4jlg22H1uTtXayX2Kz+g4ZH2j52rtMH8H
Xc49HVcThMzO1cRXu+SkL59MRQ87klGca4XtjrTtunJoQ+jyOKRwRBeIMHUdntbk2T1kbXHf9KkB
bNYGEMqSrbiDt7IJUx8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
r6CzxR0T3O2wvZRQe25aX3/CWOx/3d/3vJvvS/XsrKr7v852GNQNqCBn+PKsunj0Ncep8DqHtVie
BE6tKIqZW+3txAUjrhSri5liuFWSnzAk+Drsb4RnvIy7BeOdAK6NhVhn8ZyplkJSHVwaGjN8gtPE
LeWEHPHf5qLnzqGKV7B6oIC7POGV6Vamos1p2z1xv2cEw4udvmtZ5EjzeyCMf+omtxEPxhPi6Z2h
ENlGOmuPMkWGMjP6HQCZ1Mi0uiST/zDo29UDIMmOGcsDMe97imU/z2ekKTPXXwjcV+9q+4zHRgJV
6JWWgjU9cztV5OMaEfpBgRBWae/ijWpPZaGuFA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
glFrHilvyO7nq7/OYhnyb9uU9d8UNGJruNnkmJWuTpgvyCDmtx7iVKPBPe1Bj9jUDT/HM9AGxvu0
g7b4TuMdVkegkVPeHhw31IW0HoTL8wPnrLEpzDVK+B7xl953hPKPe0vn+0EQh2UKeL5K8VLxmsSv
gbpEeToeR90yzlSUzDE=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
D4uBhES8Mkd0GCwY2aQOmEzTqz6hO5B9Wa2oyfVBEODkWyt+AHkIXn4tuBN05FcP2FVmgtVbvZX5
K6iog51IoPw5tv+pM5x8+bQBX/aZpf0c4to3qiX6RZuITpuSUWq/7sqQDqtMqDWOFMMnUBpTX+qI
t61NvyIZcfqRWo4yvIUV2Zh1etqYKDlhqRnMoBZKMeHFpVsp19nU4sf5Km7sSlPQ08vYD8qtJqgJ
ZDYC2KWFTHsnT+5anHvc80FgHt4zBHpPrGprgpltQmVmMZxUD6NRC9EvvXf+pBhgfwPHHePWIKUn
elLld/HEVeFw76SlVV8i4LsS4KWWOM+KmMprEg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
EW9gHDqS12MVhy+y/xQVscLd4qOim+cNTepYzlas7WzqDJogZthddOuGjpm3a3fS/cMbF/h0O1Hb
Wjow664GIga0y96lkbkcJ3W8x/IGAsvgyrYT6ScsFhyq7tSd1HjvRG81BhhGM1mmpxfzh0Uqbfso
q+uVKPUmPnbQ/Gdu9YRoxmYVJdmUTpXJ5waYOdib8WNMPLdDfIo/FGrYrx2zYQBtpU5DwwVUTMrB
ZasEyxOj++icI5k5lR3Tx+3gdCFTy4XYQfcj2COm4gnVZ8FN/X1/+0ywsVGAc/OKL+mjMYH3NNH3
zfDO/TpYft+HaVl+CfF/U6IgJJeJs4qI4gB4FA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Myfv5Skg7QCxlNBoFiSTLAeIRYS0J0ArRihYk7dGAHZWAFlxJLgqo51W9P9zTVBurMJjZLtonoDJ
19RfxQj5GqhqN1A20s8xOFfLq6+uDG/V39xQFY32O626Kh4MMlH07hNJL5u1NjJWg1yze0XdFEe9
oLwKQz5lSKGMIh+VPXDuCGhShS+KhHwGEdS0lmA/IHPFNlRG1LsK0zQmUiNkG4kQ5OEVkQgvknNC
B6++ZDIYlT9WbZPs5giRY0zAhUepLPaO+N9F3fIBKVGw4ejbZOt0kXKixF86DDfLmF2+dov+PrTX
1MXJaea3YoQdR2c2MSHAk/TTkzg9ayjvxKaXpg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ks9l+EPHXfDNnWd0exs1j0Q9iSNYaIExwQnpsi8TFJimjPtOkX050wFklsLBM83WyfuD+F2KLNnZ
Jg/aiIiGe9o424jOiEFdnAJuzrD0QL9WmhQ3W9iRJ7uPhha6NfR2WGTCCM4TpN8rTKLQDKxenVfv
6x83rnL5NQxvpp9cQh3zMma73qoEJjhTR9MD9cwA4VeKq2u/R0iTWBplX81vYFd9TW2qW5/Qyzzj
A0+pXzczcJKdggV8h8bYcO+PRC3t2XrufhnjvhjMLG2tPHSMW/soDH/v8KorXyWe5N/q12fo5auN
SXr3olNuB5kpiVS3mJAPV0z4UsFfu2A4hLH7MQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
e3AJKDEM9byJqwpkFZqMIMKMQPOR1VrLFkshor7HR0C+ol7Uv3XTGyvQrINdBEArX0eazF0cHWjC
9B4BhDnysAhT6SENcNHIYHUGQE7uiF7zgL7WhCxClwEnIAVj+PU9FmqlvbreEikHQfbeIDPyCLii
NAS97RDxWki/MfR33zvZX4eEolA/oTyRzr1MagBs7LN1UXyGPvnze8JzHxA3zHVedIIrBrZxkfoj
Loqe6tLYRlC45h1Yr3Wa2gh3LJGtOSji+m7E9Xua/pPh8A/CAD+TNBa5d/X7C3a4AWl2bYTi7HBY
Y8vaIjHiSosru5F2UOEQG9xekCbNRK1Apew1UIvntzCmDMMhlAgB78AUOE2YEWKd9GOl+aTZjMS3
GxAYzrtv/bDRkPOYbcG0SNT9xf+izRM3lX1E2vN3i3uU2Qrh73fjU1lk3PIe/A/H56UrNPDnGT9W
TvlJR47bLDtGyX2+dLvfTaZGRP8aepePOXXLIlvqwCJSMVhCB/hIbz7E

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TfuXOFQtE7YhtTL4354NvKETmBCLSVnb+pbrT8gtzjU7pERE1Hu2ZVzHgVQXwt5RvwG1R/z2je+U
PzszCBhPNqUaXEhuJ0A/q0S/vvOOa6h6tW9MhiB3gnuqEFVWz5pbHZNfgrwh2gT8XyqLI8f1CoJM
xpcB2TbREV/kAAFMxIfH1Dg0KSO2dCeVV1na6N0AiMOQPvXZOB7QpXwNDbYfarWLtF0/l0hi4Fxu
Kgho2ggrUhajP0aKlrCQ9mLsqOyqJELeJldeD+vuUUqhYq4K4RrwtQF+B67lYc4AjznwQ92tUvYJ
ZspFoHJEScNvdFoHFTA2TQ2KToepsqXRiOCL1A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tmfbBpNtCYJ7zsgNxUzw7Dvn+hNn2PPUBeRfXSci/q2/OcQeF/eAAML8YIN1V+AEoAqZTE2/xRQz
+6zwVOLyAOLynMIBQ7EG7xReDJ9kEEiBjnMGO6NWdAsa/VcreVHrLD1PFtA1+WoVe6yOvNGK+Nbh
HjPkXyycyP6RQ4Rx/PtTxw31LOFVezddSgRlaKHTprKTP4LbjPG//onRBg3fAl8zwU1wYYNLzYCX
jwY7xfMkQyhUSpV2Tx3seqy2IYVl8jjxynFxfyxulvrJiqmc6aaKKBdkoOVbJ5eO2sCXFJB1mKEU
WR2Ee2ozisABzk9IcGILewCW7ghdLP82CRZv4A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GfDCxx9db4ripD5mvQy16BVlwPYfeC7ZobZXaX1my6WUDiKwd69J5SreUXKYD9lvZfI7djLgHkYm
5G247T4NX7zoBwc88bUD+tNvGNmzWFfSVVZqu8hjgd31lZXjy9uYdXA/gsE+T+JqEfRYdV8YoGgm
sREyiJjWRPDbx6kc8um8vlAK/Rjwz0EGVkGUoi/+UvxcnjG1PqCl7GSMOQ3gFMEOaxIflShnF2/c
//ioADxl3WjUGyTstMK54XlP8G1Hk95sSe/7Y+SbaIyoG8t6gGDimDJNuGs4JjDUi1V7Gxfzxk9+
O2J++9clyLkMZ3rRyxSvR+Xyrmn3YxjVC68GXw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 71856)
`pragma protect data_block
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
`pragma protect end_protected
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
