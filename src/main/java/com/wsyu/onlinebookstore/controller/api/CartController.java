package com.wsyu.onlinebookstore.controller.api;

import com.wsyu.onlinebookstore.service.CartService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/api/cart")
public class CartController {
    @Resource
    CartService cartService;
    
    @RequestMapping("/enCart")
    public String addBookToCart(@RequestParam String bookName,
                                @RequestParam int count,
                                HttpSession session) {
        String username = (String) session.getAttribute("username");
        cartService.add(bookName, count, username);
        session.setAttribute("message", "添加购物车成功！");
        return "redirect:/store";
    }
    
    @RequestMapping("/deCart")
    public String deleteCart(@RequestParam int cartId, HttpSession session) {
        cartService.removeCartByCartId(cartId);
        session.setAttribute("message", "删除购物车成功！");
        return "redirect:/store";
    }
}
