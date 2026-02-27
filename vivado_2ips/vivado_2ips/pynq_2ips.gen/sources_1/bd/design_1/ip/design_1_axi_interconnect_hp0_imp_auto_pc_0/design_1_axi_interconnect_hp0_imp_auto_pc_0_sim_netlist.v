// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Thu Feb 26 17:01:25 2026
// Host        : badhak-Precision-7720 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/badhak/Téléchargements/vivado_2ips/vivado_2ips/pynq_2ips.gen/sources_1/bd/design_1/ip/design_1_axi_interconnect_hp0_imp_auto_pc_0/design_1_axi_interconnect_hp0_imp_auto_pc_0_sim_netlist.v
// Design      : design_1_axi_interconnect_hp0_imp_auto_pc_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_axi_interconnect_hp0_imp_auto_pc_0,axi_protocol_converter_v2_1_33_axi_protocol_converter,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "axi_protocol_converter_v2_1_33_axi_protocol_converter,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module design_1_axi_interconnect_hp0_imp_auto_pc_0
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
  design_1_axi_interconnect_hp0_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter inst
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
module design_1_axi_interconnect_hp0_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo
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
  design_1_axi_interconnect_hp0_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen inst
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
module design_1_axi_interconnect_hp0_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen
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
  design_1_axi_interconnect_hp0_imp_auto_pc_0_fifo_generator_v13_2_11 fifo_gen_inst
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
module design_1_axi_interconnect_hp0_imp_auto_pc_0_axi_protocol_converter_v2_1_33_a_axi3_conv
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
  design_1_axi_interconnect_hp0_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo \USE_BURSTS.cmd_queue 
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
module design_1_axi_interconnect_hp0_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi3_conv
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

  design_1_axi_interconnect_hp0_imp_auto_pc_0_axi_protocol_converter_v2_1_33_a_axi3_conv \USE_WRITE.write_addr_inst 
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
  design_1_axi_interconnect_hp0_imp_auto_pc_0_axi_protocol_converter_v2_1_33_w_axi3_conv \USE_WRITE.write_data_inst 
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
module design_1_axi_interconnect_hp0_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter
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
  design_1_axi_interconnect_hp0_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi3_conv \gen_axi4_axi3.axi3_conv_inst 
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
module design_1_axi_interconnect_hp0_imp_auto_pc_0_axi_protocol_converter_v2_1_33_w_axi3_conv
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
module design_1_axi_interconnect_hp0_imp_auto_pc_0_xpm_cdc_async_rst
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 72464)
`pragma protect data_block
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
JS/UNN/nMr3GM8KhbuA8Pwk=
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
