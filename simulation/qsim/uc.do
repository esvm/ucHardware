onerror {exit -code 1}
vlib work
vlog -work work uc.vo
vlog -work work StoreSize.vwf.vt
vsim -novopt -c -t 1ps -L maxv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.StoreSize_vlg_vec_tst -voptargs="+acc"
vcd file -direction uc.msim.vcd
vcd add -internal StoreSize_vlg_vec_tst/*
vcd add -internal StoreSize_vlg_vec_tst/i1/*
run -all
quit -f
