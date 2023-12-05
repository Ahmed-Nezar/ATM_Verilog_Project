module atm_tb;

    reg clk;
    reg rst;
    reg language;
    reg [2:0] operation;
    reg [3:0] acc_num;
    reg [15:0] pin;
    reg [31:0] amount;
    reg [15:0] Newpin;
    wire [31:0] balance;
    wire success;
    wire [2:0] state;

    ATM atm_instance (  .clk(clk),
                        .rst(rst),
                        .operation(operation),
                        .acc_num(acc_num),
                        .pin(pin),            
                        .newPin(Newpin),
                        .amount(amount),
                        .language(language),
                        .balance(balance),
                        .success(success),
                        .state(state)
    );
    
    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end 
    end

    initial begin
        rst = 0; operation = 0; acc_num = 0; pin = 0; amount = 0; language = 0; Newpin = 0;
        @(negedge clk);

        // show balance for all accounts
        rst = 1; operation = 3; acc_num = 1; pin = 1234; amount = 0; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 3; acc_num = 2; pin = 2345; amount = 0; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 3; acc_num = 3; pin = 3456; amount = 0; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 3; acc_num = 4; pin = 4567; amount = 0; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 3; acc_num = 5; pin = 5678; amount = 0; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 3; acc_num = 6; pin = 6789; amount = 0; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 3; acc_num = 7; pin = 7890; amount = 0; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 3; acc_num = 8; pin = 8901; amount = 0; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 3; acc_num = 9; pin = 9012; amount = 0; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 3; acc_num = 10; pin = 7123; amount = 0; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);
        /***************************************************************************************************/
        
        // deposit 1000 for all accounts
        rst = 1; operation = 5; acc_num = 1; pin = 1234; amount = 1000; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 5; acc_num = 2; pin = 2345; amount = 1000; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 5; acc_num = 3; pin = 3456; amount = 1000; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 5; acc_num = 4; pin = 4567; amount = 1000; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 5; acc_num = 5; pin = 5678; amount = 1000; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 5; acc_num = 6; pin = 6789; amount = 1000; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 5; acc_num = 7; pin = 7890; amount = 1000; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 5; acc_num = 8; pin = 8901; amount = 1000; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 5; acc_num = 9; pin = 9012; amount = 1000; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 5; acc_num = 10; pin = 7123; amount = 1000; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);
        /***************************************************************************************************/

        // withdraw from all accounts
        rst = 1; operation = 4; acc_num = 1; pin = 1234; amount = 500; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 4; acc_num = 2; pin = 2345; amount = 500; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 4; acc_num = 3; pin = 3456; amount = 500; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 4; acc_num = 4; pin = 4567; amount = 500; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 4; acc_num = 5; pin = 5678; amount = 500; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 4; acc_num = 6; pin = 6789; amount = 500; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 4; acc_num = 7; pin = 7890; amount = 500; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 4; acc_num = 8; pin = 8901; amount = 500; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 4; acc_num = 9; pin = 9012; amount = 500; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 4; acc_num = 10; pin = 7123; amount = 500; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);
        /***************************************************************************************************/

        rst = 1; operation = 3; acc_num = 1; pin = 1234; amount = 0; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);

        rst = 1; operation = 3; acc_num = 2; pin = 2345; amount = 0; language = 0; Newpin = 0;
        repeat(4) @(negedge clk);


        $stop;
    end

//      psl rst_assert: assert always((rst == 0) -> next (state == 7))  @(posedge clk);
//      psl show_balance_authenticated: assert always((operation == 3) -> next[4] (balance != 32'bx) abort rst)  @(posedge clk);
//      psl deposit: assert always((operation == 5) -> next[4] (balance == (prev(balance) + amount)) abort rst)  @(posedge clk);


    initial begin
        $monitor("operation=%d, acc_num=%d, pin=%d, amount=%d, language=%b, balance=%d, success=%b, state=%b", operation, acc_num, pin, amount, language, balance, success, state);
    end

endmodule
