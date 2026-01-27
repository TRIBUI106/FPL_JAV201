package com.poly.lab5.dao.impl;


import com.poly.lab5.dao.UserDAO;
import com.poly.lab5.entity.User;
import com.poly.lab5.util.JPAUtil;
import jakarta.persistence.EntityManager;

public class UserDAOImpl implements UserDAO {

    @Override
    public User findById(String username) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.find(User.class, username);
        } finally {
            em.close();
        }
    }
}

