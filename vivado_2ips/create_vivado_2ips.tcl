# create_vivado_2ips.tcl
# Block design : conv1_pool1 + conv2_pool2 sur PYNQ-Z2
#
# Usage (depuis un dossier projet) :
#   vivado -mode batch -source create_vivado_2ips.tcl
#
# Structure attendue :
#   <dossier>/
#     ip_repo/conv1_pool1.zip   (depuis conv1_pool1_v4/ip_repo/)
#     ip_repo/conv2_pool2.zip   (depuis conv2_pool2_v1/ip_repo/)
#     pynq_output/              (cree automatiquement)

set origin_dir [file normalize [file dirname [info script]]]
set ip1_zip    "$origin_dir/ip_repo/conv1_pool1.zip"
set ip2_zip    "$origin_dir/ip_repo/conv2_pool2.zip"
set proj_dir   "$origin_dir/vivado_2ips"
set proj_name  "pynq_2ips"

puts "===================================================="
puts "Block design : conv1_pool1 + conv2_pool2"
puts "Origin : $origin_dir"
puts "===================================================="

foreach {zip name} [list $ip1_zip conv1_pool1 $ip2_zip conv2_pool2] {
    if {![file exists $zip]} {
        puts "ERROR: IP manquante : $zip"
        exit 1
    }
    puts "OK: $zip"
}

# ---------------------------------------------------------------
# 1. Extraire les IPs
# ---------------------------------------------------------------
set ip_dir "$origin_dir/ip_repo/extracted"
file mkdir "$ip_dir/conv1_pool1"
file mkdir "$ip_dir/conv2_pool2"
exec unzip -o $ip1_zip -d "$ip_dir/conv1_pool1"
exec unzip -o $ip2_zip -d "$ip_dir/conv2_pool2"
puts "IPs extraites dans : $ip_dir"

# ---------------------------------------------------------------
# 2. Creer le projet Vivado
# ---------------------------------------------------------------
file mkdir $proj_dir
create_project $proj_name $proj_dir -part xc7z020clg400-1 -force

set_property ip_repo_paths [list \
    "$ip_dir/conv1_pool1" \
    "$ip_dir/conv2_pool2" \
] [current_fileset]
update_ip_catalog
puts "IP catalog mis a jour"

# ---------------------------------------------------------------
# 3. Block Design
# ---------------------------------------------------------------
create_bd_design "design_1"

# --- PS Zynq ---
set ps [create_bd_cell -type ip \
    -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0]

apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 \
    -config { make_external "FIXED_IO, DDR" \
              apply_board_preset "0" \
              Master "Disable" \
              Slave  "Disable" } $ps

# Config PS : GP0 (controle) + HP0 (conv1) + HP1 (conv2)
set_property -dict [list \
    CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} \
    CONFIG.PCW_USE_M_AXI_GP0  {1} \
    CONFIG.PCW_USE_S_AXI_HP0  {1} \
    CONFIG.PCW_USE_S_AXI_HP2  {1} \
    CONFIG.PCW_S_AXI_HP0_DATA_WIDTH {64} \
    CONFIG.PCW_S_AXI_HP2_DATA_WIDTH {64} \
] $ps

# --- Reset ---
set rst [create_bd_cell -type ip \
    -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0]

# --- IPs HLS ---
set ip1 [create_bd_cell -type ip -vlnv user:hls:conv1_pool1:1.0 conv1_pool1_0]
set ip2 [create_bd_cell -type ip -vlnv user:hls:conv2_pool2:1.0 conv2_pool2_0]

# --- AXI Interconnect controle : GP0 -> 2 slaves s_axi_control ---
set axi_ctrl [create_bd_cell -type ip \
    -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_ctrl]
set_property CONFIG.NUM_SI {1} $axi_ctrl
set_property CONFIG.NUM_MI {2} $axi_ctrl

# --- AXI Interconnect data HP0 : conv1 IN + OUT ---
set axi_hp0 [create_bd_cell -type ip \
    -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_hp0]
set_property CONFIG.NUM_SI {2} $axi_hp0
set_property CONFIG.NUM_MI {1} $axi_hp0

# --- AXI Interconnect data HP2 : conv2 IN + OUT ---
set axi_hp2 [create_bd_cell -type ip \
    -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_hp2]
set_property CONFIG.NUM_SI {2} $axi_hp2
set_property CONFIG.NUM_MI {1} $axi_hp2

# ---------------------------------------------------------------
# 4. Connexions horloge et reset
# ---------------------------------------------------------------
connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] \
    [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] \
    [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] \
    [get_bd_pins processing_system7_0/S_AXI_HP2_ACLK] \
    [get_bd_pins proc_sys_reset_0/slowest_sync_clk] \
    [get_bd_pins axi_interconnect_ctrl/ACLK] \
    [get_bd_pins axi_interconnect_ctrl/S00_ACLK] \
    [get_bd_pins axi_interconnect_ctrl/M00_ACLK] \
    [get_bd_pins axi_interconnect_ctrl/M01_ACLK] \
    [get_bd_pins axi_interconnect_hp0/ACLK] \
    [get_bd_pins axi_interconnect_hp0/S00_ACLK] \
    [get_bd_pins axi_interconnect_hp0/S01_ACLK] \
    [get_bd_pins axi_interconnect_hp0/M00_ACLK] \
    [get_bd_pins axi_interconnect_hp2/ACLK] \
    [get_bd_pins axi_interconnect_hp2/S00_ACLK] \
    [get_bd_pins axi_interconnect_hp2/S01_ACLK] \
    [get_bd_pins axi_interconnect_hp2/M00_ACLK] \
    [get_bd_pins conv1_pool1_0/ap_clk] \
    [get_bd_pins conv2_pool2_0/ap_clk]

connect_bd_net [get_bd_pins processing_system7_0/FCLK_RESET0_N] \
    [get_bd_pins proc_sys_reset_0/ext_reset_in]

connect_bd_net [get_bd_pins proc_sys_reset_0/interconnect_aresetn] \
    [get_bd_pins axi_interconnect_ctrl/ARESETN] \
    [get_bd_pins axi_interconnect_hp0/ARESETN] \
    [get_bd_pins axi_interconnect_hp2/ARESETN]

connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] \
    [get_bd_pins axi_interconnect_ctrl/S00_ARESETN] \
    [get_bd_pins axi_interconnect_ctrl/M00_ARESETN] \
    [get_bd_pins axi_interconnect_ctrl/M01_ARESETN] \
    [get_bd_pins axi_interconnect_hp0/S00_ARESETN] \
    [get_bd_pins axi_interconnect_hp0/S01_ARESETN] \
    [get_bd_pins axi_interconnect_hp0/M00_ARESETN] \
    [get_bd_pins axi_interconnect_hp2/S00_ARESETN] \
    [get_bd_pins axi_interconnect_hp2/S01_ARESETN] \
    [get_bd_pins axi_interconnect_hp2/M00_ARESETN] \
    [get_bd_pins conv1_pool1_0/ap_rst_n] \
    [get_bd_pins conv2_pool2_0/ap_rst_n]

# ---------------------------------------------------------------
# 5. Connexions AXI
# ---------------------------------------------------------------

# GP0 -> interconnect_ctrl -> s_axi_control des 2 IPs
connect_bd_intf_net [get_bd_intf_pins processing_system7_0/M_AXI_GP0] \
    [get_bd_intf_pins axi_interconnect_ctrl/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_interconnect_ctrl/M00_AXI] \
    [get_bd_intf_pins conv1_pool1_0/s_axi_control]
connect_bd_intf_net [get_bd_intf_pins axi_interconnect_ctrl/M01_AXI] \
    [get_bd_intf_pins conv2_pool2_0/s_axi_control]

# conv1 m_axi -> HP0
connect_bd_intf_net [get_bd_intf_pins conv1_pool1_0/m_axi_AXI_IN] \
    [get_bd_intf_pins axi_interconnect_hp0/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins conv1_pool1_0/m_axi_AXI_OUT] \
    [get_bd_intf_pins axi_interconnect_hp0/S01_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_interconnect_hp0/M00_AXI] \
    [get_bd_intf_pins processing_system7_0/S_AXI_HP0]

# conv2 m_axi -> HP2
connect_bd_intf_net [get_bd_intf_pins conv2_pool2_0/m_axi_AXI_IN] \
    [get_bd_intf_pins axi_interconnect_hp2/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins conv2_pool2_0/m_axi_AXI_OUT] \
    [get_bd_intf_pins axi_interconnect_hp2/S01_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_interconnect_hp2/M00_AXI] \
    [get_bd_intf_pins processing_system7_0/S_AXI_HP2]

# DDR et FIXED_IO externes
make_bd_intf_pins_external [get_bd_intf_pins processing_system7_0/DDR]
make_bd_intf_pins_external [get_bd_intf_pins processing_system7_0/FIXED_IO]

# ---------------------------------------------------------------
# 6. Adresses
# ---------------------------------------------------------------
assign_bd_address

# ---------------------------------------------------------------
# 7. Valider + wrapper
# ---------------------------------------------------------------
validate_bd_design
save_bd_design

make_wrapper -files [get_files design_1.bd] -top
set wrapper_candidates [list \
    "$proj_dir/${proj_name}.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v" \
    "$proj_dir/${proj_name}.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.v" \
]
foreach w $wrapper_candidates {
    if {[file exists $w]} {
        add_files -norecurse $w
        set_property top design_1_wrapper [current_fileset]
        puts "Wrapper : $w"
        break
    }
}
update_compile_order -fileset sources_1

# ---------------------------------------------------------------
# 8. Synthese + Implementation + Bitstream
# ---------------------------------------------------------------
puts "===================================================="
puts "Synthese + Implementation + Bitstream (~20-30 min)..."
puts "===================================================="

launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1

# ---------------------------------------------------------------
# 9. Copier les sorties
# ---------------------------------------------------------------
file mkdir "$origin_dir/pynq_output"

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

set hwh_candidates [list \
    "$proj_dir/${proj_name}.gen/sources_1/bd/design_1/hw_handoff/design_1.hwh" \
    "$proj_dir/${proj_name}.srcs/sources_1/bd/design_1/hw_handoff/design_1.hwh" \
]
foreach hwh $hwh_candidates {
    if {[file exists $hwh]} {
        file copy -force $hwh "$origin_dir/pynq_output/design_1_wrapper.hwh"
        puts "HWH : $origin_dir/pynq_output/design_1_wrapper.hwh"
        break
    }
}

puts "===================================================="
puts "TERMINE."
puts "Fichiers a copier sur la PYNQ-Z2 :"
puts "  pynq_output/design_1_wrapper.bit"
puts "  pynq_output/design_1_wrapper.hwh"
puts "===================================================="
