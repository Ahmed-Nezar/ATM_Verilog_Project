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
     $readmemb("./Database/balance_DB.txt" , balance_database);  
  end



Authenticator authenticator (acc_num, pin, acc_index, acc_found_stat, acc_auth_stat, newPin);
ATM_Functions functions ();

always @(posedge clk or negedge rst) begin
  if (!rst) begin
    current_state <= `IDLE;
  end
  else begin
    current_state <= next_state;
  end
end

always @(current_state or operation or acc_num or language or amount or newPin or pin ) begin
    
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
                success = 0;
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

//      psl show_balance: assert always((state == 2 && operation == 3) -> next(balance == balance_database[prev(acc_index)] ))  @(posedge clk);
//      psl deposit: assert always((state == 2 && operation ==5) -> next (balance == (prev(balance) + prev(amount))))  @(posedge clk);
//      psl withdraw: assert always((state == 2 && operation ==4) -> next (balance == (prev(balance) - prev(amount))))  @(posedge clk);
  
endmodule