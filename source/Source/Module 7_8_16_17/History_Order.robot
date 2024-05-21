*** Settings ***
Library           SeleniumLibrary
Library           module.py
Library           BuiltIn
Library           Collections
Library           String

*** Test Cases ***
################################################## VIEW #############################################################

TC1: View list order by click icon
    ${driver}    Open
    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/account
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[5]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/history
    Should be true    ${check}
    Close    ${driver}

TC2: View list order by click "Order history"
    ${driver}    Open
    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/account
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[2]/div[1]/div/ul/li[6]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/history
    Should be true    ${check}
    Close    ${driver}

TC3: View list order by click setting in "Order history"
    ${driver}    Open
    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/account
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div/div[2]/div/div[1]/div/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/history
    Should be true    ${check}
    Close    ${driver}

TC4: View list order by click on navbar
    ${driver}    Open
    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/account
    Should be true    ${check}
    Hover Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/a
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[2]/ul/li[1]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/history
    Should be true    ${check}
    Close    ${driver}

TC4: View a random detail order
    ${driver}    Open
    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    Input Login    ${driver}    GiangN0507    GiangN0507
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[5]/a
    ${index}    Get Random number    19
    ${res}    View Detail Order    ${driver}    ${index}
    Should be True    ${res}
    Close    ${driver}

*** Keywords ***
Get Random number
    [Arguments]    ${n}
    ${a}    Convert To Integer    ${n}
    ${random_number}    Evaluate    random.randint(0, ${a-1})
    RETURN    ${random_number}
