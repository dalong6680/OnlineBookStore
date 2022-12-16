package com.wsyu.onlinebookstore.service;

public interface UserService {
    boolean login(String username, String password);
    void register(String username, String password);
    
    boolean isAdmin(String username);
}
