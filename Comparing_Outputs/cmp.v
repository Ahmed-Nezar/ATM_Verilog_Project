module CMP;
reg language_inp [9:0];
    reg [2:0] operation_inp [9:0];
    reg [3:0] acc_num;
    reg [13:0] amount_inp [9:0];
    reg [13:0] Newpin_inp [9:0];
    wire [13:0] balance [9:0];
    reg [13:0] pin_inp [9:0];
    reg [13:0] balance_database [9:0];
    reg [10:0] acc_num_inp [9:0];
    integer fd;
    integer i;

    initial begin
        fd = $fopen("./Reference_Code/Python/inputs.csv", "r");
        for (i = 0; i < 10 ; i = i +1 ) begin
            $fscanf(fd, "%d,%f,%d,%d,%d,%d\n", acc_num_inp[i], amount_inp[i], operation_inp[i], pin_inp[i], Newpin_inp[i],language_inp[i]);
        end
        $fclose(fd);

        for (i = 0 ; i < 10 ; i = i+1 ) begin
            $display("acc_num_inp[%d] = %d", i, acc_num_inp[i]);
            $display("amount_inp[%d] = %d", i, amount_inp[i]);
            $display("operation_inp[%d] = %d", i, operation_inp[i]);
            $display("pin_inp[%d] = %d", i, pin_inp[i]);
            $display("Newpin_inp[%d] = %d", i, Newpin_inp[i]);
            $display("language_inp[%d] = %d", i, language_inp[i]);
            $display("=====================================");
        end
    end

    
endmodule