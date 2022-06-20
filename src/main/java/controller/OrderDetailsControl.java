package controller;

import dao.ProductDAO;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderDetailsControl", value = "/orderdetails")
public class OrderDetailsControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String oid = request.getParameter("oid");
        ProductDAO productDAO = new ProductDAO();
        List<Product> products = productDAO.getProductByOrderID(oid);
        request.setAttribute("products",products);
        request.getRequestDispatcher("orderdetails.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String oid = request.getParameter("oid");
        ProductDAO productDAO = new ProductDAO();
        List<Product> products = productDAO.getProductByOrderID(oid);
        request.setAttribute("products",products);
        request.getRequestDispatcher("orderdetails.jsp").forward(request,response);
    }
}
