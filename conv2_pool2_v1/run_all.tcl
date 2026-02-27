# run_all.tcl - conv2_pool2
# Usage : vitis_hls -f run_all.tcl

set script_dir [file normalize [file dirname [info script]]]
set data_dir   "$script_dir/data"

puts "===================================================="
puts "Project root : $script_dir"
puts "Data dir     : $data_dir"
puts "===================================================="

# Verifier les fichiers de donnees
foreach f {input_pool1.bin golden_pool2.bin} {
    if {[file exists "$data_dir/$f"]} {
        puts "OK: $data_dir/$f"
    } else {
        puts "ERROR: manquant : $data_dir/$f"
        exit 1
    }
}

# Generer data_path.h
set header_file "$script_dir/src/data_path.h"
set fp [open $header_file w]
puts $fp "#pragma once"
puts $fp "#define DATA_DIR \"$data_dir\""
close $fp
puts "Header genere : $header_file"

# Projet HLS
open_project -reset hls_prj
add_files      src/conv2_pool2.cpp     -cflags "-I src"
add_files -tb  src/tb_conv2_pool2.cpp  -cflags "-I src"
open_solution  -reset solution1 -flow_target vitis
set_top        conv2_pool2
set_part       xc7z020clg400-1
create_clock   -period 10 -name default

puts "===================================================="
puts "Etape 1/2 : csim_design"
puts "===================================================="
csim_design -clean

puts "===================================================="
puts "Etape 2/2 : csynth_design"
puts "===================================================="
csynth_design

puts "===================================================="
puts "Termine. Rapport : hls_prj/solution1/syn/report/"
puts "===================================================="
