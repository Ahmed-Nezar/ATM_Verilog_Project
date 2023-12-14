vlib work
vlog ./Verilog_Code/atm.v ./Verilog_Code/atm_tb.v +cover 
vsim -voptargs=+acc work.atm_tb -cover
add wave *
coverage save atm_tb_db.ucdb -onexit -du ATM
run -all