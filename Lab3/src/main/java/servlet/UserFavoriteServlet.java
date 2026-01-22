package servlet;

import dao.impl.UserDAOImpl;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/user-favorites")
public class UserFavoriteServlet extends HttpServlet {

    UserDAOImpl userDAO = new UserDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        User user = userDAO.findById(1); // Nguyễn Văn Tèo
        req.setAttribute("user", user);

        req.getRequestDispatcher("/views/user-favorites.jsp")
                .forward(req, resp);
    }
}
