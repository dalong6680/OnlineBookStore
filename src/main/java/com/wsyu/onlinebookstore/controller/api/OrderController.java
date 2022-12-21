package com.wsyu.onlinebookstore.controller.api;

import com.wsyu.onlinebookstore.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/api/order")
public class OrderController {
    @Resource
    OrderService orderService;
    
    @RequestMapping("/createOrder")
    public String createOrder(HttpSession session) {
        String username = (String) session.getAttribute("username");
        try {
            orderService.addOrder(username);
        } catch (RuntimeException e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", e.getCause());
            return "redirect:/user/cart";
        }
        session.setAttribute("message", "下单成功！");
        session.removeAttribute("cartList");
        return "redirect:/user/orderSuccess";
    }
}
