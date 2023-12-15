var g_data = {"name":"./Verilog_Code/authenticator.v","src":"`include \"definitions.v\"\nmodule Authenticator (acc_num, pin, acc_index_out, acc_found_stat, acc_auth_stat ,newPin);\ninput [3:0] acc_num;\ninput [13:0] pin;\ninput [13:0] newPin;\noutput reg [3:0] acc_index_out;\noutput reg acc_found_stat;\noutput reg acc_auth_stat;\nreg [10:0] acc_num_db [9:0];\nreg [15:0] pin_db [9:0]; \nreg[31:0] fd;\nreg[3:0] i;\n// intializing the account number and pin in decimal format as in reference model\ninitial begin\n    fd = $fopen(\"./Database/accounts.txt\", \"r\");\n    for (i = 0; i < 10 ; i = i +1 ) begin\n        $fscanf(fd, \"%d\\n\", acc_num_db[i]);\n    end\n    $fclose(fd);\n    fd = $fopen(\"./Database/pins.txt\", \"r\");\n    for (i = 0; i < 10 ; i = i +1 ) begin\n        $fscanf(fd, \"%d\\n\", pin_db[i]);\n    end\n    $fclose(fd);\nend\n\n// find the account number in the database & adjusting mask\nreg [3:0] acc_index;\n\nalways @(*) begin\n    acc_auth_stat = `ACCOUNT_NOT_AUTHENTICATED;\n    begin : find_account\n        \n        for (i = 0; i < 10 ; i = i +1 ) \n            begin\n                if (acc_num_db[i] == acc_num) begin\n                    acc_index = i;\n                    acc_index_out = acc_index;\n                    acc_found_stat = `ACCOUNT_FOUND;\n                    disable find_account; // break the loop when finding the account\n                end\n                else begin\n                    acc_found_stat = `ACCOUNT_NOT_FOUND;\n                end\n            end\n    \n    end \n    \n\n    // Check the PIN for authentication\n    begin : check_pin\n        if (acc_found_stat == `ACCOUNT_FOUND) begin\n            \n            if ((pin_db[acc_index] == pin )|| (pin_db[acc_index] == newPin)) begin  // If the PIN matches the one in the database, set the authentication status to authenticated\n                acc_auth_stat = `ACCOUNT_AUTHENTICATED;\n                $display(\"Account Pin authenticated\",pin_db[acc_index]);\n            end\n           \n            else begin                          // If the PIN does not match, set the authentication status to not authenticated\n                acc_auth_stat = `ACCOUNT_NOT_AUTHENTICATED;\n                $display(\"Account Pin not authenticated\",pin_db[acc_index]);\n            end\n        end\n    end\nend\n\n  task changePinProcess;\n    input [15:0] newPin;\n    input [3:0] acc_index;\n    output success;\n    begin\n        if (newPin == pin) begin\n            $display(\"New PIN cannot be the same as the old PIN\");\n            success = 0;\n        end\n        else begin\n            $display(\"PIN changed successfully\");\n            pin_db[acc_index] = newPin;\n            fd = $fopen(\"./Database/pins.txt\", \"w\"); \n            for (i = 0; i < 10 ; i = i +1 ) begin\n                $fwrite(fd, \"%d\\n\", pin_db[i]);\n            end\n            $fclose(fd);\n            success = 1;\n        end\n    end\n  endtask\n\nendmodule","lang":"verilog"};
processSrcData(g_data);