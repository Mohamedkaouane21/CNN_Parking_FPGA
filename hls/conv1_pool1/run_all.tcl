# ============================================================
# run_all.tcl - Vitis HLS conv1_pool1
# Usage : vitis_hls -f run_all.tcl
# ============================================================

set script_dir [file normalize [file dirname [info script]]]
set data_dir   [file normalize "$script_dir/data"]

puts "===================================================="
puts "conv1_pool1 - Project root : $script_dir"
puts "Data dir : $data_dir"
puts "===================================================="

# Verification des donnees golden
foreach f {input_48x48.bin golden_pool1.bin} {
    set full "$data_dir/$f"
    if {![file exists $full]} {
        puts "ERROR: fichier manquant : $full"
        exit 1
    }
    puts "OK: $full"
}

# Generer data_path.h
set header "$script_dir/src/data_path.h"
if {[catch {open $header w} fh]} {
    puts "ERROR: impossible d'ouvrir $header en ecriture : $fh"
    exit 1
}
puts $fh "/* data_path.h - genere par run_all.tcl */"
puts $fh "#ifndef DATA_PATH_H"
puts $fh "#define DATA_PATH_H"
puts $fh "#define DATA_DIR \"$data_dir\""
puts $fh "#endif"
close $fh
puts "Header genere : $header"

# Projet HLS
open_project   -reset hls_prj
add_files      src/conv1_pool1.cpp    -cflags "-I src"
add_files -tb  src/tb_conv1_pool1.cpp -cflags "-I src"
open_solution  -reset solution1 -flow_target vitis
set_top        conv1_pool1
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
puts "Termine. IP exportee."
puts "===================================================="
