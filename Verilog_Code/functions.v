module ATM_Functions;

  // Define registers for storing balance and deposit amount
  reg [31:0] current_balance;

   // Task to perform the deposit operation
  task deposit_money;
    input [31:0] deposit_amt;  // Input to the task: deposit amount
    output [31:0] new_balance; // Output from the task: updated balance
    
    begin
      // Simulate deposit operation by adding deposit_amount to current_balance
      new_balance = current_balance + deposit_amt;
      $display("Deposit successful! New balance: %d", new_balance);
    end
  endtask


  // Task to show balance info
  task showBalanceInfo;
    input reg [31:0] balance;
    input reg includeReceipt; 

    begin
      // Display the balance information
      $display("Account Balance: $%0d.%02d", balance / 100, balance % 100);
      
      // Check if a receipt is requested
      if (includeReceipt)
       begin
        $display("Receipt: Thank you for using our ATM. Have a nice day!");
      end
    end
  endtask

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

  task changePinProcess;
      input [3:0] keypadInput;
      input enterKey;
      begin
          case (state)
              ENTER_OLD_PIN: begin
                  if (enterKey) begin
                      if (keypadInput == currentPin)
                          nextState = ENTER_NEW_PIN;
                      else 
                          nextState = ENTER_OLD_PIN; 
                  end
              end
              ENTER_NEW_PIN: begin
                  if (enterKey) begin
                      newPin = keypadInput;
                      nextState = CONFIRM_NEW_PIN;
                  end
              end
              CONFIRM_NEW_PIN: begin
                  if (enterKey) begin
                      if (keypadInput == newPin) begin
                          currentPin = newPin; 
                          success = 1;
                          nextState = DONE;
                      end else 
                          nextState = ENTER_OLD_PIN; 
                  end
              end
          endcase
      end
  endtask


  task selectLanguage;
      input [1:0] languageSelect;
      begin
          case (languageSelect)
              2'b00: currentLanguage <= ENGLISH;
              2'b01: currentLanguage <= ARABIC;
          endcase
      end
  endtask

endmodule
