*** Settings ***
Library           SeleniumLibrary
Library           Module_1.py

*** Test Cases ***
TC1: Sort products by Price high to low Module 14-1
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[2]/a
    ${price_sort_by_web} =    Module_1.price_sort_by_web    //*[@id="sort"]/option[5]    prdocutname
    ${products_sort_by_price_HL} =    Module_1.products_sort_by_price_HL    //*[@id="sort"]/option[5]
    Should Be Equal    ${price_sort_by_web}    ${products_sort_by_price_HL}

TC2: Sort products by Price high to low Module 14-7
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[3]/a
    ${price_sort_by_web} =    Module_1.price_sort_by_web    //*[@id="sort"]/option[5]    prdocutname
    ${products_sort_by_price_HL} =    Module_1.products_sort_by_price_HL    //*[@id="sort"]/option[5]
    Should Be Equal    ${price_sort_by_web}    ${products_sort_by_price_HL}

TC3: Sort products by Price high to low Module 14-13
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[4]/a
    ${price_sort_by_web} =    Module_1.price_sort_by_web    //*[@id="sort"]/option[5]    prdocutname
    ${products_sort_by_price_HL} =    Module_1.products_sort_by_price_HL    //*[@id="sort"]/option[5]
    Should Be Equal    ${price_sort_by_web}    ${products_sort_by_price_HL}

TC4: Sort products by Price high to low Module 14-19
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[5]/a
    ${price_sort_by_web} =    Module_1.price_sort_by_web    //*[@id="sort"]/option[5]    prdocutname
    ${products_sort_by_price_HL} =    Module_1.products_sort_by_price_HL    //*[@id="sort"]/option[5]
    Should Be Equal    ${price_sort_by_web}    ${products_sort_by_price_HL}

TC5: Sort products by Price high to low Module 14-25
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[6]/a
    ${price_sort_by_web} =    Module_1.price_sort_by_web    //*[@id="sort"]/option[5]    prdocutname
    ${products_sort_by_price_HL} =    Module_1.products_sort_by_price_HL    //*[@id="sort"]/option[5]
    Should Be Equal    ${price_sort_by_web}    ${products_sort_by_price_HL}

TC6: Sort products by Price high to low Module 14-31
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[7]/a
    ${price_sort_by_web} =    Module_1.price_sort_by_web    //*[@id="sort"]/option[5]    prdocutname
    ${products_sort_by_price_HL} =    Module_1.products_sort_by_price_HL    //*[@id="sort"]/option[5]
    Should Be Equal    ${price_sort_by_web}    ${products_sort_by_price_HL}

TC7: Sort products by Price high to low Module 14-37
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[8]/a
    ${price_sort_by_web} =    Module_1.price_sort_by_web    //*[@id="sort"]/option[5]    prdocutname
    ${products_sort_by_price_HL} =    Module_1.products_sort_by_price_HL    //*[@id="sort"]/option[5]
    Should Be Equal    ${price_sort_by_web}    ${products_sort_by_price_HL}
