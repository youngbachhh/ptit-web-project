<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="vnpay.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>VNPAY RESPONSE</title>
        <!-- Bootstrap core CSS -->
        <link href="../css/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="../css/jumbotron-narrow.css" rel="stylesheet">
        <script src="../js/jquery-1.11.3.min.js"></script>
    </head>
    <body>
        <%
            //Begin process return from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);

        %>
        <!--Begin display -->
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">VNPAY RESPONSE</h3>
            </div>
            <div class="table-responsive">
                <div class="form-group">
                    <label >Merchant Transaction Code:</label>
                    <label class="form-control" name="vnp_TxnRef"><%=request.getParameter("vnp_TxnRef")%></label>
                </div>    
                <div class="form-group">
                    <label>Amount:</label>
                    <label class="form-control" name="vnp_Amount"><%=request.getParameter("vnp_Amount")%></label>
                </div>  
                <div class="form-group">
                    <label >Order info:</label>
                    <label class="form-control" name="vnp_OrderInfo"><%=request.getParameter("vnp_OrderInfo")%></label>
                </div> 
                <div class="form-group">
                    <label >VNPAY Response Code:</label>
                    <label class="form-control" name="vnp_ResponseCode"><%=request.getParameter("vnp_ResponseCode")%></label>
                </div> 
                <div class="form-group">
                    <label >VNPAY Transaction Code:</label>
                    <label class="form-control" name="vnp_TransactionNo"><%=request.getParameter("vnp_TransactionNo")%></label>
                </div> 
                <div class="form-group">
                    <label >Bank Code:</label>
                    <label class="form-control" name="vnp_BankCode"><%=request.getParameter("vnp_BankCode")%></label>
                </div> 
                <div class="form-group">
                    <label >Pay Date:</label>
                    <label class="form-control" name="vnp_PayDate"><%=request.getParameter("vnp_PayDate")%></label>
                </div> 
                <div class="form-group">
                    <label >Payment Status:</label>
                    <label>
                        <%if (signValue.equals(vnp_SecureHash)) {
                            if ("00".equals(request.getParameter("vnp_TransactionStatus"))) { %>
                                <label type="text" name="status">success</label>
                            <%} else { %>
                                <label type="text" name="status">failed</label>
                            <%}
                        }%>
                    </label>
                </div>
                <button class="btn btn-success" id="btnLuu" onclick="saveTransaction();">Quay lại</button>
            </div>
            <p>
                &nbsp;
            </p>
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div>
    <script type="text/javascript">
       function saveTransaction() {
           const vnp_TxnRef = $("label[name='vnp_TxnRef']").text();
           const vnp_Amount = $("label[name='vnp_Amount']").text();
           const vnp_OrderInfo = $("label[name='vnp_OrderInfo']").text();
           const vnp_ResponseCode = $("label[name='vnp_ResponseCode']").text();
           const vnp_TransactionNo = $("label[name='vnp_TransactionNo']").text();
           const vnp_BankCode = $("label[name='vnp_BankCode']").text();
           const vnp_PayDate = $("label[name='vnp_PayDate']").text();
           const status = $("label[name='status']").text();

           window.location.href = "http://localhost:8080/luuGiaoDich?vnp_TxnRef=" + vnp_TxnRef + "&vnp_Amount=" + vnp_Amount + "&vnp_OrderInfo="
               + vnp_OrderInfo + "&vnp_ResponseCode=" + vnp_ResponseCode + "&vnp_TransactionNo="
               + vnp_TransactionNo + "&vnp_BankCode=" + vnp_BankCode + "&vnp_PayDate="
               + vnp_PayDate + "&status=" + status;
       }
    </script>
    </body>
</html>
