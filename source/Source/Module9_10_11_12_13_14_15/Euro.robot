*** Settings ***
Library           SeleniumLibrary
Library           Module_1.py

*** Test Cases ***
TC1: View product list by currency is EURO Module 11
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[2]/a
    ${result}=    Module_1.Currency_EURO
    Should be True    ${result}    True
    Close Browser

TC2: View product list by currency is EURO Module 11-3
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[3]/a
    ${result}=    Module_1.Currency_EURO
    Should be True    ${result}    True
    Close Browser

TC3: View product list by currency is EURO Module 11-6
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[4]/a
    ${result}=    Module_1.Currency_EURO
    Should be True    ${result}    True
    Close Browser

TC4: View product list by currency is EURO Module 11-9
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[5]/a
    ${result}=    Module_1.Currency_EURO
    Should be True    ${result}    True
    Close Browser

TC5: View product list by currency is EURO Module 11-12
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[6]/a
    ${result}=    Module_1.Currency_EURO
    Should be True    ${result}    True
    Close Browser

TC6: View product list by currency is EURO Module 11-15
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[7]/a
    ${result}=    Module_1.Currency_EURO
    Should be True    ${result}    True
    Close Browser

TC7: View product list by currency is EURO Module 11-18
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[8]/a
    ${result}=    Module_1.Currency_EURO
    Should be True    ${result}    True
    Close Browser

TC8: View product list by currency is EURO Module 11-21
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[1]/a
    ${result}=    Module_1.Currency_EURO
    Should be True    ${result}    True
    Close Browser
