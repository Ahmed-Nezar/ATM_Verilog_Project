`include "definitions.v"
`include "authenticator.v"


module ATM (clk,rst,operation,acc_num,pin,newPin,amount,language,balance,success);
input clk;
input rst;
input [2:0] operation;
input [3:0] acc_num;
input [15:0] pin;
input [15:0] newPin;
input [31:0] amount;
input language;
output [31:0] balance;
output success;

reg [2:0] next_state;
reg [2:0] current_state;
reg [3:0] acc_index;
reg acc_found_stat;
reg acc_auth_stat;
reg Withdrawal_success;

reg [31:0] balance_database [0:9];

  initial begin
    if (language == `ENGLISH) begin
      $display("Welcome to the ATM");
    end
    else begin
      $display("أهلاً بك في الصراف الآلي");
    end
     balance_database[0] = 32'd500;
     balance_database[1] = 32'd500;
     balance_database[2] = 32'd500;
     balance_database[3] = 32'd500;
     balance_database[4] = 32'd500;
     balance_database[5] = 32'd500;
     balance_database[6] = 32'd500;
     balance_database[7] = 32'd500;
     balance_database[8] = 32'd500;
     balance_database[9] = 32'd500;    
  end



Authenticator authenticator (acc_num, pin, acc_index, acc_found_stat, acc_auth_stat);
ATM_Functions functions ();

always @(posedge clk or negedge rst) begin
  if (!rst) begin
    current_state <= `WAITING;
  end
  else begin
    current_state <= next_state;
  end
end

always @(*) begin
    case (current_state)
        `WAITING: begin
        if (acc_found_stat == `TRUE) begin
            next_state <= `AUTHENTICATION;
        end
        else begin
            next_state <= `WAITING;
        end
        end
        `AUTHENTICATION: begin
            if (acc_auth_stat == `ACCOUNT_NOT_AUTHENTICATED) begin
                next_state <= `WAITING;
            end
            else begin
                next_state <= `MENU;
            end
        end
        `MENU: begin
            if (language == `ENGLISH) begin
                $display("Please select an operation: ");
                $display("1. Balance");
                $display("2. Withdraw");
                $display("3. Deposit");
                $display("4. Change PIN");
                $display("5. Exit");
            end
            else begin
                $display("الرجاء اختيار العملية: ");
                $display("1. الرصيد");
                $display("2. سحب");
                $display("3. إيداع");
                $display("4. تغيير الرقم السري");
                $display("5. الخروج");
            end
        case (operation)
            `BALANCE: begin
            next_state <= `BALANCE;
            end
            `WITHDRAW: begin
            next_state <= `WITHDRAW;
            end
            `DEPOSIT: begin
            next_state <= `DEPOSIT;
            end
            `CHANGE_PIN: begin
            next_state <= `CHANGE_PIN;
            end
            default: begin
            next_state <= `MENU;
            end
        endcase
        end
        `BALANCE: begin
            show_balance(balance_database[acc_index]);
            next_state <= `WAITING;
        end
        `WITHDRAW: begin
            withdrawAndUpdate(amount, balance_database[acc_index], balance, Withdrawal_success);
            next_state <= `WAITING;
        end
        `DEPOSIT: begin
            Deposit_Money(amount,balance_database[acc_index],balance_database[acc_index]);
            next_state <= `WAITING;
        end
        `CHANGE_PIN: begin
            changePinProcess(newPin,acc_index);
            next_state <= `WAITING;
        end
        default: begin
            next_state <= `WAITING;
        end
    endcase
end
  
  
endmodule