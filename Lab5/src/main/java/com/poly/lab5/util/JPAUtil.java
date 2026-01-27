package com.poly.lab5.util;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAUtil {
    private static EntityManagerFactory emf =
            Persistence.createEntityManagerFactory("Lab5");

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
}

