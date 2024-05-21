*** Settings ***
Library           SeleniumLibrary
Library           Module_1.py

*** Test Cases ***
TC1: Sort products by Price low to highModule 10-2
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[2]/a
    ${price_sort_by_web} =    Module_1.price_sort_by_web    //*[@id="sort"]/option[4]    oneprice
    ${products_sort_by_price_LH} =    Module_1.products_sort_by_price_LH    //*[@id="sort"]/option[4]
    Should Be Equal    ${price_sort_by_web}    ${products_sort_by_price_LH}

TC2: Sort products by Price low to high Module 10-8
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[3]/a
    ${price_sort_by_web} =    Module_1.price_sort_by_web    //*[@id="sort"]/option[4]    oneprice
    ${products_sort_by_price_LH} =    Module_1.products_sort_by_price_LH    //*[@id="sort"]/option[4]
    Should Be Equal    ${price_sort_by_web}    ${products_sort_by_price_LH}

TC3: Sort products by Price low to high Module 10-14
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[4]/a
    ${price_sort_by_web} =    Module_1.price_sort_by_web    //*[@id="sort"]/option[4]    oneprice
    ${products_sort_by_price_LH} =    Module_1.products_sort_by_price_LH    //*[@id="sort"]/option[4]
    Should Be Equal    ${price_sort_by_web}    ${products_sort_by_price_LH}

TC4: Sort products by Price low to high Module 10-20
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[5]/a
    ${price_sort_by_web} =    Module_1.price_sort_by_web    //*[@id="sort"]/option[4]    oneprice
    ${products_sort_by_price_LH} =    Module_1.products_sort_by_price_LH    //*[@id="sort"]/option[4]
    Should Be Equal    ${price_sort_by_web}    ${products_sort_by_price_LH}

TC5: Sort products by Price low to high Module 10-26
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[6]/a
    ${price_sort_by_web} =    Module_1.price_sort_by_web    //*[@id="sort"]/option[4]    oneprice
    ${products_sort_by_price_LH} =    Module_1.products_sort_by_price_LH    //*[@id="sort"]/option[4]
    Should Be Equal    ${price_sort_by_web}    ${products_sort_by_price_LH}

TC6: Sort products by Price low to high Module 10-32
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[7]/a
    ${price_sort_by_web} =    Module_1.price_sort_by_web    //*[@id="sort"]/option[4]    oneprice
    ${products_sort_by_price_LH} =    Module_1.products_sort_by_price_LH    //*[@id="sort"]/option[4]
    Should Be Equal    ${price_sort_by_web}    ${products_sort_by_price_LH}

TC7: Sort products by Price low to high Module 10-38
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[8]/a
    ${price_sort_by_web} =    Module_1.price_sort_by_web    //*[@id="sort"]/option[4]    oneprice
    ${products_sort_by_price_LH} =    Module_1.products_sort_by_price_LH    //*[@id="sort"]/option[4]
    Should Be Equal    ${price_sort_by_web}    ${products_sort_by_price_LH}