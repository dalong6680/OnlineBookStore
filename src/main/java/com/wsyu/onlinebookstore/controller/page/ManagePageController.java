package com.wsyu.onlinebookstore.controller.page;

import com.wsyu.onlinebookstore.entity.Book;
import com.wsyu.onlinebookstore.entity.MessageDetail;
import com.wsyu.onlinebookstore.entity.OrderDetail;
import com.wsyu.onlinebookstore.entity.User;
import com.wsyu.onlinebookstore.service.BookService;
import com.wsyu.onlinebookstore.service.MessageService;
import com.wsyu.onlinebookstore.service.OrderService;
import com.wsyu.onlinebookstore.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/manage")
public class ManagePageController {
    @Resource
    BookService bookService;
    @Resource
    UserService userService;
    @Resource
    OrderService orderService;
    @Resource
    MessageService messageService;
    
    @RequestMapping("/index")
    public String index() {
        return "/manage/index";
    }
    
    @RequestMapping("/bookManage")
    public String bookManage(HttpSession session) {
        List<Book> allBookList = bookService.getAllBookList();
        session.setAttribute("bookList", allBookList);
        return "/manage/bookManage";
    }
    
    @RequestMapping("/addBook")
    public String addBook() {
        return "/manage/addBook";
    }
    
    @RequestMapping("/userManage")
    public String userManage(HttpSession session) {
        List<User> allUserList = userService.getAllUserList();
        session.setAttribute("userList", allUserList);
        return "/manage/userManage";
    }
    
    @RequestMapping("/messageManage")
    public String messageManage(HttpSession session) {
        List<MessageDetail> allMessageList = messageService.getAllMessageList();
        session.setAttribute("messageList", allMessageList);
        return "/manage/messageManage";
    }
    
    @RequestMapping("/orderHistory")
    public String orderHistory(HttpSession session) {
        List<OrderDetail> orderList = orderService.getAllOrderList();
        session.setAttribute("orderList", orderList);
        return "/manage/orderHistory";
    }
}
