package com.poly.lab5.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;

public class Filter1 implements Filter {
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;

        if (request.getRequestURI().contains("test-filter1")) {
            req.setAttribute("hello", "Tôi là Filter 1");
        }

        chain.doFilter(req, res);
    }
}

