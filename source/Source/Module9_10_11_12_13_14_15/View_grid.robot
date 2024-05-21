*** Settings ***
Library           SeleniumLibrary
Library           Module_1.py

*** Test Cases ***
TC1: View product grid Module 9-1
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[2]/a
    ${result}=    Module_1.gridview
    Should be True    ${result}    True
    Close Browser

TC2: View product grid Module 9-3
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[3]/a
    ${result}=    Module_1.gridview
    Should be True    ${result}    True
    Close Browser

TC3: View product grid Module 9-5
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[4]/a
    ${result}=    Module_1.gridview
    Should be True    ${result}    True
    Close Browser

TC4: View product grid Module 9-7
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[5]/a
    ${result}=    Module_1.gridview
    Should be True    ${result}    True
    Close Browser

TC5: View product grid Module 9-9
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[6]/a
    ${result}=    Module_1.gridview
    Should be True    ${result}    True
    Close Browser

TC6: View product grid Module 9-11
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[7]/a
    ${result}=    Module_1.gridview
    Should be True    ${result}    True
    Close Browser

TC7: View product grid Module 9-13
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[8]/a
    ${result}=    Module_1.gridview
    Should be True    ${result}    True
    Close Browser
