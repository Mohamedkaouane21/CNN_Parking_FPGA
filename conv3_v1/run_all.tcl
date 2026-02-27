set script_dir [file normalize [file dirname [info script]]]
set data_dir   "$script_dir/data"
puts "===================================================="
puts "conv3 : $script_dir"
puts "===================================================="
foreach f {input_pool2.bin golden_conv3.bin} {
    if {[file exists "$data_dir/$f"]} { puts "OK: $f" } \
    else { puts "ERROR: $f manquant"; exit 1 }
}
set fp [open "$script_dir/src/data_path.h" w]
puts $fp "#pragma once"
puts $fp "#define DATA_DIR \"$data_dir\""
close $fp

open_project -reset hls_prj
add_files     src/conv3.cpp    -cflags "-I src"
add_files -tb src/tb_conv3.cpp -cflags "-I src"
open_solution -reset solution1 -flow_target vitis
set_top       conv3
set_part      xc7z020clg400-1
create_clock  -period 10 -name default

puts "===================================================="
puts "Etape 1/2 : csim_design"
puts "===================================================="
csim_design -clean

puts "===================================================="
puts "Etape 2/2 : csynth_design"
puts "===================================================="
csynth_design

puts "===================================================="
puts "Termine."
puts "===================================================="
