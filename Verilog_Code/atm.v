`include "definitions.v"
`include "authenticator.v"


module ATM (clk,operation,acc_num,pin,amount,balance,state);
input clk;
input [2:0] operation;
input [3:0] acc_num;
input [15:0] pin;
input [15:0] amount;
output [15:0] balance;
output [2:0] state;



  
endmodule