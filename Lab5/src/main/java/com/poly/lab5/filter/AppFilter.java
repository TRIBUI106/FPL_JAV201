package com.poly.lab5.filter;

import com.poly.lab5.dao.LogDAO;
import com.poly.lab5.dao.impl.LogDAOImpl;
import com.poly.lab5.entity.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/*")
public class AppFilter implements Filter {

    LogDAO logDAO = new LogDAOImpl();

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession(false);

        String username = null;
        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            username = user.getUsername();
        }

        logDAO.create(req.getRequestURI(), username);

        chain.doFilter(request, response);
    }
}

