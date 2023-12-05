`include "definitions.v"
module Authenticator (acc_num, pin, acc_index_out, acc_found_stat, acc_auth_stat);
input [3:0] acc_num;
input [15:0] pin;
output reg [3:0] acc_index_out;
output reg acc_found_stat;
output reg acc_auth_stat;
reg [10:0] acc_num_db [3:0];
reg [15:0] pin_db [3:0]; 


// intializing the account number and pin in decimal format as in reference model
initial begin
    acc_num_db[0] = 1; pin_db[0] = 16'd1234;
    acc_num_db[1] = 2; pin_db[1] = 16'd2345;
    acc_num_db[2] = 3; pin_db[2] = 16'd3456;
    acc_num_db[3] = 4; pin_db[3] = 16'd4567;
    acc_num_db[4] = 5; pin_db[4] = 16'd5678;
    acc_num_db[5] = 6; pin_db[5] = 16'd6789;
    acc_num_db[6] = 7; pin_db[6] = 16'd7890;
    acc_num_db[7] = 8; pin_db[7] = 16'd8901;
    acc_num_db[8] = 9; pin_db[8] = 16'd9012;
    acc_num_db[9] = 10; pin_db[9] = 16'd7123;
end

// find the account number in the database & adjusting mask
integer i;
reg [3:0] acc_index;

always @(*) begin
    acc_auth_stat = `ACCOUNT_NOT_AUTHENTICATED;
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
    

    // Check the PIN for authentication
    begin : check_pin
        if (acc_found_stat == `ACCOUNT_FOUND) begin
            
            if (pin_db[acc_index] == pin) begin  // If the PIN matches the one in the database, set the authentication status to authenticated
                acc_auth_stat = `ACCOUNT_AUTHENTICATED;
                $display("Account Pin authenticated",pin_db[acc_index]);
            end
           
            else begin                          // If the PIN does not match, set the authentication status to not authenticated
                acc_auth_stat = `ACCOUNT_NOT_AUTHENTICATED;
                $display("Account Pin not authenticated",pin_db[acc_index]);
            end
        end
    end
end

  task changePinProcess;
    input [15:0] newPin;
    input [3:0] acc_index;
    output success;
    begin
        if (newPin == pin) begin
            $display("New PIN cannot be the same as the old PIN");
            success = 0;
        end
        else begin
            $display("PIN changed successfully");
            pin_db[acc_index] = newPin;
            success = 1;
        end
    end
  endtask

endmodule