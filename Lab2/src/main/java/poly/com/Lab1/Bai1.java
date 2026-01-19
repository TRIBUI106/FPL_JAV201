package poly.com.Lab1;

import entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.util.List;

public class Bai1 {

    public static void main(String[] args) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("PolyOE");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

//        User user = new User();
//        user.setId("U005");
//        user.setFullname("Nguyen Trong Tinh");
//        user.setPassword("123456");
//        user.setAdmin(true);
//        user.setEmail("tinh@gmail.com");

        entityManager.getTransaction().begin();
        try {
            List<User> list = entityManager
                    .createQuery("SELECT u FROM User u", User.class)
                    .getResultList();

            for (User u : list) {
                System.out.println(u);
            }
            //entityManager.merge(user);
            entityManager.getTransaction().commit();
        }
        catch (Exception exception) {
            entityManager.getTransaction().rollback();
        }

//        User u = entityManager.find(User.class, "U005");
//        System.out.println(u);

        entityManager.close();
        entityManagerFactory.close();
    }
}
