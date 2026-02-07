package com.poly.lab6.controller;

import com.poly.lab6.dao.UserDAO;
import com.poly.lab6.dao.impl.UserDAOImpl;
import com.poly.lab6.entity.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/auth/register")
public class RegisterServlet extends HttpServlet {

    UserDAO dao = new UserDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/auth/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (dao.findByUsername(username) != null) {
            req.setAttribute("error", "Username đã tồn tại");
            req.getRequestDispatcher("/auth/register.jsp").forward(req, resp);
            return;
        }

        User u = new User();
        u.setUsername(username);
        u.setPassword(password);
        u.setRole(1); // USER mặc định

        dao.create(u);

        resp.sendRedirect(req.getContextPath() + "/auth/register.jsp");
    }
}

