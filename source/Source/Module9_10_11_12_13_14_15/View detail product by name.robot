*** Settings ***
Library           SeleniumLibrary
Library           Module_1.py

*** Test Cases ***
TC1: View product details by name Module 10-1
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[2]/a
    ${result}=    Module_1.view_detail_item_by_name
    Should be True    ${result}    True
    Close Browser

TC2: View product details by name Module 10-3
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[3]/a
    ${result}=    Module_1.view_detail_item_by_name
    Should be True    ${result}    True
    Close Browser

TC3: View product details by name Module 10-5
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[4]/a
    ${result}=    Module_1.view_detail_item_by_name
    Should be True    ${result}    True
    Close Browser

TC4: View product details by name Module 10-7
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[5]/a
    ${result}=    Module_1.view_detail_item_by_name
    Should be True    ${result}    True
    Close Browser

TC5: View product details by name Module 10-9
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[6]/a
    ${result}=    Module_1.view_detail_item_by_name
    Should be True    ${result}    True
    Close Browser

TC6: View product details by name Module 10-11
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[7]/a
    ${result}=    Module_1.view_detail_item_by_name
    Should be True    ${result}    True
    Close Browser

TC7: View product details by name Module 10-13
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[8]/a
    ${result}=    Module_1.view_detail_item_by_name
    Should be True    ${result}    True
    Close Browser

TC8: View product details by name Module 10-15
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[1]/a
    ${result}=    Module_1.view_detail_item_by_name
    Should be True    ${result}    True
    Close Browser
