`include "definitions.v"
module authenticator (acc_num, pin);

input [3:0] acc_num;
input [15:0] pin;
reg [10:0] acc_num_db [3:0];
reg [10:0] pin_db [15:0];

// intializing the account number and pin in decimal format as in reference model
initial begin
    acc_num_db[0] = 0; pin_db[0] = 1234;
    acc_num_db[1] = 1; pin_db[1] = 2345;
    acc_num_db[2] = 2; pin_db[2] = 3456;
    acc_num_db[3] = 3; pin_db[3] = 4567;
    acc_num_db[4] = 4; pin_db[4] = 5678;
    acc_num_db[5] = 5; pin_db[5] = 6789;
    acc_num_db[6] = 6; pin_db[6] = 7890;
    acc_num_db[7] = 7; pin_db[7] = 8901;
    acc_num_db[8] = 8; pin_db[8] = 9012;
    acc_num_db[9] = 9; pin_db[9] = 7123;
end





endmodule