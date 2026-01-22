package dao.impl;

import dao.GenericDAO;
import entity.User;
import jakarta.persistence.EntityManager;
import utils.JpaUtils;

import java.util.List;

public class UserDAOImpl implements GenericDAO<User, Integer> {

    EntityManager em = JpaUtils.getEntityManager();

    public List<User> findAll() {
        return em.createQuery("SELECT u FROM User u", User.class).getResultList();
    }

    public User findById(Integer id) {
        return em.find(User.class, id);
    }

    public User create(User user) {
        em.getTransaction().begin();
        em.persist(user);
        em.getTransaction().commit();
        return user;
    }

    public User update(User user) {
        em.getTransaction().begin();
        em.merge(user);
        em.getTransaction().commit();
        return user;
    }

    public void deleteById(Integer id) {
        em.getTransaction().begin();
        em.remove(findById(id));
        em.getTransaction().commit();
    }
}

