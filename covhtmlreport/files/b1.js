var g_data = {"4":{"pr":"/\\atm_tb#atm_instance ","t":"inst","br":[{"bs":[{"s":"  if (!rst) begin\r","f":1,"i":1,"l":43,"h":2},{"s":"  else begin\r","f":1,"i":1,"l":46,"h":318}],"br":{"s":"  if (!rst) begin\r","f":1,"l":43,"i":1,"p":100.00}},{"bs":[{"s":"        `WAITING: begin\r","f":1,"i":1,"l":54,"h":133},{"s":"        `AUTHENTICATION: begin\r","f":1,"i":1,"l":63,"h":88},{"s":"        `MENU: begin\r","f":1,"i":1,"l":74,"h":70},{"s":"        `BALANCE: begin\r","f":1,"i":1,"l":94,"h":23},{"s":"        `WITHDRAW: begin\r","f":1,"i":1,"l":101,"h":42},{"s":"        `DEPOSIT: begin\r","f":1,"i":1,"l":108,"h":23},{"s":"        `CHANGE_PIN: begin\r","f":1,"i":1,"l":115,"h":22},{"s":"        `IDLE: begin\r","f":1,"i":1,"l":122,"h":2},{"s":"        default: begin\r","f":1,"i":1,"l":124,"h":0}],"br":{"s":"    case (current_state)\r","f":1,"l":53,"i":1,"p":88.88}},{"bs":[{"s":"        if (acc_found_stat == `TRUE) begin\r","f":1,"i":1,"l":55,"h":127},{"s":"        else begin\r","f":1,"i":1,"l":58,"h":6}],"br":{"s":"        if (acc_found_stat == `TRUE) begin\r","f":1,"l":55,"i":1,"p":100.00}},{"bs":[{"s":"            if (acc_auth_stat == `ACCOUNT_NOT_AUTHENTICATED) begin\r","f":1,"i":1,"l":64,"h":18},{"s":"            else begin\r","f":1,"i":1,"l":68,"h":70}],"br":{"s":"            if (acc_auth_stat == `ACCOUNT_NOT_AUTHENTICATED) begin\r","f":1,"l":64,"i":1,"p":100.00}},{"bs":[{"s":"            `BALANCE: begin\r","f":1,"i":1,"l":77,"h":13},{"s":"            `WITHDRAW: begin\r","f":1,"i":1,"l":80,"h":22},{"s":"            `DEPOSIT: begin\r","f":1,"i":1,"l":83,"h":13},{"s":"            `CHANGE_PIN: begin\r","f":1,"i":1,"l":86,"h":22},{"s":"            default: begin\r","f":1,"i":1,"l":89,"h":0}],"br":{"s":"        case (operation)\r","f":1,"l":76,"i":1,"p":80.00}},{"bs":[{"s":"            if (authenticatedFlag == 0) begin\r","f":1,"i":1,"l":95,"h":13},{"s":"All False","f":1,"i":1,"l":95,"h":10}],"br":{"s":"            if (authenticatedFlag == 0) begin\r","f":1,"l":95,"i":1,"p":100.00}},{"bs":[{"s":"            if (authenticatedFlag == 0) begin\r","f":1,"i":1,"l":102,"h":22},{"s":"All False","f":1,"i":1,"l":102,"h":20}],"br":{"s":"            if (authenticatedFlag == 0) begin\r","f":1,"l":102,"i":1,"p":100.00}},{"bs":[{"s":"            if (authenticatedFlag == 0) begin\r","f":1,"i":1,"l":109,"h":13},{"s":"All False","f":1,"i":1,"l":109,"h":10}],"br":{"s":"            if (authenticatedFlag == 0) begin\r","f":1,"l":109,"i":1,"p":100.00}},{"bs":[{"s":"            if (authenticatedFlag == 0) begin\r","f":1,"i":1,"l":116,"h":22},{"s":"All False","f":1,"i":1,"l":116,"h":0}],"br":{"s":"            if (authenticatedFlag == 0) begin\r","f":1,"l":116,"i":1,"p":50.00}}]},"5":{"pr":"/\\atm_tb#atm_instance /authenticator","t":"inst","br":[{"bs":[{"s":"                if (acc_num_db[i] == acc_num) begin\r","f":2,"i":1,"l":36,"h":92},{"s":"                else begin\r","f":2,"i":1,"l":42,"h":472}],"br":{"s":"                if (acc_num_db[i] == acc_num) begin\r","f":2,"l":36,"i":1,"p":100.00}},{"bs":[{"s":"        if (acc_found_stat == `ACCOUNT_FOUND) begin\r","f":2,"i":1,"l":52,"h":92},{"s":"All False","f":2,"i":1,"l":52,"h":6}],"br":{"s":"        if (acc_found_stat == `ACCOUNT_FOUND) begin\r","f":2,"l":52,"i":1,"p":100.00}},{"bs":[{"s":"            if ((pin_db[acc_index] == pin )|| (pin_db[acc_index] == newPin)) begin  // If the PIN matches the one in the database, set the authentication status to authenticated\r","f":2,"i":1,"l":54,"h":82},{"s":"            else begin                          // If the PIN does not match, set the authentication status to not authenticated\r","f":2,"i":1,"l":59,"h":10}],"br":{"s":"            if ((pin_db[acc_index] == pin )|| (pin_db[acc_index] == newPin)) begin  // If the PIN matches the one in the database, set the authentication status to authenticated\r","f":2,"l":54,"i":1,"p":100.00}},{"bs":[{"s":"        if (newPin == pin) begin\r","f":2,"i":1,"l":72,"h":10},{"s":"        else begin\r","f":2,"i":1,"l":76,"h":12}],"br":{"s":"        if (newPin == pin) begin\r","f":2,"l":72,"i":1,"p":100.00}}]},"2":{"pr":"work.Authenticator","t":"du","br":[{"bs":[{"s":"                if (acc_num_db[i] == acc_num) begin\r","f":2,"i":1,"l":36,"h":92},{"s":"                else begin\r","f":2,"i":1,"l":42,"h":472}],"br":{"s":"                if (acc_num_db[i] == acc_num) begin\r","f":2,"l":36,"i":1,"p":100.00}},{"bs":[{"s":"        if (acc_found_stat == `ACCOUNT_FOUND) begin\r","f":2,"i":1,"l":52,"h":92},{"s":"All False","f":2,"i":1,"l":52,"h":6}],"br":{"s":"        if (acc_found_stat == `ACCOUNT_FOUND) begin\r","f":2,"l":52,"i":1,"p":100.00}},{"bs":[{"s":"            if ((pin_db[acc_index] == pin )|| (pin_db[acc_index] == newPin)) begin  // If the PIN matches the one in the database, set the authentication status to authenticated\r","f":2,"i":1,"l":54,"h":82},{"s":"            else begin                          // If the PIN does not match, set the authentication status to not authenticated\r","f":2,"i":1,"l":59,"h":10}],"br":{"s":"            if ((pin_db[acc_index] == pin )|| (pin_db[acc_index] == newPin)) begin  // If the PIN matches the one in the database, set the authentication status to authenticated\r","f":2,"l":54,"i":1,"p":100.00}},{"bs":[{"s":"        if (newPin == pin) begin\r","f":2,"i":1,"l":72,"h":10},{"s":"        else begin\r","f":2,"i":1,"l":76,"h":12}],"br":{"s":"        if (newPin == pin) begin\r","f":2,"l":72,"i":1,"p":100.00}}]}};
processBranchesData(g_data);