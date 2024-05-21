# Báo cáo cuối kì môn Kiểm thử phần mềm tự động
## About the project
- Thực hiện viên tìm hiểu chức năng của trang web thương mại điện tử Automation Test Store, tiến hành phân tích trường hợp sử dụng (use cases), viết trường hợp kiểm thử (test cases) và triển khai kiểm thử tự động với Robot Framework – Selenium.
## Danh sách thành viên
- Nguyễn Thị Hồng Gấm - 52100018
- Phùng Thị Thủy Tiên - 52100846
- Nguyễn Ngọc Hương Giang -  52100019
## Running the Application
### Những công cụ cần có: 
- RIDE (hoặc Visual Studio Code)
## Project Setup
### Python
- Go to python official site and download the latest version or the prior version of python as per your operating system. Remember to set PATH correctly to use Python after installation.
```sh
https://www.python.org/downloads/
```
### Pip
- PIP gets installed along with python to check pip version. Run:
```sh
pip --version
```
### Robot Framework
- Use pip – python package manager to install the robot framework and the command for it is as follows:
```sh
pip install robotframework
```
- Check robot framework version:
```sh
robot --version
```
### wxPython for Ride IDE
- wxPython is needed for Robot Framework Ride, which is an IDE for Robot Framework.
Windows:
```sh
https://sourceforge.net/projects/wxpython/files/wxPython/2.8.12.1/
```
### Selenium library
```sh
pip install --upgrade robotframework-seleniumlibrary
```
### Selenium webdriver
```sh
pip install --upgrade robotframework-seleniumlibrary
```
### Robot Framework Ride
- Use pip command to install Ride IDE.
```sh
pip install robotframework-ride
```
- To open Ride IDE, run
```sh
ride.py
```
## Cấu trúc
### Source
- **Module 1_2_3_4_5_6** chứa các file:
  + *Register.robot* : Test chức năng đăng kí.
  + *Logout.robot* : Test chức năng đăng xuất.
  + *Login.robot* : Test chức năng đăng nhập.
  + *EditAccountDetail.robot* : Test chức năng chỉnh sửa chi tiết tài khoản.
  + *ChangePassword.robot* : Test chức năng đổi mật khẩu.
  + *AddressBook.robot* : Test Address Book.
  + *module.py* : Chứa các keywords.
- **Mudule 7_8_16_17** chứa các file:
  + *Payment.robot* : Test chức năng thanh toán.
  + *Manage_Wish_List.robot* : Test chức năng quản lý danh sách yêu thích.
  + *Manage_Cart.robot* : Test chức năng quản lý giỏ hàng.
  + *History_Order.robot* : Test chức năng xem lịch sử đặt hàng.
  + *mmodule.py* : Chứa các keywords.
- **Module9_10_11_12_13_14_15** chứa các file:
  + *View_list.robot*, *View_grid.robot* : Test chức năng xem danh sách sản phẩm.
  + *View_detail_product_by_img.robot*, *View_detail_product_by_name.robot* : Test chức năng xem chi tiết sản phẩm.
  + *Sort_by_Rating_Lowest.robot*, *Sort_by_Rating_Highest.robot*, *Sort_by_Price_Low_to_High.robot*, *Sort_by_Price_High_to_Low.robot*, *Sort_by_Name_Z_to_A.robot*, *Sort_by_Name_A_to_Z.robot* : Test chức năng sắp xếp sản phẩm.
  + *Search_in_product_model_.robot*, *Search_in_product_descriptions_.robot* : Test chức năng tìm kiếm sản phẩm.
  + *Print_product.robot* : test chức năng in chi tiết sản phẩm.
  + *Pound.robot*, *Euro.robot*, *Dollar.robot* : Test chức năng đổi đơn vị tiền tệ.
  + *Filter_products_by_category.robot* : Test chức năng lọc theo từng danh mục.
  + *Module_1* : Chứa các keywords.
### Result
- **Module 1_2_3_4_5_6** chứa các file log và report của các chức năng:
  + Đăng xuất
  + Đăng nhập
  + Đăng kí
  + Chỉnh sửa chi tiết tài khoản
  + Đổi mật khẩu 
  + Address Book
- **Module 7_8_16_17** chứa các file log và report của các chức năng:
  + Thanh toán
  + Quản lý danh sách yêu thích
  + Quản lý giỏ hàng
  + Xem lịch sử đặt hàng
- **Module9_10_11_12_13_14_15** chứa các file log và report của các chức năng:
  + Xem danh sách sản phẩm
  + Xem chi tiết sản phẩm
  + Sắp xếp
  + Tìm kiếm
  + In chi tiết sản phẩm
  + Đổi đơn vị tiền tệ 
  + Lọc sản phẩm theo danh mục