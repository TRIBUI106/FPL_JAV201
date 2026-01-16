package me.cz.fpl_jav201;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import me.cz.fpl_jav201.entity.User;

@WebServlet("/user")
public class UserManager extends HttpServlet {

    // Sử dụng đúng tên "mariadb" đã cấu hình trong persistence.xml
    EntityManagerFactory factory = Persistence.createEntityManagerFactory("mariadb");
    EntityManager em = factory.createEntityManager();

    public void create(User user) {
        try {
            em.getTransaction().begin(); // Bắt đầu
            em.persist(user);            // Thao tác lưu
            em.getTransaction().commit(); // Xác nhận lưu vào DB
        } catch (Exception e) {
            em.getTransaction().rollback(); // Hủy nếu lỗi
            e.printStackTrace();
        }
    }

}
