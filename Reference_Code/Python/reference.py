import pandas as pd
import os,time

def generate_data():
    '''
        This function generates a dataframe with 3 columns & 10 rows:
            - Account Number
            - Pin
            - Balance
    '''
    data = pd.read_csv("Reference_Code\Python\data.csv") 

    return pd.DataFrame(data)

inputs = {
    
     "Account":[],
     "Amount":[],
     "Operations":[],
     "Pins":[],
     "Newpin":[],
     "Language":[],
     
}

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

def choose_language():
    '''
    This function prompts the user to choose a language (English or Arabic).
    '''
    print("Choose your language:")
    print("1. English")
    print("2. Arabic")
    language_choice = input("Enter your choice (1 or 2): ")
    inputs["Language"].append(language_choice) 
    if language_choice == "1":
        return "English"
    elif language_choice == "2":
        return "Arabic"
    else:
        print("Invalid language choice. Defaulting to English.")
        return "English"

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
    language = choose_language()
    if language == "English":
        instructions = {
            "1": "Change PIN",
            "2": "Withdraw",
            "3": "Deposit",
            "4": "Balance Enquiry",
            "5": "Exit"
        }
    else:
        instructions = {
            "1":"تغير الرقم السري",
            "2": "سحب",
            "3": "ايداع",
            "4": "استعلام الرصيد",
            "5": "الخروج"
        }

    while True:
        print("\nChoose an option:")
        for key, value in instructions.items():
            print(f"{key}. {value}")

        choice = input(f"Enter your choice ({language}): ")
        
        if choice == "1":
            inputs["Operations"].append(6)
            change_pin(account_number)
             
        elif choice == "2":
            inputs["Operations"].append(4) 
            withdraw(account_number)
            exit()
            break
        elif choice == "3":
            inputs["Operations"].append(5) 
            deposit(account_number)
        elif choice == "4":
            inputs["Operations"].append(3) 
            balance_enquiry(account_number)
        elif choice == "5":
            exit()
            break
        else:
            print("Invalid option. Please try again.")
    

def withdraw(account_number):
    '''
        This function takes in the amount to be withdrawn as input and
        prints the balance after withdrawal
    '''
    amount = float(input("Enter the amount to withdraw: "))
    index = data[data["Account Number"] == account_number].index[0]
    balance = data.at[index, "Balance"]
    inputs["Amount"].append(amount)

    if amount <= 0:
            print("Invalid amount. Please enter a positive value.")
    elif amount > balance:
            print("Insufficient balance. Your current balance is:", balance)
    else:
            data.at[index, "Balance"] -= amount
            print("Withdrawal successful. Your new balance is:", data.at[index, "Balance"])
            


def deposit(account_number):
    '''
        This function takes in the amount to be deposited as input and
        prints the balance after deposit
    '''
    amount = float(input("Enter the amount to deposit: "))
    inputs["Amount"].append(amount)
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
    inputs["Newpin"].append(new_pin)
    
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
    print("Thank you for using ATM. Have a great day!")
    time.sleep(3)
    os.system('cls')
    
    

# main function
if __name__ == "__main__":
    data = generate_data()
    print("Welcome to ATM")
    # choose language
    
    # Main Pragram Loop
    while True:
        print("Enter your card")
        account_number = int(input("Enter your account number: "))
        pin = int(input("Enter your pin: "))
        inputs["Pins"].append(pin)
        inputs["Account"].append(account_number)
        if card_handling(account_number, pin):
            print("Card accepted")
            operations()
            target_size = len(inputs["Account"])
            inputs["Amount"] += [0] * (target_size - len(inputs["Amount"]))
            inputs["Newpin"] += [0] * (target_size - len(inputs["Newpin"]))
            inputs["Operations"]+=[0] * (target_size - len(inputs["Operations"]))
            data.to_csv("Reference_Code\Python\outputs.csv", header= False, index=False)
            pd.DataFrame(inputs).to_csv("Reference_Code\Python\inputs.csv", header= False, index=False)
        else:
            print("Card not accepted")
            print("Please try again")
            time.sleep(3)
            os.system("cls")