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


endmodule