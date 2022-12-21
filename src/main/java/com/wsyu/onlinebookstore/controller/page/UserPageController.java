package com.wsyu.onlinebookstore.controller.page;

import com.wsyu.onlinebookstore.entity.*;
import com.wsyu.onlinebookstore.service.BookService;
import com.wsyu.onlinebookstore.service.CartService;
import com.wsyu.onlinebookstore.service.MessageService;
import com.wsyu.onlinebookstore.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserPageController {
    @Resource
    BookService bookService;
    @Resource
    MessageService messageService;
    @Resource
    CartService cartService;
    @Resource
    OrderService orderService;
    
    @RequestMapping("/cart")
    public String cart(HttpSession session) {
        String username = (String) session.getAttribute("username");
        List<CartDetail> fullCartListByUsername = cartService.getFullCartListByUsername(username);
        session.setAttribute("cartList", fullCartListByUsername);
        return "/user/cart";
    }
    
    @RequestMapping("/store")
    public String store(@RequestParam(required = false) Integer flushBookList, HttpSession session) {
        String username = (String) session.getAttribute("username");
        List<Message> messageListByUsername = messageService.getMessageListByUsername(username);
        List<Book> allBookList = bookService.getAllBookList();
        List<CartDetail> fullCartListByUsername = cartService.getFullCartListByUsername(username);
        session.setAttribute("cartList", fullCartListByUsername);
        session.setAttribute("messageList", messageListByUsername);
        if (flushBookList == null || flushBookList == 1) {
            session.setAttribute("bookList", allBookList);
        }
        return "/user/store";
    }
    
    @RequestMapping("/myOrderList")
    public String myOrderList(HttpSession session) {
        String username = (String) session.getAttribute("username");
        List<OrderDetail> orderListByUsername = orderService.getOrderListByUsername(username);
        session.setAttribute("orderList", orderListByUsername);
        return "/user/myOrderList";
    }
    
    @RequestMapping("/orderSuccess")
    public String orderSuccess() {
        return "/user/orderSuccess";
    }
}
