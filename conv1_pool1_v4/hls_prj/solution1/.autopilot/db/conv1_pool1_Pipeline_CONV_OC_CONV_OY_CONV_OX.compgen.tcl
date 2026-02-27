# This script segment is generated automatically by AutoPilot

set name conv1_pool1_fadd_32ns_32ns_32_5_full_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fadd} IMPL {fulldsp} LATENCY 4 ALLOW_PRAGMA 1
}


set name conv1_pool1_fmul_32ns_32ns_32_4_max_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fmul} IMPL {maxdsp} LATENCY 3 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler conv1_pool1_sparsemux_7_2_32_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {onehotencoding_realdef}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler conv1_pool1_sparsemux_7_2_32_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {onehotencoding_realdef}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler conv1_pool1_sparsemux_7_2_32_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {onehotencoding_realdef}
}


set name conv1_pool1_mul_6ns_8ns_13_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler conv1_pool1_sparsemux_17_3_32_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler conv1_pool1_sparsemux_17_3_32_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler conv1_pool1_sparsemux_17_3_32_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler conv1_pool1_mac_muladd_6ns_5ns_5ns_11_4_1 BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 3
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_BIASES_ROM_AUTO_1R BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_0_0_ROM_AUTO_1R BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_0_1_ROM_AUTO_1R BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_0_2_ROM_AUTO_1R BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_1_0_ROM_AUTO_1R BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_1_1_ROM_AUTO_1R BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_1_2_ROM_AUTO_1R BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_2_0_ROM_AUTO_1R BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_2_1_ROM_AUTO_1R BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler conv1_pool1_conv1_pool1_Pipeline_CONV_OC_CONV_OY_CONV_OX_p_ZL7WEIGHTS_2_2_ROM_AUTO_1R BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 106 \
    name conv_buf \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf \
    op interface \
    ports { conv_buf_address0 { O 11 vector } conv_buf_ce0 { O 1 bit } conv_buf_we0 { O 1 bit } conv_buf_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 107 \
    name conv_buf_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_1 \
    op interface \
    ports { conv_buf_1_address0 { O 11 vector } conv_buf_1_ce0 { O 1 bit } conv_buf_1_we0 { O 1 bit } conv_buf_1_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 108 \
    name conv_buf_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_2 \
    op interface \
    ports { conv_buf_2_address0 { O 11 vector } conv_buf_2_ce0 { O 1 bit } conv_buf_2_we0 { O 1 bit } conv_buf_2_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 109 \
    name conv_buf_3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_3 \
    op interface \
    ports { conv_buf_3_address0 { O 11 vector } conv_buf_3_ce0 { O 1 bit } conv_buf_3_we0 { O 1 bit } conv_buf_3_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 110 \
    name conv_buf_4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_4 \
    op interface \
    ports { conv_buf_4_address0 { O 11 vector } conv_buf_4_ce0 { O 1 bit } conv_buf_4_we0 { O 1 bit } conv_buf_4_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 111 \
    name conv_buf_5 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_5 \
    op interface \
    ports { conv_buf_5_address0 { O 11 vector } conv_buf_5_ce0 { O 1 bit } conv_buf_5_we0 { O 1 bit } conv_buf_5_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 112 \
    name conv_buf_6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_6 \
    op interface \
    ports { conv_buf_6_address0 { O 11 vector } conv_buf_6_ce0 { O 1 bit } conv_buf_6_we0 { O 1 bit } conv_buf_6_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 113 \
    name conv_buf_7 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_7 \
    op interface \
    ports { conv_buf_7_address0 { O 11 vector } conv_buf_7_ce0 { O 1 bit } conv_buf_7_we0 { O 1 bit } conv_buf_7_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 114 \
    name conv_buf_8 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_8 \
    op interface \
    ports { conv_buf_8_address0 { O 11 vector } conv_buf_8_ce0 { O 1 bit } conv_buf_8_we0 { O 1 bit } conv_buf_8_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 115 \
    name conv_buf_9 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_9 \
    op interface \
    ports { conv_buf_9_address0 { O 11 vector } conv_buf_9_ce0 { O 1 bit } conv_buf_9_we0 { O 1 bit } conv_buf_9_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 116 \
    name conv_buf_10 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_10 \
    op interface \
    ports { conv_buf_10_address0 { O 11 vector } conv_buf_10_ce0 { O 1 bit } conv_buf_10_we0 { O 1 bit } conv_buf_10_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 117 \
    name conv_buf_11 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_11 \
    op interface \
    ports { conv_buf_11_address0 { O 11 vector } conv_buf_11_ce0 { O 1 bit } conv_buf_11_we0 { O 1 bit } conv_buf_11_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 118 \
    name conv_buf_12 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_12 \
    op interface \
    ports { conv_buf_12_address0 { O 11 vector } conv_buf_12_ce0 { O 1 bit } conv_buf_12_we0 { O 1 bit } conv_buf_12_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 119 \
    name conv_buf_13 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_13 \
    op interface \
    ports { conv_buf_13_address0 { O 11 vector } conv_buf_13_ce0 { O 1 bit } conv_buf_13_we0 { O 1 bit } conv_buf_13_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 120 \
    name conv_buf_14 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_14 \
    op interface \
    ports { conv_buf_14_address0 { O 11 vector } conv_buf_14_ce0 { O 1 bit } conv_buf_14_we0 { O 1 bit } conv_buf_14_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 121 \
    name conv_buf_15 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_15 \
    op interface \
    ports { conv_buf_15_address0 { O 11 vector } conv_buf_15_ce0 { O 1 bit } conv_buf_15_we0 { O 1 bit } conv_buf_15_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 122 \
    name conv_buf_16 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_16 \
    op interface \
    ports { conv_buf_16_address0 { O 11 vector } conv_buf_16_ce0 { O 1 bit } conv_buf_16_we0 { O 1 bit } conv_buf_16_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_16'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 123 \
    name conv_buf_17 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_17 \
    op interface \
    ports { conv_buf_17_address0 { O 11 vector } conv_buf_17_ce0 { O 1 bit } conv_buf_17_we0 { O 1 bit } conv_buf_17_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_17'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 124 \
    name conv_buf_18 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_18 \
    op interface \
    ports { conv_buf_18_address0 { O 11 vector } conv_buf_18_ce0 { O 1 bit } conv_buf_18_we0 { O 1 bit } conv_buf_18_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_18'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 125 \
    name conv_buf_19 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_19 \
    op interface \
    ports { conv_buf_19_address0 { O 11 vector } conv_buf_19_ce0 { O 1 bit } conv_buf_19_we0 { O 1 bit } conv_buf_19_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_19'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 126 \
    name conv_buf_20 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_20 \
    op interface \
    ports { conv_buf_20_address0 { O 11 vector } conv_buf_20_ce0 { O 1 bit } conv_buf_20_we0 { O 1 bit } conv_buf_20_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_20'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 127 \
    name conv_buf_21 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_21 \
    op interface \
    ports { conv_buf_21_address0 { O 11 vector } conv_buf_21_ce0 { O 1 bit } conv_buf_21_we0 { O 1 bit } conv_buf_21_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_21'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 128 \
    name conv_buf_22 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_22 \
    op interface \
    ports { conv_buf_22_address0 { O 11 vector } conv_buf_22_ce0 { O 1 bit } conv_buf_22_we0 { O 1 bit } conv_buf_22_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_22'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 129 \
    name conv_buf_23 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_23 \
    op interface \
    ports { conv_buf_23_address0 { O 11 vector } conv_buf_23_ce0 { O 1 bit } conv_buf_23_we0 { O 1 bit } conv_buf_23_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_23'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 130 \
    name conv_buf_24 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_24 \
    op interface \
    ports { conv_buf_24_address0 { O 11 vector } conv_buf_24_ce0 { O 1 bit } conv_buf_24_we0 { O 1 bit } conv_buf_24_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_24'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 131 \
    name conv_buf_25 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_25 \
    op interface \
    ports { conv_buf_25_address0 { O 11 vector } conv_buf_25_ce0 { O 1 bit } conv_buf_25_we0 { O 1 bit } conv_buf_25_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_25'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 132 \
    name conv_buf_26 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_26 \
    op interface \
    ports { conv_buf_26_address0 { O 11 vector } conv_buf_26_ce0 { O 1 bit } conv_buf_26_we0 { O 1 bit } conv_buf_26_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_26'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 133 \
    name conv_buf_27 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_27 \
    op interface \
    ports { conv_buf_27_address0 { O 11 vector } conv_buf_27_ce0 { O 1 bit } conv_buf_27_we0 { O 1 bit } conv_buf_27_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_27'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 134 \
    name conv_buf_28 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_28 \
    op interface \
    ports { conv_buf_28_address0 { O 11 vector } conv_buf_28_ce0 { O 1 bit } conv_buf_28_we0 { O 1 bit } conv_buf_28_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_28'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 135 \
    name conv_buf_29 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_29 \
    op interface \
    ports { conv_buf_29_address0 { O 11 vector } conv_buf_29_ce0 { O 1 bit } conv_buf_29_we0 { O 1 bit } conv_buf_29_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_29'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 136 \
    name conv_buf_30 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_30 \
    op interface \
    ports { conv_buf_30_address0 { O 11 vector } conv_buf_30_ce0 { O 1 bit } conv_buf_30_we0 { O 1 bit } conv_buf_30_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_30'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 137 \
    name conv_buf_31 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename conv_buf_31 \
    op interface \
    ports { conv_buf_31_address0 { O 11 vector } conv_buf_31_ce0 { O 1 bit } conv_buf_31_we0 { O 1 bit } conv_buf_31_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_31'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 138 \
    name in_buf \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf \
    op interface \
    ports { in_buf_address0 { O 7 vector } in_buf_ce0 { O 1 bit } in_buf_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 139 \
    name in_buf_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_1 \
    op interface \
    ports { in_buf_1_address0 { O 7 vector } in_buf_1_ce0 { O 1 bit } in_buf_1_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 140 \
    name in_buf_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_2 \
    op interface \
    ports { in_buf_2_address0 { O 7 vector } in_buf_2_ce0 { O 1 bit } in_buf_2_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 141 \
    name in_buf_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_3 \
    op interface \
    ports { in_buf_3_address0 { O 7 vector } in_buf_3_ce0 { O 1 bit } in_buf_3_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 142 \
    name in_buf_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_4 \
    op interface \
    ports { in_buf_4_address0 { O 7 vector } in_buf_4_ce0 { O 1 bit } in_buf_4_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 143 \
    name in_buf_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_5 \
    op interface \
    ports { in_buf_5_address0 { O 7 vector } in_buf_5_ce0 { O 1 bit } in_buf_5_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 144 \
    name in_buf_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_6 \
    op interface \
    ports { in_buf_6_address0 { O 7 vector } in_buf_6_ce0 { O 1 bit } in_buf_6_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 145 \
    name in_buf_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_7 \
    op interface \
    ports { in_buf_7_address0 { O 7 vector } in_buf_7_ce0 { O 1 bit } in_buf_7_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 146 \
    name in_buf_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_8 \
    op interface \
    ports { in_buf_8_address0 { O 7 vector } in_buf_8_ce0 { O 1 bit } in_buf_8_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 147 \
    name in_buf_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_9 \
    op interface \
    ports { in_buf_9_address0 { O 7 vector } in_buf_9_ce0 { O 1 bit } in_buf_9_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 148 \
    name in_buf_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_10 \
    op interface \
    ports { in_buf_10_address0 { O 7 vector } in_buf_10_ce0 { O 1 bit } in_buf_10_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 149 \
    name in_buf_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_11 \
    op interface \
    ports { in_buf_11_address0 { O 7 vector } in_buf_11_ce0 { O 1 bit } in_buf_11_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 150 \
    name in_buf_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_12 \
    op interface \
    ports { in_buf_12_address0 { O 7 vector } in_buf_12_ce0 { O 1 bit } in_buf_12_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 151 \
    name in_buf_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_13 \
    op interface \
    ports { in_buf_13_address0 { O 7 vector } in_buf_13_ce0 { O 1 bit } in_buf_13_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 152 \
    name in_buf_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_14 \
    op interface \
    ports { in_buf_14_address0 { O 7 vector } in_buf_14_ce0 { O 1 bit } in_buf_14_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 153 \
    name in_buf_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_15 \
    op interface \
    ports { in_buf_15_address0 { O 7 vector } in_buf_15_ce0 { O 1 bit } in_buf_15_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 154 \
    name in_buf_16 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_16 \
    op interface \
    ports { in_buf_16_address0 { O 7 vector } in_buf_16_ce0 { O 1 bit } in_buf_16_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_16'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 155 \
    name in_buf_17 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_17 \
    op interface \
    ports { in_buf_17_address0 { O 7 vector } in_buf_17_ce0 { O 1 bit } in_buf_17_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_17'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 156 \
    name in_buf_18 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_18 \
    op interface \
    ports { in_buf_18_address0 { O 7 vector } in_buf_18_ce0 { O 1 bit } in_buf_18_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_18'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 157 \
    name in_buf_19 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_19 \
    op interface \
    ports { in_buf_19_address0 { O 7 vector } in_buf_19_ce0 { O 1 bit } in_buf_19_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_19'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 158 \
    name in_buf_20 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_20 \
    op interface \
    ports { in_buf_20_address0 { O 7 vector } in_buf_20_ce0 { O 1 bit } in_buf_20_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_20'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 159 \
    name in_buf_21 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_21 \
    op interface \
    ports { in_buf_21_address0 { O 7 vector } in_buf_21_ce0 { O 1 bit } in_buf_21_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_21'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 160 \
    name in_buf_22 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_22 \
    op interface \
    ports { in_buf_22_address0 { O 7 vector } in_buf_22_ce0 { O 1 bit } in_buf_22_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_22'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 161 \
    name in_buf_23 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename in_buf_23 \
    op interface \
    ports { in_buf_23_address0 { O 7 vector } in_buf_23_ce0 { O 1 bit } in_buf_23_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_buf_23'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName conv1_pool1_flow_control_loop_pipe_sequential_init_U
set CompName conv1_pool1_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix conv1_pool1_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


