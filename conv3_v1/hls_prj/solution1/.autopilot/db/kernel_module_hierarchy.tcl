set ModuleHierarchy {[{
"Name" : "conv3","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_conv3_Pipeline_LOAD_IC_LOAD_IY_fu_123","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "LOAD_IC_LOAD_IY","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX_fu_133","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX","ID" : "4","Type" : "pipeline"},]},]
}]}