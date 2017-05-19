vlog -work work StoreSize.vwf.vtvsim -novopt -c -t 1ps -L maxv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.StoreSize_vlg_vec_tst -voptargs="+acc"
add wave /*
run -all
