package com.poly.lab7.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.nio.file.*;

@WebServlet("/upload")
@MultipartConfig
public class UploadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Part filePart = req.getPart("file");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        String uploadDir = req.getServletContext().getRealPath("/uploads");
        Files.createDirectories(Paths.get(uploadDir));

        filePart.write(uploadDir + File.separator + fileName);

        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json");

        String json = String.format("""
        {
            "name": "%s",
            "type": "%s",
            "size": %d
        }
        """, fileName, filePart.getContentType(), filePart.getSize());

        resp.getWriter().print(json);
    }
}
