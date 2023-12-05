module atm_tb;

    reg clk;
    reg rst;
    reg language;
    reg [2:0] operation;
    reg [3:0] acc_num;
    reg [15:0] pin;
    reg [15:0] amount;
    reg [15:0] Newpin;
    wire [15:0] balance;
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


        rst = 1; operation = 3; acc_num = 1; pin = 1234; amount = 0; language = 0; Newpin = 0;
        @(negedge clk);


        operation = 5; amount = 1000;
        @(negedge clk);


        rst = 1; operation = 3; acc_num = 2; pin = 2345; amount = 0; language = 0; Newpin = 0;
        @(negedge clk);


        rst = 1; operation = 3; acc_num = 3; pin = 3456; amount = 0; language = 0; Newpin = 0;
        @(negedge clk);


        rst = 1; operation = 3; acc_num = 4; pin = 4567; amount = 0; language = 0; Newpin = 0;
        @(negedge clk);


        rst = 1; operation = 3; acc_num = 5; pin = 5678; amount = 0; language = 0; Newpin = 0;
        @(negedge clk);


        rst = 1; operation = 3; acc_num = 6; pin = 6789; amount = 0; language = 0; Newpin = 0;
        @(negedge clk);


        rst = 1; operation = 3; acc_num = 7; pin = 7890; amount = 0; language = 0; Newpin = 0;
        @(negedge clk);


        rst = 1; operation = 3; acc_num = 8; pin = 8901; amount = 0; language = 0; Newpin = 0;
        @(negedge clk);


        rst = 1; operation = 3; acc_num = 9; pin = 9012; amount = 0; language = 0; Newpin = 0;
        @(negedge clk);


        rst = 1; operation = 3; acc_num = 10; pin = 7123; amount = 0; language = 0; Newpin = 0;
        @(negedge clk);


        $stop;
    end

//      psl rst_assert: assert always((rst == 0) -> next (state == 0))  @(posedge clk);
//      psl show_balance_authenticated_1: assert always((operation == 3) -> next (state == 3) abort rst)  @(posedge clk);
//      psl deposit_1000: assert always((operation == 5) -> next (balance == 2000) abort rst)  @(posedge clk);
//      psl show_balance_authenticated_2: assert always((operation == 3) -> next (state == 3) abort rst)  @(posedge clk);
//      psl show_balance_authenticated_3: assert always((operation == 3) -> next (state == 3) abort rst)  @(posedge clk);
//      psl show_balance_authenticated_4: assert always((operation == 3) -> next (state == 3) abort rst)  @(posedge clk);
//      psl show_balance_authenticated_5: assert always((operation == 3) -> next (state == 3) abort rst)  @(posedge clk);
//      psl show_balance_authenticated_6: assert always((operation == 3) -> next (state == 3) abort rst)  @(posedge clk);
//      psl show_balance_authenticated_7: assert always((operation == 3) -> next (state == 3) abort rst)  @(posedge clk);
//      psl show_balance_authenticated_8: assert always((operation == 3) -> next (state == 3) abort rst)  @(posedge clk);
//      psl show_balance_authenticated_9: assert always((operation == 3) -> next (state == 3) abort rst)  @(posedge clk);
//      psl show_balance_authenticated_10: assert always((operation == 3) -> next (state == 3) abort rst)  @(posedge clk);


    initial begin
        $monitor("clk=%b, rst=%b, operation=%d, acc_num=%d, pin=%d, amount=%d, language=%b, balance=%d, success=%b, state=%b", clk, rst, operation, acc_num, pin, amount, language, balance, success, state);
    end

endmodule
