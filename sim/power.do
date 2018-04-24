
vlib work
vlib grlib

vcom -quiet  -93  -work grlib  ../simlib/grlib/stdlib/version.vhd
vcom -quiet  -93  -work grlib  ../simlib/grlib/stdlib/stdlib.vhd
vcom -quiet  -93  -work grlib  ../simlib/grlib/stdlib/stdio.vhd
vcom -quiet  -93  -work work   ../simlib/micron/ddr_sdram/mti_pkg.vhd
vcom -quiet  -93  -work work   ../simlib/micron/ddr_sdram/mt46v16m16.vhd
vcom -quiet  -93  -work work   boot_ram_sim.vhd
vcom -quiet  -93  -work work   ../pdp_ISE/netgen/par/plasma_timesim.vhd
vcom -quiet  -93  -work work   ../rtl/ddr_ctrl.vhd
vcom -quiet  -93  -work work   ../rtl/ddr_init.vhd
vcom -quiet  -93  -work work   ../rtl/ddr_ctrl_top.vhd
vcom -quiet  -93  -work work   ../rtl/clk_gen.vhd
vcom -quiet  -93  -work work   ../rtl/plasma_top.vhd
vcom -quiet  -93  -work work   sim_tb_top.vhd

vsim  -t ps -novopt -L unisim -sdftyp sim_tb_top/u1_plasma_top/u1_plasma=../pdp_ISE/netgen/par/plasma_timesim.sdf work.sim_tb_top
onerror {resume}

vcd file ../pdp_ISE/power.vcd

vcd add -ports -internal sim_tb_top/u1_plasma_top/u1_plasma/*

run 2ms

quit -sim

