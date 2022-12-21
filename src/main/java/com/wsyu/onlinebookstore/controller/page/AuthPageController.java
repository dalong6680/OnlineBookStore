package com.wsyu.onlinebookstore.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthPageController {
    @RequestMapping("/login")
    public String login() {
        return "login-register";
    }
    @RequestMapping("/register")
    public String register() {
        return "login-register";
    }
}
