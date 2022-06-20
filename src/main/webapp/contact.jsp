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
            <li><a href="contact.jsp" class="active">Liên hệ</a></li>
            <li id="lg-bag"><a href="cart.jsp"><i class="far fa-shopping-bag"></i> </a>
                <sub>
                    <% if(session.getAttribute("cart-size") != null) {%>
                    <%= session.getAttribute("cart-size") %></sub></li>
            <% } else {%>
            0</sub></li>
            <% } %>
            <% if (session.getAttribute("email") == null) { %>
            <li><a href="login.jsp">Đăng nhập</a></li>
            <% }else{  %>
            <li><a href="/logout">Đăng xuất</a></li>
            <% } %>
        </ul>
    </div>
</section>
<section id="chitiet-lienlac" class="phan-doan-p1">
    <div class="chi-tiet">
        <span>LIÊN LẠC VỚI CHÚNG TÔI</span>
        <h2>Ghé thăm chúng tôi</h2>
        <h3>Văn phòng </h3>
        <div>
            <li>
                <i class="fal fa-map"></i>
                <p>Học viện Công nghệ Bưu Chính Viễn Thông </p>
            </li>
            <li>
                <i class="far fa-envelope"></i>
                <p>youngbach.315@gmail.com </p>
            </li>
            <li>
                <i class="fas fa-phone-alt"></i>
                <p>0986853388</p>
            </li>
        </div>
    </div>

    <div class="map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1566.2919878305736!2d105.78595569968203!3d20.980963078103887!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135accdd8a1ad71%3A0xa2f9b16036648187!2zSOG7jWMgdmnhu4duIEPDtG5nIG5naOG7hyBCxrB1IGNow61uaCB2aeG7hW4gdGjDtG5n!5e0!3m2!1svi!2s!4v1655601616661!5m2!1svi!2s" width="600" height="450" style="border: 0;"
                allowfullscreen="" loading="lazy"></iframe>
    </div>
</section>
<section id="form-chi-tiet">
    <form method="post" action="/contact">      <%--thay đổi về form liên lạc--%>
        <span></span>
        <h2>Hãy để lại email của bạn tại đây</h2>
        <input type="text" name ="emailName"placeholder="Tên của bạn">
        <input type="text" name ="email" placeholder="E-mail">
        <%--            <input type="text" placeholder="Chủ đề">--%>
        <%--            <textarea name="" id="" cols="30" rows="10" placeholder="Nội dung"></textarea>--%>
        <button class="btn-mail">Xác nhận</button>
    </form>
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
</body>

</html>