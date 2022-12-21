package com.wsyu.onlinebookstore.service.impl;

import com.wsyu.onlinebookstore.entity.User;
import com.wsyu.onlinebookstore.mapper.UserMapper;
import com.wsyu.onlinebookstore.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    UserMapper userMapper;
    
    @Override
    public boolean login(String username, String password) {
        User user = userMapper.selectUserByUsername(username);
        if (user == null) {
            return false;
        }
        return user.getPassword().equals(password);
    }
    
    @Override
    public void register(String username, String password) {
        userMapper.insert(username, password, 0);
    }
    
    @Override
    public boolean isAdmin(String username) {
        User user = userMapper.selectUserByUsername(username);
        return user.getIs_admin() == 1;
    }
    
    @Override
    public void changePassword(String username, String password) {
        userMapper.updateUserByUsername(username, password);
    }
    
    @Override
    public List<User> getAllUserList() {
        return userMapper.selectList();
    }
}
