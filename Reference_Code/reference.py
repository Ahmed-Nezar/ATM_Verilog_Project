import pandas as pd

def generate_data():
    '''
        This function generates a dataframe with 3 columns & 10 rows:
            - Account Number
            - Pin
            - Balance
    '''
    data = {
    "Account Number": [1,2,3,4,5,6,7,8,9,10],
    "Pin": [1234,2345,3456,
            4567,5678,6789
            ,7890,8901,9012
            ,7123],
    "Balance": [1000,2000,3000,4000,5000,6000,7000,8000,9000,10000],
            }   

    return pd.DataFrame(data)

def card_handling(account_number, pin):
    
    '''
        This function takes in the account number and pin as input and 
        prints wheather the account is valid or not (card accepted or not)
    '''
    card_accepted = False
    if account_number in data["Account Number"].values:
        if pin in data[data["Account Number"] == account_number]["Pin"].values:
            card_accepted = True
    return card_accepted

def choose_language(language):
    '''
        This function takes in the language as input and
        makes user choose language
    '''
    pass

def operations():
    '''
        This function takes in the operation as input and
        performs the following operations:
            - Withdraw
            - Deposit
            - Balance Enquiry
            - Change Pin
            - Exit
    '''
    while True:
        choice = input("Choose an option (1: Change PIN, 2: Withdraw, 3: Deposit, 4: Balance Enquiry, 5: Exit): ")
        if choice == "1":
            change_pin(account_number)
        elif choice == "2":
            withdraw(account_number)
        elif choice == "3":
            deposit(account_number)
        elif choice == "4":
            balance_enquiry(account_number)
        elif choice == "5":
            exit()  
        else:
            print("Invalid option. Please try again.")
    

def withdraw():
    '''
        This function takes in the amount to be withdrawn as input and
        prints the balance after withdrawal
    '''
    pass

def deposit(account_number):
    '''
        This function takes in the amount to be deposited as input and
        prints the balance after deposit
    '''
    amount = float(input("Enter the amount to deposit: "))
    index = data[data["Account Number"] == account_number].index[0]
    data.at[index, "Balance"] += amount
    print(f"Deposit successful. Your new balance is: {data.at[index, 'Balance']}")


def balance_enquiry(account_number):
    '''
        This function prints the balance
    '''
    index = data[data["Account Number"] == account_number].index[0]
    balance = data.at[index, "Balance"]
    print(f"Your current balance is: {balance}")


def change_pin(account_number): 
   while True:
    old_pin = int(input("Enter your old 4-digit PIN: "))
    if old_pin in data[data["Account Number"] == account_number]["Pin"].values:
        print("Old PIN verified.")
        break
    else:
        print("Incorrect old PIN. Please try again.")

   while True:
    new_pin = input("Enter your new 4-digit PIN: ")
    
    if new_pin.isdigit() and len(new_pin) == 4:
        index = data[data["Account Number"] == account_number].index[0]
        data.at[index, "Pin"] = int(new_pin)
        print(f"Your new PIN has been set to: {new_pin}")
        break
    else:
        print("Invalid PIN. Please enter a 4-digit number.")





def exit():
    '''
        This function prints "Thank you for using ATM"
    '''
    print("Thank you for using ATM")

    pass


# main function
if __name__ == "__main__":
    data = generate_data()
    # Uncomment print statements for illustration
    # print(data)
    # to access a specific row
    # print(data.loc[0])
    # to access a specific column
    # print(data["Account Number"])
    # to access a specific cell
    # print(data["Account Number"][0])
    # to filter the data
    # print(data[data["Account Number"] == 1])
    print("Welcome to ATM")

    # choose language

    # Main Pragram Loop
    while True:
        print("Enter your card")
        account_number = int(input("Enter your account number: "))
        pin = int(input("Enter your pin: "))
        if card_handling(account_number, pin):
            print("Card accepted")
            operations()
        else:
            print("Card not accepted")
            print("Please try again")
        