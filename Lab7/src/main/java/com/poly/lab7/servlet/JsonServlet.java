package com.poly.lab7.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/json")
public class JsonServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json");

        String json = """
        {
            "manv": "TeoNV",
            "hoTen": "Nguyễn Văn Tèo",
            "gioiTinh": true,
            "luong": 950.5
        }
        """;

        resp.getWriter().print(json);
    }
}
