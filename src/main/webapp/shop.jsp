<%@ page import="model.Product" %>
<%@ page import="dao.ProductDAO" %>
<%@ page import="java.util.List" %>
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
<%
    ProductDAO productDAO = new ProductDAO();
    List<Product> products = productDAO.getAllProducts();
%>


<%@include file="header.jsp" %>

<section id="sanpham1" class="phan-doan-p1">
        <div class="ngan-san-pham">
            <% for (Product product : products) {
                int id = product.getId(); %>
            <div class="san-pham" onclick="window.location.href='detail?productId=<%= id %>';">
                <img src="<%= product.getImage() %>" alt="">
                <div class="mo-ta">
                    <span><%= product.getCategory() %></span>
                    <h5><%= product.getName() %></h5>
                    <h4><%= product.getPrice() %>$</h4>
                </div>
                <a href="detail?productId=<%= id %>"><i class="fal fa-shopping-cart cart"></i></a>
            </div>
            <% }  %>
        </div>
    </section>
<%@include file="footer.jsp" %>

</body>
<script>
    var idpage = 2;
    let element = document.getElementsByClassName("actived");
    console.log(element)
    for (let i = 0; i < element.length; i++) {
        element[i].classList.remove("active");
    }
    element[idpage-1].classList.add("active");
</script>
</html>