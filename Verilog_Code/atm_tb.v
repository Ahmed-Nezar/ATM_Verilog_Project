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
        rst = 1;
        operation = 3;
        acc_num = 1;
        pin = 1234;
        amount = 90;
        language = 0;
        Newpin = 0;
        @(negedge clk);
//      psl rst_assert: assert always((rst == 0) -> next[2] (state == 0))  @(posedge clk);

        $stop;
    end

    initial begin
        $monitor("clk=%b, rst=%b, operation=%d, acc_num=%d, pin=%d, amount=%d, language=%b, balance=%d, success=%b, state=%b", clk, rst, operation, acc_num, pin, amount, language, balance, success, state);
    end

endmodule
