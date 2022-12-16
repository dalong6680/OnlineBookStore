package com.wsyu.onlinebookstore.controller.api;

import com.wsyu.onlinebookstore.mapper.UserMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

@Controller
@RequestMapping("/api/admin")
public class AdminController {
    @Resource
    UserMapper userMapper;
    
    @RequestMapping(value = "/restorePassword", method = RequestMethod.POST)
    public void alterUserInformation(String username, String password) {
        userMapper.updateUserByUsername(username, password);
    }
}
