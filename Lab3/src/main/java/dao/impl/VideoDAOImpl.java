package dao.impl;


import dao.VideoDAO;
import entity.Video;
import utils.JpaUtils;

import jakarta.persistence.EntityManager;
import java.util.List;

public class VideoDAOImpl implements VideoDAO {

    EntityManager em = JpaUtils.getEntityManager();

    @Override
    public List<Video> findAll() {
        return em.createQuery("SELECT v FROM Video v", Video.class)
                .getResultList();
    }

    @Override
    public Video findById(Integer id) {
        return em.find(Video.class, id);
    }

    @Override
    public Video create(Video video) {
        em.getTransaction().begin();
        em.persist(video);
        em.getTransaction().commit();
        return video;
    }

    @Override
    public Video update(Video video) {
        em.getTransaction().begin();
        em.merge(video);
        em.getTransaction().commit();
        return video;
    }

    @Override
    public void deleteById(Integer id) {
        em.getTransaction().begin();
        em.remove(findById(id));
        em.getTransaction().commit();
    }
}
