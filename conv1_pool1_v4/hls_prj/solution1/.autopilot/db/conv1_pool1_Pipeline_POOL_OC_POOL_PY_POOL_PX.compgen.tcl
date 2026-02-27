# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler conv1_pool1_sparsemux_33_4_32_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {compactencoding_dontcare}
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
    id 174 \
    name conv_buf \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf \
    op interface \
    ports { conv_buf_address0 { O 11 vector } conv_buf_ce0 { O 1 bit } conv_buf_q0 { I 32 vector } conv_buf_address1 { O 11 vector } conv_buf_ce1 { O 1 bit } conv_buf_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 175 \
    name conv_buf_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_1 \
    op interface \
    ports { conv_buf_1_address0 { O 11 vector } conv_buf_1_ce0 { O 1 bit } conv_buf_1_q0 { I 32 vector } conv_buf_1_address1 { O 11 vector } conv_buf_1_ce1 { O 1 bit } conv_buf_1_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 176 \
    name conv_buf_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_2 \
    op interface \
    ports { conv_buf_2_address0 { O 11 vector } conv_buf_2_ce0 { O 1 bit } conv_buf_2_q0 { I 32 vector } conv_buf_2_address1 { O 11 vector } conv_buf_2_ce1 { O 1 bit } conv_buf_2_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 177 \
    name conv_buf_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_3 \
    op interface \
    ports { conv_buf_3_address0 { O 11 vector } conv_buf_3_ce0 { O 1 bit } conv_buf_3_q0 { I 32 vector } conv_buf_3_address1 { O 11 vector } conv_buf_3_ce1 { O 1 bit } conv_buf_3_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 178 \
    name conv_buf_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_4 \
    op interface \
    ports { conv_buf_4_address0 { O 11 vector } conv_buf_4_ce0 { O 1 bit } conv_buf_4_q0 { I 32 vector } conv_buf_4_address1 { O 11 vector } conv_buf_4_ce1 { O 1 bit } conv_buf_4_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 179 \
    name conv_buf_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_5 \
    op interface \
    ports { conv_buf_5_address0 { O 11 vector } conv_buf_5_ce0 { O 1 bit } conv_buf_5_q0 { I 32 vector } conv_buf_5_address1 { O 11 vector } conv_buf_5_ce1 { O 1 bit } conv_buf_5_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 180 \
    name conv_buf_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_6 \
    op interface \
    ports { conv_buf_6_address0 { O 11 vector } conv_buf_6_ce0 { O 1 bit } conv_buf_6_q0 { I 32 vector } conv_buf_6_address1 { O 11 vector } conv_buf_6_ce1 { O 1 bit } conv_buf_6_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 181 \
    name conv_buf_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_7 \
    op interface \
    ports { conv_buf_7_address0 { O 11 vector } conv_buf_7_ce0 { O 1 bit } conv_buf_7_q0 { I 32 vector } conv_buf_7_address1 { O 11 vector } conv_buf_7_ce1 { O 1 bit } conv_buf_7_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 182 \
    name conv_buf_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_8 \
    op interface \
    ports { conv_buf_8_address0 { O 11 vector } conv_buf_8_ce0 { O 1 bit } conv_buf_8_q0 { I 32 vector } conv_buf_8_address1 { O 11 vector } conv_buf_8_ce1 { O 1 bit } conv_buf_8_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 183 \
    name conv_buf_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_9 \
    op interface \
    ports { conv_buf_9_address0 { O 11 vector } conv_buf_9_ce0 { O 1 bit } conv_buf_9_q0 { I 32 vector } conv_buf_9_address1 { O 11 vector } conv_buf_9_ce1 { O 1 bit } conv_buf_9_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 184 \
    name conv_buf_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_10 \
    op interface \
    ports { conv_buf_10_address0 { O 11 vector } conv_buf_10_ce0 { O 1 bit } conv_buf_10_q0 { I 32 vector } conv_buf_10_address1 { O 11 vector } conv_buf_10_ce1 { O 1 bit } conv_buf_10_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 185 \
    name conv_buf_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_11 \
    op interface \
    ports { conv_buf_11_address0 { O 11 vector } conv_buf_11_ce0 { O 1 bit } conv_buf_11_q0 { I 32 vector } conv_buf_11_address1 { O 11 vector } conv_buf_11_ce1 { O 1 bit } conv_buf_11_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 186 \
    name conv_buf_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_12 \
    op interface \
    ports { conv_buf_12_address0 { O 11 vector } conv_buf_12_ce0 { O 1 bit } conv_buf_12_q0 { I 32 vector } conv_buf_12_address1 { O 11 vector } conv_buf_12_ce1 { O 1 bit } conv_buf_12_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 187 \
    name conv_buf_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_13 \
    op interface \
    ports { conv_buf_13_address0 { O 11 vector } conv_buf_13_ce0 { O 1 bit } conv_buf_13_q0 { I 32 vector } conv_buf_13_address1 { O 11 vector } conv_buf_13_ce1 { O 1 bit } conv_buf_13_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 188 \
    name conv_buf_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_14 \
    op interface \
    ports { conv_buf_14_address0 { O 11 vector } conv_buf_14_ce0 { O 1 bit } conv_buf_14_q0 { I 32 vector } conv_buf_14_address1 { O 11 vector } conv_buf_14_ce1 { O 1 bit } conv_buf_14_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 189 \
    name conv_buf_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_15 \
    op interface \
    ports { conv_buf_15_address0 { O 11 vector } conv_buf_15_ce0 { O 1 bit } conv_buf_15_q0 { I 32 vector } conv_buf_15_address1 { O 11 vector } conv_buf_15_ce1 { O 1 bit } conv_buf_15_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 190 \
    name conv_buf_16 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_16 \
    op interface \
    ports { conv_buf_16_address0 { O 11 vector } conv_buf_16_ce0 { O 1 bit } conv_buf_16_q0 { I 32 vector } conv_buf_16_address1 { O 11 vector } conv_buf_16_ce1 { O 1 bit } conv_buf_16_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_16'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 191 \
    name conv_buf_17 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_17 \
    op interface \
    ports { conv_buf_17_address0 { O 11 vector } conv_buf_17_ce0 { O 1 bit } conv_buf_17_q0 { I 32 vector } conv_buf_17_address1 { O 11 vector } conv_buf_17_ce1 { O 1 bit } conv_buf_17_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_17'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 192 \
    name conv_buf_18 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_18 \
    op interface \
    ports { conv_buf_18_address0 { O 11 vector } conv_buf_18_ce0 { O 1 bit } conv_buf_18_q0 { I 32 vector } conv_buf_18_address1 { O 11 vector } conv_buf_18_ce1 { O 1 bit } conv_buf_18_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_18'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 193 \
    name conv_buf_19 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_19 \
    op interface \
    ports { conv_buf_19_address0 { O 11 vector } conv_buf_19_ce0 { O 1 bit } conv_buf_19_q0 { I 32 vector } conv_buf_19_address1 { O 11 vector } conv_buf_19_ce1 { O 1 bit } conv_buf_19_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_19'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 194 \
    name conv_buf_20 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_20 \
    op interface \
    ports { conv_buf_20_address0 { O 11 vector } conv_buf_20_ce0 { O 1 bit } conv_buf_20_q0 { I 32 vector } conv_buf_20_address1 { O 11 vector } conv_buf_20_ce1 { O 1 bit } conv_buf_20_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_20'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 195 \
    name conv_buf_21 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_21 \
    op interface \
    ports { conv_buf_21_address0 { O 11 vector } conv_buf_21_ce0 { O 1 bit } conv_buf_21_q0 { I 32 vector } conv_buf_21_address1 { O 11 vector } conv_buf_21_ce1 { O 1 bit } conv_buf_21_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_21'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 196 \
    name conv_buf_22 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_22 \
    op interface \
    ports { conv_buf_22_address0 { O 11 vector } conv_buf_22_ce0 { O 1 bit } conv_buf_22_q0 { I 32 vector } conv_buf_22_address1 { O 11 vector } conv_buf_22_ce1 { O 1 bit } conv_buf_22_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_22'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 197 \
    name conv_buf_23 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_23 \
    op interface \
    ports { conv_buf_23_address0 { O 11 vector } conv_buf_23_ce0 { O 1 bit } conv_buf_23_q0 { I 32 vector } conv_buf_23_address1 { O 11 vector } conv_buf_23_ce1 { O 1 bit } conv_buf_23_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_23'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 198 \
    name conv_buf_24 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_24 \
    op interface \
    ports { conv_buf_24_address0 { O 11 vector } conv_buf_24_ce0 { O 1 bit } conv_buf_24_q0 { I 32 vector } conv_buf_24_address1 { O 11 vector } conv_buf_24_ce1 { O 1 bit } conv_buf_24_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_24'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 199 \
    name conv_buf_25 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_25 \
    op interface \
    ports { conv_buf_25_address0 { O 11 vector } conv_buf_25_ce0 { O 1 bit } conv_buf_25_q0 { I 32 vector } conv_buf_25_address1 { O 11 vector } conv_buf_25_ce1 { O 1 bit } conv_buf_25_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_25'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 200 \
    name conv_buf_26 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_26 \
    op interface \
    ports { conv_buf_26_address0 { O 11 vector } conv_buf_26_ce0 { O 1 bit } conv_buf_26_q0 { I 32 vector } conv_buf_26_address1 { O 11 vector } conv_buf_26_ce1 { O 1 bit } conv_buf_26_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_26'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 201 \
    name conv_buf_27 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_27 \
    op interface \
    ports { conv_buf_27_address0 { O 11 vector } conv_buf_27_ce0 { O 1 bit } conv_buf_27_q0 { I 32 vector } conv_buf_27_address1 { O 11 vector } conv_buf_27_ce1 { O 1 bit } conv_buf_27_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_27'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 202 \
    name conv_buf_28 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_28 \
    op interface \
    ports { conv_buf_28_address0 { O 11 vector } conv_buf_28_ce0 { O 1 bit } conv_buf_28_q0 { I 32 vector } conv_buf_28_address1 { O 11 vector } conv_buf_28_ce1 { O 1 bit } conv_buf_28_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_28'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 203 \
    name conv_buf_29 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_29 \
    op interface \
    ports { conv_buf_29_address0 { O 11 vector } conv_buf_29_ce0 { O 1 bit } conv_buf_29_q0 { I 32 vector } conv_buf_29_address1 { O 11 vector } conv_buf_29_ce1 { O 1 bit } conv_buf_29_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_29'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 204 \
    name conv_buf_30 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_30 \
    op interface \
    ports { conv_buf_30_address0 { O 11 vector } conv_buf_30_ce0 { O 1 bit } conv_buf_30_q0 { I 32 vector } conv_buf_30_address1 { O 11 vector } conv_buf_30_ce1 { O 1 bit } conv_buf_30_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_30'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 205 \
    name conv_buf_31 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename conv_buf_31 \
    op interface \
    ports { conv_buf_31_address0 { O 11 vector } conv_buf_31_ce0 { O 1 bit } conv_buf_31_q0 { I 32 vector } conv_buf_31_address1 { O 11 vector } conv_buf_31_ce1 { O 1 bit } conv_buf_31_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'conv_buf_31'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 172 \
    name AXI_OUT \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_AXI_OUT \
    op interface \
    ports { m_axi_AXI_OUT_0_AWVALID { O 1 bit } m_axi_AXI_OUT_0_AWREADY { I 1 bit } m_axi_AXI_OUT_0_AWADDR { O 64 vector } m_axi_AXI_OUT_0_AWID { O 1 vector } m_axi_AXI_OUT_0_AWLEN { O 32 vector } m_axi_AXI_OUT_0_AWSIZE { O 3 vector } m_axi_AXI_OUT_0_AWBURST { O 2 vector } m_axi_AXI_OUT_0_AWLOCK { O 2 vector } m_axi_AXI_OUT_0_AWCACHE { O 4 vector } m_axi_AXI_OUT_0_AWPROT { O 3 vector } m_axi_AXI_OUT_0_AWQOS { O 4 vector } m_axi_AXI_OUT_0_AWREGION { O 4 vector } m_axi_AXI_OUT_0_AWUSER { O 1 vector } m_axi_AXI_OUT_0_WVALID { O 1 bit } m_axi_AXI_OUT_0_WREADY { I 1 bit } m_axi_AXI_OUT_0_WDATA { O 32 vector } m_axi_AXI_OUT_0_WSTRB { O 4 vector } m_axi_AXI_OUT_0_WLAST { O 1 bit } m_axi_AXI_OUT_0_WID { O 1 vector } m_axi_AXI_OUT_0_WUSER { O 1 vector } m_axi_AXI_OUT_0_ARVALID { O 1 bit } m_axi_AXI_OUT_0_ARREADY { I 1 bit } m_axi_AXI_OUT_0_ARADDR { O 64 vector } m_axi_AXI_OUT_0_ARID { O 1 vector } m_axi_AXI_OUT_0_ARLEN { O 32 vector } m_axi_AXI_OUT_0_ARSIZE { O 3 vector } m_axi_AXI_OUT_0_ARBURST { O 2 vector } m_axi_AXI_OUT_0_ARLOCK { O 2 vector } m_axi_AXI_OUT_0_ARCACHE { O 4 vector } m_axi_AXI_OUT_0_ARPROT { O 3 vector } m_axi_AXI_OUT_0_ARQOS { O 4 vector } m_axi_AXI_OUT_0_ARREGION { O 4 vector } m_axi_AXI_OUT_0_ARUSER { O 1 vector } m_axi_AXI_OUT_0_RVALID { I 1 bit } m_axi_AXI_OUT_0_RREADY { O 1 bit } m_axi_AXI_OUT_0_RDATA { I 32 vector } m_axi_AXI_OUT_0_RLAST { I 1 bit } m_axi_AXI_OUT_0_RID { I 1 vector } m_axi_AXI_OUT_0_RFIFONUM { I 9 vector } m_axi_AXI_OUT_0_RUSER { I 1 vector } m_axi_AXI_OUT_0_RRESP { I 2 vector } m_axi_AXI_OUT_0_BVALID { I 1 bit } m_axi_AXI_OUT_0_BREADY { O 1 bit } m_axi_AXI_OUT_0_BRESP { I 2 vector } m_axi_AXI_OUT_0_BID { I 1 vector } m_axi_AXI_OUT_0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 173 \
    name sext_ln128 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln128 \
    op interface \
    ports { sext_ln128 { I 62 vector } } \
} "
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


