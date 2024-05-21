*** Settings ***
Library           SeleniumLibrary
Library           Module_1.py

*** Test Cases ***
TC1: Sort products by Name A to Z Module 14
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[2]/a
    ${products_sort_by_web} =    Module_1.products_sort_by_web    //*[@id="sort"]/option[2]    prdocutname
    ${products_sort_by_name_AZ} =    Module_1.products_sort_by_name_AZ    //*[@id="sort"]/option[2]
    Should Be Equal    ${products_sort_by_web}    ${products_sort_by_name_AZ}

TC2: Sort products by Name A to Z Module 14-6
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[3]/a
    ${products_sort_by_web} =    Module_1.products_sort_by_web    //*[@id="sort"]/option[2]    prdocutname
    ${products_sort_by_name_AZ} =    Module_1.products_sort_by_name_AZ    //*[@id="sort"]/option[2]
    Should Be Equal    ${products_sort_by_web}    ${products_sort_by_name_AZ}

TC3: Sort products by Name A to Z Module 14-12
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[4]/a
    ${products_sort_by_web} =    Module_1.products_sort_by_web    //*[@id="sort"]/option[2]    prdocutname
    ${products_sort_by_name_AZ} =    Module_1.products_sort_by_name_AZ    //*[@id="sort"]/option[2]
    Should Be Equal    ${products_sort_by_web}    ${products_sort_by_name_AZ}

TC4: Sort products by Name A to Z Module 14-18
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[5]/a
    ${products_sort_by_web} =    Module_1.products_sort_by_web    //*[@id="sort"]/option[2]    prdocutname
    ${products_sort_by_name_AZ} =    Module_1.products_sort_by_name_AZ    //*[@id="sort"]/option[2]
    Should Be Equal    ${products_sort_by_web}    ${products_sort_by_name_AZ}

TC5: Sort products by Name A to Z Module 14-24
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[6]/a
    ${products_sort_by_web} =    Module_1.products_sort_by_web    //*[@id="sort"]/option[2]    prdocutname
    ${products_sort_by_name_AZ} =    Module_1.products_sort_by_name_AZ    //*[@id="sort"]/option[2]
    Should Be Equal    ${products_sort_by_web}    ${products_sort_by_name_AZ}

TC6: Sort products by Name A to Z Module 14-30
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[7]/a
    ${products_sort_by_web} =    Module_1.products_sort_by_web    //*[@id="sort"]/option[2]    prdocutname
    ${products_sort_by_name_AZ} =    Module_1.products_sort_by_name_AZ    //*[@id="sort"]/option[2]
    Should Be Equal    ${products_sort_by_web}    ${products_sort_by_name_AZ}

TC7: Sort products by Name A to Z Module 14-36
    Module_1.getweb
    Module_1.get_big_catogory    //*[@id="categorymenu"]/nav/ul/li[8]/a
    ${products_sort_by_web} =    Module_1.products_sort_by_web    //*[@id="sort"]/option[2]    prdocutname
    ${products_sort_by_name_AZ} =    Module_1.products_sort_by_name_AZ    //*[@id="sort"]/option[2]
    Should Be Equal    ${products_sort_by_web}    ${products_sort_by_name_AZ}
