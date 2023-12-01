module ATM_Functions;


  // Task to perform the deposit operation
  task Deposit_Money;
    input [31:0] amount;
    input [31:0] currentBalance;
    output [31:0] newBalance;

    begin
      newBalance = currentBalance + amount;
      $display("Deposit successful! New balance: %d", newBalance);
    end
  endtask


  // Task to show balance info
  task showBalanceInfo;
    input reg [31:0] balance; 

    begin
      // Display the balance information
      $display("Account Balance: ", balance);
    end
    
  endtask

  // Task to perform the withdrawal operation
  task withdrawAndUpdate;
    input [15:0] amount;
    input [31:0] currentBalance;
    output [31:0] newBalance;
    output success;

    begin
      if (amount <= currentBalance) 
      begin
        newBalance = currentBalance - amount;
        success = 1;
        $display("Withdrawal successful! New balance: %d", newBalance);
      end 
      else 
      begin
        newBalance = currentBalance;
        success = 0;
          $display("Withdrawal Unsuccessful Insufficient Funds ! New balance: %d", newBalance);
      end
    end
  endtask

endmodule
