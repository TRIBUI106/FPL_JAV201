package com.poly.lab4.servlet;

import com.poly.lab4.DAO.VideoDAO;
import com.poly.lab4.DAO.impl.VideoDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/report")
public class ReportServlet extends HttpServlet {
    VideoDAO dao = new VideoDAOImpl();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setAttribute("reports", dao.reportShare());
        req.getRequestDispatcher("/views/report.jsp").forward(req, resp);
    }
}
