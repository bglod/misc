#
# cb_example_hw.tcl
#
# For more information about the Qsys Tcl commands:
# https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/hb/qts/qts_qii5v1.pdf
#

#
# Request TCL package from ACDS 15.0
#
package require -exact qsys 15.0


#
# module cb_example_top
#
set_module_property DESCRIPTION "Callback Example"
set_module_property NAME cb_example
set_module_property VERSION 3.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "bglod"
set_module_property AUTHOR "bglod"
set_module_property DISPLAY_NAME "Callback Example"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


#
# file sets
#
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL cb_example_top
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS true
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file cb_example.qip OTHER PATH ../cb_example.qip


# SYSTEM_INFO Parameters
# Can get information from Qsys parent system

add_parameter DEVICE_FAMILY STRING ""
set_parameter_property DEVICE_FAMILY DISPLAY_NAME "Device Family"
set_parameter_property DEVICE_FAMILY SYSTEM_INFO DEVICE_FAMILY
set_parameter_property DEVICE_FAMILY AFFECTS_GENERATION false
set_parameter_property DEVICE_FAMILY HDL_PARAMETER true

add_parameter SYS_CLOCK_FREQ_HZ INTEGER 0
set_parameter_property SYS_CLOCK_FREQ_HZ DISPLAY_NAME "System Clock Frequency (Hz)"
set_parameter_property SYS_CLOCK_FREQ_HZ SYSTEM_INFO CLOCK_RATE
set_parameter_property SYS_CLOCK_FREQ_HZ SYSTEM_INFO_ARG sys_clock_sink
set_parameter_property SYS_CLOCK_FREQ_HZ AFFECTS_GENERATION false
set_parameter_property SYS_CLOCK_FREQ_HZ HDL_PARAMETER true


#
# parameters
#
add_parameter SPI_CLK_DIV POSITIVE 2
set_parameter_property SPI_CLK_DIV DEFAULT_VALUE 2
set_parameter_property SPI_CLK_DIV DISPLAY_NAME "SPI_CLK_DIV"
set_parameter_property SPI_CLK_DIV DESCRIPTION \
    "Amount to divide down the system clock to reach the desired SPI clock rate."
set_parameter_property SPI_CLK_DIV TYPE POSITIVE
set_parameter_property SPI_CLK_DIV UNITS None
set_parameter_property SPI_CLK_DIV HDL_PARAMETER true

add_parameter ENABLE_SPI BOOLEAN true
set_parameter_property ENABLE_SPI DISPLAY_NAME \
    "Enable SPI interface"
set_parameter_property ENABLE_SPI DESCRIPTION \
    "Enable SPI interface"
set_parameter_property ENABLE_SPI DEFAULT_VALUE true
set_parameter_property ENABLE_SPI AFFECTS_ELABORATION true
set_parameter_property ENABLE_SPI ENABLED true
set_parameter_property ENABLE_SPI HDL_PARAMETER false
set_parameter_property ENABLE_SPI VISIBLE true

add_parameter GPOUT0_DEFAULT STD_LOGIC_VECTOR 903
set_parameter_property GPOUT0_DEFAULT DEFAULT_VALUE 903
set_parameter_property GPOUT0_DEFAULT DISPLAY_NAME "GPOUT Port 0 Default"
set_parameter_property GPOUT0_DEFAULT DESCRIPTION \
    "Set the default value of the general-purpose output bus 0."
set_parameter_property GPOUT0_DEFAULT TYPE STD_LOGIC_VECTOR
set_parameter_property GPOUT0_DEFAULT UNITS None
set_parameter_property GPOUT0_DEFAULT ALLOWED_RANGES 0:65535
set_parameter_property GPOUT0_DEFAULT HDL_PARAMETER true

add_parameter GPOUT1_DEFAULT STD_LOGIC_VECTOR 903
set_parameter_property GPOUT1_DEFAULT DEFAULT_VALUE 903
set_parameter_property GPOUT1_DEFAULT DISPLAY_NAME "GPOUT Port 1 Default"
set_parameter_property GPOUT1_DEFAULT DESCRIPTION \
    "Set the default value of the general-purpose output bus 1."
set_parameter_property GPOUT1_DEFAULT TYPE STD_LOGIC_VECTOR
set_parameter_property GPOUT1_DEFAULT UNITS None
set_parameter_property GPOUT1_DEFAULT ALLOWED_RANGES 0:65535
set_parameter_property GPOUT1_DEFAULT HDL_PARAMETER true

add_parameter DIQ1_MODE_QSYS STRING "DISABLED"
set_parameter_property DIQ1_MODE_QSYS ALLOWED_RANGES { "DISABLED" "MODE 1" "MODE 2" }
set_parameter_property DIQ1_MODE_QSYS DEFAULT_VALUE "DISABLED"
set_parameter_property DIQ1_MODE_QSYS DISPLAY_NAME "DIQ Port 1 Mode"
set_parameter_property DIQ1_MODE_QSYS DESCRIPTION \
    "Sets the operating mode of the Digital IQ interface."
set_parameter_property DIQ1_MODE_QSYS TYPE STRING
set_parameter_property DIQ1_MODE_QSYS UNITS None
set_parameter_property DIQ1_MODE_QSYS HDL_PARAMETER false
set_parameter_property DIQ1_MODE_QSYS GROUP \
    "Sample Interfaces"

add_parameter DIQ1_MODE STD_LOGIC_VECTOR { 0x0 }
set_parameter_property DIQ1_MODE ALLOWED_RANGES { 0x0, 0x1, 0x2 }
set_parameter_property DIQ1_MODE DEFAULT_VALUE { 0x0 }
set_parameter_property DIQ1_MODE TYPE STD_LOGIC_VECTOR
set_parameter_property DIQ1_MODE WIDTH 2
set_parameter_property DIQ1_MODE UNITS None
set_parameter_property DIQ1_MODE HDL_PARAMETER true
set_parameter_property DIQ1_MODE DERIVED true
set_parameter_property DIQ1_MODE VISIBLE false

add_parameter DIQ1_DIR_QSYS STRING "RX ONLY"
set_parameter_property DIQ1_DIR_QSYS ALLOWED_RANGES { "RX ONLY" }; #"TX ONLY" "BIDIR" }
set_parameter_property DIQ1_DIR_QSYS DEFAULT_VALUE "RX ONLY"
set_parameter_property DIQ1_DIR_QSYS DISPLAY_NAME "DIQ Port 1 Direction"
set_parameter_property DIQ1_DIR_QSYS DESCRIPTION \
    "Set the direction of the Digital IQ interface."
set_parameter_property DIQ1_DIR_QSYS TYPE STRING
set_parameter_property DIQ1_DIR_QSYS UNITS None
set_parameter_property DIQ1_DIR_QSYS HDL_PARAMETER false
set_parameter_property DIQ1_DIR_QSYS GROUP \
    "Sample Interfaces"

add_parameter DIQ1_DIR STD_LOGIC_VECTOR { 0x0 }
set_parameter_property DIQ1_DIR ALLOWED_RANGES { 0x0, 0x1, 0x2 }
set_parameter_property DIQ1_DIR DEFAULT_VALUE { 0x0 }
set_parameter_property DIQ1_DIR TYPE STD_LOGIC_VECTOR
set_parameter_property DIQ1_DIR WIDTH 2
set_parameter_property DIQ1_DIR UNITS None
set_parameter_property DIQ1_DIR HDL_PARAMETER true
set_parameter_property DIQ1_DIR DERIVED true
set_parameter_property DIQ1_DIR VISIBLE false

add_parameter DIQ2_MODE_QSYS STRING "DISABLED"
set_parameter_property DIQ2_MODE_QSYS ALLOWED_RANGES { "DISABLED" "MODE 1" "MODE 2" }
set_parameter_property DIQ2_MODE_QSYS DEFAULT_VALUE "DISABLED"
set_parameter_property DIQ2_MODE_QSYS DISPLAY_NAME "DIQ Port 2 Mode"
set_parameter_property DIQ2_MODE_QSYS DESCRIPTION \
    "Sets the operating mode of the Digital IQ interface."
set_parameter_property DIQ2_MODE_QSYS TYPE STRING
set_parameter_property DIQ2_MODE_QSYS UNITS None
set_parameter_property DIQ2_MODE_QSYS HDL_PARAMETER false
set_parameter_property DIQ2_MODE_QSYS GROUP \
    "Sample Interfaces"

add_parameter DIQ2_MODE STD_LOGIC_VECTOR { 0x0 }
set_parameter_property DIQ2_MODE ALLOWED_RANGES { 0x0, 0x1, 0x2 }
set_parameter_property DIQ2_MODE DEFAULT_VALUE { 0x0 }
set_parameter_property DIQ2_MODE TYPE STD_LOGIC_VECTOR
set_parameter_property DIQ2_MODE WIDTH 2
set_parameter_property DIQ2_MODE UNITS None
set_parameter_property DIQ2_MODE HDL_PARAMETER true
set_parameter_property DIQ2_MODE DERIVED true
set_parameter_property DIQ2_MODE VISIBLE false

add_parameter DIQ2_DIR_QSYS STRING "RX ONLY"
set_parameter_property DIQ2_DIR_QSYS ALLOWED_RANGES { "RX ONLY" }; #"TX ONLY" "BIDIR" }
set_parameter_property DIQ2_DIR_QSYS DEFAULT_VALUE "RX ONLY"
set_parameter_property DIQ2_DIR_QSYS DISPLAY_NAME "DIQ Port 1 Direction"
set_parameter_property DIQ2_DIR_QSYS DESCRIPTION \
    "Set the direction of the Digital IQ port."
set_parameter_property DIQ2_DIR_QSYS TYPE STRING
set_parameter_property DIQ2_DIR_QSYS UNITS None
set_parameter_property DIQ2_DIR_QSYS HDL_PARAMETER false
set_parameter_property DIQ2_DIR_QSYS GROUP \
    "Sample Interfaces"

add_parameter DIQ2_DIR STD_LOGIC_VECTOR { 0x0 }
set_parameter_property DIQ2_DIR ALLOWED_RANGES { 0x0, 0x1, 0x2 }
set_parameter_property DIQ2_DIR DEFAULT_VALUE { 0x0 }
set_parameter_property DIQ2_DIR TYPE STD_LOGIC_VECTOR
set_parameter_property DIQ2_DIR WIDTH 2
set_parameter_property DIQ2_DIR UNITS None
set_parameter_property DIQ2_DIR HDL_PARAMETER true
set_parameter_property DIQ2_DIR DERIVED true
set_parameter_property DIQ2_DIR VISIBLE false


#
# display items
#


#
# connection point sys_clock_sink
#
add_interface sys_clock_sink clock end
set_interface_property sys_clock_sink clockRate 0
set_interface_property sys_clock_sink ENABLED true
set_interface_property sys_clock_sink EXPORT_OF ""
set_interface_property sys_clock_sink PORT_NAME_MAP ""
set_interface_property sys_clock_sink CMSIS_SVD_VARIABLES ""
set_interface_property sys_clock_sink SVD_ADDRESS_GROUP ""

add_interface_port sys_clock_sink clock clk Input 1


#
# connection point sys_reset_sink
#
add_interface sys_reset_sink reset end
set_interface_property sys_reset_sink associatedClock sys_clock_sink
set_interface_property sys_reset_sink synchronousEdges DEASSERT
set_interface_property sys_reset_sink ENABLED true
set_interface_property sys_reset_sink EXPORT_OF ""
set_interface_property sys_reset_sink PORT_NAME_MAP ""
set_interface_property sys_reset_sink CMSIS_SVD_VARIABLES ""
set_interface_property sys_reset_sink SVD_ADDRESS_GROUP ""

add_interface_port sys_reset_sink reset reset Input 1


#
# connection point avalon_slave_0
#
add_interface avalon_slave_0 avalon end
set_interface_property avalon_slave_0 addressUnits SYMBOLS
set_interface_property avalon_slave_0 associatedClock sys_clock_sink
set_interface_property avalon_slave_0 associatedReset sys_reset_sink
set_interface_property avalon_slave_0 bitsPerSymbol 8
set_interface_property avalon_slave_0 burstOnBurstBoundariesOnly false
set_interface_property avalon_slave_0 burstcountUnits SYMBOLS
set_interface_property avalon_slave_0 explicitAddressSpan 0
set_interface_property avalon_slave_0 holdTime 0
set_interface_property avalon_slave_0 linewrapBursts false
set_interface_property avalon_slave_0 maximumPendingReadTransactions 1
set_interface_property avalon_slave_0 maximumPendingWriteTransactions 1
set_interface_property avalon_slave_0 readLatency 0
set_interface_property avalon_slave_0 readWaitTime 1
set_interface_property avalon_slave_0 setupTime 0
set_interface_property avalon_slave_0 timingUnits Cycles
set_interface_property avalon_slave_0 writeWaitTime 0
set_interface_property avalon_slave_0 ENABLED true
set_interface_property avalon_slave_0 EXPORT_OF ""
set_interface_property avalon_slave_0 PORT_NAME_MAP ""
set_interface_property avalon_slave_0 CMSIS_SVD_VARIABLES ""
set_interface_property avalon_slave_0 SVD_ADDRESS_GROUP ""

add_interface_port avalon_slave_0 address address Input 16
add_interface_port avalon_slave_0 rd read Input 1
add_interface_port avalon_slave_0 readdata readdata Output 16
add_interface_port avalon_slave_0 readdatavalid readdatavalid Output 1
add_interface_port avalon_slave_0 response response Output 2
add_interface_port avalon_slave_0 wr write Input 1
add_interface_port avalon_slave_0 writedata writedata Input 16
add_interface_port avalon_slave_0 writeresponsevalid writeresponsevalid Output 1
add_interface_port avalon_slave_0 waitrequest waitrequest Output 1
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isFlash 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isPrintableDevice 0


#
# connection point SPI conduit
#
add_interface spi conduit end
set_interface_property spi associatedClock ""
set_interface_property spi associatedReset ""
set_interface_property spi ENABLED true
set_interface_property spi EXPORT_OF ""
set_interface_property spi PORT_NAME_MAP ""
set_interface_property spi CMSIS_SVD_VARIABLES ""
set_interface_property spi SVD_ADDRESS_GROUP ""

add_interface_port spi sclk sclk Output 1
add_interface_port spi sdo sdo Input 1
add_interface_port spi sen sen Output 1
add_interface_port spi sdio sdio Output 1


#
# connection point GPIO conduit
#
add_interface gpio conduit end
set_interface_property gpio associatedClock ""
set_interface_property gpio associatedReset ""
set_interface_property gpio ENABLED true
set_interface_property gpio EXPORT_OF ""
set_interface_property gpio PORT_NAME_MAP ""
set_interface_property gpio CMSIS_SVD_VARIABLES ""
set_interface_property gpio SVD_ADDRESS_GROUP ""

add_interface_port gpio gp_out0 gp_out0 Output 16
add_interface_port gpio gp_out1 gp_out1 Output 16
add_interface_port gpio gp_in0 gpin0 Input 16
add_interface_port gpio gp_in1 gpin1 Input 16


#
# connection point DIQ Interface 1
#
add_interface diq1 conduit end
set_interface_property diq1 associatedClock ""
set_interface_property diq1 associatedReset ""
set_interface_property diq1 ENABLED true
set_interface_property diq1 EXPORT_OF ""
set_interface_property diq1 PORT_NAME_MAP ""
set_interface_property diq1 CMSIS_SVD_VARIABLES ""
set_interface_property diq1 SVD_ADDRESS_GROUP ""

add_interface_port diq1 diq1_sig1              diq1_sig1              Input  1
add_interface_port diq1 diq1_sig2              diq1_sig2              Output 1
add_interface_port diq1 diq1_bus1              diq1_bus1              Input  12
add_interface_port diq1 diq1_bus2              diq1_bus2              Output 12

add_interface_port diq1 app1_sig1              app1_sig1              Input  1
add_interface_port diq1 app1_sig2              app1_sig2              Output 1
add_interface_port diq1 app1_bus1              app1_bus1              Input  12
add_interface_port diq1 app1_bus2              app1_bus2              Output 12


#
# connection point DIQ Interface 2
#
add_interface diq2 conduit end
set_interface_property diq2 associatedClock ""
set_interface_property diq2 associatedReset ""
set_interface_property diq2 ENABLED true
set_interface_property diq2 EXPORT_OF ""
set_interface_property diq2 PORT_NAME_MAP ""
set_interface_property diq2 CMSIS_SVD_VARIABLES ""
set_interface_property diq2 SVD_ADDRESS_GROUP ""

add_interface_port diq2 diq2_sig1              diq2_sig1              Input  1
add_interface_port diq2 diq2_sig2              diq2_sig2              Output 1
add_interface_port diq2 diq2_bus1              diq2_bus1              Input  12
add_interface_port diq2 diq2_bus2              diq2_bus2              Output 12

add_interface_port diq2 app2_sig1              app2_sig1              Input  1
add_interface_port diq2 app2_sig2              app2_sig2              Output 1
add_interface_port diq2 app2_bus1              app2_bus1              Input  12
add_interface_port diq2 app2_bus2              app2_bus2              Output 12


set_module_property ELABORATION_CALLBACK cb_example_elaborate

proc cb_example_elaborate {} {

    if { [get_parameter_value ENABLE_SPI] == false } {
        set_interface_property spi ENABLED false
    } else {
        set_interface_property spi ENABLED true
    }

    if { [get_parameter_value DIQ1_MODE_QSYS] == "DISABLED" } {

        # Set HDL parameter
        set_parameter_value DIQ1_MODE { 0x0 }

        # Remove interface from Qsys top-level
        set_interface_property diq1 ENABLED false

        # Terminate the ports...inputs can have termination values
        set_port_property diq1_sig1              termination       true
        set_port_property diq1_sig1              termination_value 1
        set_port_property diq1_sig2              termination       true
        set_port_property diq1_bus1              termination       true
        set_port_property diq1_bus1              termination_value 0
        set_port_property diq1_bus2              termination       true
        set_port_property app1_sig1              termination       true
        set_port_property app1_sig1              termination_value 1
        set_port_property app1_sig2              termination       true
        set_port_property app1_bus1              termination       true
        set_port_property app1_bus1              termination_value 0
        set_port_property app1_bus2              termination       true


    } elseif { [get_parameter_value DIQ1_MODE_QSYS] == "MODE 1" } {

        # Set HDL parameter
        set_parameter_value DIQ1_MODE { 0x1 }

    } elseif { [get_parameter_value DIQ1_MODE_QSYS] == "MODE 2" } {

        # Set HDL parameter
        set_parameter_value DIQ1_MODE { 0x2 }

    }


    if { [get_parameter_value DIQ2_MODE_QSYS] == "DISABLED" } {

        # Set HDL parameter
        set_parameter_value DIQ2_MODE { 0x0 }

        # Remove interface from Qsys top-level
        set_interface_property diq2 ENABLED false

        # Terminate the ports...inputs can have termination values
        set_port_property diq2_sig1              termination       true
        set_port_property diq2_sig1              termination_value 1
        set_port_property diq2_sig2              termination       true
        set_port_property diq2_bus1              termination       true
        set_port_property diq2_bus1              termination_value 0
        set_port_property diq2_bus2              termination       true
        set_port_property app2_sig1              termination       true
        set_port_property app2_sig1              termination_value 1
        set_port_property app2_sig2              termination       true
        set_port_property app2_bus1              termination       true
        set_port_property app2_bus1              termination_value 0
        set_port_property app2_bus2              termination       true

    } elseif { [get_parameter_value DIQ2_MODE_QSYS] == "MODE 1" } {

        # Set HDL parameter
        set_parameter_value DIQ2_MODE { 0x1 }

    } elseif { [get_parameter_value DIQ2_MODE_QSYS] == "MODE 2" } {

        # Set HDL parameter
        set_parameter_value DIQ2_MODE { 0x2 }

    }

}
