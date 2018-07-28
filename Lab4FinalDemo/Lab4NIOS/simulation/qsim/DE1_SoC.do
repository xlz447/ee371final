onerror {exit -code 1}
vlib work
vlog -work work DE1_SoC.vo
vlog -work work c.vwf.vt
vsim -novopt -c -t 1ps -L cyclonev_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.clkCounter2_vlg_vec_tst -voptargs="+acc"
vcd file -direction DE1_SoC.msim.vcd
vcd add -internal clkCounter2_vlg_vec_tst/*
vcd add -internal clkCounter2_vlg_vec_tst/i1/*
run -all
quit -f
