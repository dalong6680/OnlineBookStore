package com.wsyu.onlinebookstore.service.impl;

import com.wsyu.onlinebookstore.mapper.UserMapper;
import com.wsyu.onlinebookstore.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    UserMapper userMapper;
    
    @Override
    public boolean login(String username, String password) {
        String passwordByUsername = userMapper.getPasswordByUsername(username);
        if (passwordByUsername == null) {
            return false;
        }
        return passwordByUsername.equals(password);
    }
}
