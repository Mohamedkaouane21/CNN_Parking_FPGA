# run_all.tcl — Vitis HLS conv2_pool2
# Usage : vitis_hls -f run_all.tcl
set script_dir [file normalize [file dirname [info script]]]
set data_dir   "$script_dir/data"

puts "===================================================="
puts "conv2_pool2 — Project root : $script_dir"
puts "Data dir : $data_dir"
puts "===================================================="

foreach f {input_pool1.bin golden_pool2.bin} {
    if {[file exists "$data_dir/$f"]} {
        puts "OK: $data_dir/$f"
    } else {
        puts "ERROR: manquant : $data_dir/$f"
        exit 1
    }
}

# Générer data_path.h
set header_file "$script_dir/src/data_path.h"
set fp [open $header_file w]
puts $fp "#pragma once"
puts $fp "#define DATA_DIR \"$data_dir\""
close $fp
puts "Header généré : $header_file"

open_project -reset hls_prj
add_files      src/conv2_pool2.cpp     -cflags "-I src"
add_files -tb  src/tb_conv2_pool2.cpp  -cflags "-I src"
open_solution  -reset solution1 -flow_target vitis
set_top        conv2_pool2
set_part       xc7z020clg400-1
create_clock   -period 10 -name default

puts "===================================================="
puts "Etape 1/3 : csim_design"
puts "===================================================="
csim_design -clean

puts "===================================================="
puts "Etape 2/3 : csynth_design"
puts "===================================================="
csynth_design

puts "===================================================="
puts "Etape 3/3 : export_design"
puts "===================================================="
export_design -format ip_catalog

puts "===================================================="
puts "Terminé. IP exportée."
puts "===================================================="
