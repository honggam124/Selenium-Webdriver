*** Settings ***
Library           SeleniumLibrary
Library           module.py
Library    String

*** Variables ***
${URL_LOGIN}    https://automationteststore.com/index.php?rt=account/login

*** Test Cases ***
TC module 3
    [Documentation]    Log out successful
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Logout
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[2]/div[1]/div/ul/li[10]/a    #logoff button
    ${result}    Verify Notification    ${driver}    ACCOUNT LOGOUT    //*[@id="maincontainer"]/div/div/div/h1
    Should Be True    ${result}
    Close    ${driver}

TC module 3-1
    [Documentation]    check status Login
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Logout
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[2]/div[1]/div/ul/li[10]/a    #logoff button
    # check the account cannt see
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${result}    Check Url    ${driver}    ${URL_LOGIN}
    Should Be True    ${result}
    Close    ${driver}

TC module 3-2 
    [Documentation]    check the comback for logout in website
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Logout
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[2]/div[1]/div/ul/li[10]/a    #logoff button
    ${driver}    Back    ${driver}
    ${result}    Check Url    ${driver}    ${URL_LOGIN}
    Should Be True    ${result}
    Close    ${driver}
    