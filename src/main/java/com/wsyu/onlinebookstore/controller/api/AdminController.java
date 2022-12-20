package com.wsyu.onlinebookstore.controller.api;

import com.wsyu.onlinebookstore.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

@Controller
@RequestMapping("/api/admin")
public class AdminController {
    @Resource
    UserService userService;
    
    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    public void alterUserInformation(@RequestParam String username, @RequestParam String password) {
        userService.changePassword(username, password);
    }
}
