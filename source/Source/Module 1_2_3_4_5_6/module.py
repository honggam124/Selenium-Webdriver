import time
import random
from selenium.webdriver.common.by import By
from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import Select
import re

#-------------------------------------------FUNCTION-----------------------------------#
def close(driver):
    driver.close()
    
def back(driver):
    time.sleep(2)
    driver.back()
    return driver

def open(url):
    #go to web
    driver = webdriver.Chrome()
    driver.maximize_window()
    driver.get(url)
    return driver

def remove_spaces(input_string):
    return "".join([char for char in input_string if char != " "])

def click_element_byXpath(driver, locate):
    element = WebDriverWait(driver, 4).until(
        EC.presence_of_element_located((By.XPATH, locate))
    )
    driver.execute_script("arguments[0].scrollIntoView();", element)
    driver.execute_script("arguments[0].click();", element)
    return driver

def verify_notification(driver, text, locate):
    #find alert
    element = WebDriverWait(driver, 3).until(
        EC.presence_of_element_located((By.XPATH, locate))
    )

    element_text = element.text.strip().replace('×\n', '')
    print(text)
    print(element_text)
    if element_text == text :
        return True
    else:

        return False

def check_url(driver, url):
    time.sleep(2)
    current_url = driver.current_url
    if current_url == url:
        return True
    return False


#--------------------------------------------------REGISTER--------------------------------------------------------------#
# region, country, pri is boolean
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
    
    ele_country = driver.find_element(By.ID,"AccountFrm_country_id")
    country_f = Select(ele_country)
    ele  = driver.find_element(By.ID,"AccountFrm_zone_id")
    region_f = Select(ele)

    #send key to field
    firstName_f.send_keys(firstName)
    lastName_f.send_keys(lastName)
    email_f.send_keys(email)
    add1_f.send_keys(add1)
    city_f.send_keys(city)
    zipcode_f.send_keys(zipcode)
    
    time.sleep(3)

    #If country is  true, select it from the dropdown
    if country:
        options = [option.text for option in country_f.options]
        options.pop(0)
        random_option = random.choice(options)
        country_f.select_by_visible_text(random_option)
    else:
        country_f.select_by_visible_text('--- Please Select ---')
        
    time.sleep(4)
    
    # If region is  true, select it from the dropdown
    if region:
        options = [option.text for option in region_f.options]
        options.pop(0)
        random_option = random.choice(options)
        region_f.select_by_visible_text(random_option)
        


    loginName_f.send_keys(loginName)
    password_f.send_keys(password)
    passConf_f.send_keys(passConf)
    
    #privacy policy
    if pri:
        driver = click_element_byXpath(driver, '//*[@id="AccountFrm_agree"]')
    
    #click continue button
    driver = click_element_byXpath(driver, '//*[@id="AccountFrm"]/div[5]/div/div/button')
    time.sleep(2)
    return driver


#--------------------------------------------------LOGIN--------------------------------------------------------------#
def input_login(driver, loginName, password):
    
    #find field
    loginName_f = driver.find_element(By.ID, "loginFrm_loginname")
    password_f = driver.find_element(By.ID, "loginFrm_password")
    
    #send key to field
    loginName_f.send_keys(loginName)
    password_f.send_keys(password)
    
    #click login button
    driver = click_element_byXpath(driver, "/html/body/div/div[2]/div/div/div/div/div[2]/div/form/fieldset/button")
    return driver

#--------------------------------------------------EDIT ACCOUNT--------------------------------------------------------------#

#back is boolean (user back or not)
def input_editAccount(driver, firstName, lastName, email, back, first_bool, last_bool, email_bool):
    #find field
    firstName_f = driver.find_element(By.ID, "AccountFrm_firstname")
    lastName_f = driver.find_element(By.ID, "AccountFrm_lastname")
    email_f = driver.find_element(By.ID, "AccountFrm_email")
    
    #clear
    if first_bool:
        firstName_f.clear()
        firstName_f.send_keys(firstName)
    if last_bool:
        lastName_f.clear()
        lastName_f.send_keys(lastName)
    if email_bool:
        email_f.clear()
        email_f.send_keys(email)
    
    if back:
        #back
        driver = click_element_byXpath(driver, '//*[@id="AccountFrm"]/div[2]/div/a')
    else:
        #continue
        driver = click_element_byXpath(driver, '//*[@id="AccountFrm"]/div[2]/div/button')
    return driver

#--------------------------------------------------CHANGE PASSWORD--------------------------------------------------------------#
#back is boolean (user back or not)
def input_changePassword(driver, currentPassword, newPassword, newPasswordConfirm, back):
    #find field
    currentPassword_f = driver.find_element(By.ID, "PasswordFrm_current_password")
    newPassword_f = driver.find_element(By.ID, "PasswordFrm_password")
    newPasswordConfirm_f = driver.find_element(By.ID, "PasswordFrm_confirm")
    
    #send key to field
    currentPassword_f.send_keys(currentPassword)
    newPassword_f.send_keys(newPassword)
    newPasswordConfirm_f.send_keys(newPasswordConfirm)
    
    if back:
        #back
        driver = click_element_byXpath(driver, "/html/body/div/div[2]/div/div[1]/div/div/form/div[2]/div/a")
    else:
        #continue
        driver = click_element_byXpath(driver, "/html/body/div/div[2]/div/div[1]/div/div/form/div[2]/div/button")
    return driver

#--------------------------------------------------ADDRESS BOOK--------------------------------------------------------------#

#back is boolean (user back or not), defaultAdd is boolean
def input_addressBook(driver, firstName, lastName, Company, add1, city, region, zipcode, country, defaultAdd, back):
    
    #find field (firstName_f: firsrName_Field)
    firstName_f = driver.find_element(By.ID, "AddressFrm_firstname")
    lastName_f = driver.find_element(By.ID, "AddressFrm_lastname")
    Company_f = driver.find_element(By.ID, "AddressFrm_company")
    add1_f = driver.find_element(By.ID, "AddressFrm_address_1")
    city_f = driver.find_element(By.ID, "AddressFrm_city")
    region_f = Select(driver.find_element(By.ID,"AddressFrm_zone_id"))
    zipcode_f = driver.find_element(By.ID, "AddressFrm_postcode")
    country_f = Select(driver.find_element(By.ID,"AddressFrm_country_id"))
    
    #clear
    firstName_f.clear()
    lastName_f.clear()
    Company_f.clear()
    add1_f.clear()
    city_f.clear()
    zipcode_f.clear()
    region_f.select_by_index(0)
    country_f.select_by_index(0)

    #send key to field
    firstName_f.send_keys(firstName)
    lastName_f.send_keys(lastName)
    Company_f.send_keys(Company)
    add1_f.send_keys(add1)
    city_f.send_keys(city)
    zipcode_f.send_keys(zipcode)
    
    #If country is not empty, select it from the dropdown
    if country:
        options = [option.text for option in country_f.options]
        options.pop(0)
        random_option = random.choice(options)
        country_f.select_by_visible_text(random_option)
    
    time.sleep(4)
    # If region is not empty, select it from the dropdown
    if region:
        options = [option.text for option in region_f.options]
        options.pop(0)
        random_option = random.choice(options)
        region_f.select_by_visible_text(random_option)
    
    if defaultAdd:
        driver = click_element_byXpath(driver, '//*[@id="AddressFrm_default1"]')
    else: 
        driver = click_element_byXpath(driver, '//*[@id="AddressFrm_default0"]')

    if back:
        #back
        driver = click_element_byXpath(driver, '//*[@id="AddressFrm"]/div/fieldset/div[11]/div/a')
    else:
        #continue
        driver = click_element_byXpath(driver, '//*[@id="AddressFrm"]/div/fieldset/div[11]/div/button')
    return driver


def click_random_edit_button(driver):
    
    # Find all the "Edit" buttons on the page
    edit_buttons = driver.find_elements(By.XPATH, "//button[contains(@title, 'Edit')]")
    
    # Choose a random index within the range of the edit_buttons list
    random_index = random.randint(0, len(edit_buttons) - 1)
     
    # Click on the randomly selected "Edit" button
    edit_buttons[random_index].click()
    return driver
