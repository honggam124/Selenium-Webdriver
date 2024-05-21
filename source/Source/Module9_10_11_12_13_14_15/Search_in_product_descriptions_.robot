*** Settings ***
Library           SeleniumLibrary
Library           Module_1.py

*** Test Cases ***
TC1: Search in product descriptions Module 13
    Module_1.getweb
    ${result}=    Module_1.search_in_description    shoe    //*[@id="category_id"]/option[1]
    Should be True    ${result}    True
    Close Browser

TC2: Search in product descriptions Module 13-1
    Module_1.getweb
    ${result}=    Module_1.search_in_description    eye    //*[@id="category_id"]/option[2]
    Should be True    ${result}    True
    Close Browser

TC3: Search in product descriptions Module 13-2
    Module_1.getweb
    ${result}=    Module_1.search_in_description    face    //*[@id="category_id"]/option[3]
    Should be True    ${result}    True
    Close Browser

TC4: Search in product descriptions Module 13-3
    Module_1.getweb
    ${result}=    Module_1.search_in_description    women    //*[@id="category_id"]/option[4]
    Should be True    ${result}    True
    Close Browser

TC5: Search in product descriptions Module 13-4
    Module_1.getweb
    ${result}=    Module_1.search_in_description    body    //*[@id="category_id"]/option[5]
    Should be True    ${result}    True
    Close Browser

TC6: Search in product descriptions Module 13-5
    Module_1.getweb
    ${result}=    Module_1.search_in_description    shampoo    //*[@id="category_id"]/option[6]
    Should be True    ${result}    True
    Close Browser

TC7: Search in product descriptions Module 13-6
    Module_1.getweb
    ${result}=    Module_1.search_in_description    audio    //*[@id="category_id"]/option[7]
    Should be True    ${result}    True
    Close Browser

TC8: Search in product descriptions Module 13-7
    Module_1.getweb
    ${result}=    Module_1.search_in_description    shoe    //*[@id="category_id"]/option[8]
    Should be True    ${result}    True
    Close Browser
