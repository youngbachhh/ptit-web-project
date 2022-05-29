<%--
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>
<%@ page import="dao.ProductDAO" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="manager.css" rel="stylesheet" type="text/css"/>
    <style>
        img{
            width: 200px;
            height: 120px;
        }
    </style>
<body>
<% try {
    int id = Integer.parseInt(session.getAttribute("isAdmin").toString());
    int deleteId = 0;

    if(id != 1 || session.getAttribute("isAdmin") == null) {
        response.sendRedirect("index.jsp");
    } else {
        ProductDAO productDAO = new ProductDAO();
        List<Product> products = productDAO.getAllProducts();
        List<String> listCategory = productDAO.getAllCategory();
%>
<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <h2>Quản lý <b>sản phẩm</b></h2>
                </div>
                <div class="col-sm-6">
                    <a href="#veTrangChu" class="btn btn-primary" data-toggle="modal" onclick="window.location.href='index.jsp';"><span>Về trang chủ</span></a>
                    <a href="#themSanPham" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Thêm mói</span></a>
                </div>
            </div>
        </div>
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>ID</th>
                <th>Tên</th>
                <th>Ảnh</th>
                <th>Giá</th>
                <th>Sửa/Xóa</th>
            </tr>
            </thead>
            <tbody>
            <% for (Product product : products) { %>
            <tr>
                <td><%=product.getId()%></td>
                <td><%=product.getName()%></td>
                <td>
                    <img src="<%=product.getImage()%>">
                </td>
                <td><%=product.getPrice()%> $</td>
                <td>
                    <%deleteId = product.getId();%>
                    <a href="editProduct?productId=<%=product.getId()%>"  class="edit" id="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Sửa">&#xE254;</i></a>
                    <a href="#xoaSanPham" class="delete" id="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Xóa">&#xE872;</i></a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <button type="button" class="btn btn-primary" onclick="window.location.href='index.jsp';">Về trang chủ</button>

</div>
<!-- Thêm sản phẩm HTML -->
<div id="themSanPham" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="addProduct" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Thêm sản phẩm</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Tên</label>
                        <input name="name" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Ảnh</label>
                        <input name="image" type="text" class="form-control" placeholder="Nhập link ảnh" required>
                    </div>
                    <div class="form-group">
                        <label>Giá</label>
                        <input name="price" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Số lượng</label>
                        <input name="quantity" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Mô tả</label>
                        <textarea name="description" class="form-control" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>Danh mục</label>
                        <select name="category" class="form-select" aria-label="Mặc định">
                            <% for(String category : listCategory) {%>
                            <option><%=category%></option>
                            <% } %>
                        </select>
                    </div>

                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                    <input type="submit" class="btn btn-success" value="Thêm">
                </div>
            </form>
        </div>
    </div>
</div>

<div id="xoaSanPham" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Xóa sản phẩm này nhé !</h4>
            </div>
            <div class="modal-footer">
                <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                <input type="button" onclick="window.location.href='deleteProduct?productId=<%=deleteId%>';" class="btn btn-success" value="Xóa">
            </div>
            </form>
        </div>
    </div>
</div>

<script src="manager.js" type="text/javascript"></script>
<% } } catch(NullPointerException e) {
    e.printStackTrace();
    response.sendRedirect("index.jsp");
} %>
</body>
</html>