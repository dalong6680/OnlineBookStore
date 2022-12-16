package com.wsyu.onlinebookstore.controller.api;

import com.wsyu.onlinebookstore.service.UserService;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/api")
public class RegisterController {
    @Resource
    UserService userService;
    
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@RequestParam("username") String username,
                           @RequestParam("password") String password,
                           HttpSession session) {
        session.removeAttribute("errorMessage");
        try {
            userService.register(username, password);
        } catch (DuplicateKeyException e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "该用户已存在！");
            return "redirect:/register";
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "服务器内部错误，请稍后再试！");
            return "redirect:/register";
        }
        return "redirect:/login";
    }
}
