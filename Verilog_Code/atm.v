`include "definitions.v"
`include "authenticator.v"


module ATM (clk,rst,operation,acc_num,pin,newPin,amount,language,balance,success,state);
input clk;
input rst;
input [2:0] operation;
input [3:0] acc_num;
input [13:0] pin;
input [13:0] newPin;
input [13:0] amount;
input language;
output reg [13:0] balance;
output reg success;
output reg [2:0] state;

reg [2:0] next_state = `WAITING;
reg [2:0] current_state = `IDLE;
wire [3:0] acc_index;
wire acc_found_stat;
wire acc_auth_stat;
reg authenticatedFlag = `FALSE;
reg[31:0] fd;
reg[3:0] i;
reg[3:0] counter;

reg [31:0] balance_database [9:0];

  initial begin
    fd = $fopen("./Database/balance_DB.txt", "r");
    for (i = 0; i < 10 ; i = i +1 ) begin
        $fscanf(fd, "%d\n", balance_database[i]);
    end
    $fclose(fd);  
  end



Authenticator authenticator (acc_num, pin, acc_index, acc_found_stat, acc_auth_stat, newPin);
ATM_Functions functions ();
always @(negedge clk) begin
    $display("counter = %d",counter );
    counter = counter + 1;
    if (counter >= 4) begin
        next_state =  `WAITING;
        counter = 0;
    end
end

always @(posedge clk or negedge rst) begin
  if (!rst) begin
    current_state <= `IDLE;
  end
  else begin
    current_state <= next_state;
  end
end

always @(current_state or operation or acc_num or language or amount or newPin or pin ) begin
    
    counter = 0;    
    case (current_state)
        `WAITING: begin
        if (acc_found_stat == `TRUE) begin
            next_state = `AUTHENTICATION;
        end
        else begin
            next_state = `WAITING;
            success = 0;
        end
        end
        `AUTHENTICATION: begin
            if (acc_auth_stat == `ACCOUNT_NOT_AUTHENTICATED) begin
                next_state = `WAITING;
                success = 0;
            end
            else begin
                next_state = `MENU;
                authenticatedFlag = `TRUE;
                success = 0;
            end
        end
        `MENU: begin
            if (operation == `BALANCE) begin
                next_state = `BALANCE;
            end
            else if (operation == `WITHDRAW) begin
                next_state = `WITHDRAW;
            end
            else if (operation == `DEPOSIT) begin
                next_state = `DEPOSIT;
            end
            else if (operation == `CHANGE_PIN) begin
                next_state = `CHANGE_PIN;
            end
            else begin
                next_state = `MENU;
            end
        end
        `BALANCE: begin
            if (authenticatedFlag == `TRUE) begin
                functions.showBalanceInfo(balance_database[acc_index],success);
                authenticatedFlag = `FALSE;
            end            
            next_state = `WAITING;
        end
        `WITHDRAW: begin
            if (authenticatedFlag == `TRUE) begin
                functions.withdrawAndUpdate(amount,balance_database[acc_index],balance_database[acc_index],success);
                authenticatedFlag = `FALSE;
            end
            next_state = `WAITING;
        end
        `DEPOSIT: begin
            if (authenticatedFlag == `TRUE) begin
                functions.Deposit_Money(amount,balance_database[acc_index],balance_database[acc_index],success);
                authenticatedFlag = `FALSE;
            end
            next_state = `WAITING;
        end
        `CHANGE_PIN: begin
            if (authenticatedFlag == `TRUE) begin
                authenticator.changePinProcess(newPin,acc_index,success);
                authenticatedFlag = `FALSE;
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
    fd = $fopen("./Database/balance_DB.txt", "w");
    for (i = 0; i < 10 ; i = i +1 ) begin
        $fwrite(fd, "%d\n", balance_database[i]);
    end
    $fclose(fd);
    state = current_state;
end

//      psl show_balance: assert always((state == 2 && operation == 3) -> next(balance == balance_database[prev(acc_index)] ) abort !rst)  @(posedge clk);
//      psl deposit: assert always((state == 2 && operation ==5) -> next (balance == (prev(balance) + prev(amount))) abort !rst)  @(posedge clk);
//      psl withdraw: assert always((state == 2 && operation ==4 && (amount <= balance)) -> next (balance == (prev(balance) - prev(amount))) abort !rst)  @(posedge clk);
//      psl withdraw_NotSufficientFunds: assert always((state == 2 && operation ==6 && (amount>balance) ) -> next (balance == prev(balance)) abort !rst)  @(posedge clk);  

endmodule