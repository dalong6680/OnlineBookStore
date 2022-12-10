package com.wsyu.onlinebookstore.controller;

import com.wsyu.onlinebookstore.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

@Controller
public class UserController {
    @Resource
    UserService userService;
    
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password) {
        if (userService.login(username, password)) {
            return "index";
        }
        return "/login";
    }
}
