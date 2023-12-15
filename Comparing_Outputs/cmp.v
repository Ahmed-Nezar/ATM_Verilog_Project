module CMP;
reg language_inp [9:0];
    reg [2:0] operation_inp [9:0];
    reg [3:0] acc_num;
    reg [13:0] amount_inp [9:0];
    reg [13:0] Newpin_inp [9:0];
    wire [13:0] balance;
    reg [13:0] pin_inp [9:0];
    reg [13:0] balance_database [9:0];
    reg [10:0] acc_num_inp [9:0];
    reg [10:0] acc_num_op [9:0];
    reg [13:0] pin_op [9:0];
    reg [13:0] balance_op [9:0];
    integer fd;
    integer i;

    reg clk;
    reg rst;
    reg language;
    reg [2:0] operation;
    reg [13:0] pin;
    reg [13:0] amount;
    reg [13:0] Newpin;
    wire success;
    wire [2:0] state;

    reg [13:0] pin_db [9:0];
    reg [10:0] acc_num_db [9:0];

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
        fd = $fopen("./Reference_Code/Python/inputs.csv", "r");
        for (i = 0; i < 10 ; i = i +1 ) begin
            $fscanf(fd, "%d,%d,%d,%d,%d,%d\n", acc_num_inp[i], amount_inp[i], operation_inp[i], pin_inp[i], Newpin_inp[i],language_inp[i]);
        end
        $fclose(fd);

        fd = $fopen("./Reference_Code/Python/outputs.csv", "r");
        for (i = 0; i < 10 ; i = i +1 ) begin
            $fscanf(fd, "%d,%d,%d\n", acc_num_op[i], pin_op[i], balance_op[i]);
        end
        $fclose(fd);

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

    // take inputs from the input register & check the output
    for (i = 0 ; i < 10 ; i = i + 1 ) begin
        rst = 1; operation = operation_inp[i]; acc_num = acc_num_inp[i]; pin = pin_inp[i]; amount = amount_inp[i]; language = language_inp[i]; Newpin = Newpin_inp[i];
        repeat(4)@(negedge clk);

        if (balance_op[i] == balance) begin
            $display("Comparing Outputs of Balance for Test Case %d: PASSED", i+1);
        end
    end

    // Reading Pins after changing them
      fd = $fopen("./Database/pins.txt", "r");
        for (i = 0; i < 10 ; i = i +1 ) begin
            $fscanf(fd, "%d\n", pin_db[i]);
        end
        $fclose(fd);
    // Comparing the pins
    for (i = 0 ; i < 10 ; i = i + 1 ) begin
        if (pin_op[i] == pin_db[i]) begin
            $display("Comparing Pins for Test Case %d: PASSED", i+1);
        end
    end

    $stop;

    end

    
endmodule