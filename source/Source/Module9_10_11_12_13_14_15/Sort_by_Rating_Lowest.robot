*** Settings ***
Library           SeleniumLibrary
Library           Module_1.py

*** Test Cases ***
TC1: Sort products by Rating lowest Module 10-5
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[2]/a
    ${products_sort_by_web_rating} =    Module_1.products_sort_by_web_rating    //*[@id="sort"]/option[7]    rating
    ${products_sort_by_rating_L} =    Module_1.products_sort_by_rating_L    //*[@id="sort"]/option[7]
    Should Be Equal    ${products_sort_by_web_rating}    ${products_sort_by_rating_L}

TC2: Sort products by Rating lowest Module 10-11
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[3]/a
    ${products_sort_by_web_rating} =    Module_1.products_sort_by_web_rating    //*[@id="sort"]/option[7]    rating
    ${products_sort_by_rating_L} =    Module_1.products_sort_by_rating_L    //*[@id="sort"]/option[7]
    Should Be Equal    ${products_sort_by_web_rating}    ${products_sort_by_rating_L}

TC3: Sort products by Rating lowest Module 10-17
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[4]/a
    ${products_sort_by_web_rating} =    Module_1.products_sort_by_web_rating    //*[@id="sort"]/option[7]    rating
    ${products_sort_by_rating_L} =    Module_1.products_sort_by_rating_L    //*[@id="sort"]/option[7]
    Should Be Equal    ${products_sort_by_web_rating}    ${products_sort_by_rating_L}

TC4: Sort products by Rating lowest Module 10-23
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[5]/a
    ${products_sort_by_web_rating} =    Module_1.products_sort_by_web_rating    //*[@id="sort"]/option[7]    rating
    ${products_sort_by_rating_L} =    Module_1.products_sort_by_rating_L    //*[@id="sort"]/option[7]
    Should Be Equal    ${products_sort_by_web_rating}    ${products_sort_by_rating_L}

TC5: Sort products by Rating lowest Module 10-29
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[6]/a
    ${products_sort_by_web_rating} =    Module_1.products_sort_by_web_rating    //*[@id="sort"]/option[7]    rating
    ${products_sort_by_rating_L} =    Module_1.products_sort_by_rating_L    //*[@id="sort"]/option[7]
    Should Be Equal    ${products_sort_by_web_rating}    ${products_sort_by_rating_L}

TC6: Sort products by Rating lowest Module 10-35
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[7]/a
    ${products_sort_by_web_rating} =    Module_1.products_sort_by_web_rating    //*[@id="sort"]/option[7]    rating
    ${products_sort_by_rating_L} =    Module_1.products_sort_by_rating_L    //*[@id="sort"]/option[7]
    Should Be Equal    ${products_sort_by_web_rating}    ${products_sort_by_rating_L}

TC7: Sort products by Rating lowest Module 10-41
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[8]/a
    ${products_sort_by_web_rating} =    Module_1.products_sort_by_web_rating    //*[@id="sort"]/option[7]    rating
    ${products_sort_by_rating_L} =    Module_1.products_sort_by_rating_L    //*[@id="sort"]/option[7]
    Should Be Equal    ${products_sort_by_web_rating}    ${products_sort_by_rating_L}
