package com.poly.lab6.filter;


import com.poly.lab6.entity.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import jakarta.servlet.Filter;


import java.io.IOException;

@WebFilter({
        "/admin/*",
        "/auth/change-password",
        "/auth/edit-profile",
        "/video/like/*",
        "/video/list",
        "/video/share/*",
        "/auth/change-password",
        "/auth/edit-profile"
})
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Chưa đăng nhập
        if (user == null) {
            session.setAttribute("redirectUri", request.getRequestURI());
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }

        // Kiểm tra ADMIN (role = 0)
        if (request.getRequestURI().startsWith("/admin")
                && user.getRole() != 0) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        chain.doFilter(req, res);
    }
}

