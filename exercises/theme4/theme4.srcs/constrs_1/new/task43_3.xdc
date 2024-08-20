set_property -dict {PACKAGE_PIN K17 IOSTANDARD LVCMOS33} [get_ports {clk}];
create_clock -add -name sys_clk_pin -period 8.000 -waveform {0 4} [get_ports {clk}];

set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports {ld[0]}];
set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33} [get_ports {ld[1]}];
set_property -dict {PACKAGE_PIN G14 IOSTANDARD LVCMOS33} [get_ports {ld[2]}];
set_property -dict {PACKAGE_PIN D18 IOSTANDARD LVCMOS33} [get_ports {ld[3]}];

set_property -dict {PACKAGE_PIN G15 IOSTANDARD LVCMOS33} [get_ports {sw[0]}];
set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports {sw[1]}];
set_property -dict {PACKAGE_PIN W13 IOSTANDARD LVCMOS33 } [get_ports {sw[2]}]; 
set_property -dict {PACKAGE_PIN T16 IOSTANDARD LVCMOS33 } [get_ports {sw[3]}]; 

set_property -dict {PACKAGE_PIN K18 IOSTANDARD LVCMOS33} [get_ports {push}]; # BTN0
set_property -dict {PACKAGE_PIN P16 IOSTANDARD LVCMOS33} [get_ports {pop}]; # BTN1
set_property -dict {PACKAGE_PIN K19 IOSTANDARD LVCMOS33} [get_ports {add}]; # BTN2
# set_property -dict {PACKAGE_PIN Y16 IOSTANDARD LVCMOS33} [get_ports {push_result}]; # BTN3

## RGB LED 5
set_property -dict {PACKAGE_PIN Y12 IOSTANDARD LVCMOS33} [get_ports {ld_empty}]; # T5 green #Y12: blue
# set_property -dict {PACKAGE_PIN Y12 IOSTANDARD LVCMOS33} [get_ports {ld_ready}]; # T5 green #Y12: blue
# set_property -dict {PACKAGE_PIN T5 IOSTANDARD LVCMOS33} [get_ports {ld_op}];
set_property -dict {PACKAGE_PIN Y11 IOSTANDARD LVCMOS33} [get_ports {ld_full}];

##RGB LED 6
# set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { ld_overflow }]; # IO_L18P_T2_34 Sch=led6_r
# set_property -dict { PACKAGE_PIN F17   IOSTANDARD LVCMOS33 } [get_ports { led6_g }]; # IO_L6N_T0_VREF_35 Sch=led6_g
# set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { led6_b }]; # IO_L8P_T1_AD10P_35 Sch=led6_b
