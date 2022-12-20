package com.wsyu.onlinebookstore.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserPageController {
    @RequestMapping("/cart")
    public String cart() {
        return "/user/cart";
    }
    @RequestMapping("/order")
    public String order() {
        return "/user/order";
    }
}
