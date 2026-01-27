package com.poly.lab5.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;

public class Filter2 implements Filter {
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;

        if (request.getRequestURI().contains("test-filter2")) {
            req.setAttribute("hello", "Tôi là Filter 2");
        }

        chain.doFilter(req, res);
    }
}


