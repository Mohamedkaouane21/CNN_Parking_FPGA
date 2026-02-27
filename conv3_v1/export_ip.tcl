set script_dir [file normalize [file dirname [info script]]]
open_project hls_prj
open_solution solution1
puts "Export IP conv3..."
export_design \
    -format  ip_catalog \
    -output  "$script_dir/ip_repo/conv3" \
    -ipname  "conv3" \
    -version "1.0" \
    -vendor  "user" \
    -library "hls"
puts "IP exportee : $script_dir/ip_repo/conv3.zip"
