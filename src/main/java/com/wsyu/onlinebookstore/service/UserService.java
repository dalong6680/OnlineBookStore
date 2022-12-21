package com.wsyu.onlinebookstore.service;

import com.wsyu.onlinebookstore.entity.User;

import java.util.List;

public interface UserService {
    boolean login(String username, String password);
    
    void register(String username, String password);
    
    boolean isAdmin(String username);
    void changePassword(String username, String password);
    List<User> getAllUserList();
}
