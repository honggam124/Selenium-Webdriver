*** Settings ***
Library           SeleniumLibrary
Library           module.py

*** Variables ***
${EXPECTED_URL_LOGIN}    https://automationteststore.com/index.php?rt=account/account

*** Test Cases ***
TC module 7
    [Documentation]    change password succesfull
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    gamcho123
    # Go to Change Password
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[2]/a    #change password
    # input data
    ${driver}    Input ChangePassword    ${driver}    gamcho123    nguyenhonggam    nguyenhonggam    ${False}
    ${result}    Verify Notification    ${driver}    Success: Your password has been successfully updated.    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    Should Be True    ${result}
    Close    ${driver}

TC module 7-1
    [Documentation]    cancel change password 
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    nguyenhonggam
    # Go to Change Password
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[2]/a    #change password
    # input data
    ${driver}    Input ChangePassword    ${driver}    nguyenhonggam    gamcho123    gamcho123    ${True}
    ${result}    Check Url    ${driver}    ${EXPECTED_URL_LOGIN}
    Should Be True    ${result}
    Close    ${driver}

TC module 7-2 
    [Documentation]    current password incorrect
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    nguyenhonggam
    # Go to Change Password
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[2]/a    #change password
    # input data
    ${driver}    Input ChangePassword    ${driver}    gamcho123    gamcho123    gamcho123    ${False}
    ${result1}   Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}   Verify Notification    ${driver}    Your current password is incorrect! Please try again.    //*[@id="PasswordFrm"]/div[1]/fieldset/div[1]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC module 7-3
    [Documentation]    new password has short length
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    nguyenhonggam
    # Go to Change Password
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[2]/a    #change password
    # input data
    ${driver}    Input ChangePassword    ${driver}    gamcho123    ngu    ngu    ${False}
    ${result1}   Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}   Verify Notification    ${driver}    Password must be between 4 and 20 characters!    //*[@id="PasswordFrm"]/div[1]/fieldset/div[2]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC module 7-4
    [Documentation]    new password has long length
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    nguyenhonggam
    # Go to Change Password
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[2]/a    #change password
    # input data
    ${driver}    Input ChangePassword    ${driver}    gamcho123    nguyenthihonggam12345    nguyenthihonggam12345    ${False}
    ${result1}   Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}   Verify Notification    ${driver}    Password must be between 4 and 20 characters!    //*[@id="PasswordFrm"]/div[1]/fieldset/div[2]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC module 7-5 
    [Documentation]    confirm password incorrect
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    nguyenhonggam
    # Go to Change Password
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[2]/a    #change password
    # input data
    ${driver}    Input ChangePassword    ${driver}    gamcho123    nguyenhonggam    nguyenthihonggam12345    ${False}
    ${result1}   Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}   Verify Notification    ${driver}    Password confirmation does not match password!    //*[@id="PasswordFrm"]/div[1]/fieldset/div[3]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC module 7-6
    [Documentation]    empty current password
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    nguyenhonggam
    # Go to Change Password
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[2]/a    #change password
    # input data
    ${driver}    Input ChangePassword    ${driver}    ${EMPTY}    gamcho123    gamcho123    ${False}
    ${result1}   Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}   Verify Notification    ${driver}    Your current password is incorrect! Please try again.    //*[@id="PasswordFrm"]/div[1]/fieldset/div[1]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC module 7-7
    [Documentation]    empty new password
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    nguyenhonggam
    # Go to Change Password
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[2]/a    #change password
    # input data
    ${driver}    Input ChangePassword    ${driver}    nguyenhonggam    ${EMPTY}    ${EMPTY}    ${False}
    ${result1}   Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}   Verify Notification    ${driver}    Password must be between 4 and 20 characters!    //*[@id="PasswordFrm"]/div[1]/fieldset/div[2]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC module 7-8
    [Documentation]    empty new password confirm
     # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    nguyenhonggam
    # Go to Change Password
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[2]/a    #change password
    # input data
    ${driver}    Input ChangePassword    ${driver}    nguyenhonggam    gamcho123    ${EMPTY}    ${False}
    ${result1}   Verify Notification    ${driver}    Oops, there is an error with information provided!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}   Verify Notification    ${driver}    Password confirmation does not match password!    //*[@id="PasswordFrm"]/div[1]/fieldset/div[3]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}


Set password to gamcho123
    [Documentation]    change password succesfull
    # LOGIN
    ${driver}    Open    https://automationteststore.com/
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    hggam    nguyenhonggam
    # Go to Change Password
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a    #account
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[2]/a    #change password
    # input data
    ${driver}    Input ChangePassword    ${driver}    nguyenhonggam    gamcho123    gamcho123    ${False}
    ${result}    Verify Notification    ${driver}    Success: Your password has been successfully updated.    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    Should Be True    ${result}