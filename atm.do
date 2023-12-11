vlib work
vlog System_Verilog_Code/authenticator.sv System_Verilog_Code/functions.sv System_Verilog_Code/definitions.sv System_Verilog_Code/atm.sv System_Verilog_Code/atm_tb.sv +cover 
vsim -voptargs=+acc work.atm_tb -cover
add wave *
coverage save atm_tb_db.ucdb -onexit -du atm
run -all