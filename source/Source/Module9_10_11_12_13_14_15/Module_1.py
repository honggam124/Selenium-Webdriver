import SeleniumLibrary
import random
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.action_chains import ActionChains

driver = webdriver.Chrome()

def getweb():
    driver.get("https://automationteststore.com/")
    
def get_catogory(categories, category_filter):
    apparel_menu = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, categories)))
    webdriver.ActionChains(driver).move_to_element(apparel_menu).perform()
    shoes_link = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, category_filter)))
    shoes_link.click()

def get_category(categories, category_filter):
    apparel_menu = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, categories)))
    webdriver.ActionChains(driver).move_to_element(apparel_menu).perform()
    shoes_link = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, category_filter)))
    shoes_link.click()

def get_big_catogory(categories):
    apparel_menu = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, categories)))
    apparel_menu.click()

def getListHref():
    list_product = [element.get_attribute("href") for element in driver.find_elements(By.CLASS_NAME, "prdocutname") if element.text.strip()]
    return list_product

def getListProduct(sortby):
    list_product = [element.text for element in driver.find_elements(By.CLASS_NAME, sortby) if element.text.strip()]
    return list_product

def getListPrice(sortby):
    list_product = [float(element.text.lstrip("$")) for element in driver.find_elements(By.CLASS_NAME, sortby) if element.text.strip()]
    return list_product 

################### FILTER PRODUCTS BY CATEGORY #####################
        
def filter_by_category(category_filter):
    list_product = getListHref()
    if not list_product:
        return False
    
    for link in list_product:
        driver.get(link)
        arr_model = [element.text for element in driver.find_elements(By.CLASS_NAME, "bgnone") if element.text.strip()]
        str_model = "".join(arr_model)
        description = [element.text for element in driver.find_elements(By.ID, "description") if element.text.strip()]
        str_description = "".join(description)
        
        if driver.find_elements(By.XPATH, '//*[@id="myTab"]/li[3]/a'):
            tags = WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.XPATH, '//*[@id="myTab"]/li[3]/a')))
            tags.click()
            producttag_1 = [element.text for element in driver.find_elements(By.XPATH, '//*[@id="producttag"]/ul/li[1]/a') if element.text.strip()]
            str_producttag_1 = "".join(producttag_1)
            
            if driver.find_elements(By.XPATH, '//*[@id="producttag"]/ul/li[2]/a'):
                producttag_2 = [element.text for element in driver.find_elements(By.XPATH, '//*[@id="producttag"]/ul/li[2]/a') if element.text.strip()]
                str_producttag_2 = "".join(producttag_2)
            else:
                str_producttag_2 = ""
                
            if driver.find_elements(By.XPATH, '//*[@id="producttag"]/ul/li[3]/a'):
                producttag_3 = [element.text for element in driver.find_elements(By.XPATH, '//*[@id="producttag"]/ul/li[3]/a') if element.text.strip()]
                str_producttag_3 = "".join(producttag_3)
            else:
                str_producttag_3 = ""

        else:
            str_producttag_1 = ""
            str_producttag_2 = ""
            str_producttag_3 = ""

        str_description = str_description.lower()
        str_model = str_model.lower()
        str_producttag_1 = str_producttag_1.lower()
        str_producttag_2 = str_producttag_2.lower()
        str_producttag_3 = str_producttag_3.lower()
        category_filter = category_filter.lower()
        
        concatenated_str = str_description + str_model + str_producttag_1 + str_producttag_2 + str_producttag_3
        category_filter2 = category_filter.replace(" ", "")
        stripped_str = concatenated_str.replace(" ", "")
        
        if category_filter2 not in stripped_str:
            return False
    return True        

################### PRINT PRODUCT #####################

def print_product():
    WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, '//*[@id="product"]/fieldset/div[3]')))
    print_button = driver.find_elements(By.CLASS_NAME, "productprint")
    print_button[0].click()

def view_detail_item():
    WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.XPATH, '//*[@id="search_form"]/div/div/i')))
    elements = [element.get_attribute("href") for element in driver.find_elements(By.CLASS_NAME, "prdocutname") if element.text.strip()]
    random_index = random.randint(0, len(elements) - 1)
    random_element = elements[random_index]
    driver.get(random_element)

################### SORT #####################

def products_sort_by_web(option, sortby):

    filter_dropdown = WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.XPATH, '//*[@id="sort"]')))
    filter_dropdown.click()
    option_name_az = WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.XPATH, option)))
    option_name_az.click()
    products_sort_by_web = getListProduct(sortby)
    return products_sort_by_web
    
def products_sort_by_name_AZ(option):
    products_sort_by_web = getListProduct("prdocutname")
    try:
        WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CLASS_NAME, "prdocutname")))
        products_sort_by_name_AZ = sorted(products_sort_by_web)
        return products_sort_by_name_AZ
    except:
        return None

def products_sort_by_name_ZA(option):
    products_sort_by_web = getListProduct("prdocutname")
    try:
        WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CLASS_NAME, "prdocutname")))
        products_sort_by_name_ZA = sorted(products_sort_by_web, reverse=True)
        return products_sort_by_name_ZA
    except:
        return None

def price_sort_by_web(option, sortby):
    filter_dropdown = WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.XPATH, '//*[@id="sort"]')))
    filter_dropdown.click()
    option_name_az = WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.XPATH, option)))
    option_name_az.click()
    products_sort_by_web = getListPrice("oneprice")
    return products_sort_by_web

def products_sort_by_price_LH(option):
    products_sort_by_web = getListPrice("oneprice")
    try:
        WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CLASS_NAME, "oneprice")))
        products_sort_by_price_LH = sorted(products_sort_by_web)
        return products_sort_by_price_LH
    except:
        return None
    
def products_sort_by_price_HL(option):
    products_sort_by_web = getListPrice("oneprice")
    try:
        WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CLASS_NAME, "oneprice")))
        products_sort_by_price_HL = sorted(products_sort_by_web, reverse = True)
        return products_sort_by_price_HL
    except:
        return None    

def getListProductByRating(sortby):
    dropdown = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.CLASS_NAME, "thumbnail")))
    actions = ActionChains(driver)
    actions.move_to_element(dropdown).perform()
    shortLinks = driver.find_elements(By.CLASS_NAME,"shortlinks")
    for link in shortLinks:
        driver.execute_script("arguments[0].style.display = 'block';", link)
    listp = driver.find_elements(By.CLASS_NAME, "rating") 
    list_product = [float(element.get_attribute("alt")[0]) for element in listp[0:len(listp)//2]]
    return list_product

def products_sort_by_web_rating(option, sortby):

    filter_dropdown = WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.XPATH, '//*[@id="sort"]')))
    filter_dropdown.click()
    option_name_az = WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.XPATH, option)))
    option_name_az.click()
    products_sort_by_web_rating = getListProductByRating(sortby)
    return products_sort_by_web_rating

def products_sort_by_rating_H(option):
    products_sort_by_web_rating = getListProductByRating('rating')
    try:
        products_sort_by_rating_H = sorted(products_sort_by_web_rating, reverse = True)
        return products_sort_by_rating_H
    except:
        return None
    
def products_sort_by_rating_L(option):
    products_sort_by_web_rating = getListProductByRating('rating')
    try:
        products_sort_by_rating_L = sorted(products_sort_by_web_rating)
        return products_sort_by_rating_L
    except:
        return None  
 
################### SEARCH #####################

def search_in_description(search_word, categories):
    WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.ID, "filter_keyword"))).send_keys(search_word)
    driver.find_element(By.XPATH, '//*[@id="search_form"]/div/div').click()
    driver.find_element(By.ID, 'category_id').click()
    driver.find_element(By.XPATH, categories).click() 
    WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.ID, "description"))).click()
    driver.find_element(By.ID, "search_button").click()
    list_product = getListHref()
    
    if not list_product:
        return True
    
    for link in list_product:
        driver.get(link)
        arr_model = [element.text for element in driver.find_elements(By.CLASS_NAME, "bgnone") if element.text.strip()]
        str_model = "".join(arr_model)
        description = [element.text for element in driver.find_elements(By.ID, "description") if element.text.strip()]
        str_description = "".join(description)
        
        if driver.find_elements(By.XPATH, '//*[@id="myTab"]/li[3]/a'):
            tags = WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.XPATH, '//*[@id="myTab"]/li[3]/a')))
            tags.click()
            producttag_1 = [element.text for element in driver.find_elements(By.XPATH, '//*[@id="producttag"]/ul/li[1]/a') if element.text.strip()]
            str_producttag_1 = "".join(producttag_1)
            
            if driver.find_elements(By.XPATH, '//*[@id="producttag"]/ul/li[2]/a'):
                producttag_2 = [element.text for element in driver.find_elements(By.XPATH, '//*[@id="producttag"]/ul/li[2]/a') if element.text.strip()]
                str_producttag_2 = "".join(producttag_2)
            else:
                str_producttag_2 = ""
                
            if driver.find_elements(By.XPATH, '//*[@id="producttag"]/ul/li[3]/a'):
                producttag_3 = [element.text for element in driver.find_elements(By.XPATH, '//*[@id="producttag"]/ul/li[3]/a') if element.text.strip()]
                str_producttag_3 = "".join(producttag_3)
            else:
                str_producttag_3 = ""

        else:
            str_producttag_1 = ""
            str_producttag_2 = ""
            str_producttag_3 = ""

        str_description = str_description.lower()
        str_model = str_model.lower()
        str_producttag_1 = str_producttag_1.lower()
        str_producttag_2 = str_producttag_2.lower()
        str_producttag_3 = str_producttag_3.lower()
        search_word = search_word.lower()
        
        concatenated_str = str_description + str_model + str_producttag_1 + str_producttag_2 + str_producttag_3
        search_word2 = search_word.replace(" ", "")
        stripped_str = concatenated_str.replace(" ", "")
        
        if search_word2 not in stripped_str:
            return False
    return True        

def search_in_model(search_word, categories):
    WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.ID, "filter_keyword"))).send_keys(search_word)
    driver.find_element(By.XPATH, '//*[@id="search_form"]/div/div').click()
    driver.find_element(By.ID, 'category_id').click()
    driver.find_element(By.XPATH, categories).click()   
    WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.ID, "model"))).click()
    driver.find_element(By.ID, "search_button").click()
    
    list_product = getListHref()
    if not list_product:
        return True
    
    for link in list_product:
        driver.get(link)
        description = [element.text for element in driver.find_elements(By.CLASS_NAME, "bgnone") if element.text.strip()]
        str_description = "".join(description)
        
        if driver.find_elements(By.XPATH, '//*[@id="myTab"]/li[3]/a'):
            tags = WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.XPATH, '//*[@id="myTab"]/li[3]/a')))
            tags.click()
            producttag_1 = [element.text for element in driver.find_elements(By.XPATH, '//*[@id="producttag"]/ul/li[1]/a') if element.text.strip()]
            str_producttag_1 = "".join(producttag_1)
            
            if driver.find_elements(By.XPATH, '//*[@id="producttag"]/ul/li[2]/a'):
                producttag_2 = [element.text for element in driver.find_elements(By.XPATH, '//*[@id="producttag"]/ul/li[2]/a') if element.text.strip()]
                str_producttag_2 = "".join(producttag_2)
            else:
                str_producttag_2 = ""
                
            if driver.find_elements(By.XPATH, '//*[@id="producttag"]/ul/li[3]/a'):
                producttag_3 = [element.text for element in driver.find_elements(By.XPATH, '//*[@id="producttag"]/ul/li[3]/a') if element.text.strip()]
                str_producttag_3 = "".join(producttag_3)
            else:
                str_producttag_3 = ""

        else:
            str_producttag_1 = ""
            str_producttag_2 = ""
            str_producttag_3 = ""

        str_description = str_description.lower()
        str_producttag_1 = str_producttag_1.lower()
        str_producttag_2 = str_producttag_2.lower()
        str_producttag_3 = str_producttag_3.lower()
        search_word = search_word.lower()
        
        concatenated_str = str_description + str_producttag_1 + str_producttag_2 + str_producttag_3
        search_word2 = search_word.replace(" ", "")
        stripped_str = concatenated_str.replace(" ", "")
        if search_word2 not in stripped_str:
            return False
    return True 

################### VIEW DETAIL PRODUCT #####################

def view_detail_item_by_name():
    WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.XPATH, '//*[@id="search_form"]/div/div/i')))

    elements = [element.get_attribute("href") for element in driver.find_elements(By.CLASS_NAME, "prdocutname") if element.text.strip()]
    titles = [element.get_attribute("title") for element in driver.find_elements(By.CLASS_NAME, "prdocutname") if element.text.strip()]
    random_index = random.randint(0, len(titles) - 1)
    random_element = elements[random_index]
    item_name = titles[random_index]
    driver.get(random_element)
    WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.XPATH, '/html/body/div/header/div[1]/div/div[2]')))
    # Assert that the item detail page is displayed
    assert "https://automationteststore.com" in driver.current_url
    # Assert that the item detail matches the clicked item
    if item_name in driver.page_source:
        return True
    else:
        return False
    
def view_detail_item_by_img():
    WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.XPATH, '//*[@id="search_form"]/div/div/i')))
    
    elements = driver.find_elements(By.CSS_SELECTOR, '.thumbnail img')    
    titles = [element.get_attribute("title") for element in driver.find_elements(By.CLASS_NAME, "prdocutname") if element.text.strip()]
    random_index = random.randint(0, len(titles) - 1)
    random_element = elements[random_index]
    item_name = titles[random_index]
    
    actions = ActionChains(driver)
    actions.move_to_element(random_element).perform()

    WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.XPATH, '/html/body/div/header/div[1]/div/div[2]')))
    # Assert that the item detail page is displayed
    assert "https://automationteststore.com" in driver.current_url
    # Assert that the item detail matches the clicked item
    if item_name in driver.page_source:
        return True
    else:
        return False
    return elements

################### VIEW LIST BY CURRENCY #####################

def Currency_EURO():
    dropdown = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.CLASS_NAME, "dropdown.hover")))

    actions = ActionChains(driver)
    actions.move_to_element(dropdown).perform()

    currency_menu = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.CLASS_NAME, "dropdown-menu.currency")))

    elements = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.XPATH, '/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[1]')))
    elements.click()
    
    price = [element.text for element in driver.find_elements(By.CLASS_NAME, 'oneprice') if element.text.strip()]

    random_index = random.randint(0, len(price) - 1)
    price_item = price[random_index]

    if 8364 == float(ord(price_item[-1])):
        return True
    else:
        return False

def Currency_POUND():
    dropdown = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.CLASS_NAME, "dropdown.hover")))

    actions = ActionChains(driver)
    actions.move_to_element(dropdown).perform()

    currency_menu = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.CLASS_NAME, "dropdown-menu.currency")))

    elements = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.XPATH, '/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[2]')))
    elements.click()
    
    price = [element.text for element in driver.find_elements(By.CLASS_NAME, 'oneprice') if element.text.strip()]

    random_index = random.randint(0, len(price) - 1)
    price_item = price[random_index]

    if 163 == float(ord(price_item[0])):
        return True
    else:
        return False

def Currency_DOLLAR():
    dropdown = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.CLASS_NAME, "dropdown.hover")))

    actions = ActionChains(driver)
    actions.move_to_element(dropdown).perform()

    currency_menu = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.CLASS_NAME, "dropdown-menu.currency")))

    elements = WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.XPATH, '/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[3]')))
    elements.click()
    
    price = [element.text for element in driver.find_elements(By.CLASS_NAME, 'oneprice') if element.text.strip()]

    random_index = random.randint(0, len(price) - 1)
    price_item = price[random_index]

    if '$' == price_item[0]:
        return True
    else:
        return False
        
################### VIEW PRODUCT LIST #####################

def listview():
    WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.ID, "list"))).click()
    element = WebDriverWait(driver, 5).until(EC.visibility_of_element_located((By.XPATH, '//*[@id="maincontainer"]/div/div/div/div/div[4]')))
    display_style = element.value_of_css_property('display')
    if display_style == 'block':
        return True
    else:
        return False

def gridview():
    WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.ID, "list"))).click()
    WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.ID, "grid"))).click()
    element = WebDriverWait(driver, 15).until(EC.visibility_of_element_located((By.XPATH, '//*[@id="maincontainer"]/div/div/div/div/div[3]')))
    display_style = element.value_of_css_property('display')
    if display_style == 'block':
        return True
    else:
        return False
