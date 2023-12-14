`include "definitions.v"
module Authenticator (acc_num, pin, acc_index_out, acc_found_stat, acc_auth_stat ,newPin);
input [3:0] acc_num;
input [15:0] pin;
input [15:0] newPin;
output reg [3:0] acc_index_out;
output reg acc_found_stat;
output reg acc_auth_stat;
reg [10:0] acc_num_db [9:0];
reg [15:0] pin_db [9:0]; 
integer fd;
integer i;
// intializing the account number and pin in decimal format as in reference model
initial begin
    fd = $fopen("./Database/accounts.txt", "r");
    for (i = 0; i < 10 ; i = i +1 ) begin
        $fscanf(fd, "%d\n", acc_num_db[i]);
    end
    $fclose(fd);
    fd = $fopen("./Database/pins.txt", "r");
    for (i = 0; i < 10 ; i = i +1 ) begin
        $fscanf(fd, "%d\n", pin_db[i]);
    end
    $fclose(fd);
end

// find the account number in the database & adjusting mask
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
            
            if ((pin_db[acc_index] == pin )|| (pin_db[acc_index] == newPin)) begin  // If the PIN matches the one in the database, set the authentication status to authenticated
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
            fd = $fopen("./Database/pins.txt", "w"); 
            for (i = 0; i < 10 ; i = i +1 ) begin
                $fwrite(fd, "%d\n", pin_db[i]);
            end
            $fclose(fd);
            success = 1;
        end
    end
  endtask

endmodule