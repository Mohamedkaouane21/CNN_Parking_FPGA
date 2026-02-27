set ModuleHierarchy {[{
"Name" : "conv1_pool1","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_conv1_pool1_Pipeline_LOAD_fu_353","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "LOAD","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_fu_384","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "CONV_OC_CONV_OY_CONV_OX","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "grp_conv1_pool1_Pipeline_POOL_OC_POOL_PY_POOL_PX_fu_464","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "POOL_OC_POOL_PY_POOL_PX","ID" : "6","Type" : "pipeline"},]},]
}]}