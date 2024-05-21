*** Settings ***
Library           SeleniumLibrary
Library           module.py

*** Variables ***
${EXPECTED_URL_LOGIN}    https://automationteststore.com/index.php?rt=account/account

*** Test Cases ***
TC module 2
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #input data
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    ${result}    Check Url    ${driver}    ${EXPECTED_URL_LOGIN}
    Should Be True    ${result}
    Close    ${driver}

TC module 2-1
    [Documentation]    space before username (fail)
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #input data
    ${driver}    Input Login    ${driver}    ${SPACE}hggam    gamcho123
    ${result}    Check Url    ${driver}    ${EXPECTED_URL_LOGIN}
    Should Be True    ${result}
    Close    ${driver}

TC module 2-2
    [Documentation]    space after username
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #input data
    ${driver}    Input Login    ${driver}    hggam${SPACE}    gamcho123
    ${result}    Check Url    ${driver}    ${EXPECTED_URL_LOGIN}
    Should Be True    ${result}
    Close    ${driver}

TC module 2-3
    [Documentation]    user invalid
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #input data
    ${driver}    Input Login    ${driver}    hg12345    gamcho123
    ${result}    Verify Notification    ${driver}    Error: Incorrect login or password provided.    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Be True    ${result}
    Close    ${driver}

TC module 2-4
    [Documentation]    password invalid
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #input data
    ${driver}    Input Login    ${driver}    hggam    gamcho124
    ${result}    Verify Notification    ${driver}    Error: Incorrect login or password provided.    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Be True    ${result}
    Close    ${driver}

TC module 2-5
    [Documentation]    username invalid with lowcase upcase
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #input data
    ${driver}    Input Login    ${driver}    HgGam    gamcho124
    ${result}    Verify Notification    ${driver}    Error: Incorrect login or password provided.    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Be True    ${result}
    Close    ${driver}

TC module 2-6
    [Documentation]     empty field username
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #input data
    ${driver}    Input Login    ${driver}    ${EMPTY}    gamcho123
    ${result}    Verify Notification    ${driver}    Error: Incorrect login or password provided.    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Be True    ${result}
    Close    ${driver}

TC module 2-7
    [Documentation]     empty field password
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #input data
    ${driver}    Input Login    ${driver}    hggam    ${EMPTY}
    ${result}    Verify Notification    ${driver}    Error: Incorrect login or password provided.    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Be True    ${result}
    Close    ${driver}