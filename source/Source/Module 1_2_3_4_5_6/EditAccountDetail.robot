*** Settings ***
Library           SeleniumLibrary
Library           module.py

*** Variables ***
${EXPECTED_URL_LOGIN}    https://automationteststore.com/index.php?rt=account/account

*** Test Cases ***
TC module 6
    [Documentation]    edit account succesfull
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Edit Account Detail
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[1]/a    #edit account edit
    # Input data
    ${driver}    Input EditAccount    ${driver}    Nguyen    Hong Gam    ${EMPTY}    ${False}    ${True}    ${True}    ${False}
    ${result}   Verify Notification    ${driver}    Success: Your account has been successfully updated.    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    Should Be True    ${result}
    Close    ${driver}

TC module 6-1
    [Documentation]    cancel edit account
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Edit Account Detail
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[1]/a    #edit account edit
    # Input data
    ${driver}    Input EditAccount    ${driver}    Nguyen    Hong Gam    ${EMPTY}    ${True}    ${True}    ${True}    ${False}
    ${result}    Check Url    ${driver}    ${EXPECTED_URL_LOGIN}
    Should Be True    ${result}
    Close    ${driver}

TC module 6-2
    [Documentation]    email invalid (not have @)
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Edit Account Detail
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[1]/a    #edit account edit
    # Input data
    ${driver}   Input EditAccount    ${driver}    Nguyen    Hong Gam    nguyenhonggam124gmail.com    ${False}    ${True}    ${True}    ${True}
    ${result1}   Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}   Verify Notification    ${driver}    E-Mail Address does not appear to be valid!    //*[@id="AccountFrm"]/div[1]/fieldset/div[4]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC module 6-3
    [Documentation]    email invalid (>3 dot) fail
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Edit Account Detail
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[1]/a    #edit account edit
    # Input data
    ${driver}   Input EditAccount    ${driver}    Nguyen    Hong Gam    nguyen.honggam.124@.gmail.com    ${False}    ${True}    ${True}    ${True}
    ${result1}   Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}   Verify Notification    ${driver}    E-Mail Address does not appear to be valid!    //*[@id="AccountFrm"]/div[1]/fieldset/div[4]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC module 6-4
    [Documentation]    email invalid (have symbols)
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Edit Account Detail
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[1]/a    #edit account edit
    # Input data
    ${driver}   Input EditAccount    ${driver}    Nguyen    Hong Gam    nguyen^honggam124@gmail.com    ${False}    ${True}    ${True}    ${True}
    ${result1}   Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}   Verify Notification    ${driver}    E-Mail Address does not appear to be valid!    //*[@id="AccountFrm"]/div[1]/fieldset/div[4]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC module 6-5
    [Documentation]    email invalid (end by dot)
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Edit Account Detail
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[1]/a    #edit account edit
    # Input data
    ${driver}   Input EditAccount    ${driver}    Nguyen    Hong Gam    nguyenhonggam124@gmail.com.    ${False}    ${True}    ${True}    ${True}
    ${result1}   Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}   Verify Notification    ${driver}    E-Mail Address does not appear to be valid!    //*[@id="AccountFrm"]/div[1]/fieldset/div[4]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC module 6-6
    [Documentation]    empty first name
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Edit Account Detail
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[1]/a    #edit account edit
    # Input data
    ${driver}   Input EditAccount    ${driver}    ${EMPTY}    Hong Gam    nguyenhonggam124@gmail.com    ${False}    ${True}    ${False}    ${False}
    ${result1}   Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}   Verify Notification    ${driver}    First Name must be between 1 and 32 characters!    //*[@id="AccountFrm"]/div[1]/fieldset/div[2]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC module 6-7
    [Documentation]    empty last name
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Edit Account Detail
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[1]/a    #edit account edit
    # Input data
    ${driver}   Input EditAccount    ${driver}    Nguyen    ${EMPTY}    nguyenhonggam124@gmail.com    ${False}    ${False}    ${True}    ${False}
    ${result1}   Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}   Verify Notification    ${driver}    Last Name must be between 1 and 32 characters!    //*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC module 6-8
    [Documentation]    empty email
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Edit Account Detail
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[1]/a    #edit account edit
    # Input data
    ${driver}   Input EditAccount    ${driver}    Nguyen    Gam    ${EMPTY}    ${False}    ${False}    ${False}    ${True}
    ${result1}   Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}   Verify Notification    ${driver}    E-Mail Address does not appear to be valid!    //*[@id="AccountFrm"]/div[1]/fieldset/div[4]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}