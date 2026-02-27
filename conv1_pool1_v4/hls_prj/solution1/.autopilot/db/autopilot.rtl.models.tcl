set SynModuleInfo {
  {SRCNAME conv1_pool1_Pipeline_LOAD MODELNAME conv1_pool1_Pipeline_LOAD RTLNAME conv1_pool1_conv1_pool1_Pipeline_LOAD
    SUBMODULES {
      {MODELNAME conv1_pool1_urem_6ns_3ns_2_10_1 RTLNAME conv1_pool1_urem_6ns_3ns_2_10_1 BINDTYPE op TYPE urem IMPL auto LATENCY 9 ALLOW_PRAGMA 1}
      {MODELNAME conv1_pool1_flow_control_loop_pipe_sequential_init RTLNAME conv1_pool1_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME conv1_pool1_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX MODELNAME conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX RTLNAME conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX
    SUBMODULES {
      {MODELNAME conv1_pool1_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME conv1_pool1_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME conv1_pool1_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME conv1_pool1_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME conv1_pool1_sparsemux_7_2_32_1_1 RTLNAME conv1_pool1_sparsemux_7_2_32_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME conv1_pool1_mul_6ns_8ns_13_1_1 RTLNAME conv1_pool1_mul_6ns_8ns_13_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv1_pool1_sparsemux_17_3_32_1_1 RTLNAME conv1_pool1_sparsemux_17_3_32_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME conv1_pool1_mac_muladd_6ns_5ns_5ns_11_4_1 RTLNAME conv1_pool1_mac_muladd_6ns_5ns_5ns_11_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_BIASES_ROM_AUTO_1R RTLNAME conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_BIASES_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_0_0_ROM_AUTO_1R RTLNAME conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_0_0_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_0_1_ROM_AUTO_1R RTLNAME conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_0_1_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_0_2_ROM_AUTO_1R RTLNAME conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_0_2_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_1_0_ROM_AUTO_1R RTLNAME conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_1_0_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_1_1_ROM_AUTO_1R RTLNAME conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_1_1_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_1_2_ROM_AUTO_1R RTLNAME conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_1_2_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_2_0_ROM_AUTO_1R RTLNAME conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_2_0_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_2_1_ROM_AUTO_1R RTLNAME conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_2_1_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_2_2_ROM_AUTO_1R RTLNAME conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_2_2_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME conv1_pool1_Pipeline_POOL_OC_POOL_PY_POOL_PX MODELNAME conv1_pool1_Pipeline_POOL_OC_POOL_PY_POOL_PX RTLNAME conv1_pool1_conv1_pool1_Pipeline_POOL_OC_POOL_PY_POOL_PX
    SUBMODULES {
      {MODELNAME conv1_pool1_sparsemux_33_4_32_1_1 RTLNAME conv1_pool1_sparsemux_33_4_32_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME conv1_pool1 MODELNAME conv1_pool1 RTLNAME conv1_pool1 IS_TOP 1
    SUBMODULES {
      {MODELNAME conv1_pool1_fcmp_32ns_32ns_1_2_no_dsp_1 RTLNAME conv1_pool1_fcmp_32ns_32ns_1_2_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME conv1_pool1_in_buf_RAM_AUTO_1R1W RTLNAME conv1_pool1_in_buf_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME conv1_pool1_conv_buf_RAM_AUTO_1R1W RTLNAME conv1_pool1_conv_buf_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME conv1_pool1_AXI_IN_m_axi RTLNAME conv1_pool1_AXI_IN_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME conv1_pool1_AXI_OUT_m_axi RTLNAME conv1_pool1_AXI_OUT_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME conv1_pool1_control_s_axi RTLNAME conv1_pool1_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
