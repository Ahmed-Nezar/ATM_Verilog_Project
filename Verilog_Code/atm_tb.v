`include "atm.v"

module atm_TB;

    reg clk;
    reg language;
    reg [2:0] operation;
    reg [3:0] acc_num;
    reg [15:0] pin;
    reg [15:0] amount;
    reg [15:0] Newpin;
    wire [15:0] balance;
    wire success;

    ATM atm_instance (  .clk(clk),
                        .operation(operation),
                        .acc_num(acc_num),
                        .pin(pin),            
                        .Newpin(Newpin),
                        .amount(amount),
                        .language(language),
                        .balance(balance),
                        .success(success)
    );
    
    initial begin
        forever begin
            #5 clk = ~clk;
        end 
    end

    initial begin
        // Test cases will be added here
    end


endmodule
