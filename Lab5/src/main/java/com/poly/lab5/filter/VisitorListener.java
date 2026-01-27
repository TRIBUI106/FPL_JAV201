package com.poly.lab5.filter;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

@WebListener
public class VisitorListener
        implements ServletContextListener, HttpSessionListener {

    public void contextInitialized(ServletContextEvent e) {
        e.getServletContext().setAttribute("visitors", 0);
    }

    public void sessionCreated(HttpSessionEvent e) {
        ServletContext app = e.getSession().getServletContext();
        int v = (int) app.getAttribute("visitors");
        app.setAttribute("visitors", v + 1);
    }
}
