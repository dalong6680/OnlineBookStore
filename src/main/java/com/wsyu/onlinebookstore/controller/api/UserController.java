package com.wsyu.onlinebookstore.controller.api;

import com.wsyu.onlinebookstore.service.MessageService;
import com.wsyu.onlinebookstore.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/api/user/")
public class UserController {
    @Resource
    MessageService messageService;
    @Resource
    OrderService orderService;
    
    @RequestMapping("/addMessage")
    public String addMessage(@RequestParam String message, HttpSession session) {
        String username = (String) session.getAttribute("username");
        messageService.addMessage(username, message);
        session.setAttribute("message", "添加购物车成功！");
        return "redirect:/store";
    }
    @RequestMapping("/createOrder")
    public String createOrder(HttpSession session) {
        String username = (String) session.getAttribute("username");
        try {
            orderService.addOrder(username);
        } catch (RuntimeException e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", e.getCause());
            return "redirect:/cart";
        }
        session.setAttribute("message", "下单成功！");
        return "redirect:/cart";
    }
}
