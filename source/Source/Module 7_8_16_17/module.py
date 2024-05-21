import time
from selenium.webdriver.common.by import By
from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.keys import Keys
import SeleniumLibrary
import random
from selenium.common.exceptions import StaleElementReferenceException
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.support.ui import Select
from robot.libraries.BuiltIn import BuiltIn

#-------------------------------------------FUNCTION-----------------------------------#
def open():
    driver = webdriver.Chrome()
    driver.maximize_window()
    driver.get("https://automationteststore.com/")
    return driver

def close(driver):
    driver.close()

def go_back(driver):
    driver.back()

def click_element_byXpath(driver, locate):
    element = WebDriverWait(driver, 3).until(
        EC.presence_of_element_located((By.XPATH, locate))
    )
    driver.execute_script("arguments[0].scrollIntoView();", element)
    driver.execute_script("arguments[0].click();", element)
    return driver

def hover_element_byXpath(driver, locate):
    element = WebDriverWait(driver, 3).until(
        EC.presence_of_element_located((By.XPATH, locate))
    )
    driver.execute_script("arguments[0].scrollIntoView();", element)
    driver.execute_script("arguments[0].dispatchEvent(new Event('mouseover'))", element)
    return driver

def check_for_text(driver, text):
    page_source = driver.page_source
    if text in page_source:
        return True
    return False

def check_visibility(driver, locate):
    element = WebDriverWait(driver, 5).until(
        EC.presence_of_element_located((By.XPATH, locate))
    )
    if element.is_displayed():
        return True
    return False

def open_home(driver):
    click_element_byXpath(driver, '/html/body/div/header/div[1]/div/div[1]/a')

def open_cart(driver):
    click_element_byXpath(driver,'//*[@id="main_menu_top"]/li[3]/a')

def open_checkout(driver):
    click_element_byXpath(driver, '//*[@id="main_menu_top"]/li[4]/a')
    res = check_url(driver, 'https://automationteststore.com/index.php?rt=checkout/confirm')
    return res

def check_url(driver, url):
    current_url = driver.current_url
    if(current_url == url):
        return True
    return False

def input_login(driver, loginName, password):
    loginName_f = driver.find_element(By.ID, "loginFrm_loginname")
    password_f = driver.find_element(By.ID, "loginFrm_password")

    loginName_f.send_keys(loginName)
    password_f.send_keys(password)

    driver = click_element_byXpath(driver, "/html/body/div/div[2]/div/div/div/div/div[2]/div/form/fieldset/button")
    return driver

def input_register(driver, firstName, lastName, email, add1, city, region, zipcode, country, loginName, password, passConf, pri):
    #find field (firstName_f: firsrName_Field)
    firstName_f = driver.find_element(By.ID, "AccountFrm_firstname")
    lastName_f = driver.find_element(By.ID, "AccountFrm_lastname")
    email_f = driver.find_element(By.ID, "AccountFrm_email")
    add1_f = driver.find_element(By.ID, "AccountFrm_address_1")
    city_f = driver.find_element(By.ID, "AccountFrm_city")
    zipcode_f = driver.find_element(By.ID, "AccountFrm_postcode")
    loginName_f = driver.find_element(By.ID, "AccountFrm_loginname")
    password_f = driver.find_element(By.ID, "AccountFrm_password")
    passConf_f = driver.find_element(By.ID, "AccountFrm_confirm")
    
    #send key to field
    firstName_f.send_keys(firstName)
    lastName_f.send_keys(lastName)
    email_f.send_keys(email)
    add1_f.send_keys(add1)
    city_f.send_keys(city)
    zipcode_f.send_keys(zipcode)
    
    #If country is not empty, select it from the dropdown
    if country:
        country_f = Select(driver.find_element(By.ID,"AccountFrm_country_id"))
        options = [option.text for option in country_f.options]
        random_option = random.choice(options)
        country_f.select_by_visible_text(random_option)

    time.sleep(5)
        
    # If region is not empty, select it from the dropdown
    if region:
        region_f = Select(driver.find_element(By.ID,"AccountFrm_zone_id"))
        options = [option.text for option in region_f.options]
        random_option = random.choice(options)
        region_f.select_by_visible_text(random_option)

        
    loginName_f.send_keys(loginName)
    password_f.send_keys(password)
    passConf_f.send_keys(passConf)
    
    #privacy policy
    if pri:
        driver = click_element_byXpath(driver, "/html/body/div/div[2]/div/div/div/div[1]/form/div[5]/div/label/input")
    return driver

########################################################################### CART ###############################################################################

def get_names_in_cart(driver):
    click_element_byXpath(driver, '//*[@id="main_menu_top"]/li[3]/a')
    table_rows = driver.find_elements(By.CSS_SELECTOR, '.contentpanel .product-list .table-striped tbody tr')[1:]
    names = [row.find_element(By.CSS_SELECTOR, '.align_left a').text.strip().upper() for row in table_rows]
    return names

def get_quantity_cart(driver):
    table_rows = driver.find_elements(By.CSS_SELECTOR, '.contentpanel .product-list .table-striped tbody tr')[1:]
    quantities = []
    for row in table_rows:
        input_element = row.find_element(By.CSS_SELECTOR, '.align_center .input-group input')
        value = input_element.get_attribute("value")
        if value is not None:
            quantities.append(int(value))
    return quantities

def add_by_icon(driver, section_id, number, url, amount):
    number = int(number)
    section = driver.find_element(By.ID,section_id)
    products = section.find_elements(By.CSS_SELECTOR, '.col-md-3')
    product_name = ""
    for i in range(len(products)):
        if(number == i):
            product_name = products[i].find_element(By.CSS_SELECTOR, ".prdocutname").text
            btn = products[i].find_element(By.CSS_SELECTOR, '.productcart')
            btn.click()

    if(driver.current_url == url):
        quick_baskets = section.find_elements(By.CSS_SELECTOR, '.quick_basket')
        if(len(quick_baskets) == 1):
            # get name
            click_element_byXpath(driver, '//*[@id="main_menu_top"]/li[3]/a')
            name_in_cart = get_names_in_cart(driver)
            # get quantity
            table_rows = driver.find_elements(By.CSS_SELECTOR, '.contentpanel .product-list .table-striped tbody tr')[1:]
            quantities = 0
            for row in table_rows:
                input_element = row.find_element(By.CSS_SELECTOR, '.align_center .input-group input')
                value = input_element.get_attribute("value")
                if value is not None:
                    quantities = int(value)
            ####
            if(name_in_cart[0] == product_name):
                if(quantities == int(amount)):
                    return "OK"
                else:
                    table_rows = driver.find_elements(By.CSS_SELECTOR, '.contentpanel .product-list .table-striped tbody tr')[1:]
                    for row in table_rows:
                        name = row.find_element(By.CSS_SELECTOR, '.align_left a')
                        name.click()
                    time.sleep(2)
                    val_quantity = check_for_text(driver, 'This product has a minimum quantity')
                    if(val_quantity):
                        return "OK"
                    return "Thêm sai số lượng"
            else:
                return "Thêm sản phẩm không giống"
        else:
            return "Không thấy dấu hiệu thêm thành công"
    else:
        if "https://automationteststore.com/index.php?rt=product/product&product_id=" in driver.current_url and check_visibility(driver,'//*[@id="product"]/fieldset/div[1]/div'):
            return "OK"
        return "Điều hướng qua trang khác"
    
def add_to_cart_details_page(driver, section_id, number, amount):
    number = int(number)
    section = driver.find_element(By.ID,section_id)
    products = section.find_elements(By.CSS_SELECTOR, '.col-md-3')
    product_name = []
    for i in range(len(products)):
        if(number == i):
            product = products[i].find_element(By.CSS_SELECTOR, ".prdocutname")
            product_name.append(product.text)
            product.click()

    if(check_visibility(driver,'//*[@id="product"]/fieldset/div[1]/div')):
        radio_buttons = driver.find_elements(By.CSS_SELECTOR, '.input-group.col-sm-10 input[type="radio"]')
        selectable_buttons = [radio for radio in radio_buttons if not radio.get_attribute('disabled')]
        if selectable_buttons:
            random_radio = random.choice(selectable_buttons)
            random_radio.click()
            
    element = WebDriverWait(driver, 5).until(
        EC.presence_of_element_located((By.CSS_SELECTOR, ".cart"))
    )
    val_quantity = check_for_text(driver, 'This product has a minimum quantity')      
    quantity = driver.find_element(By.ID, "product_quantity")
    quantity.clear()
    quantity.send_keys(amount)
    driver.execute_script("arguments[0].click();", element)
    name_in_cart = get_names_in_cart(driver)
    if(name_in_cart == product_name):
        table_rows = driver.find_elements(By.CSS_SELECTOR, '.contentpanel .product-list .table-striped tbody tr')[1:]
        quantities = 0
        for row in table_rows:
            input_element = row.find_element(By.CSS_SELECTOR, '.align_center .input-group input')
            value = input_element.get_attribute("value")
            if value is not None:
                quantities = int(value)
        
        if(quantities == int(amount) or (quantities != int(amount) and val_quantity)):
            return "OK"
        else:
            return "Thêm số lượng không đúng"
    else:
        return "Thêm sản phẩm không giống"
    
def add_twice(driver, section_id, number, xpathUrl, amount, quan):
    click_element_byXpath(driver, xpathUrl)
    amount = int(amount)
    product_name = []
    for a in range (0, amount):
        number = int(number)
        section = driver.find_element(By.ID,section_id)
        products = section.find_elements(By.CSS_SELECTOR, '.col-md-3')
        for i in range(len(products)):
            if(number == i):
                product = products[i].find_element(By.CSS_SELECTOR, ".prdocutname")
                if product.text not in product_name:
                    product_name.append(product.text)
                product.click()

        if(check_visibility(driver,'//*[@id="product"]/fieldset/div[1]/div')):
            radio_buttons = driver.find_elements(By.CSS_SELECTOR, '.input-group.col-sm-10 input[type="radio"]')
            selectable_buttons = [radio for radio in radio_buttons if not radio.get_attribute('disabled')]
            if selectable_buttons:
                random_radio = random.choice(selectable_buttons)
                random_radio.click()
            
        element = WebDriverWait(driver, 5).until(
            EC.presence_of_element_located((By.CSS_SELECTOR, ".cart"))
        )
        val_quantity = check_for_text(driver, 'This product has a minimum quantity')      
        quantity = driver.find_element(By.ID, "product_quantity")
        quantity.clear()
        quantity.send_keys(int(quan))
        driver.execute_script("arguments[0].click();", element)
        click_element_byXpath(driver, xpathUrl)  
    click_element_byXpath(driver,'//*[@id="main_menu_top"]/li[3]/a')
    name_in_cart = get_names_in_cart(driver)
    if(name_in_cart == product_name):
        table_rows = driver.find_elements(By.CSS_SELECTOR, '.contentpanel .product-list .table-striped tbody tr')[1:]
        quantities = 0
        for row in table_rows:
            input_element = row.find_element(By.CSS_SELECTOR, '.align_center .input-group input')
            value = input_element.get_attribute("value")
            if value is not None:
                quantities = int(value)
        
        if(quantities == (int(amount)*(int(quan))) or (quantities != (int(amount)*(int(quan))) and val_quantity)):
            return "OK"
        else:
            return "Thêm số lượng không đúng"
    else:
        return "Thêm sản phẩm không giống"
    
def get_product_names_in_section(driver, section_id):
    section = driver.find_element(By.ID,section_id)
    products = section.find_elements(By.CSS_SELECTOR, '.col-md-3')
    product_names = []
    for product in products:
        btn = product.find_elements(By.CSS_SELECTOR, '.productcart')
        if btn:
            product_name = product.find_element(By.CSS_SELECTOR, ".prdocutname").text
            product_names.append(product_name)
    return product_names

def click_icon_add_to_cart(driver, section_id):
    quantity = []
    section = driver.find_element(By.ID,section_id)
    products = section.find_elements(By.CSS_SELECTOR, '.productcart')
    for product in products:
        product.click()
        quantity.append(1)
    count_click = len(products)
    quick_baskets = section.find_elements(By.CSS_SELECTOR, '.quick_basket')
    count_icon = len(quick_baskets)
    if count_click == count_icon:
        return quantity
    return "Khong them duoc"

def find_soldout(driver, section_id):
    section = driver.find_element(By.ID,section_id)
    products = section.find_elements(By.CSS_SELECTOR, '.col-md-3')
    soldout_indexes = []
    for i in range(len(products)):
        btn = products[i].find_elements(By.CSS_SELECTOR, '.nostock')
        if btn:
            soldout_indexes.append(i)
    return soldout_indexes

def find_call_to_order(driver,section_id):
    section = driver.find_element(By.ID,section_id)
    products = section.find_elements(By.CSS_SELECTOR, '.col-md-3')
    call = []
    for i in range(len(products)):
        btn = products[i].find_elements(By.CSS_SELECTOR, '.call_to_order')
        if btn:
            call.append(i)
    return call   

# def get_out_of_stock_names(driver, section_id):
#     section = driver.find_element(By.ID, section_id)
#     products = section.find_elements(By.CSS_SELECTOR, '.col-md-3')
#     soldout_product_names = []
#     for product in products:
#         btn = product.find_elements(By.CSS_SELECTOR, '.nostock')
#         if btn:
#             product_name_element = product.find_element(By.CSS_SELECTOR, '.prdocutname')
#             product_name = product_name_element.text
#             soldout_product_names.append(product_name)
#     return soldout_product_names

def check_dropdown_and_total(driver):
    open_home(driver)
    quantity_d = driver.find_element(By.XPATH, '/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]').text.strip()
    total = driver.find_element(By.XPATH, '/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]').text.strip()
    total_d = total.replace("$","")
    open_cart(driver)
    table_rows = driver.find_elements(By.CSS_SELECTOR, '.contentpanel .product-list .table-striped tbody tr')[1:]
    price = []
    price2 = []
    for row in table_rows:
        price_each = row.find_element(By.CSS_SELECTOR, '.align_right').text.strip()
        price.append(price_each)
    sub_total = 0
    for i in range (0, len(price)):
        price_each = price[i].replace("$","")
        price2.append(price_each)
    quantities = get_quantity_cart(driver)
    for i in range (0,len(price2)):
        sub_total += int(quantities[i])*float(price2[i])
    quantity_cart = len(quantities)
    total_cart = WebDriverWait(driver, 3).until(
        EC.presence_of_element_located((By.XPATH, '//*[@id="totals_table"]/tbody/tr[1]/td[2]/span'))
    )
    total_c = total_cart.text.strip()
    total_c = total_c.replace("$","")
    if(int(quantity_d) == int(quantity_cart) and float(total_d) == float(total_c) and float(total_d) == sub_total):
        return True
    return False

def check_out_of_stock_detail_page(driver, section_id, number):
    number = int(number)
    section = driver.find_element(By.ID,section_id)
    products = section.find_elements(By.CSS_SELECTOR, '.col-md-3')
    for i in range(len(products)):
        if(number == i):
            product = products[i].find_element(By.CSS_SELECTOR, ".prdocutname")
            product.click()
            nostock = driver.find_element(By.CSS_SELECTOR,'.nostock')
            if nostock.text.strip() == 'Out of Stock':
                return True
            return False
            
#----wishlist---- 
       
def add_to_cart_in_wishlist(driver, name):
    table_rows = driver.find_elements(By.CSS_SELECTOR, '.contentpanel .product-list .table-striped tbody tr')[1:]
    for row in table_rows:
        product_name = row.find_element(By.CSS_SELECTOR, '.align_left a').text.strip().upper()
        if(product_name == name):
            btn_remove = row.find_element(By.CSS_SELECTOR, '.align_center a.btn-primary')
            btn_remove.click()
            break        

def check_add_out_of_stocks(driver):
    open_cart(driver)
    if(check_visibility(driver, '//*[@id="maincontainer"]/div/div/div/div') and driver.find_element(By.XPATH, '//*[@id="maincontainer"]/div/div/div/div').text.strip() == "Products marked with *** are not available in the desired quantity or out of stock!") or (check_visibility(driver, '//*[@id="maincontainer"]/div/div/div/div[2]') and driver.find_element(By.XPATH, '//*[@id="maincontainer"]/div/div/div/div[2]').text.strip() == "Allowed product's quantity is below minimum required. Quantity was set to minimum amount."):
        return True
    return False

def check_out_of_stocks_name_in_cart(driver, name):
    table_rows = driver.find_elements(By.CSS_SELECTOR, '.contentpanel .product-list .table-striped tbody tr')[1:]
    for row in table_rows:
        product_name = row.find_element(By.CSS_SELECTOR, '.align_left a').text.strip().upper()
        if(product_name == name):
            add_text = row.find_element(By.CSS_SELECTOR, '.align_left span').text.strip()
            if(add_text == '***'):
                return True
            return False
        
#-----update-----

def update_random(driver, index, amount):
    table_rows = driver.find_elements(By.CSS_SELECTOR, '.contentpanel .product-list .table-striped tbody tr')[1:]
    for i in range(len(table_rows)):
        if(int(index) == i):
            name = table_rows[i].find_element(By.CSS_SELECTOR, ".align_left a").text.strip()
            input = table_rows[i].find_element(By.CSS_SELECTOR, "input")
            input.clear()
            input.send_keys(amount)
            break
    return name

def click_update(driver):
    update_btn = driver.find_element(By.ID, 'cart_update')
    update_btn.click()

def check_update(driver, quantities_before, quantities_after, index, amount, name):
    try:
        int_amount = int(amount)
    except ValueError:
        names = get_names_in_cart(driver)
        if name not in names:
            return True
        return False

    if int_amount > 1:
        if quantities_before != quantities_after and quantities_after[int(index)] == int_amount:
            return True
        return amount
    else:
        names = get_names_in_cart(driver)
        if name not in names:
            return True
        return False

def update_limit(driver, amount):
    open_cart(driver)
    quanlity_before = get_quantity_cart(driver)
    table_rows = driver.find_elements(By.CSS_SELECTOR, '.contentpanel .product-list .table-striped tbody tr')[1:]
    for row in table_rows:
        input_element = row.find_element(By.CSS_SELECTOR, '.align_center .input-group input')
        input_element.clear()
        input_element.send_keys(amount)

    update_btn = driver.find_element(By.ID, 'cart_update')
    update_btn.click()

    quanlity_after = get_quantity_cart(driver)

    if(int(amount) >= quanlity_before[0]):
        if(quanlity_after != quanlity_before and quanlity_after[0] == int(amount)):
            return True
        return False
    else:
        if check_for_text(driver,"Allowed product's quantity is below minimum required. Quantity was set to minimum amount."):
            return True
        return False

#-----remove------

def remove_all_in_cart(driver):
    open_cart(driver)
    while True:
        try:
            table_rows = driver.find_elements(By.CSS_SELECTOR, '.contentpanel .product-list .table-striped tbody tr')[1:]
            if not table_rows:
                break 
            for row in table_rows:
                btn_remove = row.find_element(By.CSS_SELECTOR, '.align_center a.btn')
                btn_remove.click()
        except StaleElementReferenceException:
            continue  

def remove_one_random(driver, number):
    name = ""
    table_rows = driver.find_elements(By.CSS_SELECTOR, '.contentpanel .product-list .table-striped tbody tr')[1:]
    for i in range(len(table_rows)):
        if(int(number) == i):
            name = table_rows[i].find_element(By.CSS_SELECTOR, ".align_left a").text.strip()
            btn_remove = table_rows[i].find_element(By.CSS_SELECTOR, '.align_center a.btn')
            btn_remove.click()
    return name.upper()

def check_quantity_remove(driver):
    table_rows = driver.find_elements(By.CSS_SELECTOR, '.contentpanel .product-list .table-striped tbody tr')[1:]
    return len(table_rows)

def remove_from_cart(driver, name):
    table_rows = driver.find_elements(By.CSS_SELECTOR, '.contentpanel .product-list .table-striped tbody tr')[1:]
    for row in table_rows:
        product_name = row.find_element(By.CSS_SELECTOR, '.align_left a').text.strip()
        if(product_name.upper() == name.upper()):
            btn_remove = row.find_element(By.CSS_SELECTOR, '.align_center a.btn')
            btn_remove.click()
            break

########################################################################### WISH LIST ###############################################################################

def add_to_wish_list(driver):
    if check_for_text(driver, 'Remove from wish list'):
        click_element_byXpath(driver,'//*[@id="product"]/fieldset/div[5]/a[1]')
    time.sleep(2)
    btn_add = driver.find_element(By.CSS_SELECTOR, '.wishlist_add')
    btn_add.click()

def get_name_product(driver):
    name = driver.find_element(By.XPATH, '/html/body/div/div[2]/div/div[2]/div/div[1]/div/div[2]/div/div/h1').text.strip().upper()
    return name

def open_wish_list(driver):
    click_element_byXpath(driver,'//*[@id="customer_menu_top"]/li/a')
    click_element_byXpath(driver,'//*[@id="maincontainer"]/div/div[1]/div/ul/li[4]/a')
    return check_url(driver,'https://automationteststore.com/index.php?rt=account/wishlist')
    
def get_names_in_wishlist(driver):
    table_rows = driver.find_elements(By.CSS_SELECTOR, '.contentpanel .product-list .table-striped tbody tr')[1:]
    names = [row.find_element(By.CSS_SELECTOR, '.align_left a').text.strip().upper() for row in table_rows]
    return names
   
def check_add(driver, name):
    names = get_names_in_wishlist(driver)
    if(name in names):
        return True
    return names

def remove_from_wish_list(driver, name):
    table_rows = driver.find_elements(By.CSS_SELECTOR, '.contentpanel .product-list .table-striped tbody tr')[1:]
    for row in table_rows:
        product_name = row.find_element(By.CSS_SELECTOR, '.align_left a').text.strip().upper()
        if(product_name == name):
            btn_remove = row.find_element(By.CSS_SELECTOR, '.align_center a.btn-remove')
            btn_remove.click()
            break

########################################################################### PAYMENT ###############################################################################

def click_checkout_top_in_cart(driver):
    btn = driver.find_element(By.XPATH, '//*[@id="cart_checkout1"]')
    btn.click()

def click_checkout_down_in_cart(driver):
    btn = driver.find_element(By.XPATH, '//*[@id="cart_checkout2"]')
    btn.click()

def click_confirm(driver):
    btn = driver.find_element(By.XPATH, '//*[@id="checkout_btn"]')
    btn.click()

def check_confirm(driver):
    url = driver.current_url
    if(url == 'https://automationteststore.com/index.php?rt=checkout/success'):
        return True
    return False

def check_location(location_actual, location_check):
    if(location_check == location_actual):
        return True
    return False

def get_total_cart(driver):
    open_cart(driver)
    total_element = WebDriverWait(driver, 3).until(
        EC.presence_of_element_located((By.XPATH, '//*[@id="totals_table"]/tbody/tr[3]/td[2]/span'))
    )
    total = total_element.text.strip()
    return total

def get_names_checkout(driver):
    table_rows = driver.find_elements(By.CSS_SELECTOR, '.confirm_products tbody tr')
    names = [row.find_element(By.CSS_SELECTOR, '.checkout_heading').text.strip().upper() for row in table_rows]
    return names

def get_quantity_checkout(driver):
    table_rows = driver.find_elements(By.CSS_SELECTOR, '.confirm_products tbody tr')
    quantity = []
    for row in table_rows:
        td_elements = row.find_elements(By.CSS_SELECTOR, 'td')
        if len(td_elements) >= 4:
            quantity.append(int(td_elements[3].text.strip()))
    return quantity

def get_total_checkout(driver):
    total_element = WebDriverWait(driver, 5).until(
        EC.presence_of_element_located((By.XPATH, '//*[@id="maincontainer"]/div/div[1]/div/div[2]/div/div[1]/table/tbody/tr[3]/td[2]/span'))
    )
    total = total_element.text.strip()
    return total  

def check_name_quantity_total(n_cart,q_cart,t_cart, n_checkout,q_checkout,t_checkout):
    if(n_cart == n_checkout and q_cart == q_checkout and t_cart == t_checkout):
        return "OK"
    return "Sản phẩm hoặc số lượng hoặc giá tiền tổng không đúng"

def input_coupon(driver, text):
    coupon_input = driver.find_element(By.ID, "coupon_coupon")
    coupon_input.send_keys(text)
    apply_btn = driver.find_element(By.XPATH, '//*[@id="apply_coupon_btn"]')
    apply_btn.click()

def check_alert_input_coupon(driver):
    alert_danger = check_visibility(driver,'//*[@id="maincontainer"]/div/div/div/div')
    if alert_danger:
        alert = driver.find_element(By.XPATH, '//*[@id="maincontainer"]/div/div/div/div/strong').text.strip()
        if alert == "Error: Coupon is either invalid, expired or reached it's usage limit!":
                return True
        return False
    return False

def check_alert_remove_coupon(driver):
    btn_remove = check_visibility(driver,'//*[@id="remove_coupon_btn"]')
    if btn_remove:
        driver.find_element(By.XPATH, '//*[@id="remove_coupon_btn"]').click()
        time.sleep(3)
        alert_success = check_visibility(driver,'//*[@id="maincontainer"]/div/div/div/div')
        if alert_success:
            alert = driver.find_element(By.XPATH, '//*[@id="maincontainer"]/div/div/div/div').text.strip()
            alert = alert.replace('×', '')
            alert = alert.strip().replace('\n', '').replace('\r', '')
            if alert == "Success: Coupon has been removed!":
                return True
            return False
        return False
    return False

def input_personal_details(driver,fn, ln, email):
    fn_f = driver.find_element(By.ID, "guestFrm_firstname")
    ln_f = driver.find_element(By.ID, "guestFrm_lastname")
    email_f = driver.find_element(By.ID, "guestFrm_email")
    fn_f.send_keys(fn)
    ln_f.send_keys(ln)
    email_f.send_keys(email)

def input_address(driver, add1, city, region, zipcode, country):
    add1_f = driver.find_element(By.ID, "guestFrm_address_1")
    city_f = driver.find_element(By.ID, "guestFrm_city")
    zipcode_f = driver.find_element(By.ID, "guestFrm_postcode")
    add1_f.send_keys(add1)
    city_f.send_keys(city)
    zipcode_f.send_keys(zipcode)
    if country:
        country_f = Select(driver.find_element(By.ID,"guestFrm_country_id"))
        options = [option.text for option in country_f.options]
        options.pop(0)
        random_option = random.choice(options)
        country_f.select_by_visible_text(random_option)
    time.sleep(3)
    if region:
        region_f = Select(driver.find_element(By.ID,"guestFrm_zone_id"))
        options = [option.text for option in region_f.options]
        options.pop(0)
        random_option = random.choice(options)
        region_f.select_by_visible_text(random_option)

def input_shipping(driver, fn, ln, add1, city, region, zipcode, country):
    fn_f = driver.find_element(By.ID, "guestFrm_shipping_firstname")
    ln_f = driver.find_element(By.ID, "guestFrm_shipping_lastname")
    add1_f = driver.find_element(By.ID, "guestFrm_shipping_address_1")
    city_f = driver.find_element(By.ID, "guestFrm_shipping_city")
    zipcode_f = driver.find_element(By.ID, "guestFrm_shipping_postcode")
    fn_f.send_keys(fn)
    ln_f.send_keys(ln)
    add1_f.send_keys(add1)
    city_f.send_keys(city)
    zipcode_f.send_keys(zipcode)
    if country:
        country_f = Select(driver.find_element(By.ID,"guestFrm_shipping_country_id"))
        options = [option.text for option in country_f.options]
        options.pop(0)
        random_option = random.choice(options)
        country_f.select_by_visible_text(random_option)
    time.sleep(3)
    if region:
        region_f = Select(driver.find_element(By.ID,"guestFrm_shipping_zone_id"))
        options = [option.text for option in region_f.options]
        options.pop(0)
        random_option = random.choice(options)
        region_f.select_by_visible_text(random_option)

def get_shipping(driver):
    name = driver.find_element(By.XPATH, '//*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[1]').text.strip()
    address = driver.find_element(By.XPATH, '//*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[2]/address').text.strip()
    address = address.strip().replace('\n', ' ').replace('\r', ' ')
    return name, address

def get_payment(driver):
    name = driver.find_element(By.XPATH, '//*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[1]').text.strip()
    address = driver.find_element(By.XPATH, '//*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[2]/address').text.strip()
    address = address.strip().replace('\n', ' ').replace('\r', ' ')
    return name, address

def get_info_payment(driver):
    fn_p = driver.find_element(By.ID, "guestFrm_firstname").get_attribute("value")
    ln_p = driver.find_element(By.ID, "guestFrm_lastname").get_attribute("value")
    add1_p = driver.find_element(By.ID, "guestFrm_address_1").get_attribute("value")
    city_p = driver.find_element(By.ID, "guestFrm_city").get_attribute("value")
    region_p = Select(driver.find_element(By.ID,"guestFrm_zone_id")).first_selected_option.get_attribute("value")
    all_options = Select(driver.find_element(By.ID,"guestFrm_zone_id")).options
    for option in all_options:
        if option.get_attribute("value") == region_p:
            region = option.text
            break
    zipcode_p = driver.find_element(By.ID, "guestFrm_postcode").get_attribute("value")
    country_p = driver.find_element(By.ID,"guestFrm_country_id").get_attribute("value")
    all_options2 = Select(driver.find_element(By.ID,"guestFrm_country_id")).options
    for option in all_options2:
        if option.get_attribute("value") == country_p:
            country = option.text
            break
    name = fn_p + " " + ln_p
    address = add1_p + " " + city_p + " " + region + " " + zipcode_p + " " + country
    return name, address

def get_info_shipping(driver): 
    if check_visibility(driver,'//*[@id="shipping_details"]/h4'):
        fn_s = driver.find_element(By.ID, "guestFrm_shipping_firstname").get_attribute("value")
        ln_s = driver.find_element(By.ID, "guestFrm_shipping_lastname").get_attribute("value")
        add1_s = driver.find_element(By.ID, "guestFrm_shipping_address_1").get_attribute("value")
        city_s = driver.find_element(By.ID, "guestFrm_shipping_city").get_attribute("value")
        region_s = driver.find_element(By.ID,"guestFrm_shipping_zone_id").get_attribute("value")
        all_options = Select(driver.find_element(By.ID,"guestFrm_shipping_zone_id")).options
        for option in all_options:
            if option.get_attribute("value") == region_s:
                region = option.text
                break
        zipcode_s = driver.find_element(By.ID, "guestFrm_shipping_postcode").get_attribute("value")
        country_s = driver.find_element(By.ID,"guestFrm_shipping_country_id").get_attribute("value")
        all_options2 = Select(driver.find_element(By.ID,"guestFrm_shipping_country_id")).options
        for option in all_options2:
            if option.get_attribute("value") == country_s:
                country = option.text
                break
        name = fn_s + " " + ln_s
        address = add1_s + " " + city_s + " " + region + " " + zipcode_s + " " + country
        return name, address
    return 0

def check_payment_and_shipping(driver, payment_b, shipping_b, payment_a, shipping_a):
    if(shipping_b == 0):
        if(payment_a == payment_b == shipping_a):
            return True
        return False
    else:
        if(payment_a == payment_b and shipping_a == shipping_b):
            return True
        return False   

def choose_country(driver):
    country_f = Select(driver.find_element(By.ID,"guestFrm_country_id"))
    country_f.select_by_index(0)

def choose_country_shipping(driver):
    country_f = Select(driver.find_element(By.ID,"guestFrm_shipping_country_id"))
    country_f.select_by_index(0)

def choose_country_new_address(driver):
    country_f = Select(driver.find_element(By.ID,"Address2Frm_country_id"))
    country_f.select_by_index(0)

def check_for_text(driver, text):
    page_source = driver.page_source
    if text in page_source:
        return True
    return False

def input_new_address(driver, fn, ln, add1, city, region, zipcode, country):
    fn_f = driver.find_element(By.ID, "Address2Frm_firstname")
    ln_f = driver.find_element(By.ID, "Address2Frm_lastname")
    add1_f = driver.find_element(By.ID, "Address2Frm_address_1")
    city_f = driver.find_element(By.ID, "Address2Frm_city")
    zipcode_f = driver.find_element(By.ID, "Address2Frm_postcode")
    fn_f.send_keys(fn)
    ln_f.send_keys(ln)
    add1_f.send_keys(add1)
    city_f.send_keys(city)
    zipcode_f.send_keys(zipcode)
    if country:
        country_f = Select(driver.find_element(By.ID,"Address2Frm_country_id"))
        options = [option.text for option in country_f.options]
        options.pop(0)
        random_option = random.choice(options)
        country_f.select_by_visible_text(random_option)
    time.sleep(3)
    if region:
        region_f = Select(driver.find_element(By.ID,"Address2Frm_zone_id"))
        options = [option.text for option in region_f.options]
        options.pop(0)
        random_option = random.choice(options)
        region_f.select_by_visible_text(random_option)

def get_info_new_shipping(driver): 
    fn_s = driver.find_element(By.ID, "Address2Frm_firstname").get_attribute("value")
    ln_s = driver.find_element(By.ID, "Address2Frm_lastname").get_attribute("value")
    add1_s = driver.find_element(By.ID, "Address2Frm_address_1").get_attribute("value")
    city_s = driver.find_element(By.ID, "Address2Frm_city").get_attribute("value")
    region_s = driver.find_element(By.ID,"Address2Frm_zone_id").get_attribute("value")
    all_options = Select(driver.find_element(By.ID,"Address2Frm_zone_id")).options
    for option in all_options:
        if option.get_attribute("value") == region_s:
            region = option.text
            break
    zipcode_s = driver.find_element(By.ID, "Address2Frm_postcode").get_attribute("value")
    country_s = driver.find_element(By.ID,"Address2Frm_country_id").get_attribute("value")
    all_options2 = Select(driver.find_element(By.ID,"Address2Frm_country_id")).options
    for option in all_options2:
        if option.get_attribute("value") == country_s:
            country = option.text
            break
    name = fn_s + " " + ln_s
    address = add1_s + " " + city_s + " " + region + " " + zipcode_s + " " + country
    return name, address

def choose_old_address(driver):
    table_rows = driver.find_elements(By.CSS_SELECTOR, '.old_address .registerbox .table-striped tbody tr')
    unchecked_rows = [row for row in table_rows if not row.find_element(By.CSS_SELECTOR, '.align_left input').is_selected()]
    if unchecked_rows:
        random_row = random.choice(unchecked_rows)
        btn_check = random_row.find_element(By.CSS_SELECTOR, '.align_left input') 
        btn_check.click()
        label = random_row.find_element(By.CSS_SELECTOR, '.align_left label.inline').text.strip()
        parts = label.split(", ")
        name = parts[0]
        address = " ".join(parts[1:])
        return name, address
    else:
        return "Khong co old address"        

def input_comment_shipping(driver, comment):
    comment_f = driver.find_element(By.ID, "shipping_comment")
    comment_f.clear()
    comment_f.send_keys(comment)

def input_comment_payment(driver, comment):
    comment_f = driver.find_element(By.ID, "payment_comment")
    comment_f.clear()
    comment_f.send_keys(comment)

def input_comment_guest(driver, comment):
    comment_f = driver.find_element(By.ID, "guest_comment")
    comment_f.clear()
    comment_f.send_keys(comment)

def check_comment(driver, comment):
    if check_visibility(driver, '//*[@id="maincontainer"]/div/div[1]/div/div[2]/h4[4]'):
        text = driver.find_element(By.XPATH, '//*[@id="maincontainer"]/div/div[1]/div/div[2]/div[1]').text.strip()
        if(text == comment):
            return True
        return False
    return False

def remove_coupon_payment(driver):
    driver.find_element(By.XPATH, '//*[@id="remove_coupon_btn"]').click()
    time.sleep(3)

def check_modal_displayed(driver):
    if(check_visibility(driver, '//*[@id="returnPolicyModal"]/div/div')):
        header = driver.find_element(By.XPATH, '//*[@id="returnPolicyModalLabel"]').text.strip()
        if(header == 'Return Policy'):
            return True
        return False
    return False

def check_invoice_detail(driver, shipping_c, payment_c, products_c, quantities_c, total_c):
    time.sleep(3)
    shipping_a = driver.find_element(By.XPATH, '//*[@id="maincontainer"]/div/div[1]/div/div/div[1]/table/tbody/tr/td[2]/address').text.strip().replace('\n', ' ').replace('\r', ' ')
    payment_a = driver.find_element(By.XPATH, '//*[@id="maincontainer"]/div/div[1]/div/div/div[1]/table/tbody/tr/td[3]/address').text.strip().replace('\n', ' ').replace('\r', ' ')
    name1, add1 = shipping_c
    name2, add2 = payment_c
    shipping_check = name1 + " " + reformat_address(add1)
    payment_check = name2 + " " + reformat_address(add2)
    table_rows = driver.find_elements(By.CSS_SELECTOR, '.contentpanel .invoice_products tbody tr')[1:]
    names = [row.find_element(By.CSS_SELECTOR, '.align_left a').text.strip().upper() for row in table_rows]
    quan = [row.find_element(By.CSS_SELECTOR, '.align_right').text.strip().upper() for row in table_rows]
    quan = [int(a) for a in quan]
    total = driver.find_element(By.XPATH, '//*[@id="maincontainer"]/div/div[1]/div/div/div[2]/div[2]/table/tbody/tr[3]/td[2]').text.strip()
    if(shipping_a == shipping_check and payment_a == payment_check and products_c == names and quan == quantities_c and total == total_c):
        return True
    return payment_a, payment_check

def reformat_address(address):
    parts = address.split()  
    if len(parts) == 5:
        reformatted_parts = [parts[0], parts[1], parts[3], parts[2], parts[4]]
        reformatted_address = ' '.join(reformatted_parts)  
        return reformatted_address
    else:
        return address
    
########################################################################### HISTORY ORDER ###############################################################################

def get_number_order(driver):
    return driver.find_element(By.XPATH, '//*[@id="maincontainer"]/div/div[1]/div/ul/li[5]/a/span').text.strip()

def view_detail_order(driver, number):
    id_out = ''
    table_rows = driver.find_elements(By.CSS_SELECTOR, '.contentpanel .container-fluid.mt20')
    for i in range(0,len(table_rows)):
        if(int(number) == i):
            id_out = table_rows[i].find_element(By.CSS_SELECTOR, 'div[style="width: 49%; float: left; margin-bottom: 2px;"]').text.split(":")[1].strip()
            btn_view = table_rows[i].find_element(By.CSS_SELECTOR, '.content #button_edit')
            btn_view.click()
    time.sleep(5)
    id_link = "#" + (driver.current_url.split("="))[-1]
    print(id_link)
    td = driver.find_element(By.XPATH, '//*[@id="maincontainer"]/div/div[1]/div/div/div[1]/table/tbody/tr/td[1]').text
    if(id_out == id_link and id_out in td):
        return True
    return id_link

