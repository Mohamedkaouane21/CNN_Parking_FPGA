set SynModuleInfo {
  {SRCNAME conv3_Pipeline_LOAD_IC_LOAD_IY MODELNAME conv3_Pipeline_LOAD_IC_LOAD_IY RTLNAME conv3_conv3_Pipeline_LOAD_IC_LOAD_IY
    SUBMODULES {
      {MODELNAME conv3_flow_control_loop_pipe_sequential_init RTLNAME conv3_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME conv3_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX MODELNAME conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX RTLNAME conv3_conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX
    SUBMODULES {
      {MODELNAME conv3_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME conv3_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME conv3_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME conv3_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME conv3_fcmp_32ns_32ns_1_2_no_dsp_1 RTLNAME conv3_fcmp_32ns_32ns_1_2_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME conv3_urem_4ns_3ns_2_8_1 RTLNAME conv3_urem_4ns_3ns_2_8_1 BINDTYPE op TYPE urem IMPL auto LATENCY 7 ALLOW_PRAGMA 1}
      {MODELNAME conv3_mul_4ns_6ns_9_1_1 RTLNAME conv3_mul_4ns_6ns_9_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv3_sparsemux_7_2_32_1_1 RTLNAME conv3_sparsemux_7_2_32_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME conv3_conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX_WEIGHTS3_ROM_Abkb RTLNAME conv3_conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX_WEIGHTS3_ROM_Abkb BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME conv3_conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX_BIASES3_ROM_AUcud RTLNAME conv3_conv3_Pipeline_CONV_OC_CONV_OY_CONV_OX_CONV_IC_CONV_KY_CONV_KX_BIASES3_ROM_AUcud BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME conv3 MODELNAME conv3 RTLNAME conv3 IS_TOP 1
    SUBMODULES {
      {MODELNAME conv3_in_buf_RAM_AUTO_1R1W RTLNAME conv3_in_buf_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME conv3_AXI_IN_m_axi RTLNAME conv3_AXI_IN_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME conv3_AXI_OUT_m_axi RTLNAME conv3_AXI_OUT_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME conv3_control_s_axi RTLNAME conv3_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
