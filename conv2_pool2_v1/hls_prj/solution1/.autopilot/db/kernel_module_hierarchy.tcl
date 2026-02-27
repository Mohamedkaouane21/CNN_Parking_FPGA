set ModuleHierarchy {[{
"Name" : "conv2_pool2","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_conv2_pool2_Pipeline_LOAD_IC_LOAD_IY_fu_168","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "LOAD_IC_LOAD_IY","ID" : "2","Type" : "pipeline"},]},],
"SubLoops" : [
	{"Name" : "CONV_OC","ID" : "3","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_conv2_pool2_Pipeline_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX_fu_178","ID" : "4","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX","ID" : "5","Type" : "pipeline"},]},
	{"Name" : "grp_conv2_pool2_Pipeline_POOL_PY_POOL_PX_fu_192","ID" : "6","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "POOL_PY_POOL_PX","ID" : "7","Type" : "pipeline"},]},]},]
}]}