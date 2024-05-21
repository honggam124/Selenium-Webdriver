*** Settings ***
Library           SeleniumLibrary
Library           Module_1.py

*** Test Cases ***
TC1: Search in product model Module 13-8
    Module_1.getweb
    ${result}=    Module_1.search_in_model    shoe    //*[@id="category_id"]/option[1]
    Should be True    ${result}    True
    Close Browser

TC2: Search in product model Module 13-9
    Module_1.getweb
    ${result}=    Module_1.search_in_model    eye    //*[@id="category_id"]/option[2]
    Should be True    ${result}    True
    Close Browser

TC3: Search in product model Module 13-10
    Module_1.getweb
    ${result}=    Module_1.search_in_model    face    //*[@id="category_id"]/option[3]
    Should be True    ${result}    True
    Close Browser

TC4: Search in product model Module 13-11
    Module_1.getweb
    ${result}=    Module_1.search_in_model    women    //*[@id="category_id"]/option[4]
    Should be True    ${result}    True
    Close Browser

TC5: Search in product model Module 13-12
    Module_1.getweb
    ${result}=    Module_1.search_in_model    body    //*[@id="category_id"]/option[5]
    Should be True    ${result}    True
    Close Browser

TC6: Search in product model Module 13-13
    Module_1.getweb
    ${result}=    Module_1.search_in_model    shampoo    //*[@id="category_id"]/option[6]
    Should be True    ${result}    True
    Close Browser

TC7: Search in product model Module 13-14
    Module_1.getweb
    ${result}=    Module_1.search_in_model    audio    //*[@id="category_id"]/option[7]
    Should be True    ${result}    True
    Close Browser

TC8: Search in product model Module 13-15
    Module_1.getweb
    ${result}=    Module_1.search_in_model    shoe    //*[@id="category_id"]/option[8]
    Should be True    ${result}    True
    Close Browser
