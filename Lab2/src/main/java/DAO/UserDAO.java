package DAO;

import entity.User;

import java.util.List;

public interface UserDAO {
    void createUser(User user); // Bỏ static
    void updateUser(User user);
    void deleteUser(int userId);
    List<User> getAllUsers();
    User getUserById(String userId);
}
