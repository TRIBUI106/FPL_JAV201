package com.poly.lab5.dao.impl;

import com.poly.lab5.dao.LogDAO;
import com.poly.lab5.entity.Log;
import com.poly.lab5.util.JPAUtil;
import jakarta.persistence.EntityManager;

import java.time.LocalDateTime;

public class LogDAOImpl implements LogDAO {

    @Override
    public void create(String url, String username) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();

            Log log = new Log();
            log.setUrl(url);
            log.setUsername(username);
            log.setAccessTime(LocalDateTime.now());

            em.persist(log);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }
}

