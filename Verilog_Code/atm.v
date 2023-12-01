`include "definitions.v"
`include "authenticator.v"


module ATM (clk,rst,operation,acc_num,pin,newPin,amount,language,balance,current_state);
input clk;
input rst;
input [2:0] operation;
input [3:0] acc_num;
input [15:0] pin;
input [15:0] newPin;
input [15:0] amount;
input language;
output [15:0] balance;
output reg [2:0] current_state;


reg [15:0] balance_database [0:9];

  initial begin
    if (language == `ENGLISH) begin
      $display("Welcome to the ATM");
    end
    else begin
      $display("أهلاً بك في الصراف الآلي");
    end
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
    current_state = `WAITING;
    
  end

reg [3:0] acc_index;
reg acc_found_stat;
reg acc_auth_stat;

Authenticator authenticator (acc_num, pin, acc_index, acc_found_stat, acc_auth_stat);
ATM_Functions functions ();



always @(operation or acc_auth_stat) begin
    if (acc_auth_stat == `ACCOUNT_AUTHENTICATED) begin
      current_state = `MENU;
    end
    else begin
      current_state = `WAITING;
    end

    if (current_state == `MENU) begin
      if(language == `ENGLISH) begin
          $display("Please select an operation");
          $display("1. Balance");
          $display("2. Withdraw");
          $display("3. Deposit");
          $display("4. Change PIN");
          $display("5. Exit");
        end
        else begin
          $display("الرجاء اختيار العملية");
          $display("1. الرصيد");
          $display("2. سحب");
          $display("3. إيداع");
          $display("4. تغيير الرقم السري");
          $display("5. الخروج");
        end
      case (operation)
        `BALANCE: current_state = `BALANCE;
        `WITHDRAW: current_state = `WITHDRAW;
        `DEPOSIT: current_state = `DEPOSIT;
        `CHANGE_PIN: current_state = `CHANGE_PIN;
        default: current_state = `WAITING;
      endcase
    end

    case (current_state)
      `WAITING: begin
        if(language == `ENGLISH) begin
          $display("Waiting for the card to be inserted");
        end
        else begin
          $display("انتظر حتى يتم إدخال البطاقة");
        end
      end
      `BALANCE: showBalanceInfo(balance_database[acc_index], `TRUE);
      `WITHDRAW: withdrawAndUpdate(amount, balance_database[acc_index], balance_database[acc_index]);
      `DEPOSIT: depositAndUpdate(amount, balance_database[acc_index], balance_database[acc_index]);
      `CHANGE_PIN: changePinProcess(newPin, acc_index);
      default: $display("Invalid state");
    endcase
end
  
  
endmodule