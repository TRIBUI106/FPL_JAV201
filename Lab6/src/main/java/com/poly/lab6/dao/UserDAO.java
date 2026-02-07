package com.poly.lab6.dao;

import com.poly.lab6.entity.User;

public interface UserDAO {
    User findByUsername(String username);
    void create(User user);
}
