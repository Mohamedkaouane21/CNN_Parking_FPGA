// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Thu Feb 26 16:47:59 2026
// Host        : badhak-Precision-7720 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_axi_ic_data_imp_auto_pc_0_sim_netlist.v
// Design      : design_1_axi_ic_data_imp_auto_pc_0
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

(* CHECK_LICENSE_TYPE = "design_1_axi_ic_data_imp_auto_pc_0,axi_protocol_converter_v2_1_33_axi_protocol_converter,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "axi_protocol_converter_v2_1_33_axi_protocol_converter,Vivado 2024.2" *) 
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
