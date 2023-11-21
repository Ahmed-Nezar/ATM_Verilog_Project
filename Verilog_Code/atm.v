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


reg [15:0] balance_database [0:9];
  initial begin
    $display("Welcome to the ATM");
     balance_database[0] = 16'd500;
     balance_database[1] = 16'd500;
     balance_database[2] = 16'd500;
     balance_database[3] = 16'd500;
     balance_database[4] = 16'd500;
     balance_database[5] = 16'd500;
     balance_database[6] = 16'd500;
     balance_database[7] = 16'd500;
     balance_database[8] = 16'd500;
     balance_database[9] = 16'd500;

  end
  
endmodule