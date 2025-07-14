/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.UserDAO;
import java.util.Date;
import java.util.List;
import model.Users;
import util.PasswordUtil;

/**
 *
 * @author Admin
 */
public class UserService {
    private final UserDAO userDAO = new UserDAO();

    public Users login(String email, String plainPassword) {
        Users user = userDAO.findByEmail(email);
        if (user != null && PasswordUtil.checkPassword(plainPassword, user.getPassword())) {
            return user;
        }
        return null;
    }

    public boolean registerUser(String username, String email, String password, String fullName, Date dob, String role) {
        if (userDAO.findByUsername(username) != null) {
            System.out.println("Username already exists.");
            return false;
        }
        if (userDAO.findByEmail(email) != null) {
            System.out.println("Email already exists.");
            return false;
        }

        Users newUser = new Users();
        newUser.setUsername(username);
        newUser.setEmail(email);
        newUser.setPassword(PasswordUtil.hashPassword(password));
        newUser.setFullName(fullName);
        newUser.setDob(dob);
        newUser.setRole(role);
        newUser.setCreatedAt(new Date());

        try {
            userDAO.create(newUser);  
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Users> getAllUsers() {
        return userDAO.findAll();
    }

    public Users getUserById(int id) {
        return userDAO.findById(id);
    }

    public boolean addUser(Users user) {
        if (userDAO.findByUsername(user.getUsername()) != null || userDAO.findByEmail(user.getEmail()) != null) {
            System.out.println("User already exists.");
            return false;
        }
        try {
            user.setPassword(PasswordUtil.hashPassword(user.getPassword()));
            user.setCreatedAt(new Date());
            userDAO.create(user);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void updateUser(Users user) {
        try {
            userDAO.update(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(int id) {
        try {
            userDAO.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void toggleUserStatus(int userId) {
        Users user = userDAO.findById(userId);
        if (user != null) {
            user.setActive(!user.getActive());
            userDAO.update(user);
        }
    }
}
