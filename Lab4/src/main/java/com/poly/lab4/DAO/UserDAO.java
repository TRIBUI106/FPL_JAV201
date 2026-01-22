package com.poly.lab4.DAO;

import com.poly.lab4.entity.User;

public interface UserDAO {
    User findByIdOrEmail(String value);
}

