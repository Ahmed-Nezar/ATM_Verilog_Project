var g_data = {"4":{"pr":"/\\atm_tb#atm_instance ","t":"inst","br":[{"bs":[{"s":"    if (counter >= 4) begin\r","f":1,"i":1,"l":45,"h":6},{"s":"All False","f":1,"i":1,"l":45,"h":342}],"br":{"s":"    if (counter >= 4) begin\r","f":1,"l":45,"i":1,"p":100.00}},{"bs":[{"s":"  if (!rst) begin\r","f":1,"i":1,"l":52,"h":2},{"s":"  else begin\r","f":1,"i":1,"l":55,"h":324}],"br":{"s":"  if (!rst) begin\r","f":1,"l":52,"i":1,"p":100.00}},{"bs":[{"s":"        `WAITING: begin\r","f":1,"i":1,"l":64,"h":137},{"s":"        `AUTHENTICATION: begin\r","f":1,"i":1,"l":73,"h":91},{"s":"        `MENU: begin\r","f":1,"i":1,"l":84,"h":70},{"s":"        `BALANCE: begin\r","f":1,"i":1,"l":104,"h":23},{"s":"        `WITHDRAW: begin\r","f":1,"i":1,"l":111,"h":42},{"s":"        `DEPOSIT: begin\r","f":1,"i":1,"l":118,"h":23},{"s":"        `CHANGE_PIN: begin\r","f":1,"i":1,"l":125,"h":22},{"s":"        `IDLE: begin\r","f":1,"i":1,"l":132,"h":2},{"s":"        default: begin\r","f":1,"i":1,"l":134,"h":0}],"br":{"s":"    case (current_state)\r","f":1,"l":63,"i":1,"p":88.88}},{"bs":[{"s":"        if (acc_found_stat == `TRUE) begin\r","f":1,"i":1,"l":65,"h":131},{"s":"        else begin\r","f":1,"i":1,"l":68,"h":6}],"br":{"s":"        if (acc_found_stat == `TRUE) begin\r","f":1,"l":65,"i":1,"p":100.00}},{"bs":[{"s":"            if (acc_auth_stat == `ACCOUNT_NOT_AUTHENTICATED) begin\r","f":1,"i":1,"l":74,"h":21},{"s":"            else begin\r","f":1,"i":1,"l":78,"h":70}],"br":{"s":"            if (acc_auth_stat == `ACCOUNT_NOT_AUTHENTICATED) begin\r","f":1,"l":74,"i":1,"p":100.00}},{"bs":[{"s":"            `BALANCE: begin\r","f":1,"i":1,"l":87,"h":13},{"s":"            `WITHDRAW: begin\r","f":1,"i":1,"l":90,"h":22},{"s":"            `DEPOSIT: begin\r","f":1,"i":1,"l":93,"h":13},{"s":"            `CHANGE_PIN: begin\r","f":1,"i":1,"l":96,"h":22},{"s":"            default: begin\r","f":1,"i":1,"l":99,"h":0}],"br":{"s":"        case (operation)\r","f":1,"l":86,"i":1,"p":80.00}},{"bs":[{"s":"            if (authenticatedFlag == 0) begin\r","f":1,"i":1,"l":105,"h":13},{"s":"All False","f":1,"i":1,"l":105,"h":10}],"br":{"s":"            if (authenticatedFlag == 0) begin\r","f":1,"l":105,"i":1,"p":100.00}},{"bs":[{"s":"            if (authenticatedFlag == 0) begin\r","f":1,"i":1,"l":112,"h":22},{"s":"All False","f":1,"i":1,"l":112,"h":20}],"br":{"s":"            if (authenticatedFlag == 0) begin\r","f":1,"l":112,"i":1,"p":100.00}},{"bs":[{"s":"            if (authenticatedFlag == 0) begin\r","f":1,"i":1,"l":119,"h":13},{"s":"All False","f":1,"i":1,"l":119,"h":10}],"br":{"s":"            if (authenticatedFlag == 0) begin\r","f":1,"l":119,"i":1,"p":100.00}},{"bs":[{"s":"            if (authenticatedFlag == 0) begin\r","f":1,"i":1,"l":126,"h":22},{"s":"All False","f":1,"i":1,"l":126,"h":0}],"br":{"s":"            if (authenticatedFlag == 0) begin\r","f":1,"l":126,"i":1,"p":50.00}}]},"5":{"pr":"/\\atm_tb#atm_instance /authenticator","t":"inst","br":[{"bs":[{"s":"                if (acc_num_db[i] == acc_num) begin\r","f":2,"i":1,"l":36,"h":93},{"s":"                else begin\r","f":2,"i":1,"l":42,"h":472}],"br":{"s":"                if (acc_num_db[i] == acc_num) begin\r","f":2,"l":36,"i":1,"p":100.00}},{"bs":[{"s":"        if (acc_found_stat == `ACCOUNT_FOUND) begin\r","f":2,"i":1,"l":52,"h":93},{"s":"All False","f":2,"i":1,"l":52,"h":6}],"br":{"s":"        if (acc_found_stat == `ACCOUNT_FOUND) begin\r","f":2,"l":52,"i":1,"p":100.00}},{"bs":[{"s":"            if ((pin_db[acc_index] == pin )|| (pin_db[acc_index] == newPin)) begin  // If the PIN matches the one in the database, set the authentication status to authenticated\r","f":2,"i":1,"l":54,"h":82},{"s":"            else begin                          // If the PIN does not match, set the authentication status to not authenticated\r","f":2,"i":1,"l":59,"h":11}],"br":{"s":"            if ((pin_db[acc_index] == pin )|| (pin_db[acc_index] == newPin)) begin  // If the PIN matches the one in the database, set the authentication status to authenticated\r","f":2,"l":54,"i":1,"p":100.00}},{"bs":[{"s":"        if (newPin == pin) begin\r","f":2,"i":1,"l":72,"h":10},{"s":"        else begin\r","f":2,"i":1,"l":76,"h":12}],"br":{"s":"        if (newPin == pin) begin\r","f":2,"l":72,"i":1,"p":100.00}}]},"2":{"pr":"work.Authenticator","t":"du","br":[{"bs":[{"s":"                if (acc_num_db[i] == acc_num) begin\r","f":2,"i":1,"l":36,"h":93},{"s":"                else begin\r","f":2,"i":1,"l":42,"h":472}],"br":{"s":"                if (acc_num_db[i] == acc_num) begin\r","f":2,"l":36,"i":1,"p":100.00}},{"bs":[{"s":"        if (acc_found_stat == `ACCOUNT_FOUND) begin\r","f":2,"i":1,"l":52,"h":93},{"s":"All False","f":2,"i":1,"l":52,"h":6}],"br":{"s":"        if (acc_found_stat == `ACCOUNT_FOUND) begin\r","f":2,"l":52,"i":1,"p":100.00}},{"bs":[{"s":"            if ((pin_db[acc_index] == pin )|| (pin_db[acc_index] == newPin)) begin  // If the PIN matches the one in the database, set the authentication status to authenticated\r","f":2,"i":1,"l":54,"h":82},{"s":"            else begin                          // If the PIN does not match, set the authentication status to not authenticated\r","f":2,"i":1,"l":59,"h":11}],"br":{"s":"            if ((pin_db[acc_index] == pin )|| (pin_db[acc_index] == newPin)) begin  // If the PIN matches the one in the database, set the authentication status to authenticated\r","f":2,"l":54,"i":1,"p":100.00}},{"bs":[{"s":"        if (newPin == pin) begin\r","f":2,"i":1,"l":72,"h":10},{"s":"        else begin\r","f":2,"i":1,"l":76,"h":12}],"br":{"s":"        if (newPin == pin) begin\r","f":2,"l":72,"i":1,"p":100.00}}]}};
processBranchesData(g_data);