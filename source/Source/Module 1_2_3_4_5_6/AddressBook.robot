*** Settings ***
Library           SeleniumLibrary
Library           module.py

*** Variables ***
${EXPECTED_URL_LOGIN}    https://automationteststore.com/index.php?rt=account/account

*** Test Cases ***
TC module 6
    [Documentation]     Update address successful
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Address book
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[3]/a    #address book
    # click button edit one address
    ${driver}    Click Random Edit Button    ${driver}
    # input data
    ${driver}    Input AddressBook    ${driver}    Nguyen Thi    Hong Gam    TDT    172/6A Lam Van Ben    TP HCM    ${True}    zipcode    ${True}    ${True}    ${False}
    ${result}    Verify Notification    ${driver}    Your address has been successfully updated    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    Should Be True    ${driver}
    Close    ${driver}

TC module 6-1
    [Documentation]     Cancel update address 
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Address book
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[3]/a    #address book
    # click button edit one address
    ${driver}    Click Random Edit Button    ${driver}
    # input data
    ${driver}    Input AddressBook    ${driver}    Nguyen Thi    Hong Gam    TDT    172/6A Lam Van Ben    TP HCM    ${True}    zipcode    ${True}    ${True}    ${True}
    ${result}    Check Url    ${driver}    ${EXPECTED_URL_LOGIN}
    Should Be True    ${driver}
    Close    ${driver}
    
TC module 6-2
    [Documentation]    empty first name
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Address book
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[3]/a    #address book
    # click button edit one address
    ${driver}    Click Random Edit Button    ${driver}
    # input data
    ${driver}    Input AddressBook    ${driver}    ${EMPTY}    Hong Gam    TDT    172/6A Lam Van Ben    TP HCM    ${True}    zipcode    ${True}    ${True}    ${False}
    ${result1}    Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}    Verify Notification    ${driver}    First Name must be between 1 and 32 characters!    //*[@id="AddressFrm"]/div/fieldset/div[1]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC module 6-3
    [Documentation]    empty last name
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Address book
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[3]/a    #address book
    # click button edit one address
    ${driver}    Click Random Edit Button    ${driver}
    # input data
    ${driver}    Input AddressBook    ${driver}    Nguyen Thi    ${EMPTY}    TDT    172/6A Lam Van Ben    TP HCM    ${True}    zipcode    ${True}    ${True}    ${False}
    ${result1}    Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}    Verify Notification    ${driver}    Last Name must be between 1 and 32 characters!    //*[@id="AddressFrm"]/div/fieldset/div[2]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}
    
TC module 6-4
    [Documentation]    empty address1
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Address book
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[3]/a    #address book
    # click button edit one address
    ${driver}    Click Random Edit Button    ${driver}
    # input data
    ${driver}    Input AddressBook    ${driver}    Nguyen Thi    Hong Gam    TDT    ${EMPTY}    TP HCM    ${True}    zipcode    ${True}    ${True}    ${False}
    ${result1}    Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}    Verify Notification    ${driver}    Address must be between 3 and 128 characters!    //*[@id="AddressFrm"]/div/fieldset/div[4]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC module 6-5
    [Documentation]    empty city
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Address book
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[3]/a    #address book
    # click button edit one address
    ${driver}    Click Random Edit Button    ${driver}
    # input data
    ${driver}    Input AddressBook    ${driver}    Nguyen Thi    Hong Gam    TDT    172/6A Lam Van Ben    ${EMPTY}    ${True}    zipcode    ${True}    ${True}    ${False}
    ${result1}    Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}    Verify Notification    ${driver}    City must be between 3 and 128 characters!    //*[@id="AddressFrm"]/div/fieldset/div[6]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC module 6-6
    [Documentation]     empty region
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Address book
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[3]/a    #address book
    # click button edit one address
    ${driver}    Click Random Edit Button    ${driver}
    # input data
    ${driver}    Input AddressBook    ${driver}    Nguyen Thi    Hong Gam    TDT    172/6A Lam Van Ben    TP HCM    ${False}    zipcode    ${True}    ${True}    ${False}
    ${result1}    Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}    Verify Notification    ${driver}    Please select a region / state!    //*[@id="AddressFrm"]/div/fieldset/div[7]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC module 6-7
    [Documentation]    empty zipcode
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Address book
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[3]/a    #address book
    # click button edit one address
    ${driver}    Click Random Edit Button    ${driver}
    # input data
    ${driver}    Input AddressBook    ${driver}    Nguyen Thi    Hong Gam    TDT    172/6A Lam Van Ben    TP HCM    ${True}    ${EMPTY}    ${True}    ${True}    ${False}
    ${result1}    Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}    Verify Notification    ${driver}    Zip/postal code must be between 2 and 10 characters!    //*[@id="AddressFrm"]/div/fieldset/div[8]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC module 6-6
    [Documentation]    empty country
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Address book
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[3]/a    #address book
    # click button edit one address
    ${driver}    Click Random Edit Button    ${driver}
    # input data
    ${driver}    Input AddressBook    ${driver}    Nguyen Thi    Hong Gam    TDT    172/6A Lam Van Ben    TP HCM    ${False}    ${EMPTY}    ${False}    ${False}    ${False}
    ${result1}    Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}    Verify Notification    ${driver}    Please select a country!    //*[@id="AddressFrm"]/div/fieldset/div[9]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}



#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

TC module 6-9
    [Documentation]     Add new address successful
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Address book
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[3]/a    #address book
    # click button add a address
    ${driver}    Click Random Edit Button    ${driver}
    # input data
    ${driver}    Input AddressBook    ${driver}    Nguyen Thi    Hong Gam    TDT    172/6A Lam Van Ben    TP HCM    ${True}    zipcode    ${True}    ${True}    ${False}
    ${result}    Verify Notification    ${driver}    Your address has been successfully updated    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    Should Be True    ${driver}
    Close    ${driver}

TC module 6-10
    [Documentation]     Cancel add address 
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Address book
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[3]/a    #address book
    # click button add a address
    ${driver}    Click Random Edit Button    ${driver}
    # input data
    ${driver}    Input AddressBook    ${driver}    Nguyen Thi    Hong Gam    TDT    172/6A Lam Van Ben    TP HCM    ${True}    zipcode    ${True}    ${True}    ${True}
    ${result}    Check Url    ${driver}    ${EXPECTED_URL_LOGIN}
    Should Be True    ${driver}
    Close    ${driver}
    
TC module 6-11
    [Documentation]    empty first name
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Address book
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[3]/a    #address book
    # click button add a address
    ${driver}    Click Random Edit Button    ${driver}
    # input data
    ${driver}    Input AddressBook    ${driver}    ${EMPTY}    Hong Gam    TDT    172/6A Lam Van Ben    TP HCM    ${True}    zipcode    ${True}    ${True}    ${False}
    ${result1}    Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}    Verify Notification    ${driver}    First Name must be between 1 and 32 characters!    //*[@id="AddressFrm"]/div/fieldset/div[1]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC module 6-12
    [Documentation]    empty last name
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Address book
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[3]/a    #address book
    # click button add a address
    ${driver}    Click Random Edit Button    ${driver}
    # input data
    ${driver}    Input AddressBook    ${driver}    Nguyen Thi    ${EMPTY}    TDT    172/6A Lam Van Ben    TP HCM    ${True}    zipcode    ${True}    ${True}    ${False}
    ${result1}    Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}    Verify Notification    ${driver}    Last Name must be between 1 and 32 characters!    //*[@id="AddressFrm"]/div/fieldset/div[2]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}
    
TC module 6-13
    [Documentation]    empty address1
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Address book
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[3]/a    #address book
    # click button add a address
    ${driver}    Click Random Edit Button    ${driver}
    # input data
    ${driver}    Input AddressBook    ${driver}    Nguyen Thi    Hong Gam    TDT    ${EMPTY}    TP HCM    ${True}    zipcode    ${True}    ${True}    ${False}
    ${result1}    Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}    Verify Notification    ${driver}    Address must be between 3 and 128 characters!    //*[@id="AddressFrm"]/div/fieldset/div[4]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC module 6-14
    [Documentation]    empty city
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Address book
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[3]/a    #address book
    # click button add a address
    ${driver}    Click Random Edit Button    ${driver}
    # input data
    ${driver}    Input AddressBook    ${driver}    Nguyen Thi    Hong Gam    TDT    172/6A Lam Van Ben    ${EMPTY}    ${True}    zipcode    ${True}    ${True}    ${False}
    ${result1}    Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}    Verify Notification    ${driver}    City must be between 3 and 128 characters!    //*[@id="AddressFrm"]/div/fieldset/div[6]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC module 6-15
    [Documentation]     empty region
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Address book
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[3]/a    #address book
    # click button add a address
    ${driver}    Click Random Edit Button    ${driver}
    # input data
    ${driver}    Input AddressBook    ${driver}    Nguyen Thi    Hong Gam    TDT    172/6A Lam Van Ben    TP HCM    ${False}    zipcode    ${True}    ${False}    ${False}
    ${result1}    Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}    Verify Notification    ${driver}    Please select a region / state!    //*[@id="AddressFrm"]/div/fieldset/div[7]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC module 6-16
    [Documentation]    empty zipcode
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Address book
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[3]/a    #address book
    # click button add a address
    ${driver}    Click Random Edit Button    ${driver}
    # input data
    ${driver}    Input AddressBook    ${driver}    Nguyen Thi    Hong Gam    TDT    172/6A Lam Van Ben    TP HCM    ${True}    ${EMPTY}    ${True}    ${True}    ${False}
    ${result1}    Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}    Verify Notification    ${driver}    Zip/postal code must be between 2 and 10 characters!    //*[@id="AddressFrm"]/div/fieldset/div[8]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC module 6-17
    [Documentation]    empty country
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Address book
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[3]/a    #address book
    # click button add a address
    ${driver}    Click Random Edit Button    ${driver}
    # input data
    ${driver}    Input AddressBook    ${driver}    Nguyen Thi    Hong Gam    TDT    172/6A Lam Van Ben    TP HCM    ${False}    zipcode    ${False}    ${False}    ${False}
    ${result1}    Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}    Verify Notification    ${driver}    Please select a country!    //*[@id="AddressFrm"]/div/fieldset/div[9]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

#----------------------------------------------------------------------------------------------------
