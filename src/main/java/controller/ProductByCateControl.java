package controller;

import dao.ProductDAO;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductByCateControl", value = "/category")
public class ProductByCateControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO productDAO = new ProductDAO();
        String category = request.getParameter("cate");
        List<Product> list = productDAO.getProductByCate(category);
        request.setAttribute("list", list);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO productDAO = new ProductDAO();
        String category = request.getParameter("cate");
        List<Product> list = productDAO.getProductByCate(category);
        request.setAttribute("list", list);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }
}
