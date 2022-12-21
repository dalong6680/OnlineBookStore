package com.wsyu.onlinebookstore.controller.api;

import com.wsyu.onlinebookstore.entity.Book;
import com.wsyu.onlinebookstore.service.BookService;
import com.wsyu.onlinebookstore.service.MessageService;
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
    @Resource
    BookService bookService;
    @Resource
    MessageService messageService;
    
    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    public String alterUserInformation(@RequestParam String username, @RequestParam String password) {
        userService.changePassword(username, password);
        return "redirect:/manage/userManage";
    }
    
    @RequestMapping("/addBook")
    public String addBook(@RequestParam String name,
                          @RequestParam String writer,
                          @RequestParam double price,
                          @RequestParam int stock) {
        bookService.addBook(name, writer, price, stock);
        return "redirect:/manage/addBook";
    }
    
    @RequestMapping("/changeBook")
    public String alterBookInformation(@RequestParam int bookId,
                                       @RequestParam String name,
                                       @RequestParam String writer,
                                       @RequestParam double price,
                                       @RequestParam int stock) {
        bookService.updateBook(bookId, name, writer, price, stock);
        return "redirect:/manage/bookManage";
    }
    @RequestMapping("/replyMessage")
    public String replyMessage(@RequestParam int messageId, @RequestParam String reply) {
        messageService.replyMessage(reply, messageId);
        return "redirect:/manage/messageManage";
    }
}
