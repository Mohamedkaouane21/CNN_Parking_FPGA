# export_ip.tcl
# A lancer depuis ~/Téléchargements/conv1_pool1_v4/
# Rouvre le projet existant (ne relance pas csim/synth)
# et exporte l'IP dans ip_repo/conv1_pool1/

set script_dir [file normalize [file dirname [info script]]]

open_project hls_prj
open_solution solution1

puts "===================================================="
puts "Export IP en cours..."
puts "===================================================="

# format ip_catalog = format standard pour Vivado IP Repository
# vendor, library, version : identifies l'IP dans Vivado
export_design \
    -format ip_catalog \
    -output "$script_dir/ip_repo/conv1_pool1" \
    -ipname  "conv1_pool1" \
    -version "1.0" \
    -vendor  "user" \
    -library "hls"

puts "===================================================="
puts "IP exportee dans : $script_dir/ip_repo/conv1_pool1"
puts "===================================================="
