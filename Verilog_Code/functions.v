module ATM_Functions;
  
  // Define registers for storing balance and deposit amount
  reg [31:0] current_balance;
  reg [31:0] deposit_amount;

  // Deposit function
    function deposit;
        input [31:0] deposit_amt;  //amount to deposit
        begin
            int new_balance;
            new_balance = current_balance + deposit_amt;
            $display("Deposit successful! New balance: %d", new_balance);
            return new_balance; // Return the updated balance
        end
    endfunction

    // balance function
    function void showBalanceInfo(input [31:0] balance, input bit includeReceipt);
        // Assuming a 32-bit balance variable

        // display the balance information
        $display("Account Balance: $%0d.%02d", balance / 100, balance % 100);

        // Check if a receipt is requested
        if (includeReceipt) begin
            $display("Receipt: Thank you for using our ATM. Have a nice day!");
        end
    endfunction



endmodule