set moduleName conv3
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
set cdfgNum 5
set C_modelName {conv3}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ AXI_IN int 64 regular {axi_master 0}  }
	{ AXI_OUT int 512 regular {axi_master 1}  }
	{ in_r int 64 regular {axi_slave 0}  }
	{ out_r int 64 regular {axi_slave 0}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "AXI_IN", "interface" : "axi_master", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "in_r","offset": { "type": "dynamic","port_name": "in_r","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "AXI_OUT", "interface" : "axi_master", "bitwidth" : 512, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "out_r","offset": { "type": "dynamic","port_name": "out_r","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
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
	{ m_axi_AXI_IN_WDATA sc_out sc_lv 64 signal 0 } 
	{ m_axi_AXI_IN_WSTRB sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_AXI_IN_RDATA sc_in sc_lv 64 signal 0 } 
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
	{ m_axi_AXI_OUT_WDATA sc_out sc_lv 512 signal 1 } 
	{ m_axi_AXI_OUT_WSTRB sc_out sc_lv 64 signal 1 } 
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
	{ m_axi_AXI_OUT_RDATA sc_in sc_lv 512 signal 1 } 
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
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"conv3","role":"start","value":"0","valid_bit":"0"},{"name":"conv3","role":"continue","value":"0","valid_bit":"4"},{"name":"conv3","role":"auto_start","value":"0","valid_bit":"7"},{"name":"in_r","role":"data","value":"16"},{"name":"out_r","role":"data","value":"28"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"conv3","role":"start","value":"0","valid_bit":"0"},{"name":"conv3","role":"done","value":"0","valid_bit":"1"},{"name":"conv3","role":"idle","value":"0","valid_bit":"2"},{"name":"conv3","role":"ready","value":"0","valid_bit":"3"},{"name":"conv3","role":"auto_start","value":"0","valid_bit":"7"}] },
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
 	{ "name": "m_axi_AXI_IN_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_IN_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "AXI_IN", "role": "WSTRB" }} , 
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
 	{ "name": "m_axi_AXI_IN_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_IN", "role": "RDATA" }} , 
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
 	{ "name": "m_axi_AXI_OUT_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WDATA" }} , 
 	{ "name": "m_axi_AXI_OUT_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "WSTRB" }} , 
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
 	{ "name": "m_axi_AXI_OUT_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "AXI_OUT", "role": "RDATA" }} , 
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
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "6", "16", "17", "18"],
		"CDFG" : "conv3",
		"Protocol" : "ap_ctrl_chain",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4720355", "EstimateLatencyMax" : "4720355",
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
					{"ID" : "4", "SubInstance" : "grp_conv3_Pipeline_LOAD_IC_LOAD_IY_fu_123", "Port" : "AXI_IN", "Inst_start_state" : "73", "Inst_end_state" : "74"}]},
			{"Name" : "AXI_OUT", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "AXI_OUT_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "AXI_OUT_blk_n_B", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX_fu_133", "Port" : "AXI_OUT", "Inst_start_state" : "75", "Inst_end_state" : "76"}]},
			{"Name" : "in_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "WEIGHTS3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX_fu_133", "Port" : "WEIGHTS3", "Inst_start_state" : "75", "Inst_end_state" : "76"}]},
			{"Name" : "BIASES3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX_fu_133", "Port" : "BIASES3", "Inst_start_state" : "75", "Inst_end_state" : "76"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_2_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_conv3_Pipeline_LOAD_IC_LOAD_IY_fu_123", "Parent" : "0", "Child" : ["5"],
		"CDFG" : "conv3_Pipeline_LOAD_IC_LOAD_IY",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1603", "EstimateLatencyMax" : "1603",
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
			{"Name" : "sext_ln28", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_buf", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "in_buf_2", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "LOAD_IC_LOAD_IY", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3_Pipeline_LOAD_IC_LOAD_IY_fu_123.flow_control_loop_pipe_sequential_init_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX_fu_133", "Parent" : "0", "Child" : ["7", "8", "9", "10", "11", "12", "13", "14", "15"],
		"CDFG" : "conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4718609", "EstimateLatencyMax" : "4718609",
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
			{"Name" : "in_buf", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln43", "Type" : "None", "Direction" : "I"},
			{"Name" : "WEIGHTS3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BIASES3", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX_fu_133.WEIGHTS3_U", "Parent" : "6"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX_fu_133.BIASES3_U", "Parent" : "6"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX_fu_133.fadd_32ns_32ns_32_5_full_dsp_1_U6", "Parent" : "6"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX_fu_133.fmul_32ns_32ns_32_4_max_dsp_1_U7", "Parent" : "6"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX_fu_133.fcmp_32ns_32ns_1_2_no_dsp_1_U8", "Parent" : "6"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX_fu_133.urem_4ns_3ns_2_8_1_U9", "Parent" : "6"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX_fu_133.mul_4ns_6ns_9_1_1_U10", "Parent" : "6"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX_fu_133.sparsemux_7_2_32_1_1_U11", "Parent" : "6"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX_fu_133.flow_control_loop_pipe_sequential_init_U", "Parent" : "6"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AXI_IN_m_axi_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.AXI_OUT_m_axi_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	conv3 {
		AXI_IN {Type I LastRead 5 FirstWrite -1}
		AXI_OUT {Type O LastRead 76 FirstWrite 20}
		in_r {Type I LastRead 0 FirstWrite -1}
		out_r {Type I LastRead 0 FirstWrite -1}
		WEIGHTS3 {Type I LastRead -1 FirstWrite -1}
		BIASES3 {Type I LastRead -1 FirstWrite -1}}
	conv3_Pipeline_LOAD_IC_LOAD_IY {
		AXI_IN {Type I LastRead 5 FirstWrite -1}
		sext_ln28 {Type I LastRead 0 FirstWrite -1}
		in_buf {Type O LastRead -1 FirstWrite 2}
		in_buf_1 {Type O LastRead -1 FirstWrite 2}
		in_buf_2 {Type O LastRead -1 FirstWrite 3}}
	conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX {
		AXI_OUT {Type O LastRead -1 FirstWrite 20}
		in_buf {Type I LastRead 6 FirstWrite -1}
		in_buf_1 {Type I LastRead 6 FirstWrite -1}
		in_buf_2 {Type I LastRead 6 FirstWrite -1}
		sext_ln43 {Type I LastRead 0 FirstWrite -1}
		WEIGHTS3 {Type I LastRead -1 FirstWrite -1}
		BIASES3 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4720355", "Max" : "4720355"}
	, {"Name" : "Interval", "Min" : "4720356", "Max" : "4720356"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	AXI_IN { m_axi {  { m_axi_AXI_IN_AWVALID VALID 1 1 }  { m_axi_AXI_IN_AWREADY READY 0 1 }  { m_axi_AXI_IN_AWADDR ADDR 1 64 }  { m_axi_AXI_IN_AWID ID 1 1 }  { m_axi_AXI_IN_AWLEN SIZE 1 8 }  { m_axi_AXI_IN_AWSIZE BURST 1 3 }  { m_axi_AXI_IN_AWBURST LOCK 1 2 }  { m_axi_AXI_IN_AWLOCK CACHE 1 2 }  { m_axi_AXI_IN_AWCACHE PROT 1 4 }  { m_axi_AXI_IN_AWPROT QOS 1 3 }  { m_axi_AXI_IN_AWQOS REGION 1 4 }  { m_axi_AXI_IN_AWREGION USER 1 4 }  { m_axi_AXI_IN_AWUSER DATA 1 1 }  { m_axi_AXI_IN_WVALID VALID 1 1 }  { m_axi_AXI_IN_WREADY READY 0 1 }  { m_axi_AXI_IN_WDATA FIFONUM 1 64 }  { m_axi_AXI_IN_WSTRB STRB 1 8 }  { m_axi_AXI_IN_WLAST LAST 1 1 }  { m_axi_AXI_IN_WID ID 1 1 }  { m_axi_AXI_IN_WUSER DATA 1 1 }  { m_axi_AXI_IN_ARVALID VALID 1 1 }  { m_axi_AXI_IN_ARREADY READY 0 1 }  { m_axi_AXI_IN_ARADDR ADDR 1 64 }  { m_axi_AXI_IN_ARID ID 1 1 }  { m_axi_AXI_IN_ARLEN SIZE 1 8 }  { m_axi_AXI_IN_ARSIZE BURST 1 3 }  { m_axi_AXI_IN_ARBURST LOCK 1 2 }  { m_axi_AXI_IN_ARLOCK CACHE 1 2 }  { m_axi_AXI_IN_ARCACHE PROT 1 4 }  { m_axi_AXI_IN_ARPROT QOS 1 3 }  { m_axi_AXI_IN_ARQOS REGION 1 4 }  { m_axi_AXI_IN_ARREGION USER 1 4 }  { m_axi_AXI_IN_ARUSER DATA 1 1 }  { m_axi_AXI_IN_RVALID VALID 0 1 }  { m_axi_AXI_IN_RREADY READY 1 1 }  { m_axi_AXI_IN_RDATA FIFONUM 0 64 }  { m_axi_AXI_IN_RLAST LAST 0 1 }  { m_axi_AXI_IN_RID ID 0 1 }  { m_axi_AXI_IN_RUSER DATA 0 1 }  { m_axi_AXI_IN_RRESP RESP 0 2 }  { m_axi_AXI_IN_BVALID VALID 0 1 }  { m_axi_AXI_IN_BREADY READY 1 1 }  { m_axi_AXI_IN_BRESP RESP 0 2 }  { m_axi_AXI_IN_BID ID 0 1 }  { m_axi_AXI_IN_BUSER DATA 0 1 } } }
	AXI_OUT { m_axi {  { m_axi_AXI_OUT_AWVALID VALID 1 1 }  { m_axi_AXI_OUT_AWREADY READY 0 1 }  { m_axi_AXI_OUT_AWADDR ADDR 1 64 }  { m_axi_AXI_OUT_AWID ID 1 1 }  { m_axi_AXI_OUT_AWLEN SIZE 1 8 }  { m_axi_AXI_OUT_AWSIZE BURST 1 3 }  { m_axi_AXI_OUT_AWBURST LOCK 1 2 }  { m_axi_AXI_OUT_AWLOCK CACHE 1 2 }  { m_axi_AXI_OUT_AWCACHE PROT 1 4 }  { m_axi_AXI_OUT_AWPROT QOS 1 3 }  { m_axi_AXI_OUT_AWQOS REGION 1 4 }  { m_axi_AXI_OUT_AWREGION USER 1 4 }  { m_axi_AXI_OUT_AWUSER DATA 1 1 }  { m_axi_AXI_OUT_WVALID VALID 1 1 }  { m_axi_AXI_OUT_WREADY READY 0 1 }  { m_axi_AXI_OUT_WDATA FIFONUM 1 512 }  { m_axi_AXI_OUT_WSTRB STRB 1 64 }  { m_axi_AXI_OUT_WLAST LAST 1 1 }  { m_axi_AXI_OUT_WID ID 1 1 }  { m_axi_AXI_OUT_WUSER DATA 1 1 }  { m_axi_AXI_OUT_ARVALID VALID 1 1 }  { m_axi_AXI_OUT_ARREADY READY 0 1 }  { m_axi_AXI_OUT_ARADDR ADDR 1 64 }  { m_axi_AXI_OUT_ARID ID 1 1 }  { m_axi_AXI_OUT_ARLEN SIZE 1 8 }  { m_axi_AXI_OUT_ARSIZE BURST 1 3 }  { m_axi_AXI_OUT_ARBURST LOCK 1 2 }  { m_axi_AXI_OUT_ARLOCK CACHE 1 2 }  { m_axi_AXI_OUT_ARCACHE PROT 1 4 }  { m_axi_AXI_OUT_ARPROT QOS 1 3 }  { m_axi_AXI_OUT_ARQOS REGION 1 4 }  { m_axi_AXI_OUT_ARREGION USER 1 4 }  { m_axi_AXI_OUT_ARUSER DATA 1 1 }  { m_axi_AXI_OUT_RVALID VALID 0 1 }  { m_axi_AXI_OUT_RREADY READY 1 1 }  { m_axi_AXI_OUT_RDATA FIFONUM 0 512 }  { m_axi_AXI_OUT_RLAST LAST 0 1 }  { m_axi_AXI_OUT_RID ID 0 1 }  { m_axi_AXI_OUT_RUSER DATA 0 1 }  { m_axi_AXI_OUT_RRESP RESP 0 2 }  { m_axi_AXI_OUT_BVALID VALID 0 1 }  { m_axi_AXI_OUT_BREADY READY 1 1 }  { m_axi_AXI_OUT_BRESP RESP 0 2 }  { m_axi_AXI_OUT_BID ID 0 1 }  { m_axi_AXI_OUT_BUSER DATA 0 1 } } }
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
