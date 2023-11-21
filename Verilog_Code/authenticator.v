`include "definitions.v"
module authenticator (acc_num, pin, acc_index_out, acc_found_stat);

input [3:0] acc_num;
input [15:0] pin;
output reg [3:0] acc_index_out;
output reg acc_found_stat;
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

// find the account number in the database & adjusting mask
integer i;
reg [3:0] acc_index;

always @(*) begin
    begin : find_account
        
        for (i = 0; i < 10 ; i = i +1 ) 
            begin
                if (acc_num_db[i] == acc_num) begin
                    acc_index = i;
                    acc_index_out = acc_index;
                    acc_found_stat = `ACCOUNT_FOUND;
                    disable find_account; // break the loop when finding the account
                end
                else begin
                    acc_found_stat = `ACCOUNT_NOT_FOUND;
                end
            end
    
    end 
end





endmodule