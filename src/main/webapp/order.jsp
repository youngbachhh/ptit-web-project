<%@ page import="dao.ProductDAO" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.OrderDetailDAO" %>
<%@ page import="model.OrderDetail" %>
<%@ page import="dao.OrderDAO" %>
<%@ page import="model.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lý sản phẩm</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">--%>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="style.css" rel="stylesheet" type="text/css"/>
<body>
<% try {
    int id = (int) session.getAttribute("userID");
    OrderDAO orderDAO= new OrderDAO();
    List<Order> orders = orderDAO.getOrderByUserID(String.valueOf(id));
%>
<section id="dautrang">
    <a href="index.jsp"><img src="img/logo.png" class="logo" alt=""></a>
    <div>
        <ul id="thanh-dieu-huong">
            <li><a href="index.jsp" id="1"   class="actived">Trang chủ</a></li>
        </ul>
    </div>
</section>
<section id="cart" class="phan-doan-p1">
    <div id="quan-ly-dau">
        <div class="row">
            <h2>Đơn hàng của tôi</h2>
        </div>
    </div>
    <table width="100%">
        <thead>
        <tr>
            <th>STT</th>
            <th>Tên</th>
            <th>SĐT</th>
            <th>Địa chỉ</th>
            <th>Tổng tiền</th>
            <th>Ngày đặt hàng</th>
            <th>Trạng thái</th>
            <th>Xem chi tiết</th>
        </tr>
        </thead>
        <tbody>
        <%int i = 1;%>
        <% for (Order order : orders) { %>
        <tr>
            <td><%=i++%></td>
            <td><%=order.getName()%></td>
            <td><%=order.getPhone()%></td>
            <td><%=order.getAddress()%></td>
            <td>$<%=order.getTotalPrice()%></td>
            <td><%=order.getDate()%></td>
            <td><% if(order.getStatus().equalsIgnoreCase("0")) {%>
                Chưa được duyệt
                <% } else {%>
                Đã được duyệt
                <% } %>
            </td>
            <td>
                <a href = "orderdetails?oid=<%=order.getId()%>" class="detail-but">Xem chi tiết</a>
            </td>
        </tr>

        <% } %>
        </tbody>
    </table>
</section>

<%  } catch(NullPointerException e) {
    e.printStackTrace();
    response.sendRedirect("index.jsp");
} %>
</body>


</html>