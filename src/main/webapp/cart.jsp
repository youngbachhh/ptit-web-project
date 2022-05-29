<%@ page import="model.Cart" %>
<%@ page import="model.Product" %>
<%@ page import="dao.ProductDAO" %>
<%@ page import="java.util.ArrayList" %>
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
    ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart");
    ProductDAO productDAO = new ProductDAO();
    Product product = new Product();
    int total = 0;
%>
<%@include file="header.jsp" %>


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
        <% if(cart != null) {%>
        <% for(Cart cartItem: cart) {
            product = productDAO.getProductById(cartItem.getId());
            int totalPrice = cartItem.getCartQuantity() * product.getPrice();
            total += totalPrice;
        %>
        <tr>
            <td><a href="/delete?productId=<%=product.getId()%>"><i class="far fa-times-circle"></i></a></td>
            <td><img src="<%= product.getImage() %>" alt=""></td>
            <td><%= product.getName() %></td>
            <td>$<%= product.getPrice() %></td>
            <td>
                <div class="number">
                    <a href="/removequantity?removeproductid=<%=product.getId()%>" class="quantity"><span class="minus">-</span></a>
                    <input type="text" value="<%=cartItem.getCartQuantity()%>"/>
                    <a href="/addquantity?addproductid=<%=product.getId()%>" class="quantity"><span class="plus">+</span></a>
                </div>
            </td>
            <td>$<%= totalPrice %></td>
        </tr>
        <% } } %>
        </tbody>
    </table>
</section>

<section id="cart-add" class="phan-doan-p1">
    <div id="subtotal">
        <h3>Tổng hoá đơn</h3>
        <table>
            <tr>
                <td>Tổng giỏ hàng</td>
                <td>$<%= total %></td>
            </tr>
            <tr>
                <td><strong>Tổng phải thanh toán</strong></td>
                <td><strong>$<%= total %></strong></td>
            </tr>
        </table>
    </div>
</section>
<section class="thong-tin">
    <div class="form-thong-tin">
        <form action="/checkout" method="post" accept-charset="UTF-8">
            <input required type="text"   name="name" placeholder = "Họ và tên">
            <input required type="text"   name="number" placeholder = "Số điện thoại">
            <input required type="text"   name="add" placeholder = "Địa chỉ">
            <input type="submit" class="but" value="Thanh toán" >
        </form>
    </div>

</section>


<%@include file="footer.jsp" %>
<script src="script.js"></script>
</body>

<script>
    var idpage = 5;
    let element = document.getElementsByClassName("actived");
    console.log(element)
    for (let i = 0; i < element.length; i++) {
        element[i].classList.remove("active");
    }
    element[idpage-1].classList.add("active");
</script>
</html>



