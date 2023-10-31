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

def card_handling(data):
    
    '''
        This function takes in the account number and pin as input and 
        prints wheather the account is valid or not (card accepted or not)
    '''
    pass

def choose_language(language):
    '''
        This function takes in the language as input and
        makes user choose language
    '''
    pass

def operations(operation):
    '''
        This function takes in the operation as input and
        performs the following operations:
            - Withdraw
            - Deposit
            - Balance Enquiry
            - Change Pin
            - Exit
    '''
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