package controller;

import dao.UserDAO;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginControl", value = "/login")
public class LoginControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByEmail(email);

        if (userDAO.checkUser(email, password) == true) {
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("userName", userDAO.getUserName());
            session.setAttribute("userID",userDAO.getUserID());
            session.setAttribute("isAdmin", user.getRole());
            response.sendRedirect("index.jsp");
        }
        else {
            response.sendRedirect("login.jsp");
        }
    }
}
