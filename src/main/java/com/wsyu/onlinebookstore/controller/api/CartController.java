package com.wsyu.onlinebookstore.controller.api;

import com.wsyu.onlinebookstore.entity.Cart;
import com.wsyu.onlinebookstore.service.CartService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

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
        return "redirect:/user/store";
    }
    
    @RequestMapping("/deCart")
    public String deleteCart(@RequestParam int cartId, HttpSession session) {
        cartService.removeCartByCartId(cartId);
        session.setAttribute("message", "删除购物车成功！");
        return "redirect:/user/cart";
    }
    @RequestMapping(value = "/updateCart", method = RequestMethod.GET)
    public String updateCart(@RequestParam int cartId, @RequestParam int newCount, HttpSession session) {
        cartService.updateCartByCartIdAndCount(cartId, newCount);
        return "redirect:/user/cart";
    }
    
    @RequestMapping("/clearCart")
    public String clearCart(HttpSession session) {
        List<Cart> cartListByUsername = cartService.getCartListByUsername((String) session.getAttribute("username"));
        for (Cart cart : cartListByUsername) {
            cartService.removeCartByCartId(cart.getCart_id());
        }
        session.setAttribute("message", "清空购物车成功！");
        return "redirect:/user/cart";
    }
}
