// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Thu Feb 26 16:48:00 2026
// Host        : badhak-Precision-7720 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/badhak/Téléchargements/conv1_pool1_v4/vivado_pynq/pynq_conv1.gen/sources_1/bd/design_1/ip/design_1_axi_ic_data_imp_auto_pc_0/design_1_axi_ic_data_imp_auto_pc_0_sim_netlist.v
// Design      : design_1_axi_ic_data_imp_auto_pc_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_axi_ic_data_imp_auto_pc_0,axi_protocol_converter_v2_1_33_axi_protocol_converter,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "axi_protocol_converter_v2_1_33_axi_protocol_converter,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module design_1_axi_ic_data_imp_auto_pc_0
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
  design_1_axi_ic_data_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter inst
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

(* ORIG_REF_NAME = "axi_data_fifo_v2_1_32_axic_fifo" *) 
module design_1_axi_ic_data_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo
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
  design_1_axi_ic_data_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen inst
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

(* ORIG_REF_NAME = "axi_data_fifo_v2_1_32_fifo_gen" *) 
module design_1_axi_ic_data_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen
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
  design_1_axi_ic_data_imp_auto_pc_0_fifo_generator_v13_2_11 fifo_gen_inst
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

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_33_a_axi3_conv" *) 
module design_1_axi_ic_data_imp_auto_pc_0_axi_protocol_converter_v2_1_33_a_axi3_conv
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
  design_1_axi_ic_data_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo \USE_BURSTS.cmd_queue 
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

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_33_axi3_conv" *) 
module design_1_axi_ic_data_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi3_conv
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

  design_1_axi_ic_data_imp_auto_pc_0_axi_protocol_converter_v2_1_33_a_axi3_conv \USE_WRITE.write_addr_inst 
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
  design_1_axi_ic_data_imp_auto_pc_0_axi_protocol_converter_v2_1_33_w_axi3_conv \USE_WRITE.write_data_inst 
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
(* C_TRANSLATION_MODE = "0" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "axi_protocol_converter_v2_1_33_axi_protocol_converter" *) 
(* P_AXI3 = "1" *) (* P_AXI4 = "0" *) (* P_AXILITE = "2" *) 
(* P_AXILITE_SIZE = "3'b011" *) (* P_CONVERSION = "2" *) (* P_DECERR = "2'b11" *) 
(* P_INCR = "2'b01" *) (* P_PROTECTION = "1" *) (* P_SLVERR = "2'b10" *) 
module design_1_axi_ic_data_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter
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
  design_1_axi_ic_data_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi3_conv \gen_axi4_axi3.axi3_conv_inst 
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

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_33_w_axi3_conv" *) 
module design_1_axi_ic_data_imp_auto_pc_0_axi_protocol_converter_v2_1_33_w_axi3_conv
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

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) 
(* INV_DEF_VAL = "1'b1" *) (* ORIG_REF_NAME = "xpm_cdc_async_rst" *) (* RST_ACTIVE_HIGH = "1" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "ASYNC_RST" *) 
module design_1_axi_ic_data_imp_auto_pc_0_xpm_cdc_async_rst
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 72224)
`pragma protect data_block
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
1vYeCwo=
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
