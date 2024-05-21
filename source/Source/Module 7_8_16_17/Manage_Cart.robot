*** Settings ***
Library           SeleniumLibrary
Library           BuiltIn
Library           module.py
Library           Collections
Library           String

*** Test Cases ***
################################################## VIEW #############################################################

TC1: Go Shopping Cart Page in navbar
    ${driver}    Open
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[3]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/cart
    Should be true    ${check}
    Close    ${driver}

TC2: Go Shopping Cart Page in dropdown
    ${driver}    Open
    ${driver}    Click Element ByXpath    ${driver}    /html/body/div/header/div[2]/div/div[3]/ul/li/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/cart
    Should be true    ${check}
    Close    ${driver}

TC3: Go Shopping Cart Page in dropdown hover
    ${driver}    Open
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a
    ${driver}    Hover Element ByXpath    ${driver}    /html/body/div/header/div[2]/div/div[3]/ul/li
    ${is_visiable}    Check Visibility    ${driver}    /html/body/div/header/div[2]/div/div[3]/ul/li/ul
    Should be true    ${is_visiable}
    ${driver}    Click Element ByXpath    ${driver}    /html/body/div/header/div[2]/div/div[3]/ul/li/ul/li/div[2]/div[1]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/cart
    Should be true    ${check}
    Close    ${driver}

################################################## ADD #############################################################

TC4: Click icon - Add one product in FEATURED
    ${driver}    Open
    ${section_id}    Set Variable    featured
    ${products}    Find Soldout    ${driver}    ${section_id}
    ${new_products}    Create List
    FOR    ${element}    IN RANGE    4
        Run Keyword If    ${element} not in ${products}    Append To List    ${new_products}    ${element}
    END
    FOR    ${element}    IN    @{new_products}
        ${element_str}    Convert To String    ${element}
        ${add_item_1}    Add By Icon    ${driver}    ${section_id}    ${element_str}    https://automationteststore.com/    1
        Run Keyword And Continue On Failure    Should Be Equal    ${add_item_1}    OK
        Close    ${driver}
        ${driver}    Open
    END
    Close    ${driver}

TC5: Click icon - Add one product in LATEST PRODUCTS
    ${driver}    Open
    ${section_id}    Set Variable    latest
    ${products}    Find Soldout    ${driver}    ${section_id}
    ${new_products}    Create List
    FOR    ${element}    IN RANGE    4
        Run Keyword If    ${element} not in ${products}    Append To List    ${new_products}    ${element}
    END
    FOR    ${element}    IN    @{new_products}
        ${element_str}    Convert To String    ${element}
        ${add_item_1}    Add By Icon    ${driver}    ${section_id}    ${element_str}    https://automationteststore.com/    1
        Run Keyword And Continue On Failure    Should Be Equal    ${add_item_1}    OK
        Close    ${driver}
        ${driver}    Open
    END
    Close    ${driver}

TC6: Click icon - Add one product in BESTSELLERS
    ${driver}    Open
    ${section_id}    Set Variable    bestseller
    ${products}    Find Soldout    ${driver}    ${section_id}
    ${new_products}    Create List
    FOR    ${element}    IN RANGE    4
        Run Keyword If    ${element} not in ${products}    Append To List    ${new_products}    ${element}
    END
    FOR    ${element}    IN    @{new_products}
        ${element_str}    Convert To String    ${element}
        ${add_item_1}    Add By Icon    ${driver}    ${section_id}    ${element_str}    https://automationteststore.com/    1
        Run Keyword And Continue On Failure    Should Be Equal    ${add_item_1}    OK
        Close    ${driver}
        ${driver}    Open
    END
    Close    ${driver}

TC7: Click icon - Add one product in SPECIALS
    ${driver}    Open
    ${section_id}    Set Variable    special
    ${products}    Find Soldout    ${driver}    ${section_id}
    ${new_products}    Create List
    FOR    ${element}    IN RANGE    4
        Run Keyword If    ${element} not in ${products}    Append To List    ${new_products}    ${element}
    END
    FOR    ${element}    IN    @{new_products}
        ${element_str}    Convert To String    ${element}
        ${add_item_1}    Add By Icon    ${driver}    ${section_id}    ${element_str}    https://automationteststore.com/    1
        Run Keyword And Continue On Failure    Should Be Equal    ${add_item_1}    OK
        Close    ${driver}
        ${driver}    Open
    END
    Close    ${driver}

TC8: Click icon - Add one product in special page
    ${driver}    Open
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[1]/a
    ${section_id}    Set Variable    maincontainer
    ${products}    Find Soldout    ${driver}    ${section_id}
    ${new_products}    Create List
    FOR    ${element}    IN RANGE    8
        Run Keyword If    ${element} not in ${products}    Append To List    ${new_products}    ${element}
    END
    FOR    ${element}    IN    @{new_products}
        ${element_str}    Convert To String    ${element}
        ${add_item_1}    Add By Icon    ${driver}    ${section_id}    ${element_str}    https://automationteststore.com/index.php?rt=product/special    1
        Run Keyword And Continue On Failure    Should Be Equal    ${add_item_1}    OK
        Close    ${driver}
        ${driver}    Open
        ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[1]/a
    END
    Close    ${driver}

TC9: Detail page - Add one product in FEATURED
    ${driver}    Open
    ${section_id}    Set Variable    featured
    ${product_sold_out}    Find Soldout    ${driver}    ${section_id}
    ${product_call}    Find Call To Order    ${driver}    ${section_id}
    ${product_not_sold_out}    Create List
    FOR    ${element}    IN RANGE    4
        Run Keyword If    ${element} not in ${product_call} and ${element} not in ${product_sold_out}    Append To List    ${product_not_sold_out}    ${element}
    END
    FOR    ${element}    IN    @{product_not_sold_out}
        ${element_str}    Convert To String    ${element}
        ${add_item}    Add To Cart Details Page    ${driver}    ${section_id}    ${element}    1
        Run Keyword And Continue On Failure    Should Be Equal    ${add_item}    OK
        Close    ${driver}
        ${driver}    Open
    END
    Close    ${driver}

TC10: Detail page - Add one product in LATEST PRODUCTS
    ${driver}    Open
    ${section_id}    Set Variable    latest
    ${product_sold_out}    Find Soldout    ${driver}    ${section_id}
    ${product_call}    Find Call To Order    ${driver}    ${section_id}
    ${product_not_sold_out}    Create List
    FOR    ${element}    IN RANGE    4
        Run Keyword If    ${element} not in ${product_call} and ${element} not in ${product_sold_out}    Append To List    ${product_not_sold_out}    ${element}
    END
    FOR    ${element}    IN    @{product_not_sold_out}
        ${element_str}    Convert To String    ${element}
        ${add_item}    Add To Cart Details Page    ${driver}    ${section_id}    ${element}    1
        Run Keyword And Continue On Failure    Should Be Equal    ${add_item}    OK
        Close    ${driver}
        ${driver}    Open
    END
    Close    ${driver}

TC11: Detail page - Add one product in BESTSELLERS
    ${driver}    Open
    ${section_id}    Set Variable    bestseller
    ${product_sold_out}    Find Soldout    ${driver}    ${section_id}
    ${product_call}    Find Call To Order    ${driver}    ${section_id}
    ${product_not_sold_out}    Create List
    FOR    ${element}    IN RANGE    4
        Run Keyword If    ${element} not in ${product_call} and ${element} not in ${product_sold_out}    Append To List    ${product_not_sold_out}    ${element}
    END
    FOR    ${element}    IN    @{product_not_sold_out}
        ${element_str}    Convert To String    ${element}
        ${add_item}    Add To Cart Details Page    ${driver}    ${section_id}    ${element}    1
        Run Keyword And Continue On Failure    Should Be Equal    ${add_item}    OK
        Close    ${driver}
        ${driver}    Open
    END
    Close    ${driver}

TC12: Detail page - Add one product in SPECIALS
    ${driver}    Open
    ${section_id}    Set Variable    special
    ${product_sold_out}    Find Soldout    ${driver}    ${section_id}
    ${product_call}    Find Call To Order    ${driver}    ${section_id}
    ${product_not_sold_out}    Create List
    FOR    ${element}    IN RANGE    4
        Run Keyword If    ${element} not in ${product_call} and ${element} not in ${product_sold_out}    Append To List    ${product_not_sold_out}    ${element}
    END
    FOR    ${element}    IN    @{product_not_sold_out}
        ${element_str}    Convert To String    ${element}
        ${add_item}    Add To Cart Details Page    ${driver}    ${section_id}    ${element}    1
        Run Keyword And Continue On Failure    Should Be Equal    ${add_item}    OK
        Close    ${driver}
        ${driver}    Open
    END
    Close    ${driver}

TC13: Detail page - Add one product in special page
    ${driver}    Open
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[1]/a
    ${section_id}    Set Variable    maincontainer
    ${product_sold_out}    Find Soldout    ${driver}    ${section_id}
    ${product_not_sold_out}    Create List
    FOR    ${element}    IN RANGE    8
        Run Keyword If    ${element} not in ${product_sold_out}    Append To List    ${product_not_sold_out}    ${element}
    END
    FOR    ${element}    IN    @{product_not_sold_out}
        ${element_str}    Convert To String    ${element}
        ${add_item}    Add To Cart Details Page    ${driver}    ${section_id}    ${element}    1
        Run Keyword And Continue On Failure    Should Be Equal    ${add_item}    OK
        Close    ${driver}
        ${driver}    Open
        ${driver}    Click Element ByXpath    ${driver}    //*[@id="main_menu_top"]/li[1]/a
    END
    Close    ${driver}

TC14: Detail page - Add one product Apparel & accessories
    ${driver}    Open
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="categorymenu"]/nav/ul/li[2]/a
    ${section_id}    Set Variable    maincontainer
    ${product_sold_out}    Find Soldout    ${driver}    ${section_id}
    ${product_call}    Find Call To Order    ${driver}    ${section_id}
    ${product_not_sold_out}    Create List
    FOR    ${element}    IN RANGE    8
        Run Keyword If    ${element} not in ${product_call} and ${element} not in ${product_sold_out}    Append To List    ${product_not_sold_out}    ${element}
    END
    log    ${product_not_sold_out}
    FOR    ${element}    IN    @{product_not_sold_out}
        ${element_str}    Convert To String    ${element}
        ${add_item}    Add To Cart Details Page    ${driver}    ${section_id}    ${element}    1
        Run Keyword And Continue On Failure    Should Be Equal    ${add_item}    OK
        Close    ${driver}
        ${driver}    Open
        ${driver}    Click Element ByXpath    ${driver}    //*[@id="categorymenu"]/nav/ul/li[2]/a
    END
    Close    ${driver}

TC15: Detail page - Add one product Makeup
    ${driver}    Open
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="categorymenu"]/nav/ul/li[3]/a
    ${section_id}    Set Variable    maincontainer
    ${product_sold_out}    Find Soldout    ${driver}    ${section_id}
    ${product_call}    Find Call To Order    ${driver}    ${section_id}
    ${product_not_sold_out}    Create List
    FOR    ${element}    IN RANGE    6
        Run Keyword If    ${element} not in ${product_call} and ${element} not in ${product_sold_out}    Append To List    ${product_not_sold_out}    ${element}
    END
    FOR    ${element}    IN    @{product_not_sold_out}
        ${element_str}    Convert To String    ${element}
        ${add_item}    Add To Cart Details Page    ${driver}    ${section_id}    ${element}    1
        Run Keyword And Continue On Failure    Should Be Equal    ${add_item}    OK
        Close Browser
        ${driver}    Open
        ${driver}    Click Element ByXpath    ${driver}    //*[@id="categorymenu"]/nav/ul/li[3]/a
    END
    Close    ${driver}

TC16: Detail page - Add one product Skincare
    ${driver}    Open
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="categorymenu"]/nav/ul/li[4]/a
    ${section_id}    Set Variable    maincontainer
    ${product_sold_out}    Find Soldout    ${driver}    ${section_id}
    ${product_call}    Find Call To Order    ${driver}    ${section_id}
    ${product_not_sold_out}    Create List
    FOR    ${element}    IN RANGE    5
        Run Keyword If    ${element} not in ${product_call} and ${element} not in ${product_sold_out}    Append To List    ${product_not_sold_out}    ${element}
    END
    FOR    ${element}    IN    @{product_not_sold_out}
        ${element_str}    Convert To String    ${element}
        ${add_item}    Add To Cart Details Page    ${driver}    ${section_id}    ${element}    1
        Run Keyword And Continue On Failure    Should Be Equal    ${add_item}    OK
        Close    ${driver}
        ${driver}    Open
        ${driver}    Click Element ByXpath    ${driver}    //*[@id="categorymenu"]/nav/ul/li[4]/a
    END
    Close    ${driver}

TC17: Detail page - Add one product Fragrance
    ${driver}    Open
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="categorymenu"]/nav/ul/li[5]/a
    ${section_id}    Set Variable    maincontainer
    ${product_sold_out}    Find Soldout    ${driver}    ${section_id}
    ${product_call}    Find Call To Order    ${driver}    ${section_id}
    ${product_not_sold_out}    Create List
    FOR    ${element}    IN RANGE    9
        Run Keyword If    ${element} not in ${product_call} and ${element} not in ${product_sold_out}    Append To List    ${product_not_sold_out}    ${element}
    END
    log    ${product_not_sold_out}
    FOR    ${element}    IN    @{product_not_sold_out}
        ${element_str}    Convert To String    ${element}
        ${add_item}    Add To Cart Details Page    ${driver}    ${section_id}    ${element}    1
        Run Keyword And Continue On Failure    Should Be Equal    ${add_item}    OK
        Close    ${driver}
        ${driver}    Open
        ${driver}    Click Element ByXpath    ${driver}    //*[@id="categorymenu"]/nav/ul/li[5]/a
    END
    Close    ${driver}

TC18: Detail page - Add one product Men
    ${driver}    Open
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="categorymenu"]/nav/ul/li[6]/a
    ${section_id}    Set Variable    maincontainer
    ${product_sold_out}    Find Soldout    ${driver}    ${section_id}
    ${product_call}    Find Call To Order    ${driver}    ${section_id}
    ${product_not_sold_out}    Create List
    FOR    ${element}    IN RANGE    4
        Run Keyword If    ${element} not in ${product_call} and ${element} not in ${product_sold_out}    Append To List    ${product_not_sold_out}    ${element}
    END
    FOR    ${element}    IN    @{product_not_sold_out}
        ${element_str}    Convert To String    ${element}
        ${add_item}    Add To Cart Details Page    ${driver}    ${section_id}    ${element}    1
        Run Keyword And Continue On Failure    Should Be Equal    ${add_item}    OK
        Close    ${driver}
        ${driver}    Open
        ${driver}    Click Element ByXpath    ${driver}    //*[@id="categorymenu"]/nav/ul/li[6]/a
    END
    Close    ${driver}

TC19: Detail page - Add one product Haircare
    ${driver}    Open
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="categorymenu"]/nav/ul/li[7]/a
    ${section_id}    Set Variable    maincontainer
    ${product_sold_out}    Find Soldout    ${driver}    ${section_id}
    ${product_call}    Find Call To Order    ${driver}    ${section_id}
    ${product_not_sold_out}    Create List
    FOR    ${element}    IN RANGE    4
        Run Keyword If    ${element} not in ${product_call} and ${element} not in ${product_sold_out}    Append To List    ${product_not_sold_out}    ${element}
    END
    FOR    ${element}    IN    @{product_not_sold_out}
        ${element_str}    Convert To String    ${element}
        ${add_item}    Add To Cart Details Page    ${driver}    ${section_id}    ${element}    1
        Run Keyword And Continue On Failure    Should Be Equal    ${add_item}    OK
        Close    ${driver}
        ${driver}    Open
        ${driver}    Click Element ByXpath    ${driver}    //*[@id="categorymenu"]/nav/ul/li[7]/a
    END
    Close    ${driver}

TC20: Detail page - Add one product Book
    ${driver}    Open
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="categorymenu"]/nav/ul/li[8]/a
    ${section_id}    Set Variable    maincontainer
    ${product_sold_out}    Find Soldout    ${driver}    ${section_id}
    ${product_call}    Find Call To Order    ${driver}    ${section_id}
    ${product_not_sold_out}    Create List
    FOR    ${element}    IN RANGE    4
        Run Keyword If    ${element} not in ${product_call} and ${element} not in ${product_sold_out}    Append To List    ${product_not_sold_out}    ${element}
    END
    FOR    ${element}    IN    @{product_not_sold_out}
        ${element_str}    Convert To String    ${element}
        ${add_item}    Add To Cart Details Page    ${driver}    ${section_id}    ${element}    1
        Run Keyword And Continue On Failure    Should Be Equal    ${add_item}    OK
        Close    ${driver}
        ${driver}    Open
        ${driver}    Click Element ByXpath    ${driver}    //*[@id="categorymenu"]/nav/ul/li[8]/a
    END
    Close    ${driver}

TC21: Add one product twice
    ${driver}    Open
    ${section_id}    Set Variable    latest
    ${product_sold_out}    Find Soldout    ${driver}    ${section_id}
    ${product_call}    Find Call To Order    ${driver}    ${section_id}
    ${product_not_sold_out}    Create List
    FOR    ${element}    IN RANGE    4
        Run Keyword If    ${element} not in ${product_call} and ${element} not in ${product_sold_out}    Append To List    ${product_not_sold_out}    ${element}
    END
    ${random_no}    Get Random    ${product_not_sold_out}
    ${res}    Add Twice    ${driver}    ${section_id}    ${random_no}    /html/body/div/header/div[1]/div/div[1]/a    2    2
    Should Be Equal    ${res}    OK
    Close    ${driver}

TC22: Add > 1 different product
    ${driver}    Open
    ${names_add}    Get Product Names In Section    ${driver}    latest
    ${quantity_add}    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${result_quanlity}    Get Quantity Cart    ${driver}
    Should Be Equal    ${names_add}    ${names_in_cart}
    Should Be Equal    ${quantity_add}    ${result_quanlity}
    Close    ${driver}

TC23: Add not out of stock product from wishlist page
    ${driver}    Open
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    giangH123    giangH123
    Open Home    ${driver}
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="block_frame_latest_1770"]/div/div[3]/div[1]/div/a
    ${name_product}    Get Name Product    ${driver}
    Open Cart    ${driver}
    Remove From Cart    ${driver}    ${name_product}
    ${name_before}    Get Names In Cart    ${driver}
    Open Home    ${driver}
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="block_frame_latest_1770"]/div/div[3]/div[1]/div/a
    Should not contain    ${name_before}    ${name_product}
    Add To Wish List    ${driver}
    Open Wish List    ${driver}
    Add To Cart In Wishlist    ${driver}    ${name_product}
    ${name_after}    Get Names In Cart    ${driver}
    Should not be equal    ${name_before}    ${name_after}
    Should contain    ${name_after}    ${name_product}
    Close    ${driver}

TC24: Add out of stock product in wishlist page
    ${driver}    Open
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    giangH123    giangH123
    Open Home    ${driver}
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="block_frame_featured_1769"]/div/div[2]/div[1]/div/a
    ${name_product}    Get Name Product    ${driver}
    Open Cart    ${driver}
    Remove From Cart    ${driver}    ${name_product}
    ${name_before}    Get Names In Cart    ${driver}
    Should not contain    ${name_before}    ${name_product}
    Open Home    ${driver}
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="block_frame_featured_1769"]/div/div[2]/div[1]/div/a
    Add To Wish List    ${driver}
    Open Wish List    ${driver}
    Add To Cart In Wishlist    ${driver}    ${name_product}
    ${name_after}    Get Names In Cart    ${driver}
    Should not be equal    ${name_before}    ${name_after}
    Should contain    ${name_after}    ${name_product}
    ${result}    Check Add Out Of Stocks    ${driver}
    Should be True    ${result}
    ${name_product_in_cart}    Check Out Of Stocks Name In Cart    ${driver}    ${name_product}
    Should be true    ${name_product_in_cart}
    Close    ${driver}

TC25: Add one limit quantity product in wishlist page
    ${driver}    Open
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    ${driver}    Input Login    ${driver}    giangH123    giangH123
    Open Home    ${driver}
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="block_frame_featured_1769"]/div/div[3]/div[1]/div/a
    ${name_product}    Get Name Product    ${driver}
    Open Cart    ${driver}
    Remove From Cart    ${driver}    ${name_product}
    ${name_before}    Get Names In Cart    ${driver}
    Should not contain    ${name_before}    ${name_product}
    Open Home    ${driver}
    ${driver}    Click Element ByXpath    ${driver}    //*[@id="block_frame_featured_1769"]/div/div[3]/div[1]/div/a
    Add To Wish List    ${driver}
    Open Wish List    ${driver}
    Add To Cart In Wishlist    ${driver}    ${name_product}
    ${res}    Check For Text    ${driver}    Allowed product's quantity is below minimum required. Quantity was set to minimum amount.
    ${result}    Check Add Out Of Stocks    ${driver}
    ${name_after}    Get Names In Cart    ${driver}
    Should not be equal    ${name_before}    ${name_after}
    Should contain    ${name_after}    ${name_product}
    Close    ${driver}

################################################## UPDATE #############################################################

TC26: Update random with amount> 1
    ${driver}    Open
    ${names_add}    Get Product Names In Section    ${driver}    latest
    ${is_added}    Click Icon Add To Cart    ${driver}    latest
    Should Be True    ${is_added}
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${result}=    Run Keyword And Return Status    Should Be Equal    ${names_add}    ${names_in_cart}
    Should Be True    ${result}
    ${amount_before}    Check Quantity Remove    ${driver}
    ${index}    Get Random number    ${amount_before}
    ${quantity_before}    Get Quantity Cart    ${driver}
    ${amount}    Set Variable    160
    ${name}    Update Random    ${driver}    ${index}    ${amount}
    Click update    ${driver}
    ${quantity_after}    Get Quantity Cart    ${driver}
    ${res}    Check Update    ${driver}    ${quantity_before}    ${quantity_after}    ${index}    ${amount}    ${name}
    should be true    ${res}
    Close    ${driver}

TC27: Update random with amount < 1
    ${driver}    Open
    ${names_add}    Get Product Names In Section    ${driver}    latest
    ${is_added}    Click Icon Add To Cart    ${driver}    latest
    Should Be True    ${is_added}
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${result}=    Run Keyword And Return Status    Should Be Equal    ${names_add}    ${names_in_cart}
    Should Be True    ${result}
    ${amount_before}    Check Quantity Remove    ${driver}
    ${index}    Get Random number    ${amount_before}
    ${quantity_before}    Get Quantity Cart    ${driver}
    ${amount}    Set Variable    -6
    ${name}    Update Random    ${driver}    ${index}    ${amount}
    Click update    ${driver}
    ${quantity_after}    Get Quantity Cart    ${driver}
    ${res}    Check Update    ${driver}    ${quantity_before}    ${quantity_after}    ${index}    ${amount}    ${name}
    should be true    ${res}
    Close    ${driver}

TC28: Update random with amount is not a number
    ${driver}    Open
    ${names_add}    Get Product Names In Section    ${driver}    latest
    ${is_added}    Click Icon Add To Cart    ${driver}    latest
    Should Be True    ${is_added}
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${result}=    Run Keyword And Return Status    Should Be Equal    ${names_add}    ${names_in_cart}
    Should Be True    ${result}
    ${amount_before}    Check Quantity Remove    ${driver}
    ${index}    Get Random number    ${amount_before}
    ${quantity_before}    Get Quantity Cart    ${driver}
    ${amount}    Set Variable    hihi
    ${name}    Update Random    ${driver}    ${index}    ${amount}
    Click update    ${driver}
    ${quantity_after}    Get Quantity Cart    ${driver}
    ${res}    Check Update    ${driver}    ${quantity_before}    ${quantity_after}    ${index}    ${amount}    ${name}
    should be true    ${res}
    Close    ${driver}

TC29: Update > limit quantity
    ${driver}    Open
    ${section_id}    Set Variable    featured
    ${add_item_1}    Add By Icon    ${driver}    ${section_id}    2    https://automationteststore.com/    1
    Should Be Equal    ${add_item_1}    OK
    ${res}    Update Limit    ${driver}    90
    should be true    ${res}
    Close    ${driver}

TC30: Update < limit quantity
    ${driver}    Open
    ${section_id}    Set Variable    featured
    ${add_item_1}    Add By Icon    ${driver}    ${section_id}    2    https://automationteststore.com/    1
    Should Be Equal    ${add_item_1}    OK
    ${res}    Update Limit    ${driver}    1
    should be true    ${res}
    Close    ${driver}

################################################## REMOVE #############################################################

TC31: Remove random product from cart
    ${driver}    Open
    ${names_add}    Get Product Names In Section    ${driver}    latest
    ${is_added}    Click Icon Add To Cart    ${driver}    latest
    Should Be True    ${is_added}
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${result}=    Run Keyword And Return Status    Should Be Equal    ${names_add}    ${names_in_cart}
    Should Be True    ${result}
    ${amount_before}    Check Quantity Remove    ${driver}
    ${index}    Get Random number    ${amount_before}
    ${name}    Remove One Random    ${driver}    ${index}
    ${amount_after}    Check Quantity Remove    ${driver}
    ${names_in_cart_after}    Get Names In Cart    ${driver}
    Should not be equal    ${amount_before}    ${amount_after}
    Should not be equal    ${names_in_cart}    ${names_in_cart_after}
    Should not contain    ${names_in_cart_after}    ${name}
    Close    ${driver}

TC32: Remove all product from cart
    ${driver}    Open
    ${names_add}    Get Product Names In Section    ${driver}    latest
    ${is_added}    Click Icon Add To Cart    ${driver}    latest
    Should Be True    ${is_added}
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${result}=    Run Keyword And Return Status    Should Be Equal    ${names_add}    ${names_in_cart}
    Should Be True    ${result}
    Remove All In Cart    ${driver}
    ${amount_after}    Check Quantity Remove    ${driver}
    Should be equal    ${amount_after}    ${0}
    Close    ${driver}

TC33: Check out of stocks (out of stock product)
    ${driver}    Open
    @{product_sold_out}    Create List
    ${section_id}    Set Variable    maincontainer
    ${categories}    Create List    //*[@id="main_menu_top"]/li[1]/a    //*[@id="categorymenu"]/nav/ul/li[2]/a    //*[@id="categorymenu"]/nav/ul/li[2]/div/ul[1]/li[1]/a    //*[@id="categorymenu"]/nav/ul/li[2]/div/ul[1]/li[2]/a    //*[@id="categorymenu"]/nav/ul/li[3]/div/ul[1]/li[1]/a    //*[@id="categorymenu"]/nav/ul/li[3]/div/ul[1]/li[2]/a    //*[@id="categorymenu"]/nav/ul/li[3]/div/ul[1]/li[3]/a    //*[@id="categorymenu"]/nav/ul/li[3]/div/ul[1]/li[4]/a    //*[@id="categorymenu"]/nav/ul/li[3]/div/ul[1]/li[5]/a    //*[@id="categorymenu"]/nav/ul/li[3]/div/ul[1]/li[6]/a    //*[@id="categorymenu"]/nav/ul/li[4]/div/ul[1]/li[1]/a    //*[@id="categorymenu"]/nav/ul/li[4]/div/ul[1]/li[2]/a    //*[@id="categorymenu"]/nav/ul/li[4]/div/ul[1]/li[3]/a    //*[@id="categorymenu"]/nav/ul/li[4]/div/ul[1]/li[4]/a    //*[@id="categorymenu"]/nav/ul/li[4]/div/ul[1]/li[5]/a
    ...    //*[@id="categorymenu"]/nav/ul/li[5]/div/ul[1]/li[1]/a    //*[@id="categorymenu"]/nav/ul/li[5]/div/ul[1]/li[2]/a    //*[@id="categorymenu"]/nav/ul/li[6]/div/ul[1]/li[1]/a    //*[@id="categorymenu"]/nav/ul/li[6]/div/ul[1]/li[2]/a    //*[@id="categorymenu"]/nav/ul/li[6]/div/ul[1]/li[3]/a    //*[@id="categorymenu"]/nav/ul/li[6]/div/ul[1]/li[4]/a    //*[@id="categorymenu"]/nav/ul/li[7]/div/ul[1]/li[1]/a    //*[@id="categorymenu"]/nav/ul/li[7]/div/ul[1]/li[2]/a    //*[@id="categorymenu"]/nav/ul/li[8]/div/ul[1]/li[1]/a    //*[@id="categorymenu"]/nav/ul/li[8]/div/ul[1]/li[2]/a
    FOR    ${category}    IN    @{categories}
        ${driver}    Click Element ByXpath    ${driver}    ${category}
        ${section_id}    Set Variable    maincontainer
        ${product_sold_out}    Find Soldout    ${driver}    ${section_id}
        FOR    ${element}    IN    @{product_sold_out}
            ${element_str}    Convert To String    ${element}
            ${add_item}    Check Out Of Stock Detail Page    ${driver}    ${section_id}    ${element}
            Run Keyword And Continue On Failure    Should Be True    ${add_item}
            Close    ${driver}
            ${driver}    Open
            ${driver}    Click Element ByXpath    ${driver}    ${category}
        END
    END
    Close    ${driver}

TC34: Check Dropdown And Sub-Total
    ${driver}    Open
    ${names_add}    Get Product Names In Section    ${driver}    latest
    ${quantity_add}    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${result_quanlity}    Get Quantity Cart    ${driver}
    Should Be Equal    ${names_add}    ${names_in_cart}
    Should Be Equal    ${quantity_add}    ${result_quanlity}
    ${check}    Check Dropdown And Total    ${driver}
    Should Be True    ${check}
    Close    ${driver}

*** Keywords ***
Get Random
    [Arguments]    ${list}
    ${random_element}    Evaluate    random.choice($list)    random
    RETURN    ${random_element}

Get Random number
    [Arguments]    ${n}
    ${a}    Convert To Integer    ${n}
    ${random_number}    Evaluate    random.randint(0, ${a-1})
    RETURN    ${random_number}
