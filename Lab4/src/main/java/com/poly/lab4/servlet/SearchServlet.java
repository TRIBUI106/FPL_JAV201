package com.poly.lab4.servlet;

import com.poly.lab4.DAO.VideoDAO;
import com.poly.lab4.DAO.impl.VideoDAOImpl;
import com.poly.lab4.entity.Video;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    VideoDAO dao = new VideoDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String keyword = req.getParameter("keyword");
        System.out.println("KEYWORD = [" + keyword + "]");

        if (keyword != null && !keyword.trim().isEmpty()) {
            req.setAttribute("videos", dao.findByKeyword(keyword.trim()));
        }

        req.getRequestDispatcher("/views/search.jsp")
                .forward(req, resp);
    }
}

