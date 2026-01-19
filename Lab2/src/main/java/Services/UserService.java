package Services;

import DAO.UserDAO;
import DAO.UserDAOImpl;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
@WebServlet({
        "/user",
        "/user/create",
        "/user/update",
        "/user/delete",
        "/user/edit/*",
        "/user/reset"
})
public class UserService extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAO userDAO = new UserDAOImpl();
        String path = req.getServletPath();
        String uri = req.getRequestURI();

        // Xử lý lấy ID cho nút Edit
        if (uri.contains("/user/edit/")) {
            String id = uri.substring(uri.lastIndexOf("/") + 1);
            User user = userDAO.getUserById(id);
            req.setAttribute("user", user);
            req.setAttribute("isEdit", true);
        }

        // Luôn lấy danh sách mới nhất để hiển thị lên bảng
        req.setAttribute("users", userDAO.getAllUsers());
        req.getRequestDispatcher("/user-curd.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAO userDAO = new UserDAOImpl();
        User user = new User();
        try {
            BeanUtils.populate(user, req.getParameterMap());
            String path = req.getServletPath();

            if (path.endsWith("/create")) {
                userDAO.createUser(user);
            } else if (path.endsWith("/update")) {
                userDAO.updateUser(user);
            } else if (path.endsWith("/delete")) {
                userDAO.deleteUser(user.getId());
            }

            // SAU KHI XỬ LÝ: Redirect về trang chủ của Servlet để load lại data
            resp.sendRedirect(req.getContextPath() + "/user");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/user?error=failed");
        }
    }
}