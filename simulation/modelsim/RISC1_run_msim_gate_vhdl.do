transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {RISC1_6_1200mv_0c_slow.vho}

vcom -93 -work work {/home/virtualgod/Altera/RISC1/testbench_full.vhd}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /dut=RISC1_6_1200mv_0c_vhd_slow.sdo -L altera_mf -L altera -L lpm -L sgate -L cycloneiv_hssi -L cycloneiv_pcie_hip -L cycloneiv -L gate_work -L work -voptargs="+acc"  Testbench_full

add wave *
view structure
view signals
run -all
