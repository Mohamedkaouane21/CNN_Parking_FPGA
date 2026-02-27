set moduleName conv2_pool2_Pipeline_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type loop_auto_rewind
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 6
set C_modelName {conv2_pool2_Pipeline_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict in_buf { MEM_WIDTH 32 MEM_SIZE 11776 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict in_buf_1 { MEM_WIDTH 32 MEM_SIZE 11776 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict in_buf_2 { MEM_WIDTH 32 MEM_SIZE 11776 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict conv_buf { MEM_WIDTH 32 MEM_SIZE 924 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict conv_buf_1 { MEM_WIDTH 32 MEM_SIZE 924 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ acc float 32 regular  }
	{ zext_ln42 int 5 regular  }
	{ in_buf float 32 regular {array 2944 { 1 3 } 1 1 }  }
	{ in_buf_1 float 32 regular {array 2944 { 1 3 } 1 1 }  }
	{ in_buf_2 float 32 regular {array 2944 { 1 3 } 1 1 }  }
	{ conv_buf float 32 regular {array 231 { 0 3 } 0 1 }  }
	{ conv_buf_1 float 32 regular {array 231 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "acc", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln42", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "in_buf", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "in_buf_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "in_buf_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "conv_buf", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "conv_buf_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 30
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ acc sc_in sc_lv 32 signal 0 } 
	{ zext_ln42 sc_in sc_lv 5 signal 1 } 
	{ in_buf_address0 sc_out sc_lv 12 signal 2 } 
	{ in_buf_ce0 sc_out sc_logic 1 signal 2 } 
	{ in_buf_q0 sc_in sc_lv 32 signal 2 } 
	{ in_buf_1_address0 sc_out sc_lv 12 signal 3 } 
	{ in_buf_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ in_buf_1_q0 sc_in sc_lv 32 signal 3 } 
	{ in_buf_2_address0 sc_out sc_lv 12 signal 4 } 
	{ in_buf_2_ce0 sc_out sc_logic 1 signal 4 } 
	{ in_buf_2_q0 sc_in sc_lv 32 signal 4 } 
	{ conv_buf_address0 sc_out sc_lv 8 signal 5 } 
	{ conv_buf_ce0 sc_out sc_logic 1 signal 5 } 
	{ conv_buf_we0 sc_out sc_logic 1 signal 5 } 
	{ conv_buf_d0 sc_out sc_lv 32 signal 5 } 
	{ conv_buf_1_address0 sc_out sc_lv 8 signal 6 } 
	{ conv_buf_1_ce0 sc_out sc_logic 1 signal 6 } 
	{ conv_buf_1_we0 sc_out sc_logic 1 signal 6 } 
	{ conv_buf_1_d0 sc_out sc_lv 32 signal 6 } 
	{ grp_fu_322_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_322_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_322_p_opcode sc_out sc_lv 5 signal -1 } 
	{ grp_fu_322_p_dout0 sc_in sc_lv 1 signal -1 } 
	{ grp_fu_322_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "acc", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc", "role": "default" }} , 
 	{ "name": "zext_ln42", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "zext_ln42", "role": "default" }} , 
 	{ "name": "in_buf_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "in_buf", "role": "address0" }} , 
 	{ "name": "in_buf_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_buf", "role": "ce0" }} , 
 	{ "name": "in_buf_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_buf", "role": "q0" }} , 
 	{ "name": "in_buf_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "in_buf_1", "role": "address0" }} , 
 	{ "name": "in_buf_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_buf_1", "role": "ce0" }} , 
 	{ "name": "in_buf_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_buf_1", "role": "q0" }} , 
 	{ "name": "in_buf_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "in_buf_2", "role": "address0" }} , 
 	{ "name": "in_buf_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_buf_2", "role": "ce0" }} , 
 	{ "name": "in_buf_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_buf_2", "role": "q0" }} , 
 	{ "name": "conv_buf_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "conv_buf", "role": "address0" }} , 
 	{ "name": "conv_buf_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "conv_buf", "role": "ce0" }} , 
 	{ "name": "conv_buf_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "conv_buf", "role": "we0" }} , 
 	{ "name": "conv_buf_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "conv_buf", "role": "d0" }} , 
 	{ "name": "conv_buf_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "conv_buf_1", "role": "address0" }} , 
 	{ "name": "conv_buf_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "conv_buf_1", "role": "ce0" }} , 
 	{ "name": "conv_buf_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "conv_buf_1", "role": "we0" }} , 
 	{ "name": "conv_buf_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "conv_buf_1", "role": "d0" }} , 
 	{ "name": "grp_fu_322_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_322_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_322_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_322_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_322_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "grp_fu_322_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_322_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_322_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_322_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_322_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
		"CDFG" : "conv2_pool2_Pipeline_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "254035", "EstimateLatencyMax" : "254035",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "acc", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln42", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_buf", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "in_buf_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_buf", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "conv_buf_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "WEIGHTS2", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.WEIGHTS2_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U8", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U9", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_5ns_7ns_11_1_1_U11", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_5ns_3ns_2_9_1_U12", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_32_1_1_U13", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_5ns_4ns_4ns_8_4_1_U14", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_5ns_5ns_5ns_9_4_1_U15", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	conv2_pool2_Pipeline_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX {
		acc {Type I LastRead 0 FirstWrite -1}
		zext_ln42 {Type I LastRead 0 FirstWrite -1}
		in_buf {Type I LastRead 9 FirstWrite -1}
		in_buf_1 {Type I LastRead 9 FirstWrite -1}
		in_buf_2 {Type I LastRead 9 FirstWrite -1}
		conv_buf {Type O LastRead -1 FirstWrite 22}
		conv_buf_1 {Type O LastRead -1 FirstWrite 22}
		WEIGHTS2 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "254035", "Max" : "254035"}
	, {"Name" : "Interval", "Min" : "254035", "Max" : "254035"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	acc { ap_none {  { acc in_data 0 32 } } }
	zext_ln42 { ap_none {  { zext_ln42 in_data 0 5 } } }
	in_buf { ap_memory {  { in_buf_address0 mem_address 1 12 }  { in_buf_ce0 mem_ce 1 1 }  { in_buf_q0 mem_dout 0 32 } } }
	in_buf_1 { ap_memory {  { in_buf_1_address0 mem_address 1 12 }  { in_buf_1_ce0 mem_ce 1 1 }  { in_buf_1_q0 mem_dout 0 32 } } }
	in_buf_2 { ap_memory {  { in_buf_2_address0 mem_address 1 12 }  { in_buf_2_ce0 mem_ce 1 1 }  { in_buf_2_q0 mem_dout 0 32 } } }
	conv_buf { ap_memory {  { conv_buf_address0 mem_address 1 8 }  { conv_buf_ce0 mem_ce 1 1 }  { conv_buf_we0 mem_we 1 1 }  { conv_buf_d0 mem_din 1 32 } } }
	conv_buf_1 { ap_memory {  { conv_buf_1_address0 mem_address 1 8 }  { conv_buf_1_ce0 mem_ce 1 1 }  { conv_buf_1_we0 mem_we 1 1 }  { conv_buf_1_d0 mem_din 1 32 } } }
}
