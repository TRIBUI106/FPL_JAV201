package com.poly.lab5.servlet;

import com.poly.lab5.dao.UserDAO;
import com.poly.lab5.dao.impl.UserDAOImpl;
import com.poly.lab5.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    UserDAO dao = new UserDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String u = req.getParameter("username");
        String p = req.getParameter("password");

        User user = dao.findById(u);

        if (user == null) {
            req.setAttribute("error", "Sai username");
            req.getRequestDispatcher("views/login.jsp").forward(req, resp);
        } else if (!user.getPassword().equals(p)) {
            req.setAttribute("error", "Sai password");
            req.getRequestDispatcher("views/login.jsp").forward(req, resp);
        } else {
            req.getSession().setAttribute("user", user);
            resp.sendRedirect(req.getContextPath() + "/index.jsp");
        }
    }
}


