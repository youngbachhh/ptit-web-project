<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <title>Ecommerce Website</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <section id="dautrang">
        <a href="index.jsp"><img src="img/logo.png" class="logo" alt=""></a>

        <div>
            <ul id="thanh-dieu-huong">
                <li><a href="index.jsp">Trang chủ</a></li>
                <li><a href="shop.jsp">Cửa hàng</a></li>
                <li><a href="about.jsp">Về chúng tôi</a></li>
                <li><a href="contact.jsp">Liên hệ</a></li>
                <li id="lg-bag"><a href="cart.jsp" class="active"><i class="far fa-shopping-bag"></i></a></li>
                <li><a href="login.jsp">Đăng nhập</a></li>
            </ul>
        </div>
    </section>

    <section id="cart" class="phan-doan-p1">
        <table width="100%">
            <thead>
                <tr>
                    <td>Xoá</td>
                    <td>Ảnh</td>
                    <td>Sản phẩm</td>
                    <td>Giá</td>
                    <td>Số lượng</td>
                    <td>Tổng tiền</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><a href="#"><i class="far fa-times-circle"></i></a></td>
                    <td><img src="img/products/lt-1.jpg" alt=""></td>
                    <td>Laptop Acer Aspire 3 A315-56-58EG 15FHDIPS</td>
                    <td>$2000</td>
                    <td><input type="number" value="1"></td>
                    <td>$2000</td>
                </tr>
                <tr>
                    <td><a href="#"><i class="far fa-times-circle"></i></a></td>
                    <td><img src="img/products/lt-2.jpg" alt=""></td>
                    <td>Laptop Acer Aspire A315-57G-573F NX.HZRSV.00B</td>
                    <td>$2000</td>
                    <td><input type="number" value="1"></td>
                    <td>$2000</td>
                </tr>
                <tr>
                    <td><a href="#"><i class="far fa-times-circle"></i></a></td>
                    <td><img src="img/products/lt-3.jpg" alt=""></td>
                    <td>Laptop ASUS Gaming ROG Strix G15 G513QC-HN015T</td>
                    <td>$2000</td>
                    <td><input type="number" value="1"></td>
                    <td>$2000</td>
                </tr>
            </tbody>
        </table>
    </section>

    <section id="cart-add" class="phan-doan-p1">
        <div id="subtotal">
            <h3>Tổng hoá đơn</h3>
            <table>
                <tr>
                    <td>Tổng giỏ hàng</td>
                    <td>$6000</td>
                </tr>
                <tr>
                    <td>Phí vận chuyển</td>
                    <td>Free</td>
                </tr>
                <tr>
                    <td><strong>Tổng phải thanh toán</strong></td>
                    <td><strong>$6000 </strong></td>
                </tr>
            </table>
            <button class="normal">Thanh toán</button>
        </div>
    </section>

    <footer class="phan-doan-p1">
        <div class="cot">
            <img class="logo" src="img/logo.png" alt="">
        </div>
        <div class="cot">
            <a href="about.jsp">Về chúng tôi</a>
            <a href="contact.jsp">Liên hệ</a>
        </div>
        <div class="cot">
            <a href="login.jsp">Đăng nhập</a>
            <a href="cart.jsp">Giỏ hàng</a>
        </div>

    </footer>
    <script src="script.js"></script>
</body>

</html>



<!-- Nối thêm vào từ đây -->