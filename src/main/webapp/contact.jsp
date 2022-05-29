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
<%@include file="header.jsp" %>

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
            <iframe src="https://goo.gl/maps/rCUcicT6aZzCpiMJA" width="600" height="450" style="border: 0;"
                allowfullscreen="" loading="lazy"></iframe>
        </div>
    </section>
<section id="form-chi-tiet">
        <form action="">
            <span></span>
            <h2>Chúng tôi rất mong những ý kiến từ bạn</h2>
            <input type="text" placeholder="Tên của bạn">
            <input type="text" placeholder="E-mail">
            <input type="text" placeholder="Chủ đề">
            <textarea name="" id="" cols="30" rows="10" placeholder="Nội dung"></textarea>
            <button class="btn-mail">Gửi mail</button>
        </form>
    </section>
<%@include file="footer.jsp" %>
</body>
<script>
    var idpage = 4;
    let element = document.getElementsByClassName("actived");
    console.log(element)
    for (let i = 0; i < element.length; i++) {
        element[i].classList.remove("active");
    }
    element[idpage-1].classList.add("active");
</script>
</html>