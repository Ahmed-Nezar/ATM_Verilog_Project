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



    reg [15:0] pin_random [9:0];

    reg [15:0] pin_db [9:0];
    reg [31:0] balance_database [9:0];
    reg [10:0] acc_num_db [9:0];
    integer i;
    integer fd;

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
        
        fd = $fopen("./Database/pins.txt", "r");
        for (i = 0; i < 10 ; i = i +1 ) begin
            $fscanf(fd, "%d\n", pin_db[i]);
        end
        $fclose(fd);

        fd = $fopen("./Database/balance_DB.txt", "r");
        for (i = 0; i < 10 ; i = i +1 ) begin
            $fscanf(fd, "%d\n", balance_database[i]);
        end
        $fclose(fd);

        fd = $fopen("./Database/accounts.txt", "r");
        for (i = 0; i < 10 ; i = i +1 ) begin
            $fscanf(fd, "%d\n", acc_num_db[i]);
        end
        $fclose(fd);


        /***************************************************************************************************/
        rst = 0; operation = 0; acc_num = 0; pin = 0; amount = 0; language = 0; Newpin = 0;
        @(negedge clk);
        if (state != 7) begin
            $display("Test Failed");
        end


        // show balance for all accounts
        for (i = 0; i < 10 ; i = i +1 ) begin
            rst = 1; operation = 3; acc_num = acc_num_db[i]; pin = pin_db[i]; amount = 0; language = 0; Newpin = 0;
            repeat(4) @(negedge clk);
            if (balance != balance_database[i]) begin
                $display("Test Failed");
            end
        end
        /***************************************************************************************************/
        
        // Withdraw more than balance
            for (i = 0; i < 10 ; i = i +1 ) begin
                rst = 1; operation = 4; acc_num = acc_num_db[i]; pin = pin_db[i]; amount = balance_database[i] + 100; language = 0; Newpin = 0;
                repeat(4) @(negedge clk);
            end

        /***************************************************************************************************/
        // deposit 1000 for all accounts
        for (i = 0; i < 10 ; i = i +1 ) begin
            rst = 1; operation = 5; acc_num = acc_num_db[i]; pin = pin_db[i]; amount = 1000; language = 0; Newpin = 0;
            repeat(4) @(negedge clk);
            if (balance != balance_database[i] + 1000) begin
                $display("Test Failed");
            end
        end
        /***************************************************************************************************/

        // withdraw from all accounts
        for (i = 0; i < 10 ; i = i +1 ) begin
            rst = 1; operation = 4; acc_num = acc_num_db[i]; pin = pin_db[i]; amount = 500; language = 0; Newpin = 0;
            repeat(4) @(negedge clk);
            if (balance != balance_database[i] + 1000 - 500) begin
                $display("Test Failed");
            end
        end
        /***************************************************************************************************/

        // Accounts that doesn't exist
        for (i = 0; i < 5 ; i = i +1 ) begin
            rst = 1; operation = 3; acc_num = 11+i; pin = pin_db[9-i]; amount = 0; language = 0; Newpin = 0;
            repeat(4) @(negedge clk);
            if (success != 0) begin
                $display("Test Failed");
            end
        end
        /***************************************************************************************************/              
        
        // wrong pin
        for (i = 0; i < 10 ; i = i +1 ) begin
            rst = 1; operation = 3; acc_num = acc_num_db[i]; pin = pin_db[9-i]; amount = 0; language = 0; Newpin = 0;
            repeat(4) @(negedge clk);
            if (success != 0) begin
                $display("Test Failed");
            end
        end
        /***************************************************************************************************/
           // Change pin but having the same pin
        for ( i = 0; i < 10 ; i = i + 1 ) begin
            rst = 1; operation = 6; acc_num = acc_num_db[i]; pin = pin_db[i]; amount = 0; language = 0; Newpin = pin_db[i]; 
            repeat(4) @(negedge clk);
        end

        /***************************************************************************************************/
         
         // Changing pins for all accounts
        rst = 1; operation = 6; acc_num = 1; pin = 1234; amount = 0; language = 0; Newpin = 5678;
        repeat(4) @(negedge clk);

        rst = 1; operation = 6; acc_num = 2; pin = 2345; amount = 0; language = 0; Newpin = 6789;
        repeat(4) @(negedge clk);

        rst = 1; operation = 6; acc_num = 3; pin = 3456; amount = 0; language = 0; Newpin = 7890;
        repeat(4) @(negedge clk);

        rst = 1; operation = 6; acc_num = 4; pin = 4567; amount = 0; language = 0; Newpin = 8901;
        repeat(4) @(negedge clk);

        rst = 1; operation = 6; acc_num = 5; pin = 5678; amount = 0; language = 0; Newpin = 9012;
        repeat(4) @(negedge clk);

        rst = 1; operation = 6; acc_num = 6; pin = 6789; amount = 0; language = 0; Newpin = 7123;
        repeat(4) @(negedge clk);

        rst = 1; operation = 6; acc_num = 7; pin = 7890; amount = 0; language = 0; Newpin = 1234;
        repeat(4) @(negedge clk);

        rst = 1; operation = 6; acc_num = 8; pin = 8901; amount = 0; language = 0; Newpin = 2345;
        repeat(4) @(negedge clk);

        rst = 1; operation = 6; acc_num = 9; pin = 9012; amount = 0; language = 0; Newpin = 3456;
        repeat(4) @(negedge clk);

        rst = 1; operation = 6; acc_num = 10; pin = 7123; amount = 0; language = 0; Newpin = 4567;
        repeat(4) @(negedge clk);
        /***************************************************************************************************/

         // Testing counter
        rst = 1; operation = 7; acc_num = 1; pin = pin_db[0]; amount = 0; language = 0; Newpin = 0;
        repeat(6) @(negedge clk);
        
        /***************************************************************************************************/
         
        fd = $fopen("./Database/pins.txt", "r");
        for (i = 0; i < 10 ; i = i +1 ) begin
            $fscanf(fd, "%d\n", pin_random[i]);
        end
        $fclose(fd);
        // random testing
        for (i = 0 ; i < 10 ; i = i +1) begin
            rst = 1;
            operation = $urandom_range(3,6);
            acc_num = i+1;
            pin = pin_random[acc_num-1];
            amount = $urandom_range(0,10000);
            language = $urandom_range(0,1);
            Newpin = $urandom_range(1000,9999);
            repeat(4)@(negedge clk);
        end


        $stop;
    end

//      psl rst_assert: assert always((rst == 0) -> next (state == 7))  @(posedge clk);

    initial begin
        $monitor("operation=%d, acc_num=%d, pin=%d, amount=%d, language=%b, balance=%d, success=%b, state=%b", operation, acc_num, pin, amount, language, balance, success, state);
    end
    //urandom_range()
endmodule