*** Settings ***
Library           SeleniumLibrary
Library           module.py
Library           BuiltIn
Library           Collections
Library           String

*** Test Cases ***
TC1: Login and Payment successful start in checkout page
    ${driver}    Open
    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    Input Login    ${driver}    GiangN0507    GiangN0507
    Remove All In Cart    ${driver}
    Open Home    ${driver}
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${quantity_in_cart}    Get Quantity Cart    ${driver}
    ${total_in_cart}    Get Total Cart    ${driver}
    ${res}    Open Checkout    ${driver}
    Should be true    ${res}
    ${names_in_checkout}    Get Names Checkout    ${driver}
    ${quantity_in_checkout}    Get Quantity Checkout    ${driver}
    ${total_in_checkout}    Get Total Checkout    ${driver}
    ${res}    Check Name Quantity Total    ${names_in_cart}    ${quantity_in_cart}    ${total_in_cart}    ${names_in_checkout}    ${quantity_in_checkout}    ${total_in_checkout}
    Should be equal    ${res}    OK
    Click Confirm    ${driver}
    sleep    5s
    ${confirm}    Check Confirm    ${driver}
    Should be true    ${confirm}
    Close    ${driver}

TC2: Login and Payment successful start in cart page with the top checkout btn
    ${driver}    Open
    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    Input Login    ${driver}    GiangN0507    GiangN0507
    Remove All In Cart    ${driver}
    Open Home    ${driver}
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${quantity_in_cart}    Get Quantity Cart    ${driver}
    ${total_in_cart}    Get Total Cart    ${driver}
    Click Checkout Top In Cart    ${driver}
    ${res}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${res}
    ${names_in_checkout}    Get Names Checkout    ${driver}
    ${quantity_in_checkout}    Get Quantity Checkout    ${driver}
    ${total_in_checkout}    Get Total Checkout    ${driver}
    ${res}    Check Name Quantity Total    ${names_in_cart}    ${quantity_in_cart}    ${total_in_cart}    ${names_in_checkout}    ${quantity_in_checkout}    ${total_in_checkout}
    Should be equal    ${res}    OK
    Click Confirm    ${driver}
    sleep    5s
    ${confirm}    Check Confirm    ${driver}
    Should be true    ${confirm}
    Close    ${driver}

TC3: Login and Payment successful start in cart page with the down checkout btn
    ${driver}    Open
    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    Input Login    ${driver}    GiangN0507    GiangN0507
    Remove All In Cart    ${driver}
    Open Home    ${driver}
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${quantity_in_cart}    Get Quantity Cart    ${driver}
    ${total_in_cart}    Get Total Cart    ${driver}
    Click Checkout Down In Cart    ${driver}
    ${res}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${res}
    ${names_in_checkout}    Get Names Checkout    ${driver}
    ${quantity_in_checkout}    Get Quantity Checkout    ${driver}
    ${total_in_checkout}    Get Total Checkout    ${driver}
    ${res}    Check Name Quantity Total    ${names_in_cart}    ${quantity_in_cart}    ${total_in_cart}    ${names_in_checkout}    ${quantity_in_checkout}    ${total_in_checkout}
    Should be equal    ${res}    OK
    Click Confirm    ${driver}
    sleep    5s
    ${confirm}    Check Confirm    ${driver}
    Should be true    ${confirm}
    Close    ${driver}

TC4: Login and Payment with empty cart
    ${driver}    Open
    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    Input Login    ${driver}    GiangN0507    GiangN0507
    Remove All In Cart    ${driver}
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${result}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/cart
    Should be true    ${result}
    Close    ${driver}

TC5: Login and Payment with out of stocks product in cart with the top checkout btn
    ${driver}    Open
    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    Input Login    ${driver}    giangH123    giangH123
    ${result}    Check Add Out Of Stocks    ${driver}
    Should be True    ${result}
    Click Checkout Top In Cart    ${driver}
    ${res}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/cart
    Should be true    ${res}
    Close    ${driver}

TC6: Login and Payment with out of stocks product in cart with the down checkout btn
    ${driver}    Open
    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    Input Login    ${driver}    giangH123    giangH123
    ${result}    Check Add Out Of Stocks    ${driver}
    Should be True    ${result}
    Click Checkout Down In Cart    ${driver}
    ${res}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/cart
    Should be true    ${res}
    Close    ${driver}

TC7: Login and Payment with out of stocks product in cart start in checkout page
    ${driver}    Open
    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    Input Login    ${driver}    giangH123    giangH123
    ${result}    Check Add Out Of Stocks    ${driver}
    Should be True    ${result}
    Open Checkout    ${driver}
    ${res}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/cart
    Should be true    ${res}
    Close    ${driver}

TC8: Check alert when input wrong coupon in cart
    ${driver}    Open
    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    Input Login    ${driver}    GiangN0507    GiangN0507
    Remove All In Cart    ${driver}
    Open Home    ${driver}
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    Open Cart    ${driver}
    Input Coupon    ${driver}    abc
    sleep    5s
    ${result}    Check Alert Input Coupon    ${driver}
    Should be true    ${result}
    Close    ${driver}

TC9: Check alert when delete coupon in cart
    ${driver}    Open
    Click Element ByXpath    ${driver}    //*[@id="customer_menu_top"]/li/a
    Input Login    ${driver}    GiangN0507    GiangN0507
    Remove All In Cart    ${driver}
    Open Home    ${driver}
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    Open Cart    ${driver}
    Input Coupon    ${driver}    abc
    sleep    2s
    ${result}    Check Alert Remove Coupon    ${driver}
    Should be true    ${result}
    Close    ${driver}

TC10: Payment (RETURNING CUSTOMER) start in checkout page
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${quantity_in_cart}    Get Quantity Cart    ${driver}
    ${total_in_cart}    Get Total Cart    ${driver}
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    should be true    ${check}
    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    should be true    ${check}
    ${names_in_checkout}    Get Names Checkout    ${driver}
    ${quantity_in_checkout}    Get Quantity Checkout    ${driver}
    ${total_in_checkout}    Get Total Checkout    ${driver}
    ${res}    Check Name Quantity Total    ${names_in_cart}    ${quantity_in_cart}    ${total_in_cart}    ${names_in_checkout}    ${quantity_in_checkout}    ${total_in_checkout}
    Should be equal    ${res}    OK
    Click Confirm    ${driver}
    sleep    5s
    ${confirm}    Check Confirm    ${driver}
    Should be true    ${confirm}
    Close    ${driver}

TC11: Payment (I AM A NEW CUSTOMER - Register Account) start in cart page
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${quantity_in_cart}    Get Quantity Cart    ${driver}
    ${total_in_cart}    Get Total Cart    ${driver}
    Click Checkout Top In Cart    ${driver}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm_accountregister"]
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/create
    Should be true    ${check}
    Input Register    ${driver}    Zang    Nguyen    zangBC2@gmail.com    tdtu    HCM    Aberdeen    12J3    United Kingdom    zangBC2    zangBC2    zangBC2    True
    Click Element ByXpath    ${driver}    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    3s
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    should be true    ${check}
    ${names_in_checkout}    Get Names Checkout    ${driver}
    ${quantity_in_checkout}    Get Quantity Checkout    ${driver}
    ${total_in_checkout}    Get Total Checkout    ${driver}
    ${res}    Check Name Quantity Total    ${names_in_cart}    ${quantity_in_cart}    ${total_in_cart}    ${names_in_checkout}    ${quantity_in_checkout}    ${total_in_checkout}
    Should be equal    ${res}    OK
    Click Confirm    ${driver}
    sleep    5s
    ${confirm}    Check Confirm    ${driver}
    Should be true    ${confirm}
    Close    ${driver}

TC12: Payment (RETURNING CUSTOMER) start in cart page
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${quantity_in_cart}    Get Quantity Cart    ${driver}
    ${total_in_cart}    Get Total Cart    ${driver}
    Click Checkout Top In Cart    ${driver}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    should be true    ${check}
    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    should be true    ${check}
    ${names_in_checkout}    Get Names Checkout    ${driver}
    ${quantity_in_checkout}    Get Quantity Checkout    ${driver}
    ${total_in_checkout}    Get Total Checkout    ${driver}
    ${res}    Check Name Quantity Total    ${names_in_cart}    ${quantity_in_cart}    ${total_in_cart}    ${names_in_checkout}    ${quantity_in_checkout}    ${total_in_checkout}
    Should be equal    ${res}    OK
    Click Confirm    ${driver}
    sleep    5s
    ${confirm}    Check Confirm    ${driver}
    Should be true    ${confirm}
    Close    ${driver}

TC13: Payment (I AM A NEW CUSTOMER - Register Account) start in checkout page
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${quantity_in_cart}    Get Quantity Cart    ${driver}
    ${total_in_cart}    Get Total Cart    ${driver}
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[1]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/create
    Should be true    ${check}
    Input Register    ${driver}    Zang    Nguyen    zangBC3@gmail.com    tdtu    HCM    Aberdeen    12J3    United Kingdom    zangBC3    zangBC3    zangBC3    True
    Sleep    5s
    Click Element ByXpath    ${driver}    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    3s
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    should be true    ${check}
    ${names_in_checkout}    Get Names Checkout    ${driver}
    ${quantity_in_checkout}    Get Quantity Checkout    ${driver}
    ${total_in_checkout}    Get Total Checkout    ${driver}
    ${res}    Check Name Quantity Total    ${names_in_cart}    ${quantity_in_cart}    ${total_in_cart}    ${names_in_checkout}    ${quantity_in_checkout}    ${total_in_checkout}
    Should be equal    ${res}    OK
    Click Confirm    ${driver}
    sleep    5s
    ${confirm}    Check Confirm    ${driver}
    Should be true    ${confirm}
    Close    ${driver}

TC14: Payment (I AM A NEW CUSTOMER - Guest Checkout) with no shipping address
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${quantity_in_cart}    Get Quantity Cart    ${driver}
    ${total_in_cart}    Get Total Cart    ${driver}
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    ${info_payment}    Get Info Payment    ${driver}
    ${info_shipping}    Get Info Shipping    ${driver}
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    Sleep    5s
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_3
    Should be true    ${check}
    ${info_shipping_confirm}    Get Shipping    ${driver}
    ${info_payment_confirm}    Get Payment    ${driver}
    ${names_in_checkout}    Get Names Checkout    ${driver}
    ${quantity_in_checkout}    Get Quantity Checkout    ${driver}
    ${total_in_checkout}    Get Total Checkout    ${driver}
    ${res}    Check Name Quantity Total    ${names_in_cart}    ${quantity_in_cart}    ${total_in_cart}    ${names_in_checkout}    ${quantity_in_checkout}    ${total_in_checkout}
    Should be equal    ${res}    OK
    ${check}    Check Payment And Shipping    ${driver}    ${info_payment}    ${info_shipping}    ${info_payment_confirm}    ${info_shipping_confirm}
    Should be true    ${check}
    Click Confirm    ${driver}
    sleep    5s
    ${confirm}    Check Confirm    ${driver}
    Should be true    ${confirm}
    Close    ${driver}

TC15: No shipping address - Check not fill firstname
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    \    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    ${check}    Check For Text    ${driver}    First Name must be greater than 3 and less than 32 characters!
    Should be true    ${check}
    Close    ${driver}

TC16: No shipping address - Check not fill lastname
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    \    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    ${check}    Check For Text    ${driver}    Last Name must be greater than 3 and less than 32 characters!
    Should be true    ${check}
    Close    ${driver}

TC17: No shipping address - Check not fill email
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    \
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    ${check}    Check For Text    ${driver}    E-Mail Address does not appear to be valid!
    Should be true    ${check}
    Close    ${driver}

TC18: No shipping address - Check not fill address 1
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    \    HCM    Aberdeen    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    ${check}    Check For Text    ${driver}    Address 1 must be greater than 3 and less than 128 characters!
    Should be true    ${check}
    Close    ${driver}

TC19: No shipping address - Check not fill city
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    \    Aberdeen    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    ${check}    Check For Text    ${driver}    City must be greater than 3 and less than 128 characters!
    Should be true    ${check}
    Close    ${driver}

TC20: No shipping address - Check not fill region
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    \    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    ${check}    Check For Text    ${driver}    Please select a region / state!
    Should be true    ${check}
    Close    ${driver}

TC21: No shipping address - Check not fill zipcode
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    \    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    ${check}    Check For Text    ${driver}    Zip/postal code must be between 3 and 10 characters!
    Should be true    ${check}
    Close    ${driver}

TC22: No shipping address - Check not fill country
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    Choose Country    ${driver}
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    ${check}    Check For Text    ${driver}    Please select a country!
    Should be true    ${check}
    Close    ${driver}

TC23: Payment (I AM A NEW CUSTOMER - Guest Checkout) with shipping address
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${quantity_in_cart}    Get Quantity Cart    ${driver}
    ${total_in_cart}    Get Total Cart    ${driver}
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm_shipping_indicator"]
    Sleep    2s
    Input Shipping    ${driver}    Giang    Nguyen    BinhDai    Bentre    BenTre    2589K    VietNam
    ${info_payment}    Get Info Payment    ${driver}
    ${info_shipping}    Get Info Shipping    ${driver}
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    Sleep    5s
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_3
    Should be true    ${check}
    ${info_shipping_confirm}    Get Shipping    ${driver}
    ${info_payment_confirm}    Get Payment    ${driver}
    ${names_in_checkout}    Get Names Checkout    ${driver}
    ${quantity_in_checkout}    Get Quantity Checkout    ${driver}
    ${total_in_checkout}    Get Total Checkout    ${driver}
    ${res}    Check Name Quantity Total    ${names_in_cart}    ${quantity_in_cart}    ${total_in_cart}    ${names_in_checkout}    ${quantity_in_checkout}    ${total_in_checkout}
    Should be equal    ${res}    OK
    ${check}    Check Payment And Shipping    ${driver}    ${info_payment}    ${info_shipping}    ${info_payment_confirm}    ${info_shipping_confirm}
    Should be true    ${check}
    Click Confirm    ${driver}
    sleep    5s
    ${confirm}    Check Confirm    ${driver}
    Should be true    ${confirm}
    Close    ${driver}

TC24: With shipping address - Check not fill firstname
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm_shipping_indicator"]
    Sleep    2s
    Input Shipping    ${driver}    \    Nguyen    BinhDai    Bentre    BenTre    2589K    VietNam
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    ${check}    Check For Text    ${driver}    First Name must be greater than 3 and less than 32 characters!
    Should be true    ${check}
    Close    ${driver}

TC25: With shipping address - Check not fill lastname
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm_shipping_indicator"]
    Sleep    2s
    Input Shipping    ${driver}    Giang    \    BinhDai    Bentre    BenTre    2589K    VietNam
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    ${check}    Check For Text    ${driver}    Last Name must be greater than 3 and less than 32 characters!
    Should be true    ${check}
    Close    ${driver}

TC26: With shipping address - Check not fill address 1
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm_shipping_indicator"]
    Sleep    2s
    Input Shipping    ${driver}    Giang    Nguyen    \    Bentre    BenTre    2589K    VietNam
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    ${check}    Check For Text    ${driver}    Address 1 must be greater than 3 and less than 128 characters!
    Close    ${driver}

TC27: With shipping address - Check not fill city
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm_shipping_indicator"]
    Sleep    2s
    Input Shipping    ${driver}    Giang    Nguyen    BinhDai    \    BenTre    2589K    VietNam
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    ${check}    Check For Text    ${driver}    City must be greater than 3 and less than 128 characters!
    Should be true    ${check}
    Close    ${driver}

TC28: With shipping address - Check not fill region
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm_shipping_indicator"]
    Sleep    2s
    Input Shipping    ${driver}    Giang    Nguyen    BinhDai    Bentre    \    2589K    VietNam
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    ${check}    Check For Text    ${driver}    Please select a region / state!
    Should be true    ${check}
    Close    ${driver}

TC29: With shipping address - Check not fill zipcode
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm_shipping_indicator"]
    Sleep    2s
    Input Shipping    ${driver}    Giang    Nguyen    BinhDai    Bentre    BenTre    \    VietNam
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    ${check}    Check For Text    ${driver}    Zip/postal code must be between 3 and 10 characters!
    Should be true    ${check}
    Close    ${driver}

TC30: With shipping address - Check not fill country
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm_shipping_indicator"]
    Sleep    2s
    Input Shipping    ${driver}    Giang    Nguyen    BinhDai    Bentre    BenTre    2589K    VietNam
    Choose Country Shipping    ${driver}
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    ${check}    Check For Text    ${driver}    Please select a country!
    Should be true    ${check}
    Close    ${driver}

TC31: Edit shipping successfull (choose old address)
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${quantity_in_cart}    Get Quantity Cart    ${driver}
    ${total_in_cart}    Get Total Cart    ${driver}
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    ZangN1    ZangN1
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    ${info_payment_before}    Get Payment    ${driver}
    ${info_shipping_before}    Get Shipping    ${driver}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[4]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/shipping&mode=edit
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="shipping"]/div[1]/table/tbody/tr/td[2]/div/div/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/address/shipping
    Should be true    ${check}
    ${new_address_shipping}    Choose Old Address    ${driver}
    Click Element ByXpath    ${driver}    //*[@id="address_1"]/div/div/div/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    ${info_payment_after}    Get Payment    ${driver}
    ${info_shipping_after}    Get Shipping    ${driver}
    Should not be equal    ${info_shipping_before}    ${info_shipping_after}
    Should be equal    ${info_payment_before}    ${info_payment_after}
    Should be equal    ${new_address_shipping}    ${info_shipping_after}
    ${names_in_checkout}    Get Names Checkout    ${driver}
    ${quantity_in_checkout}    Get Quantity Checkout    ${driver}
    ${total_in_checkout}    Get Total Checkout    ${driver}
    ${res}    Check Name Quantity Total    ${names_in_cart}    ${quantity_in_cart}    ${total_in_cart}    ${names_in_checkout}    ${quantity_in_checkout}    ${total_in_checkout}
    Should be equal    ${res}    OK
    Click Confirm    ${driver}
    sleep    5s
    ${confirm}    Check Confirm    ${driver}
    Should be true    ${confirm}
    Close    ${driver}

TC32: Edit shipping successfull (add new address)
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${quantity_in_cart}    Get Quantity Cart    ${driver}
    ${total_in_cart}    Get Total Cart    ${driver}
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    ZangN1    ZangN1
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    ${info_payment_before}    Get Payment    ${driver}
    ${info_shipping_before}    Get Shipping    ${driver}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[4]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/shipping&mode=edit
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="shipping"]/div[1]/table/tbody/tr/td[2]/div/div/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/address/shipping
    Should be true    ${check}
    Input New Address    ${driver}    Giangne    Ng    TanPhong    Quan7    TPHCM    abc8    VietNam
    ${new_address_shipping}    Get Info New Shipping    ${driver}
    Click Element ByXpath    ${driver}    //*[@id="Address2Frm"]/div/fieldset/div[10]/div/button
    Sleep    3s
    ${info_payment_after}    Get Payment    ${driver}
    ${info_shipping_after}    Get Shipping    ${driver}
    Should not be equal    ${info_shipping_before}    ${info_shipping_after}
    Should be equal    ${info_payment_before}    ${info_payment_after}
    Should be equal    ${new_address_shipping}    ${info_shipping_after}
    ${names_in_checkout}    Get Names Checkout    ${driver}
    ${quantity_in_checkout}    Get Quantity Checkout    ${driver}
    ${total_in_checkout}    Get Total Checkout    ${driver}
    ${res}    Check Name Quantity Total    ${names_in_cart}    ${quantity_in_cart}    ${total_in_cart}    ${names_in_checkout}    ${quantity_in_checkout}    ${total_in_checkout}
    Should be equal    ${res}    OK
    Click Confirm    ${driver}
    sleep    5s
    ${confirm}    Check Confirm    ${driver}
    Should be true    ${confirm}
    Close    ${driver}

TC33: Edit shipping - Check not fill firstname
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[4]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/shipping&mode=edit
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="shipping"]/div[1]/table/tbody/tr/td[2]/div/div/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/address/shipping
    Should be true    ${check}
    Input New Address    ${driver}    \    Ng    TanPhong    Quan7    TPHCM    abc8    VietNam
    Click Element ByXpath    ${driver}    //*[@id="Address2Frm"]/div/fieldset/div[10]/div/button
    ${check}    Check For Text    ${driver}    First Name must be between 1 and 32 characters!
    Should be true    ${check}
    Close    ${driver}

TC34: Edit shipping - Check not fill lastname
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[4]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/shipping&mode=edit
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="shipping"]/div[1]/table/tbody/tr/td[2]/div/div/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/address/shipping
    Should be true    ${check}
    Input New Address    ${driver}    Giangne    \    TanPhong    Quan7    TPHCM    abc8    VietNam
    Click Element ByXpath    ${driver}    //*[@id="Address2Frm"]/div/fieldset/div[10]/div/button
    ${check}    Check For Text    ${driver}    Last Name must be between 1 and 32 characters!
    Should be true    ${check}
    Close    ${driver}

TC35: Edit shipping - Check not fill address 1
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[4]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/shipping&mode=edit
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="shipping"]/div[1]/table/tbody/tr/td[2]/div/div/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/address/shipping
    Should be true    ${check}
    Input New Address    ${driver}    Giangne    Ng    \    Quan7    TPHCM    abc8    VietNam
    Click Element ByXpath    ${driver}    //*[@id="Address2Frm"]/div/fieldset/div[10]/div/button
    ${check}    Check For Text    ${driver}    Address 1 must be between 3 and 64 characters!
    Should be true    ${check}
    Close    ${driver}

TC36: Edit shipping - Check not fill city
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[4]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/shipping&mode=edit
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="shipping"]/div[1]/table/tbody/tr/td[2]/div/div/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/address/shipping
    Should be true    ${check}
    Input New Address    ${driver}    Giangne    Ng    TanPhong    \    TPHCM    abc8    VietNam
    Click Element ByXpath    ${driver}    //*[@id="Address2Frm"]/div/fieldset/div[10]/div/button
    ${check}    Check For Text    ${driver}    City must be between 3 and 32 characters!
    Should be true    ${check}
    Close    ${driver}

TC37: Edit shipping - Check not fill region
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[4]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/shipping&mode=edit
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="shipping"]/div[1]/table/tbody/tr/td[2]/div/div/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/address/shipping
    Should be true    ${check}
    Input New Address    ${driver}    Giangne    Ng    TanPhong    Quan7    \    abc8    VietNam
    Click Element ByXpath    ${driver}    //*[@id="Address2Frm"]/div/fieldset/div[10]/div/button
    ${check}    Check For Text    ${driver}    Please select a region / state!
    Should be true    ${check}
    Close    ${driver}

TC38: Edit shipping - Check not fill zipcode
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[4]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/shipping&mode=edit
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="shipping"]/div[1]/table/tbody/tr/td[2]/div/div/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/address/shipping
    Should be true    ${check}
    Input New Address    ${driver}    Giangne    Ng    TanPhong    Quan7    TPHCM    \    VietNam
    Click Element ByXpath    ${driver}    //*[@id="Address2Frm"]/div/fieldset/div[10]/div/button
    ${check}    Check For Text    ${driver}    Zip/postal code must be between 3 and 10 characters!
    Should be true    ${check}
    Close    ${driver}

TC39: Edit shipping - Check not fill country
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[4]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/shipping&mode=edit
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="shipping"]/div[1]/table/tbody/tr/td[2]/div/div/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/address/shipping
    Should be true    ${check}
    Input New Address    ${driver}    Giangne    Ng    TanPhong    Quan7    TPHCM    abc8    VietNam
    Choose Country New Address    ${driver}
    Click Element ByXpath    ${driver}    //*[@id="Address2Frm"]/div/fieldset/div[10]/div/button
    ${check}    Check For Text    ${driver}    Please select a country!
    Should be true    ${check}
    Close    ${driver}

TC40: Edit shipping - Add comment
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${quantity_in_cart}    Get Quantity Cart    ${driver}
    ${total_in_cart}    Get Total Cart    ${driver}
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    ZangN1    ZangN1
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[4]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/shipping&mode=edit
    Should be true    ${check}
    Input Comment Shipping    ${driver}    Fast
    Click Element ByXpath    ${driver}    //*[@id="shipping"]/div[3]/div[2]/div/button
    ${names_in_checkout}    Get Names Checkout    ${driver}
    ${quantity_in_checkout}    Get Quantity Checkout    ${driver}
    ${total_in_checkout}    Get Total Checkout    ${driver}
    ${res}    Check Name Quantity Total    ${names_in_cart}    ${quantity_in_cart}    ${total_in_cart}    ${names_in_checkout}    ${quantity_in_checkout}    ${total_in_checkout}
    Should be equal    ${res}    OK
    ${check}    Check Comment    ${driver}    Fast
    Should be true    ${check}
    Click Confirm    ${driver}
    sleep    5s
    ${confirm}    Check Confirm    ${driver}
    Should be true    ${confirm}
    Close    ${driver}

TC41: Edit shipping - Edit comment
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${quantity_in_cart}    Get Quantity Cart    ${driver}
    ${total_in_cart}    Get Total Cart    ${driver}
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    ZangN1    ZangN1
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[4]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/shipping&mode=edit
    Should be true    ${check}
    Input Comment Shipping    ${driver}    Fast
    Click Element ByXpath    ${driver}    //*[@id="shipping"]/div[3]/div[2]/div/button
    ${names_in_checkout}    Get Names Checkout    ${driver}
    ${quantity_in_checkout}    Get Quantity Checkout    ${driver}
    ${total_in_checkout}    Get Total Checkout    ${driver}
    ${res}    Check Name Quantity Total    ${names_in_cart}    ${quantity_in_cart}    ${total_in_cart}    ${names_in_checkout}    ${quantity_in_checkout}    ${total_in_checkout}
    Should be equal    ${res}    OK
    ${check}    Check Comment    ${driver}    Fast
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[4]/a
    Input Comment Shipping    ${driver}    ABC
    Click Element ByXpath    ${driver}    //*[@id="shipping"]/div[3]/div[2]/div/button
    ${check}    Check Comment    ${driver}    ABC
    Should be true    ${check}
    Click Confirm    ${driver}
    sleep    5s
    ${confirm}    Check Confirm    ${driver}
    Should be true    ${confirm}
    Close    ${driver}

TC42: Edit payment successfull (add new address)
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${quantity_in_cart}    Get Quantity Cart    ${driver}
    ${total_in_cart}    Get Total Cart    ${driver}
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    ZangN1    ZangN1
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    ${info_payment_before}    Get Payment    ${driver}
    ${info_shipping_before}    Get Shipping    ${driver}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[4]/a[1]
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/payment&mode=edit
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div/div[1]/table/tbody/tr/td[2]/div/div/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/address/payment
    Should be true    ${check}
    Input New Address    ${driver}    Giangne    Ng    TanPhong    Quan7    TPHCM    abc8    VietNam
    ${new_address_payment}    Get Info New Shipping    ${driver}
    Click Element ByXpath    ${driver}    //*[@id="Address2Frm"]/div/fieldset/div[10]/div/button
    Sleep    3s
    ${info_payment_after}    Get Payment    ${driver}
    ${info_shipping_after}    Get Shipping    ${driver}
    Should be equal    ${info_shipping_before}    ${info_shipping_after}
    Should not be equal    ${info_payment_before}    ${info_payment_after}
    Should be equal    ${new_address_payment}    ${info_payment_after}
    ${names_in_checkout}    Get Names Checkout    ${driver}
    ${quantity_in_checkout}    Get Quantity Checkout    ${driver}
    ${total_in_checkout}    Get Total Checkout    ${driver}
    ${res}    Check Name Quantity Total    ${names_in_cart}    ${quantity_in_cart}    ${total_in_cart}    ${names_in_checkout}    ${quantity_in_checkout}    ${total_in_checkout}
    Should be equal    ${res}    OK
    Click Confirm    ${driver}
    sleep    5s
    ${confirm}    Check Confirm    ${driver}
    Should be true    ${confirm}
    Close    ${driver}

TC43: Edit payment successfull (choose old address)
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${quantity_in_cart}    Get Quantity Cart    ${driver}
    ${total_in_cart}    Get Total Cart    ${driver}
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    ZangN1    ZangN1
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    ${info_payment_before}    Get Payment    ${driver}
    ${info_shipping_before}    Get Shipping    ${driver}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[4]/a[1]
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/payment&mode=edit
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div/div[1]/table/tbody/tr/td[2]/div/div/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/address/payment
    Should be true    ${check}
    ${new_address_payment}    Choose Old Address    ${driver}
    Click Element ByXpath    ${driver}    //*[@id="address_1"]/div/div/div/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    ${info_payment_after}    Get Payment    ${driver}
    ${info_shipping_after}    Get Shipping    ${driver}
    Should be equal    ${info_shipping_before}    ${info_shipping_after}
    Should not be equal    ${info_payment_before}    ${info_payment_after}
    Should be equal    ${new_address_payment}    ${info_payment_after}
    ${names_in_checkout}    Get Names Checkout    ${driver}
    ${quantity_in_checkout}    Get Quantity Checkout    ${driver}
    ${total_in_checkout}    Get Total Checkout    ${driver}
    ${res}    Check Name Quantity Total    ${names_in_cart}    ${quantity_in_cart}    ${total_in_cart}    ${names_in_checkout}    ${quantity_in_checkout}    ${total_in_checkout}
    Should be equal    ${res}    OK
    Click Confirm    ${driver}
    sleep    5s
    ${confirm}    Check Confirm    ${driver}
    Should be true    ${confirm}
    Close    ${driver}

TC44: Edit payment - Check not fill firstname
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[4]/a[1]
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/payment&mode=edit
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div/div[1]/table/tbody/tr/td[2]/div/div/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/address/payment
    Should be true    ${check}
    Input New Address    ${driver}    \    Ng    TanPhong    Quan7    TPHCM    abc8    VietNam
    Click Element ByXpath    ${driver}    //*[@id="Address2Frm"]/div/fieldset/div[10]/div/button
    ${check}    Check For Text    ${driver}    First Name must be between 1 and 32 characters!
    Should be true    ${check}
    Close    ${driver}

TC45: Edit payment - Check not fill lastname
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[4]/a[1]
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/payment&mode=edit
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div/div[1]/table/tbody/tr/td[2]/div/div/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/address/payment
    Should be true    ${check}
    Input New Address    ${driver}    Giangne    \    TanPhong    Quan7    TPHCM    abc8    VietNam
    Click Element ByXpath    ${driver}    //*[@id="Address2Frm"]/div/fieldset/div[10]/div/button
    ${check}    Check For Text    ${driver}    Last Name must be between 1 and 32 characters!
    Should be true    ${check}
    Close    ${driver}

TC46: Edit payment - Check not fill address 1
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[4]/a[1]
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/payment&mode=edit
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div/div[1]/table/tbody/tr/td[2]/div/div/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/address/payment
    Should be true    ${check}
    Input New Address    ${driver}    Giangne    Ng    \    Quan7    TPHCM    abc8    VietNam
    Click Element ByXpath    ${driver}    //*[@id="Address2Frm"]/div/fieldset/div[10]/div/button
    ${check}    Check For Text    ${driver}    Address 1 must be between 3 and 64 characters!
    Should be true    ${check}
    Close    ${driver}

TC47: Edit payment - Check not fill city
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[4]/a[1]
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/payment&mode=edit
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div/div[1]/table/tbody/tr/td[2]/div/div/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/address/payment
    Should be true    ${check}
    Input New Address    ${driver}    Giangne    Ng    TanPhong    \    TPHCM    abc8    VietNam
    Click Element ByXpath    ${driver}    //*[@id="Address2Frm"]/div/fieldset/div[10]/div/button
    ${check}    Check For Text    ${driver}    City must be between 3 and 32 characters!
    Should be true    ${check}
    Close    ${driver}

TC48: Edit payment - Check not fill region
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[4]/a[1]
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/payment&mode=edit
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div/div[1]/table/tbody/tr/td[2]/div/div/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/address/payment
    Should be true    ${check}
    Input New Address    ${driver}    Giangne    Ng    TanPhong    Quan7    \    abc8    VietNam
    Click Element ByXpath    ${driver}    //*[@id="Address2Frm"]/div/fieldset/div[10]/div/button
    ${check}    Check For Text    ${driver}    Please select a region / state!
    Should be true    ${check}
    Close    ${driver}

TC49: Edit payment - Check not fill zipcode
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[4]/a[1]
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/payment&mode=edit
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div/div[1]/table/tbody/tr/td[2]/div/div/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/address/payment
    Should be true    ${check}
    Input New Address    ${driver}    Giangne    Ng    TanPhong    Quan7    TPHCM    \    VietNam
    Click Element ByXpath    ${driver}    //*[@id="Address2Frm"]/div/fieldset/div[10]/div/button
    ${check}    Check For Text    ${driver}    Zip/postal code must be between 3 and 10 characters!
    Should be true    ${check}
    Close    ${driver}

TC50: Edit payment - Check not fill country
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[4]/a[1]
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/payment&mode=edit
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div/div[1]/table/tbody/tr/td[2]/div/div/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/address/payment
    Should be true    ${check}
    Input New Address    ${driver}    Giangne    Ng    TanPhong    Quan7    TPHCM    abc8    VietNam
    Choose Country New Address    ${driver}
    Click Element ByXpath    ${driver}    //*[@id="Address2Frm"]/div/fieldset/div[10]/div/button
    ${check}    Check For Text    ${driver}    Please select a country!
    Should be true    ${check}
    Close    ${driver}

TC51: Edit payment - Add wrong coupon
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[4]/a[1]
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/payment&mode=edit
    Should be true    ${check}
    Input Coupon    ${driver}    abc
    sleep    5s
    ${check}    Check For Text    ${driver}    Error: Coupon is either invalid, expired or reached it's usage limit!
    Should be true    ${check}
    Close    ${driver}

TC52: Edit payment - Delete coupon
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    GiangN0507    GiangN0507
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[4]/a[1]
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/payment&mode=edit
    Should be true    ${check}
    Input Coupon    ${driver}    abc
    Remove Coupon Payment    ${driver}
    ${check}    Check For Text    ${driver}    Success: Coupon has been removed!
    Should be true    ${check}
    Close    ${driver}

TC53: Edit payment - Add comment
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${quantity_in_cart}    Get Quantity Cart    ${driver}
    ${total_in_cart}    Get Total Cart    ${driver}
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    ZangN1    ZangN1
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[4]/a[1]
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/payment&mode=edit
    Should be true    ${check}
    Input Comment Payment    ${driver}    Fast
    Click Element ByXpath    ${driver}    //*[@id="payment_agree"]
    Click Element ByXpath    ${driver}    //*[@id="payment"]/div[2]/div[2]/div/button
    ${names_in_checkout}    Get Names Checkout    ${driver}
    ${quantity_in_checkout}    Get Quantity Checkout    ${driver}
    ${total_in_checkout}    Get Total Checkout    ${driver}
    ${res}    Check Name Quantity Total    ${names_in_cart}    ${quantity_in_cart}    ${total_in_cart}    ${names_in_checkout}    ${quantity_in_checkout}    ${total_in_checkout}
    Should be equal    ${res}    OK
    ${check}    Check Comment    ${driver}    Fast
    Should be true    ${check}
    Click Confirm    ${driver}
    sleep    5s
    ${confirm}    Check Confirm    ${driver}
    Should be true    ${confirm}
    Close    ${driver}

TC54: Edit payment - Check error not agree policy
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${quantity_in_cart}    Get Quantity Cart    ${driver}
    ${total_in_cart}    Get Total Cart    ${driver}
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    ZangN1    ZangN1
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[4]/a[1]
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/payment&mode=edit
    Should be true    ${check}
    Input Comment Payment    ${driver}    Fast
    Click Element ByXpath    ${driver}    //*[@id="payment"]/div[2]/div[2]/div/button
    ${check}    Check For Text    ${driver}    Error: You must agree to the Return Policy!
    Should be true    ${check}
    Close    ${driver}

TC55: Edit coupon
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${quantity_in_cart}    Get Quantity Cart    ${driver}
    ${total_in_cart}    Get Total Cart    ${driver}
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    ZangN1    ZangN1
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[4]/a[2]
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/payment&mode=edit
    Should be true    ${check}
    Close    ${driver}

TC56: Check edit cart
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${quantity_in_cart}    Get Quantity Cart    ${driver}
    ${total_in_cart}    Get Total Cart    ${driver}
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    ZangN1    ZangN1
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/h4[3]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/cart
    Should be true    ${check}
    Close    ${driver}

TC57: Check back btn
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${quantity_in_cart}    Get Quantity Cart    ${driver}
    ${total_in_cart}    Get Total Cart    ${driver}
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    ZangN1    ZangN1
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="back"]
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/payment&mode=edit
    Should be true    ${check}
    Close    ${driver}

TC58: Check appear modal
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Input Login    ${driver}    ZangN1    ZangN1
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/confirm
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/p/a
    Sleep    5s
    ${check}    Check Modal Displayed    ${driver}
    Should be true    ${check}
    Close    ${driver}

TC59: Guest edit shipping - add wrong coupon
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    Sleep    5s
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_3
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[4]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_2&mode=edit
    Should be true    ${check}
    Input Coupon    ${driver}    abc
    sleep    5s
    ${check}    Check For Text    ${driver}    Error: Coupon is either invalid, expired or reached it's usage limit!
    Should be true    ${check}
    Close    ${driver}

TC60: Guest edit shipping - delete coupon
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    Sleep    5s
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_3
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[4]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_2&mode=edit
    Should be true    ${check}
    Input Coupon    ${driver}    abc
    sleep    5s
    Remove Coupon Payment    ${driver}
    ${check}    Check For Text    ${driver}    Success: Coupon has been removed!
    Should be true    ${check}
    Close    ${driver}

TC61: Guest edit shipping - add comment
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${quantity_in_cart}    Get Quantity Cart    ${driver}
    ${total_in_cart}    Get Total Cart    ${driver}
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    ${info_payment}    Get Info Payment    ${driver}
    ${info_shipping}    Get Info Shipping    ${driver}
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    Sleep    5s
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_3
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[4]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_2&mode=edit
    Should be true    ${check}
    Input Comment Guest    ${driver}    Fast
    Click Element ByXpath    ${driver}    //*[@id="guest_agree"]
    Click Element ByXpath    ${driver}    //*[@id="guest"]/div[4]/div[2]/div/button
    ${info_shipping_confirm}    Get Shipping    ${driver}
    ${info_payment_confirm}    Get Payment    ${driver}
    ${names_in_checkout}    Get Names Checkout    ${driver}
    ${quantity_in_checkout}    Get Quantity Checkout    ${driver}
    ${total_in_checkout}    Get Total Checkout    ${driver}
    ${res}    Check Name Quantity Total    ${names_in_cart}    ${quantity_in_cart}    ${total_in_cart}    ${names_in_checkout}    ${quantity_in_checkout}    ${total_in_checkout}
    Should be equal    ${res}    OK
    ${check}    Check Payment And Shipping    ${driver}    ${info_payment}    ${info_shipping}    ${info_payment_confirm}    ${info_shipping_confirm}
    Should be true    ${check}
    ${check}    Check Comment    ${driver}    Fast
    Should be true    ${check}
    Click Confirm    ${driver}
    sleep    5s
    ${confirm}    Check Confirm    ${driver}
    Should be true    ${confirm}
    Close    ${driver}

TC62: Guest edit shipping - error not agree policy
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    Sleep    5s
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_3
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[4]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_2&mode=edit
    Should be true    ${check}
    Input Comment Guest    ${driver}    Fast
    Click Element ByXpath    ${driver}    //*[@id="guest"]/div[4]/div[2]/div/button
    ${check}    Check For Text    ${driver}    Error: You must agree to the Return Policy!
    Should be true    ${check}
    Close    ${driver}

TC63: Guest edit payment
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    Sleep    5s
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_3
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[4]/a[1]
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_2&mode=edit
    Should be true    ${check}
    Close    ${driver}

TC64: Guest edit coupon
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    Sleep    5s
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_3
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[4]/a[2]
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_2&mode=edit
    Should be true    ${check}
    Close    ${driver}

TC65: Guest check edit cart
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    Sleep    5s
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_3
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/h4[3]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/cart
    Should be true    ${check}
    Close    ${driver}

TC66: Guest check back btn
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    Sleep    5s
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_3
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="back"]
    Close    ${driver}

TC67: Guest check appear modal
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    Sleep    5s
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_3
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/p/a
    Sleep    5s
    ${check}    Check Modal Displayed    ${driver}
    Should be true    ${check}
    Close    ${driver}

TC68: Check link Contact us
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Input Login    ${driver}    GiangN0507    GiangN0507
    Click Confirm    ${driver}
    sleep    5s
    ${confirm}    Check Confirm    ${driver}
    Should be true    ${confirm}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div/div/div/section/p[4]/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=content/contact
    Should be true    ${check}
    Close    ${driver}

TC69: Check invoice detail
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${names_in_cart}    Get Names In Cart    ${driver}
    ${quantity_in_cart}    Get Quantity Cart    ${driver}
    ${total_in_cart}    Get Total Cart    ${driver}
    ${res}    Open Checkout    ${driver}
    Should not be true    ${res}
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=account/login
    Should be true    ${check}
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/div[2]/label
    Click Element ByXpath    ${driver}    //*[@id="accountFrm"]/fieldset/button
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_1
    Should be true    ${check}
    Input Personal Details    ${driver}    zangA    NguyenN    zangA@gmail.com
    Input Address    ${driver}    tdtu    HCM    Aberdeen    12J3    United Kingdom
    Click Element ByXpath    ${driver}    //*[@id="guestFrm_shipping_indicator"]
    Sleep    2s
    Input Shipping    ${driver}    Giang    Nguyen    BinhDai    Bentre    BenTre    2589K    VietNam
    ${info_payment}    Get Info Payment    ${driver}
    ${info_shipping}    Get Info Shipping    ${driver}
    Click Element ByXpath    ${driver}    //*[@id="guestFrm"]/div[4]/div/button
    Sleep    5s
    ${check}    Check Url    ${driver}    https://automationteststore.com/index.php?rt=checkout/guest_step_3
    Should be true    ${check}
    ${info_shipping_confirm}    Get Shipping    ${driver}
    ${info_payment_confirm}    Get Payment    ${driver}
    ${names_in_checkout}    Get Names Checkout    ${driver}
    ${quantity_in_checkout}    Get Quantity Checkout    ${driver}
    ${total_in_checkout}    Get Total Checkout    ${driver}
    ${res}    Check Name Quantity Total    ${names_in_cart}    ${quantity_in_cart}    ${total_in_cart}    ${names_in_checkout}    ${quantity_in_checkout}    ${total_in_checkout}
    Should be equal    ${res}    OK
    ${check}    Check Payment And Shipping    ${driver}    ${info_payment}    ${info_shipping}    ${info_payment_confirm}    ${info_shipping_confirm}
    Should be true    ${check}
    Click Confirm    ${driver}
    sleep    5s
    ${confirm}    Check Confirm    ${driver}
    Should be true    ${confirm}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div/div/div/section/p[3]/a
    ${res}    Check Invoice Detail    ${driver}    ${info_shipping_confirm}    ${info_payment_confirm}    ${names_in_checkout}    ${quantity_in_checkout}    ${total_in_checkout}
    Should be true    ${res}
    Close    ${driver}

TC70: Check Continue btn
    ${driver}    Open
    Get Product Names In Section    ${driver}    latest
    Click Icon Add To Cart    ${driver}    latest
    ${res}    Open Checkout    ${driver}
    Input Login    ${driver}    GiangN0507    GiangN0507
    Click Confirm    ${driver}
    sleep    5s
    ${confirm}    Check Confirm    ${driver}
    Should be true    ${confirm}
    Click Element ByXpath    ${driver}    //*[@id="maincontainer"]/div/div/div/div/section/a
    ${check}    Check Url    ${driver}    https://automationteststore.com/
    Should be true    ${check}
    Close    ${driver}
