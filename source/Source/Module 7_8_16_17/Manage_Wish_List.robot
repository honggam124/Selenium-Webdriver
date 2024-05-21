*** Settings ***
Library           SeleniumLibrary
Library           module.py
Library           BuiltIn
Library           Collections
Library           String

*** Test Cases ***
################################################## VIEW #############################################################

TC1: Go My Wish List Page click symbol in account page
    ${driver}    Open
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/account
    Should be true    ${check}
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/ul/li[4]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/wishlist
    Should be true    ${check}
    Close    ${driver}

TC2: Go My Wish List Page click "My wish list" in account page
    ${driver}    Open
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/account
    Should be true    ${check}
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[2]/div[1]/div/ul/li[2]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/wishlist
    Should be true    ${check}
    Close    ${driver}

TC3: Go My Wish List Page click "My wish list" in dropdown on navbar
    ${driver}    Open
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/account
    Should be true    ${check}
    Hover Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/ul/li[2]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/wishlist
    Should be true    ${check}
    Close    ${driver}

################################################## ADD #############################################################

TC4: Add product to my wish list
    ${driver}    Open
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    GiangN0507    GiangN0507
    ${driver}    Click Element ByXpath    ${driver}    /html/body/div/header/div[1]/div/div[1]/a
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="block_frame_latest_1770"]/div/div[2]/div[1]/div/a
    ${name_product}    Get Name Product    ${driver}
    Open Wish List    ${driver}
    Remove From Wish List    ${driver}    ${name_product}
    sleep    2s
    ${names_before}    Get Names In Wishlist    ${driver}
    ${driver}    Click Element ByXpath    ${driver}    /html/body/div/header/div[1]/div/div[1]/a
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="block_frame_latest_1770"]/div/div[2]/div[1]/div/a
    ${name_product}    Get Name Product    ${driver}
    Add To Wish List    ${driver}
    Open Wish List    ${driver}
    ${added}    Check Add    ${driver}    ${name_product}
    should be true    ${added}
    ${names_after}    Get Names In Wishlist    ${driver}
    Should not be equal    ${names_before}    ${names_after}
    Close    ${driver}

################################################## REMOVE #############################################################

TC5: Remove product from my wish list
    ${driver}    Open
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    GiangN0507    GiangN0507
    ${driver}    Click Element ByXpath    ${driver}    /html/body/div/header/div[1]/div/div[1]/a
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="block_frame_featured_1769"]/div/div[2]/div[1]/div/a
    ${name_product}    Get Name Product    ${driver}
    Add To Wish List    ${driver}
    Open Wish List    ${driver}
    ${names_before}    Get Names In Wishlist    ${driver}
    Remove From Wish List    ${driver}    ${name_product}
    sleep    3s
    ${names_after}    Get Names In Wishlist    ${driver}
    Should not be equal    ${names_before}    ${names_after}
    Should not contain    ${names_after}    ${name_product}
    Close    ${driver}

TC6: Remove product from my wish list in detail page
    ${driver}    Open
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    GiangN0507    GiangN0507
    ${driver}    Click Element ByXpath    ${driver}    /html/body/div/header/div[1]/div/div[1]/a
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="block_frame_featured_1769"]/div/div[2]/div[1]/div/a
    ${name_product}    Get Name Product    ${driver}
    Add To Wish List    ${driver}
    Open Wish List    ${driver}
    ${names_before}    Get Names In Wishlist    ${driver}
    ${driver}    Click Element ByXpath    ${driver}    /html/body/div/header/div[1]/div/div[1]/a
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="block_frame_featured_1769"]/div/div[2]/div[1]/div/a
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="product"]/fieldset/div[5]/a[1]
    Open Wish List    ${driver}
    ${names_after}    Get Names In Wishlist    ${driver}
    Should not be equal    ${names_before}    ${names_after}
    Should not contain    ${names_after}    ${name_product}
    Close    ${driver}
