# Run in the Vivado Tcl Console: source /path/to/create_project.tcl
set repo_dir [file dirname [file normalize [info script]]]
create_project -force WashingMachineController [file join $repo_dir vivado_project] -part xc7a100tcsg324-1
add_files -fileset sources_1 [glob -directory [file join $repo_dir src] *.vhd]
set_property top main [get_filesets sources_1]
update_compile_order -fileset sources_1
add_files -fileset sim_1 [file join $repo_dir sim simulare.vhd]
set_property top masina_spalat_tb [get_filesets sim_1]
update_compile_order -fileset sim_1
puts "Project created. Add your board's .xdc constraints before implementation."
