`include "definitions.sv"
`include "authenticator.sv"


module ATM (clk,rst,operation,acc_num,pin,newPin,amount,language,balance,success,state);
input clk;
input rst;
input [2:0] operation;
input [3:0] acc_num;
input [15:0] pin;
input [15:0] newPin;
input [31:0] amount;
input language;
output reg [31:0] balance;
output reg success;
output reg [2:0] state;

reg [2:0] next_state = `WAITING;
reg [2:0] current_state = `IDLE;
wire [3:0] acc_index;
wire acc_found_stat;
wire acc_auth_stat;
reg authenticatedFlag = 1;

reg [31:0] balance_database [9:0];

  initial begin
     balance_database[0] = 1000;
     balance_database[1] = 2000;
     balance_database[2] = 3000;
     balance_database[3] = 4000;
     balance_database[4] = 5000;
     balance_database[5] = 6000;
     balance_database[6] = 7000;
     balance_database[7] = 8000;
     balance_database[8] = 9000;
     balance_database[9] = 10000;   
  end



Authenticator authenticator (acc_num, pin, acc_index, acc_found_stat, acc_auth_stat);
ATM_Functions functions ();

always @(posedge clk or negedge rst) begin
  if (!rst) begin
    current_state <= `IDLE;
  end
  else begin
    current_state <= next_state;
  end
end

always @(current_state or operation or acc_num or language or amount or newPin or pin or acc_found_stat or acc_auth_stat) begin
    
    case (current_state)
        `WAITING: begin
        if (acc_found_stat == `TRUE) begin
            next_state = `AUTHENTICATION;
        end
        else begin
            next_state = `WAITING;
        end
        end
        `AUTHENTICATION: begin
            if (acc_auth_stat == `ACCOUNT_NOT_AUTHENTICATED) begin
                next_state = `WAITING;
            end
            else begin
                next_state = `MENU;
                authenticatedFlag = 0;
                success = 0;
            end
        end
        `MENU: begin
          
        case (operation)
            `BALANCE: begin
            next_state = `BALANCE;
            end
            `WITHDRAW: begin
            next_state = `WITHDRAW;
            end
            `DEPOSIT: begin
            next_state = `DEPOSIT;
            end
            `CHANGE_PIN: begin
            next_state = `CHANGE_PIN;
            end
            default: begin
            next_state = `MENU;
            end
        endcase
        end
        `BALANCE: begin
            if (authenticatedFlag == 0) begin
                functions.showBalanceInfo(balance_database[acc_index],success);
                authenticatedFlag = 1;
            end            
            next_state = `WAITING;
        end
        `WITHDRAW: begin
            if (authenticatedFlag == 0) begin
                functions.withdrawAndUpdate(amount,balance_database[acc_index],balance_database[acc_index],success);
                authenticatedFlag = 1;
            end
            next_state = `WAITING;
        end
        `DEPOSIT: begin
            if (authenticatedFlag == 0) begin
                functions.Deposit_Money(amount,balance_database[acc_index],balance_database[acc_index],success);
                authenticatedFlag = 1;
            end
            next_state = `WAITING;
        end
        `CHANGE_PIN: begin
            if (authenticatedFlag == 0) begin
                authenticator.changePinProcess(newPin,acc_index,success);
                authenticatedFlag = 1;
            end
            next_state = `WAITING;
        end
        `IDLE: begin
        end
        default: begin
            next_state = `WAITING;
        end
    endcase
    balance = balance_database[acc_index];
    state = current_state;
end

  
  
endmodule