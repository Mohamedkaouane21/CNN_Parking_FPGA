# create_vivado_project.tcl  v3
# Architecture simplifiee : PS + Reset + HLS IP (pas de DMA)
# L'IP HLS accede directement a la DDR via m_axi (HP0).
# Le PS controle l'IP via s_axilite (GP0).
#
# Usage :
#   vivado -mode batch -source create_vivado_project.tcl

# ---------------------------------------------------------------
# Chemins
# ---------------------------------------------------------------
set origin_dir [file normalize [file dirname [info script]]]
set ip_zip     "$origin_dir/ip_repo/conv1_pool1.zip"
set proj_dir   "$origin_dir/vivado_pynq"
set proj_name  "pynq_conv1"

if {![file exists $ip_zip]} {
    puts "ERROR: IP introuvable : $ip_zip"
    puts "       -> Lancer d'abord export_ip.tcl"
    exit 1
}
puts "IP trouvee : $ip_zip"

# ---------------------------------------------------------------
# 1. Extraire l'IP
# ---------------------------------------------------------------
set ip_dir "$origin_dir/ip_repo/conv1_pool1_extracted"
file mkdir $ip_dir
exec unzip -o $ip_zip -d $ip_dir
puts "IP extraite dans : $ip_dir"

# ---------------------------------------------------------------
# 2. Creer le projet
# ---------------------------------------------------------------
file mkdir $proj_dir
create_project $proj_name $proj_dir -part xc7z020clg400-1 -force

set_property ip_repo_paths $ip_dir [current_fileset]
update_ip_catalog

# ---------------------------------------------------------------
# 3. Block Design
# ---------------------------------------------------------------
create_bd_design "design_1"

# --- PS Zynq ---
set ps [create_bd_cell -type ip \
    -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0]

set_property -dict [list \
    CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} \
    CONFIG.PCW_USE_M_AXI_GP0            {1}   \
    CONFIG.PCW_USE_S_AXI_HP0            {1}   \
    CONFIG.PCW_S_AXI_HP0_DATA_WIDTH     {64}  \
    CONFIG.PCW_EN_CLK0_PORT             {1}   \
    CONFIG.PCW_EN_RST0_PORT             {1}   \
] $ps

make_bd_intf_pins_external [get_bd_intf_pins processing_system7_0/DDR]
make_bd_intf_pins_external [get_bd_intf_pins processing_system7_0/FIXED_IO]

# --- Reset ---
set rst [create_bd_cell -type ip \
    -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0]

# --- IP HLS ---
set hls_ip [create_bd_cell -type ip \
    -vlnv user:hls:conv1_pool1:1.0 conv1_pool1_0]

# --- AXI Interconnect GP0 -> s_axi_control ---
set ctrl_ic [create_bd_cell -type ip \
    -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_ctrl]
set_property -dict [list CONFIG.NUM_SI {1} CONFIG.NUM_MI {1}] $ctrl_ic

# --- AXI Interconnect HP0 <- {AXI_IN, AXI_OUT} ---
set data_ic [create_bd_cell -type ip \
    -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_data]
set_property -dict [list CONFIG.NUM_SI {2} CONFIG.NUM_MI {1}] $data_ic

# ---------------------------------------------------------------
# 4. Connexions horloge
# ---------------------------------------------------------------
set clk [get_bd_pins processing_system7_0/FCLK_CLK0]

connect_bd_net $clk \
    [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] \
    [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] \
    [get_bd_pins proc_sys_reset_0/slowest_sync_clk]   \
    [get_bd_pins axi_ic_ctrl/ACLK]                    \
    [get_bd_pins axi_ic_ctrl/S00_ACLK]                \
    [get_bd_pins axi_ic_ctrl/M00_ACLK]                \
    [get_bd_pins axi_ic_data/ACLK]                    \
    [get_bd_pins axi_ic_data/S00_ACLK]                \
    [get_bd_pins axi_ic_data/S01_ACLK]                \
    [get_bd_pins axi_ic_data/M00_ACLK]                \
    [get_bd_pins conv1_pool1_0/ap_clk]

# ---------------------------------------------------------------
# 5. Connexions reset
# ---------------------------------------------------------------
connect_bd_net \
    [get_bd_pins processing_system7_0/FCLK_RESET0_N] \
    [get_bd_pins proc_sys_reset_0/ext_reset_in]

connect_bd_net \
    [get_bd_pins proc_sys_reset_0/interconnect_aresetn] \
    [get_bd_pins axi_ic_ctrl/ARESETN] \
    [get_bd_pins axi_ic_data/ARESETN]

connect_bd_net \
    [get_bd_pins proc_sys_reset_0/peripheral_aresetn] \
    [get_bd_pins axi_ic_ctrl/S00_ARESETN] \
    [get_bd_pins axi_ic_ctrl/M00_ARESETN] \
    [get_bd_pins axi_ic_data/S00_ARESETN] \
    [get_bd_pins axi_ic_data/S01_ARESETN] \
    [get_bd_pins axi_ic_data/M00_ARESETN] \
    [get_bd_pins conv1_pool1_0/ap_rst_n]

# ---------------------------------------------------------------
# 6. Connexions AXI
# ---------------------------------------------------------------
# GP0 -> ctrl interconnect -> s_axi_control
connect_bd_intf_net \
    [get_bd_intf_pins processing_system7_0/M_AXI_GP0] \
    [get_bd_intf_pins axi_ic_ctrl/S00_AXI]

connect_bd_intf_net \
    [get_bd_intf_pins axi_ic_ctrl/M00_AXI] \
    [get_bd_intf_pins conv1_pool1_0/s_axi_control]

# m_axi_AXI_IN -> data interconnect
connect_bd_intf_net \
    [get_bd_intf_pins conv1_pool1_0/m_axi_AXI_IN] \
    [get_bd_intf_pins axi_ic_data/S00_AXI]

# m_axi_AXI_OUT -> data interconnect
connect_bd_intf_net \
    [get_bd_intf_pins conv1_pool1_0/m_axi_AXI_OUT] \
    [get_bd_intf_pins axi_ic_data/S01_AXI]

# data interconnect -> HP0
connect_bd_intf_net \
    [get_bd_intf_pins axi_ic_data/M00_AXI] \
    [get_bd_intf_pins processing_system7_0/S_AXI_HP0]

# ---------------------------------------------------------------
# 7. Adresses
# ---------------------------------------------------------------
assign_bd_address

# ---------------------------------------------------------------
# 8. Validation
# ---------------------------------------------------------------
validate_bd_design
save_bd_design
puts "Block Design valide."

# ---------------------------------------------------------------
# 9. Wrapper HDL
# Vivado 2024.x place le wrapper dans .gen/ et non .srcs/
# ---------------------------------------------------------------
make_wrapper -files [get_files design_1.bd] -top

# Chercher le wrapper dans les deux emplacements possibles
set wrapper_candidates [list \
    "$proj_dir/${proj_name}.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v" \
    "$proj_dir/${proj_name}.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.v" \
]

set wrapper_file ""
foreach candidate $wrapper_candidates {
    if {[file exists $candidate]} {
        set wrapper_file $candidate
        break
    }
}

if {$wrapper_file eq ""} {
    puts "ERROR: wrapper introuvable. Cherche dans :"
    foreach c $wrapper_candidates { puts "  $c" }
    exit 1
}

puts "Wrapper trouve : $wrapper_file"
add_files -norecurse $wrapper_file
set_property top design_1_wrapper [current_fileset]
update_compile_order -fileset sources_1

# ---------------------------------------------------------------
# 10. Synthese + Implementation + Bitstream
# ---------------------------------------------------------------
puts "===================================================="
puts "Lancement synthese + implementation + bitstream..."
puts "Duree estimee : 15-25 minutes"
puts "===================================================="

launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1

# Verifier le statut
set run_status [get_property STATUS [get_runs impl_1]]
puts "Statut implementation : $run_status"

# ---------------------------------------------------------------
# 11. Copie des fichiers de sortie
# ---------------------------------------------------------------
file mkdir "$origin_dir/pynq_output"

# Bitstream
set bit_candidates [list \
    "$proj_dir/${proj_name}.runs/impl_1/design_1_wrapper.bit" \
]
foreach bit $bit_candidates {
    if {[file exists $bit]} {
        file copy -force $bit "$origin_dir/pynq_output/design_1_wrapper.bit"
        puts "Bitstream : $origin_dir/pynq_output/design_1_wrapper.bit"
        break
    }
}

# HWH (hardware handoff pour PYNQ)
set hwh_candidates [list \
    "$proj_dir/${proj_name}.gen/sources_1/bd/design_1/hw_handoff/design_1.hwh" \
    "$proj_dir/${proj_name}.srcs/sources_1/bd/design_1/hw_handoff/design_1.hwh" \
]
foreach hwh $hwh_candidates {
    if {[file exists $hwh]} {
        file copy -force $hwh "$origin_dir/pynq_output/design_1_wrapper.hwh"
        puts "HWH       : $origin_dir/pynq_output/design_1_wrapper.hwh"
        break
    }
}

puts "===================================================="
puts "TERMINE."
puts "Fichiers a copier sur la PYNQ-Z2 :"
puts "  pynq_output/design_1_wrapper.bit"
puts "  pynq_output/design_1_wrapper.hwh"
puts "  data/input_48x48.bin"
puts "  data/golden_pool1.bin"
puts "===================================================="