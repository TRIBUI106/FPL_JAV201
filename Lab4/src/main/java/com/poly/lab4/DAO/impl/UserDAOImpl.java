package com.poly.lab4.DAO.impl;

import com.poly.lab4.DAO.UserDAO;
import com.poly.lab4.entity.User;
import com.poly.lab4.utils.JpaUtils;
import jakarta.persistence.EntityManager;

public class UserDAOImpl implements UserDAO {
    EntityManager em = JpaUtils.getEntityManager();

    @Override
    public User findByIdOrEmail(String value) {
        String jpql = "SELECT u FROM User u WHERE u.id = :val OR u.email = :val";
        try {
            return em.createQuery(jpql, User.class)
                    .setParameter("val", value)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
}

