vlib work
vlog authenticator.sv functions.sv definitions.sv atm.sv atm_tb.sv +cover 
vsim -voptargs=+acc work.atm_tb -cover
add wave *
coverage save atm_tb_db.ucdb -onexit -du atm
run -all