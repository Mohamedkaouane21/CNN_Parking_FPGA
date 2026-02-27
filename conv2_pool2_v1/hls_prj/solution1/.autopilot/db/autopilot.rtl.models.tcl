set SynModuleInfo {
  {SRCNAME conv2_pool2_Pipeline_LOAD_IC_LOAD_IY MODELNAME conv2_pool2_Pipeline_LOAD_IC_LOAD_IY RTLNAME conv2_pool2_conv2_pool2_Pipeline_LOAD_IC_LOAD_IY
    SUBMODULES {
      {MODELNAME conv2_pool2_mac_muladd_5ns_5ns_5ns_9_4_1 RTLNAME conv2_pool2_mac_muladd_5ns_5ns_5ns_9_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME conv2_pool2_flow_control_loop_pipe_sequential_init RTLNAME conv2_pool2_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME conv2_pool2_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME conv2_pool2_Pipeline_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX MODELNAME conv2_pool2_Pipeline_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX RTLNAME conv2_pool2_conv2_pool2_Pipeline_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX
    SUBMODULES {
      {MODELNAME conv2_pool2_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME conv2_pool2_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME conv2_pool2_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME conv2_pool2_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME conv2_pool2_mul_5ns_7ns_11_1_1 RTLNAME conv2_pool2_mul_5ns_7ns_11_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv2_pool2_urem_5ns_3ns_2_9_1 RTLNAME conv2_pool2_urem_5ns_3ns_2_9_1 BINDTYPE op TYPE urem IMPL auto LATENCY 8 ALLOW_PRAGMA 1}
      {MODELNAME conv2_pool2_sparsemux_7_2_32_1_1 RTLNAME conv2_pool2_sparsemux_7_2_32_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME conv2_pool2_mac_muladd_5ns_4ns_4ns_8_4_1 RTLNAME conv2_pool2_mac_muladd_5ns_4ns_4ns_8_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME conv2_pool2_conv2_pool2_Pipeline_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX_WEIGHTS2_ROM_AUTbkb RTLNAME conv2_pool2_conv2_pool2_Pipeline_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX_WEIGHTS2_ROM_AUTbkb BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME conv2_pool2_Pipeline_POOL_PY_POOL_PX MODELNAME conv2_pool2_Pipeline_POOL_PY_POOL_PX RTLNAME conv2_pool2_conv2_pool2_Pipeline_POOL_PY_POOL_PX}
  {SRCNAME conv2_pool2 MODELNAME conv2_pool2 RTLNAME conv2_pool2 IS_TOP 1
    SUBMODULES {
      {MODELNAME conv2_pool2_fcmp_32ns_32ns_1_2_no_dsp_1 RTLNAME conv2_pool2_fcmp_32ns_32ns_1_2_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME conv2_pool2_BIASES2_ROM_AUTO_1R RTLNAME conv2_pool2_BIASES2_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME conv2_pool2_in_buf_RAM_AUTO_1R1W RTLNAME conv2_pool2_in_buf_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME conv2_pool2_conv_buf_RAM_AUTO_1R1W RTLNAME conv2_pool2_conv_buf_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME conv2_pool2_AXI_IN_m_axi RTLNAME conv2_pool2_AXI_IN_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME conv2_pool2_AXI_OUT_m_axi RTLNAME conv2_pool2_AXI_OUT_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME conv2_pool2_control_s_axi RTLNAME conv2_pool2_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
