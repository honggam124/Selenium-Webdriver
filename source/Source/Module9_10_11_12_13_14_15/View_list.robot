*** Settings ***
Library           SeleniumLibrary
Library           Module_1.py

*** Test Cases ***
TC1: View product list Module 9
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[2]/a
    ${result}=    Module_1.listview
    Should be True    ${result}    True
    Close Browser

TC2: View product list Module 9-2
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[3]/a
    ${result}=    Module_1.listview
    Should be True    ${result}    True
    Close Browser

TC3: View product list Module 9-4
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[4]/a
    ${result}=    Module_1.listview
    Should be True    ${result}    True
    Close Browser

TC4: View product list Module 9-6
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[5]/a
    ${result}=    Module_1.listview
    Should be True    ${result}    True
    Close Browser

TC5: View product list Module 9-8
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[6]/a
    ${result}=    Module_1.listview
    Should be True    ${result}    True
    Close Browser

TC6: View product list Module 9-10
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[7]/a
    ${result}=    Module_1.listview
    Should be True    ${result}    True
    Close Browser

TC7: View product list Module 9-12
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[8]/a
    ${result}=    Module_1.listview
    Should be True    ${result}    True
    Close Browser
