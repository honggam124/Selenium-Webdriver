*** Settings ***
Library           SeleniumLibrary
Library           Module_1.py

*** Test Cases ***
TC1: Filter_products_by_category Module 12
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[2]/a    //*[@id="categorymenu"]/nav/ul/li[2]/div/ul[1]/li[1]/a
    ${result}=    Module_1.filter_by_category    Shoe
    Should be True    ${result}

TC2: Filter_products_by_category Module 12-1
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[2]/a    //*[@id="categorymenu"]/nav/ul/li[2]/div/ul[1]/li[2]/a
    ${result}=    Module_1.filter_by_category    Shirt
    Should be True    ${result}

TC3: Filter_products_by_category Module 12-2
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[3]/a    //*[@id="categorymenu"]/nav/ul/li[3]/div/ul[1]/li[1]/a
    ${result}=    Module_1.filter_by_category    Cheek
    Should be True    ${result}

TC4: Filter_products_by_category Module 12-3
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[3]/a    //*[@id="categorymenu"]/nav/ul/li[3]/div/ul[1]/li[2]/a
    ${result}=    Module_1.filter_by_category    Eye
    Should be True    ${result}

TC5: Filter_products_by_category Module 12-4
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[3]/a    //*[@id="categorymenu"]/nav/ul/li[3]/div/ul[1]/li[3]/a
    ${result}=    Module_1.filter_by_category    Face
    Should be True    ${result}

TC6: Filter_products_by_category Module 12-5
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[3]/a    //*[@id="categorymenu"]/nav/ul/li[3]/div/ul[1]/li[4]/a
    ${result}=    Module_1.filter_by_category    Lip
    Should be True    ${result}

TC7: Filter_products_by_category Module 12-6
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[3]/a    //*[@id="categorymenu"]/nav/ul/li[3]/div/ul[1]/li[5]/a
    ${result}=    Module_1.filter_by_category    Nail
    Should be True    ${result}

TC8: Filter_products_by_category Module 12-7
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[3]/a    //*[@id="categorymenu"]/nav/ul/li[3]/div/ul[1]/li[6]/a
    ${result}=    Module_1.filter_by_category    Value set
    Should be True    ${result}

TC9: Filter_products_by_category Module 12-8
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[4]/a    //*[@id="categorymenu"]/nav/ul/li[4]/div/ul[1]/li[1]/a
    ${result}=    Module_1.filter_by_category    Eye
    Should be True    ${result}

TC10: Filter_products_by_category Module 12-9
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[4]/a    //*[@id="categorymenu"]/nav/ul/li[4]/div/ul[1]/li[2]/a
    ${result}=    Module_1.filter_by_category    Face
    Should be True    ${result}

TC11: Filter_products_by_category Module 12-10
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[4]/a    //*[@id="categorymenu"]/nav/ul/li[4]/div/ul[1]/li[3]/a
    ${result}=    Module_1.filter_by_category    Gift
    Should be True    ${result}

TC12: Filter_products_by_category Module 12-11
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[4]/a    //*[@id="categorymenu"]/nav/ul/li[4]/div/ul[1]/li[4]/a
    ${result}=    Module_1.filter_by_category    Hand
    Should be True    ${result}

TC13: Filter_products_by_category Module 12-12
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[4]/a    //*[@id="categorymenu"]/nav/ul/li[4]/div/ul[1]/li[5]/a
    ${result}=    Module_1.filter_by_category    Sun
    Should be True    ${result}

TC14: Filter_products_by_category Module 12-13
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[5]/a    //*[@id="categorymenu"]/nav/ul/li[5]/div/ul[1]/li[1]/a
    ${result}=    Module_1.filter_by_category    Man
    Should be True    ${result}

TC15: Filter_products_by_category Module 12-14
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[5]/a    //*[@id="categorymenu"]/nav/ul/li[5]/div/ul[1]/li[2]/a
    ${result}=    Module_1.filter_by_category    Women
    Should be True    ${result}

TC16: Filter_products_by_category Module 12-15
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[6]/a    //*[@id="categorymenu"]/nav/ul/li[6]/div/ul[1]/li[1]/a
    ${result}=    Module_1.filter_by_category    Body
    Should be True    ${result}

TC17: Filter_products_by_category Module 12-16
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[6]/a    //*[@id="categorymenu"]/nav/ul/li[6]/div/ul[1]/li[2]/a
    ${result}=    Module_1.filter_by_category    Fragrance
    Should be True    ${result}

TC18: Filter_products_by_category Module 12-17
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[6]/a    //*[@id="categorymenu"]/nav/ul/li[6]/div/ul[1]/li[3]/a
    ${result}=    Module_1.filter_by_category    Shaving
    Should be True    ${result}

TC19: Filter_products_by_category Module 12-18
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[6]/a    //*[@id="categorymenu"]/nav/ul/li[6]/div/ul[1]/li[4]/a
    ${result}=    Module_1.filter_by_category    Skincare
    Should be True    ${result}

TC20: Filter_products_by_category Module 12-19
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[7]/a    //*[@id="categorymenu"]/nav/ul/li[7]/div/ul[1]/li[1]/a
    ${result}=    Module_1.filter_by_category    Conditioner
    Should be True    ${result}

TC21: Filter_products_by_category Module 12-20
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[7]/a    //*[@id="categorymenu"]/nav/ul/li[7]/div/ul[1]/li[2]/a
    ${result}=    Module_1.filter_by_category    Shampoo
    Should be True    ${result}

TC22: Filter_products_by_category Module 12-21
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[8]/a    //*[@id="categorymenu"]/nav/ul/li[8]/div/ul[1]/li[1]/a
    ${result}=    Module_1.filter_by_category    Audio
    Should be True    ${result}

TC23: Filter_products_by_category Module 12-22
    Module_1.getweb
    Module_1.get_category    //*[@id="categorymenu"]/nav/ul/li[8]/a    //*[@id="categorymenu"]/nav/ul/li[8]/div/ul[1]/li[2]/a
    ${result}=    Module_1.filter_by_category    Paperback
    Should be True    ${result}
