package servlet;

import dao.impl.FavoriteDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/favorites")
public class FavoriteServlet extends HttpServlet {

    FavoriteDAOImpl dao = new FavoriteDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setAttribute("favorites", dao.findAll());
        req.getRequestDispatcher("/views/favorites.jsp")
                .forward(req, resp);
    }
}
