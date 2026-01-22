package dao.impl;

import dao.FavoriteDAO;
import entity.Favorite;
import utils.JpaUtils;

import jakarta.persistence.EntityManager;
import java.util.List;

public class FavoriteDAOImpl implements FavoriteDAO {

    EntityManager em = JpaUtils.getEntityManager();

    @Override
    public List<Favorite> findAll() {
        return em.createQuery("SELECT f FROM Favorite f", Favorite.class)
                .getResultList();
    }

    @Override
    public Favorite findById(Integer id) {
        return em.find(Favorite.class, id);
    }

    @Override
    public Favorite create(Favorite favorite) {
        em.getTransaction().begin();
        em.persist(favorite);
        em.getTransaction().commit();
        return favorite;
    }

    @Override
    public Favorite update(Favorite favorite) {
        em.getTransaction().begin();
        em.merge(favorite);
        em.getTransaction().commit();
        return favorite;
    }

    @Override
    public void deleteById(Integer id) {
        em.getTransaction().begin();
        em.remove(findById(id));
        em.getTransaction().commit();
    }
}
