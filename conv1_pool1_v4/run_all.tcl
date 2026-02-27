# ============================================================
# run_all.tcl  -  Vitis HLS 2024.2
# Usage : vitis_hls -f run_all.tcl
# Etapes : csim_design -> csynth_design
# ============================================================

set script_dir [file normalize [file dirname [info script]]]
set data_dir   [file normalize "$script_dir/data"]

puts "===================================================="
puts "Project root : $script_dir"
puts "Data dir     : $data_dir"
puts "===================================================="

foreach f {input_48x48.bin golden_pool1.bin} {
    set full "$data_dir/$f"
    if {![file exists $full]} {
        puts "ERROR: fichier manquant : $full"
        puts "       -> Lancer d'abord : python3 regen_golden.py"
        exit 1
    }
    puts "OK: $full"
}

set header "$script_dir/src/data_path.h"
set fh [open $header w]
puts $fh "/* data_path.h - genere par run_all.tcl - NE PAS EDITER */"
puts $fh "#ifndef DATA_PATH_H"
puts $fh "#define DATA_PATH_H"
puts $fh "#define DATA_DIR \"$data_dir\""
puts $fh "#endif"
close $fh
puts "Header genere : $header"

open_project -reset hls_prj
add_files      src/conv1_pool1.cpp -cflags "-I src"
add_files -tb  src/tb_conv1_pool1.cpp -cflags "-I src"

open_solution -reset solution1 -flow_target vitis
set_top conv1_pool1
set_part xc7z020clg400-1
create_clock -period 10 -name default

# ---------------------------------------------------------------
# CSIM
# ---------------------------------------------------------------
puts "===================================================="
puts "Etape 1/2 : csim_design"
puts "===================================================="
csim_design -clean

# ---------------------------------------------------------------
# SYNTHESE RTL
# ---------------------------------------------------------------
puts "===================================================="
puts "Etape 2/2 : csynth_design"
puts "===================================================="
csynth_design

puts "===================================================="
puts "Termine. Rapport : hls_prj/solution1/syn/report/"
puts "===================================================="
