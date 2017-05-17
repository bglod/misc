################################################################################
# Tcl script to generate a QSys project (.qsys).
#
# To execute this script:
#   qsys-script --cmd="set device <device>; ..." \
#               --script="/path/to/this.tcl"
#
################################################################################

if { [info exists device] == 0 } {
    #error "Device variable not set."
    set device "5CEBA2F17A7"; # just some example, don't need to error out
}

if { [info exists qsys_name] == 0 } {
    set qsys_name "cb_example_system"
}

#package require -exact qsys 16.0
set qsys_ver     [package require qsys]

create_system ${qsys_name}

set_project_property DEVICE ${device}
set_module_property  NAME   ${qsys_name}


################################################################################
# Define component instances and parameters
################################################################################

add_instance cb_example_0 cb_example 3.0
set_instance_parameter_value cb_example_0 {SPI_CLK_DIV} {2}
set_instance_parameter_value cb_example_0 {ENABLE_SPI} {1}
set_instance_parameter_value cb_example_0 {GPOUT0_DEFAULT} {903}
set_instance_parameter_value cb_example_0 {GPOUT1_DEFAULT} {903}
set_instance_parameter_value cb_example_0 {DIQ1_MODE_QSYS} {MODE 1}
set_instance_parameter_value cb_example_0 {DIQ1_DIR_QSYS} {RX ONLY}
set_instance_parameter_value cb_example_0 {DIQ2_MODE_QSYS} {DISABLED}
set_instance_parameter_value cb_example_0 {DIQ2_DIR_QSYS} {RX ONLY}

add_instance clk_0 clock_source ${qsys_ver}
set_instance_parameter_value clk_0 {clockFrequency} {50000000.0}
set_instance_parameter_value clk_0 {clockFrequencyKnown} {1}
set_instance_parameter_value clk_0 {resetSynchronousEdges} {NONE}


################################################################################
# Exported Interfaces
################################################################################

add_interface cb_example_0_avalon_slave_0 avalon slave
set_interface_property cb_example_0_avalon_slave_0 EXPORT_OF cb_example_0.avalon_slave_0
add_interface cb_example_0_diq1 conduit end
set_interface_property cb_example_0_diq1 EXPORT_OF cb_example_0.diq1
add_interface cb_example_0_gpio conduit end
set_interface_property cb_example_0_gpio EXPORT_OF cb_example_0.gpio
add_interface cb_example_0_spi conduit end
set_interface_property cb_example_0_spi EXPORT_OF cb_example_0.spi
add_interface clk clock sink
set_interface_property clk EXPORT_OF clk_0.clk_in
add_interface reset reset sink
set_interface_property reset EXPORT_OF clk_0.clk_in_reset


################################################################################
# Define component interconnects
################################################################################

add_connection clk_0.clk cb_example_0.sys_clock_sink

add_connection clk_0.clk_reset cb_example_0.sys_reset_sink

################################################################################
# Interconnect Requirements
################################################################################

set_interconnect_requirement {$system} {qsys_mm.clockCrossingAdapter} {HANDSHAKE}
set_interconnect_requirement {$system} {qsys_mm.maxAdditionalLatency} {1}
set_interconnect_requirement {$system} {qsys_mm.enableEccProtection} {FALSE}
set_interconnect_requirement {$system} {qsys_mm.insertDefaultSlave} {FALSE}

save_system ${qsys_name}.qsys
