module ATM_Functions;

  // Define registers for storing balance and deposit amount
  reg [31:0] current_balance;

  // Deposit function
  function reg[31:0] deposit;
    input reg [31:0] deposit_amt;  // Amount to deposit
    reg [31:0] new_balance;
    begin
      deposit = current_balance + deposit_amt; // Return the updated balance
      $display("Deposit successful! New balance: %d", deposit);
    end
  endfunction


  // Task to show balance info
   task showBalanceInfo;
    input reg [31:0] balance;
    input reg includeReceipt; // Changed 'bit' to 'reg' for consistency

    begin
      // Display the balance information
      $display("Account Balance: $%0d.%02d", balance / 100, balance % 100);
      
      // Check if a receipt is requested
      if (includeReceipt) begin
        $display("Receipt: Thank you for using our ATM. Have a nice day!");
      end
    end
  endtask

endmodule
