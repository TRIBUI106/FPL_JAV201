package com.poly.lab4.servlet;

import com.poly.lab4.DAO.UserDAO;
import com.poly.lab4.DAO.impl.UserDAOImpl;
import com.poly.lab4.entity.User;
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

        req.getRequestDispatcher("/views/login.jsp")
                .forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String user = req.getParameter("username");
        String pass = req.getParameter("password");

        System.out.println("INPUT USER = " + user);
        System.out.println("INPUT PASS = " + pass);

        User u = dao.findByIdOrEmail(user);

        System.out.println("DB USER = " + (u != null ? u.getId() : "null"));
        System.out.println("DB PASS = " + (u != null ? u.getPassword() : "null"));


        if (u != null && u.getPassword().equals(pass)) {
            req.getSession().setAttribute("user", u);
            resp.sendRedirect(req.getContextPath() + "/index.jsp");
        } else {
            req.setAttribute("error", "Sai tài khoản hoặc mật khẩu");
            req.getRequestDispatcher("/views/login.jsp")
                    .forward(req, resp);
        }
    }
}

