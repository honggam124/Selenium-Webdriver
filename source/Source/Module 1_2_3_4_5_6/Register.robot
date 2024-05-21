*** Settings ***
Library           SeleniumLibrary
Library           module.py
Library    Collections
*** Variables ***
${EXPECTED_URL_LOGIN}    https://automationteststore.com/index.php?rt=account/account

*** Test Cases ***
# new email: gemthui123@gmail.com
TC module 1
    [Documentation]    Valid
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    Trung Dung    pgy99579@vogco.com    172/6A Lam Van Ben    Tan An    ${True}      vgmg      ${True}    finalfinal    finalfinal    finalfinal    ${True}
    Sleep    3
    ${result}    Verify Notification    ${driver}     YOUR ACCOUNT HAS BEEN CREATED!    //*[@id="maincontainer"]/div/div[1]/div/h1
    Should Be True    ${result}
    Close    ${driver}

TC module 1-1
    [Documentation]     login succesfull with account
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #input data
    ${driver}    Input Login    ${driver}    finalfinal    finalfinal
    ${result}    Check Url    ${driver}    ${EXPECTED_URL_LOGIN}
    Should Be True    ${result}
    Close    ${driver}

TC: Module 1-2
    [Documentation]    Email invalid (exists)
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    Hong Gam    nguyenhonggam124@gmail.com    172/6A Lam Van Ben    TP HCM    Ho Chi Minh City    vgmg    Viet Nam    gem3212    gem3212    gem3212    ${True}
    ${result}    Verify Notification    ${driver}     Error: E-Mail Address is already registered!    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Be True    ${result}
    Close    ${driver}
    
TC Module 1-3
    [Documentation]    Email invalid (not @)
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    Trung Dung    gemthui896787123gmail.com    172/6A Lam Van Ben    Tan An    ${True}      vgmg      ${True}    gam111114111    gam111114111    gam111114111    ${True}
    ${result}    Verify Notification    ${driver}     Email Address does not appear to be valid!    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Be True    ${result}
    Close    ${driver}

TC Module 1-4
    [Documentation]    email invalid (>3dot) (fail) 
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    Trung Dung    gem.thui.123.@gmail.com    172/6A Lam Van Ben    Tan An    ${True}      vgmg      ${True}    gamvagam    gamvagam    gamvagam    ${True}
    ${result}    Verify Notification    ${driver}     Email Address does not appear to be valid!    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Be True    ${result}
    Close    ${driver}

TC Module 1-5
    [Documentation]    email invalid (have special char)
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    Trung Dung    gemthu%^&*123.@gmail.com    172/6A Lam Van Ben    Tan An    ${True}      vgmg      ${True}    gamgamgam    gamgamgam    gamgamgam    ${True}
    ${result}    Verify Notification    ${driver}     Email Address does not appear to be valid!    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Be True    ${result}
    Close    ${driver}

TC Module 1-6
    [Documentation]    email invalid (end by dot) fail
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    Trung Dung    hggemtui12367@gmail.com.    172/6A Lam Van Ben    Tan An    ${True}      vgmg      ${True}    gamdihoc    gamdihoc    gamdihoc    ${True}
    ${result}    Verify Notification    ${driver}     Email Address does not appear to be valid!    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Be True    ${result}
    Close    ${driver}

TC Module 1-7
    [Documentation]    username invalid [exist] 
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    Trung Dung    gemthi123554@gmail.com    172/6A Lam Van Ben    Tan An    ${True}      vgmg      ${True}    hggam    gamdihoc    gamdihoc    ${True}
    ${result}    Verify Notification    ${driver}     This login name is not available. Try different login name!    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Be True    ${result}
    Close    ${driver}

TC Module 1-8
    [Documentation]    username invalid (< 5 char)
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    Trung Dung    gem12333333333@gmail.com    172/6A Lam Van Ben    Tan An    ${True}      vgmg      ${True}    hgga    gamdihoc    gamdihoc    ${True}
    ${result}    Verify Notification    ${driver}     Login name must be alphanumeric only and between 5 and 64 characters!    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Be True    ${result}
    Close    ${driver}

TC Module 1-9
    [Documentation]    username invalid (>64 char)
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    Trung Dung    gem11111123s@gmail.com    172/6A Lam Van Ben    Tan An    ${True}      vgmg      ${True}    hggammmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm    gamdihoc    gamdihoc    ${True}
    ${result}    Verify Notification    ${driver}     Login name must be alphanumeric only and between 5 and 64 characters!    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Be True    ${result}
    Close    ${driver}

TC Module 1-10
    [Documentation]    username invalid (have symbols)
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    Trung Dung    gemthu15234@gmail.com    172/6A Lam Van Ben    Tan An    ${True}      vgmg      ${True}    hgggamdihoc&    gamdihoc    gamdihoc    ${True}
    ${result}    Verify Notification    ${driver}     Login name must be alphanumeric only and between 5 and 64 characters!    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Be True    ${result}
    Close    ${driver}

TC Module 1-11
    [Documentation]    pass invalid (<4 char)
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    Trung Dung    gemdihoc111121111@gmail.com    172/6A Lam Van Ben    Tan An    ${True}      vgmg      ${True}    gamdichoi    ho    ho    ${True}
    ${result}    Verify Notification    ${driver}     Password must be between 4 and 20 characters!    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Be True    ${result}
    Close    ${driver}
    
TC Module 1-12
    [Documentation]    pass invalid (>20 char)
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    Trung Dung    gem111121@gmail.com    172/6A Lam Van Ben    Tan An    ${True}      vgmg      ${True}    gemlonhon20    gem1234567891011121314123425161718191    gem1234567891011121314123425161718191    ${True}
    ${result}    Verify Notification    ${driver}     Password must be between 4 and 20 characters!    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Be True    ${result}
    Close    ${driver}

TC Module 1-13
    [Documentation]    pass confirm invalid
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    Trung Dung    gemdic11112111@gmail.com    172/6A Lam Van Ben    Tan An    ${True}      vgmg      ${True}    gemtuhoc    gem1234    gemdihoc    ${True}
    ${result}    Verify Notification    ${driver}     Password confirmation does not match password!    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Be True    ${result}
    Close    ${driver}

TC Module 1-14
    [Documentation]    empty first name
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    ${EMPTY}    Trung Dung    gemeee1111211@gmail.com    172/6A Lam Van Ben    Tan An    ${True}      vgmg      ${True}    gemkhongco    gemkhongco    gemkhongco    ${True}
    ${result1}   Verify Notification    ${driver}    First Name must be between 1 and 32 characters!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}   Verify Notification    ${driver}    First Name must be between 1 and 32 characters!    //*[@id="AccountFrm"]/div[1]/fieldset/div[1]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}


TC Module 1-15
    [Documentation]    empty last name
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    ${EMPTY}    gemthom1111@gmail.com    172/6A Lam Van Ben    Tan An    ${True}      vgmg      ${True}    khonglamnua    khonglamnua    khonglamnua    ${True}
    ${result1}   Verify Notification    ${driver}    Last Name must be between 1 and 32 characters!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}   Verify Notification    ${driver}    Last Name must be between 1 and 32 characters!    //*[@id="AccountFrm"]/div[1]/fieldset/div[2]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC Module 1-16
    [Documentation]    empty email
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    Trung Dung    ${EMPTY}    172/6A Lam Van Ben    Tan An    ${True}      vgmg      ${True}    maidead    maidead    maidead    ${True}
    ${result1}   Verify Notification    ${driver}    Email Address does not appear to be valid!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}    Verify Notification    ${driver}     Email Address does not appear to be valid!    //*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC Module 1-17
    [Documentation]    empty addres1
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    Trung Dung    gemthdddddu9i1234@gmail.com    ${EMPTY}    Tan An    ${True}      vgmg      ${True}    khongsuadau    khongsuadau    khongsuadau    ${True}
    ${result1}   Verify Notification    ${driver}    Address 1 must be between 3 and 128 characters!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}    Verify Notification    ${driver}     Address 1 must be between 3 and 128 characters!    //*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC Module 1-18
    [Documentation]    empty City
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    Trung Dung    colene1234@gmail.com    172/6A Lam Van Ben    ${EMPTY}   ${True}      vgmg      ${True}    colenne    colenne    colenne    ${True}
    ${result1}   Verify Notification    ${driver}    City must be between 3 and 128 characters!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}    Verify Notification    ${driver}     City must be between 3 and 128 characters!    //*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC Module 1-19
    [Documentation]    empty zip code
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    Trung Dung    gemkhonghoc55631234@gmail.com    172/6A Lam Van Ben    Tan An    ${True}      ${EMPTY}      ${True}    metquahuhu    metquahuhu    metquahuhu    ${True}
    ${result1}   Verify Notification    ${driver}    Zip/postal code must be between 3 and 10 characters!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}    Verify Notification    ${driver}     Zip/postal code must be between 3 and 10 characters!    //*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC Module 1-20
    [Documentation]    empty country
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    Trung Dung    gem8864@gmail.com    172/6A Lam Van Ben    Tan An    ${False}      vgmg      ${False}    gem326    gem326    gem326    ${True}
    ${result1}   Verify Notification    ${driver}    Please select a country!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}    Verify Notification    ${driver}     Please select a country!    //*[@id="AccountFrm"]/div[2]/fieldset/div[7]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC Module 1-21
    [Documentation]    empty login name
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    Trung Dung    gem4416@gmail.com    172/6A Lam Van Ben    Tan An    ${True}      vgmg      ${True}    ${EMPTY}    gem428    gem428    ${True}
    ${result1}   Verify Notification    ${driver}    Login name must be alphanumeric only and between 5 and 64 characters!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}    Verify Notification    ${driver}     Login name must be alphanumeric only and between 5 and 64 characters!    //*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC Module 1-22
    [Documentation]    empty password
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    Trung Dung    gem9981@gmail.com    172/6A Lam Van Ben    Tan An    ${True}      vgmg      ${True}    gem9981    ${EMPTY}    ${EMPTY}    ${True}
    ${result1}   Verify Notification    ${driver}    Password must be between 4 and 20 characters!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}    Verify Notification    ${driver}     Password must be between 4 and 20 characters!    //*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC Module 1-23
    [Documentation]    wrong pass confirm
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    Trung Dung    gem6636@gmail.com    172/6A Lam Van Ben    Tan An    ${True}      vgmg      ${True}    gemhehe    gemhehe    ${EMPTY}    ${True}
    ${result1}   Verify Notification    ${driver}    Password confirmation does not match password!    //*[@id="maincontainer"]/div/div[1]/div/div[1]
    ${result2}    Verify Notification    ${driver}     Password confirmation does not match password!    //*[@id="AccountFrm"]/div[3]/fieldset/div[3]/span
    Should Be True    ${result1}
    Should Be True    ${result2}
    Close    ${driver}

TC Module 1-24
    [Documentation]    not click privacy policy
    ${driver}    Open    https://automationteststore.com/
    #click register or login
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    #click continue in register
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    Input Register    ${driver}    Nguyen    Trung Dung    gemvadead@gmail.com    172/6A Lam Van Ben    Tan An    ${True}      vgmg      ${True}    hihihihihi    gemvadead    gemvadead    ${False}
    ${result}    Verify Notification    ${driver}     Error: You must agree to the Privacy Policy!    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Be True    ${result}
    Close    ${driver}