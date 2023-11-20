# ATM_Verilog_Project

## Reference Code Structure

### 1. generate_data Function
- Generates a sample DataFrame with information about account numbers, PINs, and balances.

### 2. card_handling Function
- Checks the validity of the provided account number and PIN, determining if the card is accepted or not.

### 3. choose_language Function
- Prompts the user to choose between English and Arabic.

### 4. operations Function
- Manages the main operations of the ATM, such as withdrawing, depositing, checking balance, changing PIN, and exiting.

### 5. withdraw, deposit, balance_enquiry, and change_pin Functions
- Implement the respective functionalities for each operation.

### 6. exit Function
- Prints a farewell message and clears the screen before exiting.

### 7. Main Program
- Generates sample data using generate_data.
- Enters a loop for card authentication and main program execution.

## Usage
1. Run the script.
2. Enter the account number and PIN when prompted.
3. If the card is accepted, perform operations such as withdrawing, depositing, etc.
4. Exit the program when done.

## Note
- The PIN change functionality requires verification of the old PIN before setting a new one.
- The code includes a language selection option between English and Arabic.

## Dependencies
- Pandas library is used for data manipulation.

## Additional Information
- This code is a basic representation of an ATM system and may require further enhancements for real-world usage.
- Ensure that you have Python and Pandas installed to run the script successfully.

Feel free to modify and expand the code based on your specific requirements.