# export_ip.tcl - conv2_pool2
set script_dir [file normalize [file dirname [info script]]]

open_project hls_prj
open_solution solution1

puts "===================================================="
puts "Export IP conv2_pool2..."
puts "===================================================="

export_design \
    -format  ip_catalog \
    -output  "$script_dir/ip_repo/conv2_pool2" \
    -ipname  "conv2_pool2" \
    -version "1.0" \
    -vendor  "user" \
    -library "hls"

puts "===================================================="
puts "IP exportee : $script_dir/ip_repo/conv2_pool2.zip"
puts "===================================================="
