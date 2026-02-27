// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Thu Feb 26 17:01:57 2026
// Host        : badhak-Precision-7720 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_conv2_pool2_0_0_stub.v
// Design      : design_1_conv2_pool2_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "design_1_conv2_pool2_0_0,conv2_pool2,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "HLS" *) 
(* X_CORE_INFO = "conv2_pool2,Vivado 2024.2" *) (* hls_module = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(s_axi_control_ARADDR, 
  s_axi_control_ARREADY, s_axi_control_ARVALID, s_axi_control_AWADDR, 
  s_axi_control_AWREADY, s_axi_control_AWVALID, s_axi_control_BREADY, 
  s_axi_control_BRESP, s_axi_control_BVALID, s_axi_control_RDATA, s_axi_control_RREADY, 
  s_axi_control_RRESP, s_axi_control_RVALID, s_axi_control_WDATA, s_axi_control_WREADY, 
  s_axi_control_WSTRB, s_axi_control_WVALID, ap_clk, ap_rst_n, interrupt, 
  m_axi_AXI_IN_ARADDR, m_axi_AXI_IN_ARBURST, m_axi_AXI_IN_ARCACHE, m_axi_AXI_IN_ARID, 
  m_axi_AXI_IN_ARLEN, m_axi_AXI_IN_ARLOCK, m_axi_AXI_IN_ARPROT, m_axi_AXI_IN_ARQOS, 
  m_axi_AXI_IN_ARREADY, m_axi_AXI_IN_ARREGION, m_axi_AXI_IN_ARSIZE, m_axi_AXI_IN_ARVALID, 
  m_axi_AXI_IN_AWADDR, m_axi_AXI_IN_AWBURST, m_axi_AXI_IN_AWCACHE, m_axi_AXI_IN_AWID, 
  m_axi_AXI_IN_AWLEN, m_axi_AXI_IN_AWLOCK, m_axi_AXI_IN_AWPROT, m_axi_AXI_IN_AWQOS, 
  m_axi_AXI_IN_AWREADY, m_axi_AXI_IN_AWREGION, m_axi_AXI_IN_AWSIZE, m_axi_AXI_IN_AWVALID, 
  m_axi_AXI_IN_BID, m_axi_AXI_IN_BREADY, m_axi_AXI_IN_BRESP, m_axi_AXI_IN_BVALID, 
  m_axi_AXI_IN_RDATA, m_axi_AXI_IN_RID, m_axi_AXI_IN_RLAST, m_axi_AXI_IN_RREADY, 
  m_axi_AXI_IN_RRESP, m_axi_AXI_IN_RVALID, m_axi_AXI_IN_WDATA, m_axi_AXI_IN_WID, 
  m_axi_AXI_IN_WLAST, m_axi_AXI_IN_WREADY, m_axi_AXI_IN_WSTRB, m_axi_AXI_IN_WVALID, 
  m_axi_AXI_OUT_ARADDR, m_axi_AXI_OUT_ARBURST, m_axi_AXI_OUT_ARCACHE, m_axi_AXI_OUT_ARID, 
  m_axi_AXI_OUT_ARLEN, m_axi_AXI_OUT_ARLOCK, m_axi_AXI_OUT_ARPROT, m_axi_AXI_OUT_ARQOS, 
  m_axi_AXI_OUT_ARREADY, m_axi_AXI_OUT_ARREGION, m_axi_AXI_OUT_ARSIZE, 
  m_axi_AXI_OUT_ARVALID, m_axi_AXI_OUT_AWADDR, m_axi_AXI_OUT_AWBURST, 
  m_axi_AXI_OUT_AWCACHE, m_axi_AXI_OUT_AWID, m_axi_AXI_OUT_AWLEN, m_axi_AXI_OUT_AWLOCK, 
  m_axi_AXI_OUT_AWPROT, m_axi_AXI_OUT_AWQOS, m_axi_AXI_OUT_AWREADY, 
  m_axi_AXI_OUT_AWREGION, m_axi_AXI_OUT_AWSIZE, m_axi_AXI_OUT_AWVALID, m_axi_AXI_OUT_BID, 
  m_axi_AXI_OUT_BREADY, m_axi_AXI_OUT_BRESP, m_axi_AXI_OUT_BVALID, m_axi_AXI_OUT_RDATA, 
  m_axi_AXI_OUT_RID, m_axi_AXI_OUT_RLAST, m_axi_AXI_OUT_RREADY, m_axi_AXI_OUT_RRESP, 
  m_axi_AXI_OUT_RVALID, m_axi_AXI_OUT_WDATA, m_axi_AXI_OUT_WID, m_axi_AXI_OUT_WLAST, 
  m_axi_AXI_OUT_WREADY, m_axi_AXI_OUT_WSTRB, m_axi_AXI_OUT_WVALID)
/* synthesis syn_black_box black_box_pad_pin="s_axi_control_ARADDR[5:0],s_axi_control_ARREADY,s_axi_control_ARVALID,s_axi_control_AWADDR[5:0],s_axi_control_AWREADY,s_axi_control_AWVALID,s_axi_control_BREADY,s_axi_control_BRESP[1:0],s_axi_control_BVALID,s_axi_control_RDATA[31:0],s_axi_control_RREADY,s_axi_control_RRESP[1:0],s_axi_control_RVALID,s_axi_control_WDATA[31:0],s_axi_control_WREADY,s_axi_control_WSTRB[3:0],s_axi_control_WVALID,ap_rst_n,interrupt,m_axi_AXI_IN_ARADDR[63:0],m_axi_AXI_IN_ARBURST[1:0],m_axi_AXI_IN_ARCACHE[3:0],m_axi_AXI_IN_ARID[0:0],m_axi_AXI_IN_ARLEN[7:0],m_axi_AXI_IN_ARLOCK[1:0],m_axi_AXI_IN_ARPROT[2:0],m_axi_AXI_IN_ARQOS[3:0],m_axi_AXI_IN_ARREADY,m_axi_AXI_IN_ARREGION[3:0],m_axi_AXI_IN_ARSIZE[2:0],m_axi_AXI_IN_ARVALID,m_axi_AXI_IN_AWADDR[63:0],m_axi_AXI_IN_AWBURST[1:0],m_axi_AXI_IN_AWCACHE[3:0],m_axi_AXI_IN_AWID[0:0],m_axi_AXI_IN_AWLEN[7:0],m_axi_AXI_IN_AWLOCK[1:0],m_axi_AXI_IN_AWPROT[2:0],m_axi_AXI_IN_AWQOS[3:0],m_axi_AXI_IN_AWREADY,m_axi_AXI_IN_AWREGION[3:0],m_axi_AXI_IN_AWSIZE[2:0],m_axi_AXI_IN_AWVALID,m_axi_AXI_IN_BID[0:0],m_axi_AXI_IN_BREADY,m_axi_AXI_IN_BRESP[1:0],m_axi_AXI_IN_BVALID,m_axi_AXI_IN_RDATA[31:0],m_axi_AXI_IN_RID[0:0],m_axi_AXI_IN_RLAST,m_axi_AXI_IN_RREADY,m_axi_AXI_IN_RRESP[1:0],m_axi_AXI_IN_RVALID,m_axi_AXI_IN_WDATA[31:0],m_axi_AXI_IN_WID[0:0],m_axi_AXI_IN_WLAST,m_axi_AXI_IN_WREADY,m_axi_AXI_IN_WSTRB[3:0],m_axi_AXI_IN_WVALID,m_axi_AXI_OUT_ARADDR[63:0],m_axi_AXI_OUT_ARBURST[1:0],m_axi_AXI_OUT_ARCACHE[3:0],m_axi_AXI_OUT_ARID[0:0],m_axi_AXI_OUT_ARLEN[7:0],m_axi_AXI_OUT_ARLOCK[1:0],m_axi_AXI_OUT_ARPROT[2:0],m_axi_AXI_OUT_ARQOS[3:0],m_axi_AXI_OUT_ARREADY,m_axi_AXI_OUT_ARREGION[3:0],m_axi_AXI_OUT_ARSIZE[2:0],m_axi_AXI_OUT_ARVALID,m_axi_AXI_OUT_AWADDR[63:0],m_axi_AXI_OUT_AWBURST[1:0],m_axi_AXI_OUT_AWCACHE[3:0],m_axi_AXI_OUT_AWID[0:0],m_axi_AXI_OUT_AWLEN[7:0],m_axi_AXI_OUT_AWLOCK[1:0],m_axi_AXI_OUT_AWPROT[2:0],m_axi_AXI_OUT_AWQOS[3:0],m_axi_AXI_OUT_AWREADY,m_axi_AXI_OUT_AWREGION[3:0],m_axi_AXI_OUT_AWSIZE[2:0],m_axi_AXI_OUT_AWVALID,m_axi_AXI_OUT_BID[0:0],m_axi_AXI_OUT_BREADY,m_axi_AXI_OUT_BRESP[1:0],m_axi_AXI_OUT_BVALID,m_axi_AXI_OUT_RDATA[63:0],m_axi_AXI_OUT_RID[0:0],m_axi_AXI_OUT_RLAST,m_axi_AXI_OUT_RREADY,m_axi_AXI_OUT_RRESP[1:0],m_axi_AXI_OUT_RVALID,m_axi_AXI_OUT_WDATA[63:0],m_axi_AXI_OUT_WID[0:0],m_axi_AXI_OUT_WLAST,m_axi_AXI_OUT_WREADY,m_axi_AXI_OUT_WSTRB[7:0],m_axi_AXI_OUT_WVALID" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 6, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, FREQ_HZ 100000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [5:0]s_axi_control_ARADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY" *) output s_axi_control_ARREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID" *) input s_axi_control_ARVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR" *) input [5:0]s_axi_control_AWADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY" *) output s_axi_control_AWREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID" *) input s_axi_control_AWVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BREADY" *) input s_axi_control_BREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BRESP" *) output [1:0]s_axi_control_BRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BVALID" *) output s_axi_control_BVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RDATA" *) output [31:0]s_axi_control_RDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RREADY" *) input s_axi_control_RREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RRESP" *) output [1:0]s_axi_control_RRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RVALID" *) output s_axi_control_RVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WDATA" *) input [31:0]s_axi_control_WDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WREADY" *) output s_axi_control_WREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB" *) input [3:0]s_axi_control_WSTRB;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WVALID" *) input s_axi_control_WVALID;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_control:m_axi_AXI_IN:m_axi_AXI_OUT, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input ap_clk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input ap_rst_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1" *) output interrupt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARADDR" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_AXI_IN, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, MAX_BURST_LENGTH 256, PROTOCOL AXI4, READ_WRITE_MODE READ_ONLY, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, ADDR_WIDTH 64, DATA_WIDTH 32, FREQ_HZ 100000000, ID_WIDTH 1, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output [63:0]m_axi_AXI_IN_ARADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARBURST" *) output [1:0]m_axi_AXI_IN_ARBURST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARCACHE" *) output [3:0]m_axi_AXI_IN_ARCACHE;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARID" *) output [0:0]m_axi_AXI_IN_ARID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARLEN" *) output [7:0]m_axi_AXI_IN_ARLEN;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARLOCK" *) output [1:0]m_axi_AXI_IN_ARLOCK;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARPROT" *) output [2:0]m_axi_AXI_IN_ARPROT;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARQOS" *) output [3:0]m_axi_AXI_IN_ARQOS;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARREADY" *) input m_axi_AXI_IN_ARREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARREGION" *) output [3:0]m_axi_AXI_IN_ARREGION;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARSIZE" *) output [2:0]m_axi_AXI_IN_ARSIZE;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN ARVALID" *) output m_axi_AXI_IN_ARVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWADDR" *) output [63:0]m_axi_AXI_IN_AWADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWBURST" *) output [1:0]m_axi_AXI_IN_AWBURST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWCACHE" *) output [3:0]m_axi_AXI_IN_AWCACHE;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWID" *) output [0:0]m_axi_AXI_IN_AWID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWLEN" *) output [7:0]m_axi_AXI_IN_AWLEN;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWLOCK" *) output [1:0]m_axi_AXI_IN_AWLOCK;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWPROT" *) output [2:0]m_axi_AXI_IN_AWPROT;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWQOS" *) output [3:0]m_axi_AXI_IN_AWQOS;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWREADY" *) input m_axi_AXI_IN_AWREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWREGION" *) output [3:0]m_axi_AXI_IN_AWREGION;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWSIZE" *) output [2:0]m_axi_AXI_IN_AWSIZE;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN AWVALID" *) output m_axi_AXI_IN_AWVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN BID" *) input [0:0]m_axi_AXI_IN_BID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN BREADY" *) output m_axi_AXI_IN_BREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN BRESP" *) input [1:0]m_axi_AXI_IN_BRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN BVALID" *) input m_axi_AXI_IN_BVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN RDATA" *) input [31:0]m_axi_AXI_IN_RDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN RID" *) input [0:0]m_axi_AXI_IN_RID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN RLAST" *) input m_axi_AXI_IN_RLAST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN RREADY" *) output m_axi_AXI_IN_RREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN RRESP" *) input [1:0]m_axi_AXI_IN_RRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN RVALID" *) input m_axi_AXI_IN_RVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN WDATA" *) output [31:0]m_axi_AXI_IN_WDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN WID" *) output [0:0]m_axi_AXI_IN_WID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN WLAST" *) output m_axi_AXI_IN_WLAST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN WREADY" *) input m_axi_AXI_IN_WREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN WSTRB" *) output [3:0]m_axi_AXI_IN_WSTRB;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_IN WVALID" *) output m_axi_AXI_IN_WVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARADDR" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_AXI_OUT, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, MAX_BURST_LENGTH 256, PROTOCOL AXI4, READ_WRITE_MODE WRITE_ONLY, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, ADDR_WIDTH 64, DATA_WIDTH 64, FREQ_HZ 100000000, ID_WIDTH 1, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output [63:0]m_axi_AXI_OUT_ARADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARBURST" *) output [1:0]m_axi_AXI_OUT_ARBURST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARCACHE" *) output [3:0]m_axi_AXI_OUT_ARCACHE;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARID" *) output [0:0]m_axi_AXI_OUT_ARID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARLEN" *) output [7:0]m_axi_AXI_OUT_ARLEN;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARLOCK" *) output [1:0]m_axi_AXI_OUT_ARLOCK;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARPROT" *) output [2:0]m_axi_AXI_OUT_ARPROT;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARQOS" *) output [3:0]m_axi_AXI_OUT_ARQOS;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARREADY" *) input m_axi_AXI_OUT_ARREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARREGION" *) output [3:0]m_axi_AXI_OUT_ARREGION;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARSIZE" *) output [2:0]m_axi_AXI_OUT_ARSIZE;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT ARVALID" *) output m_axi_AXI_OUT_ARVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWADDR" *) output [63:0]m_axi_AXI_OUT_AWADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWBURST" *) output [1:0]m_axi_AXI_OUT_AWBURST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWCACHE" *) output [3:0]m_axi_AXI_OUT_AWCACHE;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWID" *) output [0:0]m_axi_AXI_OUT_AWID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWLEN" *) output [7:0]m_axi_AXI_OUT_AWLEN;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWLOCK" *) output [1:0]m_axi_AXI_OUT_AWLOCK;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWPROT" *) output [2:0]m_axi_AXI_OUT_AWPROT;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWQOS" *) output [3:0]m_axi_AXI_OUT_AWQOS;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWREADY" *) input m_axi_AXI_OUT_AWREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWREGION" *) output [3:0]m_axi_AXI_OUT_AWREGION;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWSIZE" *) output [2:0]m_axi_AXI_OUT_AWSIZE;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT AWVALID" *) output m_axi_AXI_OUT_AWVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT BID" *) input [0:0]m_axi_AXI_OUT_BID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT BREADY" *) output m_axi_AXI_OUT_BREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT BRESP" *) input [1:0]m_axi_AXI_OUT_BRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT BVALID" *) input m_axi_AXI_OUT_BVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT RDATA" *) input [63:0]m_axi_AXI_OUT_RDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT RID" *) input [0:0]m_axi_AXI_OUT_RID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT RLAST" *) input m_axi_AXI_OUT_RLAST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT RREADY" *) output m_axi_AXI_OUT_RREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT RRESP" *) input [1:0]m_axi_AXI_OUT_RRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT RVALID" *) input m_axi_AXI_OUT_RVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT WDATA" *) output [63:0]m_axi_AXI_OUT_WDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT WID" *) output [0:0]m_axi_AXI_OUT_WID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT WLAST" *) output m_axi_AXI_OUT_WLAST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT WREADY" *) input m_axi_AXI_OUT_WREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT WSTRB" *) output [7:0]m_axi_AXI_OUT_WSTRB;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_AXI_OUT WVALID" *) output m_axi_AXI_OUT_WVALID;
endmodule
