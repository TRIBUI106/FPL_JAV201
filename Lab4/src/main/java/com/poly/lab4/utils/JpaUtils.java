package com.poly.lab4.utils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JpaUtils {

    private static EntityManagerFactory factory;

    static {
        try {
            factory = Persistence.createEntityManagerFactory("Lab4");
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionInInitializerError("Lỗi tạo EntityManagerFactory");
        }
    }

    public static EntityManager getEntityManager() {
        return factory.createEntityManager();
    }

    public static void shutdown() {
        if (factory != null && factory.isOpen()) {
            factory.close();
        }
    }
}

