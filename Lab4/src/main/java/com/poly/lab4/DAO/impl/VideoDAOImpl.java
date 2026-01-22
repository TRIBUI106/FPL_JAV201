package com.poly.lab4.DAO.impl;

import com.poly.lab4.DAO.VideoDAO;
import com.poly.lab4.entity.Video;
import com.poly.lab4.utils.JpaUtils;
import jakarta.persistence.EntityManager;

import java.util.List;

public class VideoDAOImpl implements VideoDAO {
    EntityManager em = JpaUtils.getEntityManager();

    @Override
    public List<Video> findByKeyword(String keyword) {
        String jpql = "SELECT v FROM Video v WHERE v.title LIKE :kw";
        return em.createQuery(jpql, Video.class)
                .setParameter("kw", "%" + keyword + "%")
                .getResultList();
    }

    public List<Object[]> reportShare() {
        String jpql = """
            SELECT v.title,
                   COUNT(s),
                   MIN(s.shareDate),
                   MAX(s.shareDate)
            FROM Share s JOIN s.video v
            GROUP BY v.title
        """;
        return em.createQuery(jpql).getResultList();
    }
}
