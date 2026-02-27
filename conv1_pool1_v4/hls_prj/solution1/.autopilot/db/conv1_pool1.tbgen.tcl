set moduleName conv1_pool1
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_chain
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 6
set C_modelName {conv1_pool1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ AXI_IN int 512 regular {axi_master 0}  }
	{ AXI_OUT int 32 regular {axi_master 1}  }
	{ in_r int 64 regular {axi_slave 0}  }
	{ out_r int 64 regular {axi_slave 0}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "AXI_IN", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "in_r","offset": { "type": "dynamic","port_name": "in_r","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "AXI_OUT", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "out_r","offset": { "type": "dynamic","port_name": "out_r","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "in_r", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "out_r", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} ]}
# RTL Port declarations: 
set portNum 110
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_AXI_IN_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_AXI_IN_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WDATA sc_out sc_lv 512 signal 0 } 
	{ m_axi_AXI_IN_WSTRB sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_AXI_IN_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_AXI_IN_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_AXI_IN_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RDATA sc_in sc_lv 512 signal 0 } 
	{ m_axi_AXI_IN_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_AXI_IN_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_AXI_IN_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_IN_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_AXI_OUT_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_AXI_OUT_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_AXI_OUT_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_AXI_OUT_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_AXI_OUT_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_AXI_OUT_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_AXI_OUT_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_AXI_OUT_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_AXI_OUT_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_AXI_OUT_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_AXI_OUT_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_AXI_OUT_BUSER sc_in sc_lv 1 signal 1 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"conv1_pool1","role":"start","value":"0","valid_bit":"0"},{"name":"conv1_pool1","role":"continue","value":"0","valid_bit":"4"},{"name":"conv1_pool1","role":"auto_start","value":"0","valid_bit":"7"},{"name":"in_r","role":"data","value":"16"},{"name":"out_r","role":"data","value":"28"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"conv1_pool1","role":"start","value":"0","valid_bit":"0"},{"name":"conv1_pool1","role":"done","value":"0","valid_bit":"1"},{"name":"conv1_pool1","role":"idle","value":"0","valid_bit":"2"},{"name":"conv1_pool1","role":"ready","value":"0","valid_bit":"3"},{"name":"conv1_pool1","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_AXI_IN_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_IN_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_IN_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_IN_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_IN_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLEN" }} , 
 	{ "name": "m_axi_AXI_IN_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_AXI_IN_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWBURST" }} , 
 	{ "name": "m_axi_AXI_IN_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_AXI_IN_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_AXI_IN_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWPROT" }} , 
 	{ "name": "m_axi_AXI_IN_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWQOS" }} , 
 	{ "name": "m_axi_AXI_IN_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWREGION" }} , 
 	{ "name": "m_axi_AXI_IN_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "AWUSER" }} , 
 	{ "name": "m_axi_AXI_IN_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WVALID" }} , 
 	{ "name": "m_axi_AXI_IN_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WREADY" }} , 
 	{ "name": "m_axi_AXI_IN_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_IN_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_IN_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_IN_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_IN_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_IN_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_IN_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_IN_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_IN_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_IN_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLEN" }} , 
 	{ "name": "m_axi_AXI_IN_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_AXI_IN_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARBURST" }} , 
 	{ "name": "m_axi_AXI_IN_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_AXI_IN_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_AXI_IN_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARPROT" }} , 
 	{ "name": "m_axi_AXI_IN_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARQOS" }} , 
 	{ "name": "m_axi_AXI_IN_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARREGION" }} , 
 	{ "name": "m_axi_AXI_IN_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "ARUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RVALID" }} , 
 	{ "name": "m_axi_AXI_IN_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RREADY" }} , 
 	{ "name": "m_axi_AXI_IN_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_IN_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_IN_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_IN_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_IN_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_IN_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_IN_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_IN_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_IN_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_IN", "role": "BUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWID" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLEN" }} , 
 	{ "name": "m_axi_AXI_OUT_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_AXI_OUT_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWBURST" }} , 
 	{ "name": "m_axi_AXI_OUT_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_AXI_OUT_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_AXI_OUT_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWPROT" }} , 
 	{ "name": "m_axi_AXI_OUT_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWQOS" }} , 
 	{ "name": "m_axi_AXI_OUT_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWREGION" }} , 
 	{ "name": "m_axi_AXI_OUT_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "AWUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WSTRB" }} , 
 	{ "name": "m_axi_AXI_OUT_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WID" }} , 
 	{ "name": "m_axi_AXI_OUT_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARADDR" }} , 
 	{ "name": "m_axi_AXI_OUT_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARID" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLEN" }} , 
 	{ "name": "m_axi_AXI_OUT_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_AXI_OUT_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARBURST" }} , 
 	{ "name": "m_axi_AXI_OUT_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_AXI_OUT_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_AXI_OUT_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARPROT" }} , 
 	{ "name": "m_axi_AXI_OUT_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARQOS" }} , 
 	{ "name": "m_axi_AXI_OUT_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARREGION" }} , 
 	{ "name": "m_axi_AXI_OUT_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "ARUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RLAST" }} , 
 	{ "name": "m_axi_AXI_OUT_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RID" }} , 
 	{ "name": "m_axi_AXI_OUT_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RUSER" }} , 
 	{ "name": "m_axi_AXI_OUT_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BVALID" }} , 
 	{ "name": "m_axi_AXI_OUT_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BREADY" }} , 
 	{ "name": "m_axi_AXI_OUT_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BRESP" }} , 
 	{ "name": "m_axi_AXI_OUT_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BID" }} , 
 	{ "name": "m_axi_AXI_OUT_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "60", "128", "138", "139", "140", "141"],
		"CDFG" : "conv1_pool1",
		"Protocol" : "ap_ctrl_chain",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "44859", "EstimateLatencyMax" : "44859",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_IN", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "AXI_IN_blk_n_AR", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "57", "SubInstance" : "grp_conv1_pool1_Pipeline_LOAD_fu_353", "Port" : "AXI_IN", "Inst_start_state" : "73", "Inst_end_state" : "74"}]},
			{"Name" : "AXI_OUT", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "AXI_OUT_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "AXI_OUT_blk_n_B", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "128", "SubInstance" : "grp_conv1_pool1_Pipeline_POOL_OC_POOL_PY_POOL_PX_fu_464", "Port" : "AXI_OUT", "Inst_start_state" : "77", "Inst_end_state" : "78"}]},
			{"Name" : "in_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "BIASES", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "60", "SubInstance" : "grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384", "Port" : "BIASES", "Inst_start_state" : "75", "Inst_end_state" : "76"}]},
			{"Name" : "p_ZL7WEIGHTS_0_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "60", "SubInstance" : "grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384", "Port" : "p_ZL7WEIGHTS_0_0", "Inst_start_state" : "75", "Inst_end_state" : "76"}]},
			{"Name" : "p_ZL7WEIGHTS_0_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "60", "SubInstance" : "grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384", "Port" : "p_ZL7WEIGHTS_0_1", "Inst_start_state" : "75", "Inst_end_state" : "76"}]},
			{"Name" : "p_ZL7WEIGHTS_0_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "60", "SubInstance" : "grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384", "Port" : "p_ZL7WEIGHTS_0_2", "Inst_start_state" : "75", "Inst_end_state" : "76"}]},
			{"Name" : "p_ZL7WEIGHTS_1_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "60", "SubInstance" : "grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384", "Port" : "p_ZL7WEIGHTS_1_0", "Inst_start_state" : "75", "Inst_end_state" : "76"}]},
			{"Name" : "p_ZL7WEIGHTS_1_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "60", "SubInstance" : "grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384", "Port" : "p_ZL7WEIGHTS_1_1", "Inst_start_state" : "75", "Inst_end_state" : "76"}]},
			{"Name" : "p_ZL7WEIGHTS_1_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "60", "SubInstance" : "grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384", "Port" : "p_ZL7WEIGHTS_1_2", "Inst_start_state" : "75", "Inst_end_state" : "76"}]},
			{"Name" : "p_ZL7WEIGHTS_2_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "60", "SubInstance" : "grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384", "Port" : "p_ZL7WEIGHTS_2_0", "Inst_start_state" : "75", "Inst_end_state" : "76"}]},
			{"Name" : "p_ZL7WEIGHTS_2_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "60", "SubInstance" : "grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384", "Port" : "p_ZL7WEIGHTS_2_1", "Inst_start_state" : "75", "Inst_end_state" : "76"}]},
			{"Name" : "p_ZL7WEIGHTS_2_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "60", "SubInstance" : "grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384", "Port" : "p_ZL7WEIGHTS_2_2", "Inst_start_state" : "75", "Inst_end_state" : "76"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_2_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_3_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_4_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_5_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_6_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_7_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_8_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_9_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_10_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_11_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_12_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_13_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_14_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_15_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_16_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_17_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_18_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_19_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_20_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_21_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_22_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_23_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_1_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_2_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_3_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_4_U", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_5_U", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_6_U", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_7_U", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_8_U", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_9_U", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_10_U", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_11_U", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_12_U", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_13_U", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_14_U", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_15_U", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_16_U", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_17_U", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_18_U", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_19_U", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_20_U", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_21_U", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_22_U", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_23_U", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_24_U", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_25_U", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_26_U", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_27_U", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_28_U", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_29_U", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_30_U", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conv_buf_31_U", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_LOAD_fu_353", "Parent" : "0", "Child" : ["58", "59"],
		"CDFG" : "conv1_pool1_Pipeline_LOAD",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2315", "EstimateLatencyMax" : "2315",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_IN", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "AXI_IN_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "in_buf", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_16", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_17", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_18", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_19", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_20", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_21", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_22", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_23", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "sext_ln67", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "LOAD", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter11", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter11", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_LOAD_fu_353.urem_6ns_3ns_2_10_1_U1", "Parent" : "57"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_LOAD_fu_353.flow_control_loop_pipe_sequential_init_U", "Parent" : "57"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384", "Parent" : "0", "Child" : ["61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127"],
		"CDFG" : "conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "33922", "EstimateLatencyMax" : "33922",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "conv_buf", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_16", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_17", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_18", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_19", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_20", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_21", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_22", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_23", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_24", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_25", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_26", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_27", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_28", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_29", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_30", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_31", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_16", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_17", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_18", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_19", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_20", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_21", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_22", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_23", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BIASES", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZL7WEIGHTS_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZL7WEIGHTS_0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZL7WEIGHTS_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZL7WEIGHTS_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZL7WEIGHTS_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZL7WEIGHTS_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZL7WEIGHTS_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZL7WEIGHTS_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZL7WEIGHTS_2_2", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "CONV_OC_CONV_OY_CONV_OX", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter65", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter65", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.BIASES_U", "Parent" : "60"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.p_ZL7WEIGHTS_0_0_U", "Parent" : "60"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.p_ZL7WEIGHTS_0_1_U", "Parent" : "60"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.p_ZL7WEIGHTS_0_2_U", "Parent" : "60"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.p_ZL7WEIGHTS_1_0_U", "Parent" : "60"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.p_ZL7WEIGHTS_1_1_U", "Parent" : "60"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.p_ZL7WEIGHTS_1_2_U", "Parent" : "60"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.p_ZL7WEIGHTS_2_0_U", "Parent" : "60"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.p_ZL7WEIGHTS_2_1_U", "Parent" : "60"},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.p_ZL7WEIGHTS_2_2_U", "Parent" : "60"},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.fadd_32ns_32ns_32_5_full_dsp_1_U29", "Parent" : "60"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.fadd_32ns_32ns_32_5_full_dsp_1_U30", "Parent" : "60"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.fadd_32ns_32ns_32_5_full_dsp_1_U31", "Parent" : "60"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.fadd_32ns_32ns_32_5_full_dsp_1_U32", "Parent" : "60"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.fadd_32ns_32ns_32_5_full_dsp_1_U33", "Parent" : "60"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.fadd_32ns_32ns_32_5_full_dsp_1_U34", "Parent" : "60"},
	{"ID" : "77", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.fadd_32ns_32ns_32_5_full_dsp_1_U35", "Parent" : "60"},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.fadd_32ns_32ns_32_5_full_dsp_1_U36", "Parent" : "60"},
	{"ID" : "79", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.fadd_32ns_32ns_32_5_full_dsp_1_U37", "Parent" : "60"},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.fmul_32ns_32ns_32_4_max_dsp_1_U38", "Parent" : "60"},
	{"ID" : "81", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.fmul_32ns_32ns_32_4_max_dsp_1_U39", "Parent" : "60"},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.fmul_32ns_32ns_32_4_max_dsp_1_U40", "Parent" : "60"},
	{"ID" : "83", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.fmul_32ns_32ns_32_4_max_dsp_1_U41", "Parent" : "60"},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.fmul_32ns_32ns_32_4_max_dsp_1_U42", "Parent" : "60"},
	{"ID" : "85", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.fmul_32ns_32ns_32_4_max_dsp_1_U43", "Parent" : "60"},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.fmul_32ns_32ns_32_4_max_dsp_1_U44", "Parent" : "60"},
	{"ID" : "87", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.fmul_32ns_32ns_32_4_max_dsp_1_U45", "Parent" : "60"},
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.fmul_32ns_32ns_32_4_max_dsp_1_U46", "Parent" : "60"},
	{"ID" : "89", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U48", "Parent" : "60"},
	{"ID" : "90", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U49", "Parent" : "60"},
	{"ID" : "91", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U50", "Parent" : "60"},
	{"ID" : "92", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U51", "Parent" : "60"},
	{"ID" : "93", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U52", "Parent" : "60"},
	{"ID" : "94", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U53", "Parent" : "60"},
	{"ID" : "95", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U54", "Parent" : "60"},
	{"ID" : "96", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U55", "Parent" : "60"},
	{"ID" : "97", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U56", "Parent" : "60"},
	{"ID" : "98", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U57", "Parent" : "60"},
	{"ID" : "99", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U58", "Parent" : "60"},
	{"ID" : "100", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U59", "Parent" : "60"},
	{"ID" : "101", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U60", "Parent" : "60"},
	{"ID" : "102", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U61", "Parent" : "60"},
	{"ID" : "103", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U62", "Parent" : "60"},
	{"ID" : "104", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U63", "Parent" : "60"},
	{"ID" : "105", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U64", "Parent" : "60"},
	{"ID" : "106", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U65", "Parent" : "60"},
	{"ID" : "107", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U66", "Parent" : "60"},
	{"ID" : "108", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U67", "Parent" : "60"},
	{"ID" : "109", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U68", "Parent" : "60"},
	{"ID" : "110", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U69", "Parent" : "60"},
	{"ID" : "111", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U70", "Parent" : "60"},
	{"ID" : "112", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_7_2_32_1_1_U71", "Parent" : "60"},
	{"ID" : "113", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.urem_6ns_3ns_2_10_1_U72", "Parent" : "60"},
	{"ID" : "114", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.mul_6ns_8ns_13_1_1_U73", "Parent" : "60"},
	{"ID" : "115", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.mul_6ns_8ns_13_1_1_U74", "Parent" : "60"},
	{"ID" : "116", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.mul_6ns_8ns_13_1_1_U75", "Parent" : "60"},
	{"ID" : "117", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_17_3_32_1_1_U76", "Parent" : "60"},
	{"ID" : "118", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_17_3_32_1_1_U77", "Parent" : "60"},
	{"ID" : "119", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_17_3_32_1_1_U78", "Parent" : "60"},
	{"ID" : "120", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_17_3_32_1_1_U79", "Parent" : "60"},
	{"ID" : "121", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_17_3_32_1_1_U80", "Parent" : "60"},
	{"ID" : "122", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_17_3_32_1_1_U81", "Parent" : "60"},
	{"ID" : "123", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_17_3_32_1_1_U82", "Parent" : "60"},
	{"ID" : "124", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_17_3_32_1_1_U83", "Parent" : "60"},
	{"ID" : "125", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.sparsemux_17_3_32_1_1_U84", "Parent" : "60"},
	{"ID" : "126", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.mac_muladd_6ns_5ns_5ns_11_4_1_U85", "Parent" : "60"},
	{"ID" : "127", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384.flow_control_loop_pipe_sequential_init_U", "Parent" : "60"},
	{"ID" : "128", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_POOL_OC_POOL_PY_POOL_PX_fu_464", "Parent" : "0", "Child" : ["129", "130", "131", "132", "133", "134", "135", "136", "137"],
		"CDFG" : "conv1_pool1_Pipeline_POOL_OC_POOL_PY_POOL_PX",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8477", "EstimateLatencyMax" : "8477",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "AXI_OUT", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "AXI_OUT_blk_n_W", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln128", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv_buf", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_16", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_17", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_18", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_19", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_20", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_21", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_22", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_23", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_24", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_25", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_26", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_27", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_28", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_29", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_30", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf_31", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "POOL_OC_POOL_PY_POOL_PX", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter12", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter12", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "129", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_POOL_OC_POOL_PY_POOL_PX_fu_464.fcmp_32ns_32ns_1_2_no_dsp_1_U163", "Parent" : "128"},
	{"ID" : "130", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_POOL_OC_POOL_PY_POOL_PX_fu_464.fcmp_32ns_32ns_1_2_no_dsp_1_U164", "Parent" : "128"},
	{"ID" : "131", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_POOL_OC_POOL_PY_POOL_PX_fu_464.sparsemux_33_4_32_1_1_U165", "Parent" : "128"},
	{"ID" : "132", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_POOL_OC_POOL_PY_POOL_PX_fu_464.sparsemux_33_4_32_1_1_U166", "Parent" : "128"},
	{"ID" : "133", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_POOL_OC_POOL_PY_POOL_PX_fu_464.sparsemux_33_4_32_1_1_U167", "Parent" : "128"},
	{"ID" : "134", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_POOL_OC_POOL_PY_POOL_PX_fu_464.sparsemux_33_4_32_1_1_U168", "Parent" : "128"},
	{"ID" : "135", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_POOL_OC_POOL_PY_POOL_PX_fu_464.mac_muladd_6ns_5ns_5ns_11_4_1_U169", "Parent" : "128"},
	{"ID" : "136", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_POOL_OC_POOL_PY_POOL_PX_fu_464.mac_muladd_6ns_5ns_5ns_11_4_1_U170", "Parent" : "128"},
	{"ID" : "137", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv1_pool1_Pipeline_POOL_OC_POOL_PY_POOL_PX_fu_464.flow_control_loop_pipe_sequential_init_U", "Parent" : "128"},
	{"ID" : "138", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "139", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AXI_IN_m_axi_U", "Parent" : "0"},
	{"ID" : "140", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AXI_OUT_m_axi_U", "Parent" : "0"},
	{"ID" : "141", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fcmp_32ns_32ns_1_2_no_dsp_1_U206", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	conv1_pool1 {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		AXI_OUT {Type O LastRead 78 FirstWrite 12}
		in_r {Type I LastRead 0 FirstWrite -1}
		out_r {Type I LastRead 0 FirstWrite -1}
		BIASES {Type I LastRead -1 FirstWrite -1}
		p_ZL7WEIGHTS_0_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL7WEIGHTS_0_1 {Type I LastRead -1 FirstWrite -1}
		p_ZL7WEIGHTS_0_2 {Type I LastRead -1 FirstWrite -1}
		p_ZL7WEIGHTS_1_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL7WEIGHTS_1_1 {Type I LastRead -1 FirstWrite -1}
		p_ZL7WEIGHTS_1_2 {Type I LastRead -1 FirstWrite -1}
		p_ZL7WEIGHTS_2_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL7WEIGHTS_2_1 {Type I LastRead -1 FirstWrite -1}
		p_ZL7WEIGHTS_2_2 {Type I LastRead -1 FirstWrite -1}}
	conv1_pool1_Pipeline_LOAD {
		AXI_IN {Type I LastRead 10 FirstWrite -1}
		in_buf {Type O LastRead -1 FirstWrite 11}
		in_buf_1 {Type O LastRead -1 FirstWrite 11}
		in_buf_2 {Type O LastRead -1 FirstWrite 11}
		in_buf_3 {Type O LastRead -1 FirstWrite 11}
		in_buf_4 {Type O LastRead -1 FirstWrite 11}
		in_buf_5 {Type O LastRead -1 FirstWrite 11}
		in_buf_6 {Type O LastRead -1 FirstWrite 11}
		in_buf_7 {Type O LastRead -1 FirstWrite 11}
		in_buf_8 {Type O LastRead -1 FirstWrite 11}
		in_buf_9 {Type O LastRead -1 FirstWrite 11}
		in_buf_10 {Type O LastRead -1 FirstWrite 11}
		in_buf_11 {Type O LastRead -1 FirstWrite 11}
		in_buf_12 {Type O LastRead -1 FirstWrite 11}
		in_buf_13 {Type O LastRead -1 FirstWrite 11}
		in_buf_14 {Type O LastRead -1 FirstWrite 11}
		in_buf_15 {Type O LastRead -1 FirstWrite 11}
		in_buf_16 {Type O LastRead -1 FirstWrite 11}
		in_buf_17 {Type O LastRead -1 FirstWrite 11}
		in_buf_18 {Type O LastRead -1 FirstWrite 11}
		in_buf_19 {Type O LastRead -1 FirstWrite 11}
		in_buf_20 {Type O LastRead -1 FirstWrite 11}
		in_buf_21 {Type O LastRead -1 FirstWrite 11}
		in_buf_22 {Type O LastRead -1 FirstWrite 11}
		in_buf_23 {Type O LastRead -1 FirstWrite 11}
		sext_ln67 {Type I LastRead 0 FirstWrite -1}}
	conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX {
		conv_buf {Type O LastRead -1 FirstWrite 65}
		conv_buf_1 {Type O LastRead -1 FirstWrite 65}
		conv_buf_2 {Type O LastRead -1 FirstWrite 65}
		conv_buf_3 {Type O LastRead -1 FirstWrite 65}
		conv_buf_4 {Type O LastRead -1 FirstWrite 65}
		conv_buf_5 {Type O LastRead -1 FirstWrite 65}
		conv_buf_6 {Type O LastRead -1 FirstWrite 65}
		conv_buf_7 {Type O LastRead -1 FirstWrite 65}
		conv_buf_8 {Type O LastRead -1 FirstWrite 65}
		conv_buf_9 {Type O LastRead -1 FirstWrite 65}
		conv_buf_10 {Type O LastRead -1 FirstWrite 65}
		conv_buf_11 {Type O LastRead -1 FirstWrite 65}
		conv_buf_12 {Type O LastRead -1 FirstWrite 65}
		conv_buf_13 {Type O LastRead -1 FirstWrite 65}
		conv_buf_14 {Type O LastRead -1 FirstWrite 65}
		conv_buf_15 {Type O LastRead -1 FirstWrite 65}
		conv_buf_16 {Type O LastRead -1 FirstWrite 65}
		conv_buf_17 {Type O LastRead -1 FirstWrite 65}
		conv_buf_18 {Type O LastRead -1 FirstWrite 65}
		conv_buf_19 {Type O LastRead -1 FirstWrite 65}
		conv_buf_20 {Type O LastRead -1 FirstWrite 65}
		conv_buf_21 {Type O LastRead -1 FirstWrite 65}
		conv_buf_22 {Type O LastRead -1 FirstWrite 65}
		conv_buf_23 {Type O LastRead -1 FirstWrite 65}
		conv_buf_24 {Type O LastRead -1 FirstWrite 65}
		conv_buf_25 {Type O LastRead -1 FirstWrite 65}
		conv_buf_26 {Type O LastRead -1 FirstWrite 65}
		conv_buf_27 {Type O LastRead -1 FirstWrite 65}
		conv_buf_28 {Type O LastRead -1 FirstWrite 65}
		conv_buf_29 {Type O LastRead -1 FirstWrite 65}
		conv_buf_30 {Type O LastRead -1 FirstWrite 65}
		conv_buf_31 {Type O LastRead -1 FirstWrite 65}
		in_buf {Type I LastRead 13 FirstWrite -1}
		in_buf_1 {Type I LastRead 13 FirstWrite -1}
		in_buf_2 {Type I LastRead 13 FirstWrite -1}
		in_buf_3 {Type I LastRead 13 FirstWrite -1}
		in_buf_4 {Type I LastRead 13 FirstWrite -1}
		in_buf_5 {Type I LastRead 13 FirstWrite -1}
		in_buf_6 {Type I LastRead 13 FirstWrite -1}
		in_buf_7 {Type I LastRead 13 FirstWrite -1}
		in_buf_8 {Type I LastRead 13 FirstWrite -1}
		in_buf_9 {Type I LastRead 13 FirstWrite -1}
		in_buf_10 {Type I LastRead 13 FirstWrite -1}
		in_buf_11 {Type I LastRead 13 FirstWrite -1}
		in_buf_12 {Type I LastRead 13 FirstWrite -1}
		in_buf_13 {Type I LastRead 13 FirstWrite -1}
		in_buf_14 {Type I LastRead 13 FirstWrite -1}
		in_buf_15 {Type I LastRead 13 FirstWrite -1}
		in_buf_16 {Type I LastRead 13 FirstWrite -1}
		in_buf_17 {Type I LastRead 13 FirstWrite -1}
		in_buf_18 {Type I LastRead 13 FirstWrite -1}
		in_buf_19 {Type I LastRead 13 FirstWrite -1}
		in_buf_20 {Type I LastRead 13 FirstWrite -1}
		in_buf_21 {Type I LastRead 13 FirstWrite -1}
		in_buf_22 {Type I LastRead 13 FirstWrite -1}
		in_buf_23 {Type I LastRead 13 FirstWrite -1}
		BIASES {Type I LastRead -1 FirstWrite -1}
		p_ZL7WEIGHTS_0_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL7WEIGHTS_0_1 {Type I LastRead -1 FirstWrite -1}
		p_ZL7WEIGHTS_0_2 {Type I LastRead -1 FirstWrite -1}
		p_ZL7WEIGHTS_1_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL7WEIGHTS_1_1 {Type I LastRead -1 FirstWrite -1}
		p_ZL7WEIGHTS_1_2 {Type I LastRead -1 FirstWrite -1}
		p_ZL7WEIGHTS_2_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL7WEIGHTS_2_1 {Type I LastRead -1 FirstWrite -1}
		p_ZL7WEIGHTS_2_2 {Type I LastRead -1 FirstWrite -1}}
	conv1_pool1_Pipeline_POOL_OC_POOL_PY_POOL_PX {
		AXI_OUT {Type O LastRead -1 FirstWrite 12}
		sext_ln128 {Type I LastRead 0 FirstWrite -1}
		conv_buf {Type I LastRead 6 FirstWrite -1}
		conv_buf_1 {Type I LastRead 8 FirstWrite -1}
		conv_buf_2 {Type I LastRead 6 FirstWrite -1}
		conv_buf_3 {Type I LastRead 8 FirstWrite -1}
		conv_buf_4 {Type I LastRead 6 FirstWrite -1}
		conv_buf_5 {Type I LastRead 8 FirstWrite -1}
		conv_buf_6 {Type I LastRead 6 FirstWrite -1}
		conv_buf_7 {Type I LastRead 8 FirstWrite -1}
		conv_buf_8 {Type I LastRead 6 FirstWrite -1}
		conv_buf_9 {Type I LastRead 8 FirstWrite -1}
		conv_buf_10 {Type I LastRead 6 FirstWrite -1}
		conv_buf_11 {Type I LastRead 8 FirstWrite -1}
		conv_buf_12 {Type I LastRead 6 FirstWrite -1}
		conv_buf_13 {Type I LastRead 8 FirstWrite -1}
		conv_buf_14 {Type I LastRead 6 FirstWrite -1}
		conv_buf_15 {Type I LastRead 8 FirstWrite -1}
		conv_buf_16 {Type I LastRead 6 FirstWrite -1}
		conv_buf_17 {Type I LastRead 8 FirstWrite -1}
		conv_buf_18 {Type I LastRead 6 FirstWrite -1}
		conv_buf_19 {Type I LastRead 8 FirstWrite -1}
		conv_buf_20 {Type I LastRead 6 FirstWrite -1}
		conv_buf_21 {Type I LastRead 8 FirstWrite -1}
		conv_buf_22 {Type I LastRead 6 FirstWrite -1}
		conv_buf_23 {Type I LastRead 8 FirstWrite -1}
		conv_buf_24 {Type I LastRead 6 FirstWrite -1}
		conv_buf_25 {Type I LastRead 8 FirstWrite -1}
		conv_buf_26 {Type I LastRead 6 FirstWrite -1}
		conv_buf_27 {Type I LastRead 8 FirstWrite -1}
		conv_buf_28 {Type I LastRead 6 FirstWrite -1}
		conv_buf_29 {Type I LastRead 8 FirstWrite -1}
		conv_buf_30 {Type I LastRead 6 FirstWrite -1}
		conv_buf_31 {Type I LastRead 8 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "44859", "Max" : "44859"}
	, {"Name" : "Interval", "Min" : "44860", "Max" : "44860"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	AXI_IN { m_axi {  { m_axi_AXI_IN_AWVALID VALID 1 1 }  { m_axi_AXI_IN_AWREADY READY 0 1 }  { m_axi_AXI_IN_AWADDR ADDR 1 64 }  { m_axi_AXI_IN_AWID ID 1 1 }  { m_axi_AXI_IN_AWLEN SIZE 1 8 }  { m_axi_AXI_IN_AWSIZE BURST 1 3 }  { m_axi_AXI_IN_AWBURST LOCK 1 2 }  { m_axi_AXI_IN_AWLOCK CACHE 1 2 }  { m_axi_AXI_IN_AWCACHE PROT 1 4 }  { m_axi_AXI_IN_AWPROT QOS 1 3 }  { m_axi_AXI_IN_AWQOS REGION 1 4 }  { m_axi_AXI_IN_AWREGION USER 1 4 }  { m_axi_AXI_IN_AWUSER DATA 1 1 }  { m_axi_AXI_IN_WVALID VALID 1 1 }  { m_axi_AXI_IN_WREADY READY 0 1 }  { m_axi_AXI_IN_WDATA FIFONUM 1 512 }  { m_axi_AXI_IN_WSTRB STRB 1 64 }  { m_axi_AXI_IN_WLAST LAST 1 1 }  { m_axi_AXI_IN_WID ID 1 1 }  { m_axi_AXI_IN_WUSER DATA 1 1 }  { m_axi_AXI_IN_ARVALID VALID 1 1 }  { m_axi_AXI_IN_ARREADY READY 0 1 }  { m_axi_AXI_IN_ARADDR ADDR 1 64 }  { m_axi_AXI_IN_ARID ID 1 1 }  { m_axi_AXI_IN_ARLEN SIZE 1 8 }  { m_axi_AXI_IN_ARSIZE BURST 1 3 }  { m_axi_AXI_IN_ARBURST LOCK 1 2 }  { m_axi_AXI_IN_ARLOCK CACHE 1 2 }  { m_axi_AXI_IN_ARCACHE PROT 1 4 }  { m_axi_AXI_IN_ARPROT QOS 1 3 }  { m_axi_AXI_IN_ARQOS REGION 1 4 }  { m_axi_AXI_IN_ARREGION USER 1 4 }  { m_axi_AXI_IN_ARUSER DATA 1 1 }  { m_axi_AXI_IN_RVALID VALID 0 1 }  { m_axi_AXI_IN_RREADY READY 1 1 }  { m_axi_AXI_IN_RDATA FIFONUM 0 512 }  { m_axi_AXI_IN_RLAST LAST 0 1 }  { m_axi_AXI_IN_RID ID 0 1 }  { m_axi_AXI_IN_RUSER DATA 0 1 }  { m_axi_AXI_IN_RRESP RESP 0 2 }  { m_axi_AXI_IN_BVALID VALID 0 1 }  { m_axi_AXI_IN_BREADY READY 1 1 }  { m_axi_AXI_IN_BRESP RESP 0 2 }  { m_axi_AXI_IN_BID ID 0 1 }  { m_axi_AXI_IN_BUSER DATA 0 1 } } }
	AXI_OUT { m_axi {  { m_axi_AXI_OUT_AWVALID VALID 1 1 }  { m_axi_AXI_OUT_AWREADY READY 0 1 }  { m_axi_AXI_OUT_AWADDR ADDR 1 64 }  { m_axi_AXI_OUT_AWID ID 1 1 }  { m_axi_AXI_OUT_AWLEN SIZE 1 8 }  { m_axi_AXI_OUT_AWSIZE BURST 1 3 }  { m_axi_AXI_OUT_AWBURST LOCK 1 2 }  { m_axi_AXI_OUT_AWLOCK CACHE 1 2 }  { m_axi_AXI_OUT_AWCACHE PROT 1 4 }  { m_axi_AXI_OUT_AWPROT QOS 1 3 }  { m_axi_AXI_OUT_AWQOS REGION 1 4 }  { m_axi_AXI_OUT_AWREGION USER 1 4 }  { m_axi_AXI_OUT_AWUSER DATA 1 1 }  { m_axi_AXI_OUT_WVALID VALID 1 1 }  { m_axi_AXI_OUT_WREADY READY 0 1 }  { m_axi_AXI_OUT_WDATA FIFONUM 1 32 }  { m_axi_AXI_OUT_WSTRB STRB 1 4 }  { m_axi_AXI_OUT_WLAST LAST 1 1 }  { m_axi_AXI_OUT_WID ID 1 1 }  { m_axi_AXI_OUT_WUSER DATA 1 1 }  { m_axi_AXI_OUT_ARVALID VALID 1 1 }  { m_axi_AXI_OUT_ARREADY READY 0 1 }  { m_axi_AXI_OUT_ARADDR ADDR 1 64 }  { m_axi_AXI_OUT_ARID ID 1 1 }  { m_axi_AXI_OUT_ARLEN SIZE 1 8 }  { m_axi_AXI_OUT_ARSIZE BURST 1 3 }  { m_axi_AXI_OUT_ARBURST LOCK 1 2 }  { m_axi_AXI_OUT_ARLOCK CACHE 1 2 }  { m_axi_AXI_OUT_ARCACHE PROT 1 4 }  { m_axi_AXI_OUT_ARPROT QOS 1 3 }  { m_axi_AXI_OUT_ARQOS REGION 1 4 }  { m_axi_AXI_OUT_ARREGION USER 1 4 }  { m_axi_AXI_OUT_ARUSER DATA 1 1 }  { m_axi_AXI_OUT_RVALID VALID 0 1 }  { m_axi_AXI_OUT_RREADY READY 1 1 }  { m_axi_AXI_OUT_RDATA FIFONUM 0 32 }  { m_axi_AXI_OUT_RLAST LAST 0 1 }  { m_axi_AXI_OUT_RID ID 0 1 }  { m_axi_AXI_OUT_RUSER DATA 0 1 }  { m_axi_AXI_OUT_RRESP RESP 0 2 }  { m_axi_AXI_OUT_BVALID VALID 0 1 }  { m_axi_AXI_OUT_BREADY READY 1 1 }  { m_axi_AXI_OUT_BRESP RESP 0 2 }  { m_axi_AXI_OUT_BID ID 0 1 }  { m_axi_AXI_OUT_BUSER DATA 0 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict AXI_IN { CHANNEL_NUM 0 BUNDLE AXI_IN NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict AXI_OUT { CHANNEL_NUM 0 BUNDLE AXI_OUT NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE WRITE_ONLY}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ AXI_IN 64 }
	{ AXI_OUT 64 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ AXI_IN 64 }
	{ AXI_OUT 64 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
