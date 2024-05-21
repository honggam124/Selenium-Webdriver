*** Settings ***
Library           SeleniumLibrary
Library           Module_1.py

*** Test Cases ***
TC1: Sort products by Rating highest Module 10-4
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[2]/a
    ${products_sort_by_web_rating} =    Module_1.products_sort_by_web_rating    //*[@id="sort"]/option[6]    rating
    ${products_sort_by_rating_H} =    Module_1.products_sort_by_rating_H    //*[@id="sort"]/option[6]
    Should Be Equal    ${products_sort_by_web_rating}    ${products_sort_by_rating_H}

TC2: Sort products by Rating highest Module 10-10
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[3]/a
    ${products_sort_by_web_rating} =    Module_1.products_sort_by_web_rating    //*[@id="sort"]/option[6]    rating
    ${products_sort_by_rating_H} =    Module_1.products_sort_by_rating_H    //*[@id="sort"]/option[6]
    Should Be Equal    ${products_sort_by_web_rating}    ${products_sort_by_rating_H}

TC3: Sort products by Rating highest Module 10-16
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[4]/a
    ${products_sort_by_web_rating} =    Module_1.products_sort_by_web_rating    //*[@id="sort"]/option[6]    rating
    ${products_sort_by_rating_H} =    Module_1.products_sort_by_rating_H    //*[@id="sort"]/option[6]
    Should Be Equal    ${products_sort_by_web_rating}    ${products_sort_by_rating_H}

TC4: Sort products by Rating highest Module 10-22
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[5]/a
    ${products_sort_by_web_rating} =    Module_1.products_sort_by_web_rating    //*[@id="sort"]/option[6]    rating
    ${products_sort_by_rating_H} =    Module_1.products_sort_by_rating_H    //*[@id="sort"]/option[6]
    Should Be Equal    ${products_sort_by_web_rating}    ${products_sort_by_rating_H}

TC5: Sort products by Rating highest Module 10-28
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[6]/a
    ${products_sort_by_web_rating} =    Module_1.products_sort_by_web_rating    //*[@id="sort"]/option[6]    rating
    ${products_sort_by_rating_H} =    Module_1.products_sort_by_rating_H    //*[@id="sort"]/option[6]
    Should Be Equal    ${products_sort_by_web_rating}    ${products_sort_by_rating_H}

TC6: Sort products by Rating highest Module 10-34
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[7]/a
    ${products_sort_by_web_rating} =    Module_1.products_sort_by_web_rating    //*[@id="sort"]/option[6]    rating
    ${products_sort_by_rating_H} =    Module_1.products_sort_by_rating_H    //*[@id="sort"]/option[6]
    Should Be Equal    ${products_sort_by_web_rating}    ${products_sort_by_rating_H}

TC7: Sort products by Rating highest Module 10-40
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[8]/a
    ${products_sort_by_web_rating} =    Module_1.products_sort_by_web_rating    //*[@id="sort"]/option[6]    rating
    ${products_sort_by_rating_H} =    Module_1.products_sort_by_rating_H    //*[@id="sort"]/option[6]
    Should Be Equal    ${products_sort_by_web_rating}    ${products_sort_by_rating_H}
