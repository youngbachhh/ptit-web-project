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
    String province = "";
    String district = "";
    String ward = "";
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
                <td>Phí vận chuyển</td>
                <td class="ship">$0</td>
            </tr>
            <tr>
                <td><strong>Tổng phải thanh toán</strong></td>
                <td class="total"><strong>$<%= total %></strong></td>
            </tr>
        </table>
    </div>
</section>
<section class="thong-tin">
    <div class="form-thong-tin">
        <% if (session.getAttribute("email") == null) { %>
            <form action="/login" method="post" accept-charset="UTF-8">
        <% }else if(session.getAttribute("cart-size") == null ||session.getAttribute("cart-size").toString().equalsIgnoreCase("0") ) {  %>
            <form action="index.jsp" method="post" accept-charset="UTF-8">
        <% } else {%>
            <form action="/checkout" method="post" accept-charset="UTF-8">
        <% } %>

            <input required type="text"   name="name" placeholder = "Họ và tên">
            <input required type="text"   name="number" placeholder = "Số điện thoại">

            <div class="province-select">
                <select name="province_name" id="province">
                </select>

                <select name="district_name" id="district">
                </select>

                <select name="ward_name" id="ward">
                </select>
            </div>
            <input required type="text"   name="add" placeholder = "Địa chỉ cụ thể">
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
    for (let i = 0; i < element.length; i++) {
        element[i].classList.remove("active");
    }
    element[idpage-1].classList.add("active");


    var ship = document.getElementsByClassName("ship");
    var total = document.getElementsByClassName("total");
    var temp = 0;
    async function getData() {
        let apiURL = `https://api.openweathermap.org/data/2.5/weather?q=ha noi&appid=7c186e6ad2a59dc9c66cfb11b00cb3cc
`
        let data = await fetch(apiURL).then(res => res.json())

        temp = (data.main.feels_like - 273.15).toFixed(0)
        if(temp < 25) {
            ship[0].innerHTML = "$0";
        }
        else {

            ship[0].innerHTML = "$20";
            var totalPrice = <%= total %> + 20;
            total[0].innerHTML = "$" + totalPrice;
        }
    }
    getData()


    // API Province
    var province = document.getElementById('province');
    var district = document.getElementById('district');
    var ward = document.getElementById('ward');
    var data
    var province_arr = [];
    var district_arr = [];
    for (let i = 0; i < 100; i++) {
        district_arr[i] = new Array(100);
    }
    var ward_arr = [];
    for (let i = 0; i < 100; i++) {
        ward_arr[i] = new Array(100);
    }

    for (let i = 0; i < 100; i++) {
        for (let j = 0; j < 100; j++) {
            ward_arr[i][j] = new Array(100);
        }
    }



    async function Provincess() {
        let apiURL = `https://provinces.open-api.vn/api/?depth=3`
        data = await fetch(apiURL).then(res => res.json())
        console.log(data)
        for (let i = 0; i < data.length; i++) {
            let option = document.createElement('option');
            option.value = data[i].name;
            option.innerText = data[i].name;
            province.appendChild(option);
            province_arr.push(data[i].name)
        }
        province.addEventListener("click", function () {
            let province_code = province.value;
            console.log(province_code)
            for (let i = 0; i < data.length; i++) {
                if (data[i].name == province_code) {
<%--                    <%= province %> =  data[i].name--%>
                    let district = document.getElementById('district');
                    district.innerHTML = '';
                    ward.innerHTML = '';
                    for (let j = 0; j < data[i].districts.length; j++) {
                        let option = document.createElement('option');
                        option.value = data[i].districts[j].name;
                        option.innerText = data[i].districts[j].name;
                        district.appendChild(option);
                        district_arr[i][j] = data[i].districts[j].name;
                    }
                }
            }
        })


        district.addEventListener("click", function () {
            let district_code = district.value;
            console.log(district_code)
            for (let i = 0; i < data.length; i++) {
                for (let j = 0; j < data[i].districts.length; j++) {
                    if (data[i].districts[j].name == district_code) {
<%--                        <%= district %> =  data[i].districts[j].name--%>
                        let ward = document.getElementById('ward');
                        ward.innerHTML = '';
                        for (let k = 0; k < data[i].districts[j].wards.length; k++) {
                            let option = document.createElement('option');
                            option.value = data[i].districts[j].wards[k].name;
                            option.innerText = data[i].districts[j].wards[k].name;
                            ward.appendChild(option);
                            ward_arr[i][j][k] = data[i].districts[j].wards[k].name;
                        }
                    }
                }
            }
        })

        <%--ward.addEventListener("click", function () {--%>
        <%--    let ward_code = ward.value;--%>
        <%--    console.log(ward_code)--%>
        <%--    for (let i = 0; i < data.length; i++) {--%>
        <%--        for (let j = 0; j < data[i].districts.length; j++) {--%>
        <%--            for (let k = 0; k < data[i].districts[j].wards.length; k++) {--%>
        <%--                if (data[i].districts[j].wards[k].code == ward_code) {--%>
        <%--                    <%= ward %> =  data[i].districts[j].wards[k].name--%>
        <%--                }--%>
        <%--            }--%>
        <%--        }--%>
        <%--    }--%>
        <%--})--%>

    }
    Provincess()
    console.log(province_arr)
    console.log(district_arr)
    console.log(ward_arr)


</script>
</html>



