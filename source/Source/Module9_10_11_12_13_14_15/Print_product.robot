*** Settings ***
Library           SeleniumLibrary
Library           Module_1.py

*** Test Cases ***
TC1: Print product details Module 15
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[2]/a
    Module_1.view_detail_item
    Module_1.print_product
    Close Browser

TC2: Print product details Module 15-1
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[3]/a
    Module_1.view_detail_item
    Module_1.print_product
    Close Browser

TC3: Print product details Module 15-2
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[4]/a
    Module_1.view_detail_item
    Module_1.print_product
    Close Browser

TC4: Print product details Module 15-3
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[5]/a
    Module_1.view_detail_item
    Module_1.print_product
    Close Browser

TC5: Print product details Module 15-4
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[6]/a
    Module_1.view_detail_item
    Module_1.print_product
    Close Browser

TC6: Print product details Module 15-5
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[7]/a
    Module_1.view_detail_item
    Module_1.print_product
    Close Browser

TC7: Print product details Module 15-6
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[8]/a
    Module_1.view_detail_item
    Module_1.print_product
    Close Browser
