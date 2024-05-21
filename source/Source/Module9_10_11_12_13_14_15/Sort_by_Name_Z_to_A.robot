*** Settings ***
Library           SeleniumLibrary
Library           Module_1.py

*** Test Cases ***
TC1: Sort products by Name Z to A Module 14-1
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[2]/a
    ${products_sort_by_web} =    Module_1.products_sort_by_web    //*[@id="sort"]/option[3]    prdocutname
    ${products_sort_by_name_ZA} =    Module_1.products_sort_by_name_ZA    //*[@id="sort"]/option[3]
    Should Be Equal    ${products_sort_by_web}    ${products_sort_by_name_ZA}

TC2: Sort products by Name Z to A Module 14-7
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[3]/a
    ${products_sort_by_web} =    Module_1.products_sort_by_web    //*[@id="sort"]/option[3]    prdocutname
    ${products_sort_by_name_ZA} =    Module_1.products_sort_by_name_ZA    //*[@id="sort"]/option[3]
    Should Be Equal    ${products_sort_by_web}    ${products_sort_by_name_ZA}

TC3: Sort products by Name Z to A Module 14-13
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[4]/a
    ${products_sort_by_web} =    Module_1.products_sort_by_web    //*[@id="sort"]/option[3]    prdocutname
    ${products_sort_by_name_ZA} =    Module_1.products_sort_by_name_ZA    //*[@id="sort"]/option[3]
    Should Be Equal    ${products_sort_by_web}    ${products_sort_by_name_ZA}

TC4: Sort products by Name Z to A Module 14-19
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[5]/a
    ${products_sort_by_web} =    Module_1.products_sort_by_web    //*[@id="sort"]/option[3]    prdocutname
    ${products_sort_by_name_ZA} =    Module_1.products_sort_by_name_ZA    //*[@id="sort"]/option[3]
    Should Be Equal    ${products_sort_by_web}    ${products_sort_by_name_ZA}

TC5: Sort products by Name Z to A Module 14-25
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[6]/a
    ${products_sort_by_web} =    Module_1.products_sort_by_web    //*[@id="sort"]/option[3]    prdocutname
    ${products_sort_by_name_ZA} =    Module_1.products_sort_by_name_ZA    //*[@id="sort"]/option[3]
    Should Be Equal    ${products_sort_by_web}    ${products_sort_by_name_ZA}

TC6: Sort products by Name Z to A Module 14-31
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[7]/a
    ${products_sort_by_web} =    Module_1.products_sort_by_web    //*[@id="sort"]/option[3]    prdocutname
    ${products_sort_by_name_ZA} =    Module_1.products_sort_by_name_ZA    //*[@id="sort"]/option[3]
    Should Be Equal    ${products_sort_by_web}    ${products_sort_by_name_ZA}

TC7: Sort products by Name Z to A Module 14-37
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[8]/a
    ${products_sort_by_web} =    Module_1.products_sort_by_web    //*[@id="sort"]/option[3]    prdocutname
    ${products_sort_by_name_ZA} =    Module_1.products_sort_by_name_ZA    //*[@id="sort"]/option[3]
    Should Be Equal    ${products_sort_by_web}    ${products_sort_by_name_ZA}
