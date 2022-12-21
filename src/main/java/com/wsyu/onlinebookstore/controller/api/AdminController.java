package com.wsyu.onlinebookstore.controller.api;

import com.wsyu.onlinebookstore.entity.Book;
import com.wsyu.onlinebookstore.service.BookService;
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
    
    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    public void alterUserInformation(@RequestParam String username, @RequestParam String password) {
        userService.changePassword(username, password);
    }
    
    @RequestMapping("/addBook")
    public String addBook(@RequestParam String name,
                          @RequestParam String writer,
                          @RequestParam double price,
                          @RequestParam int stock) {
        bookService.addBook(name, writer, price, stock);
        return "redirect:";
    }
    
    @RequestMapping("/addBookStock")
    public String addBookStock(@RequestParam String name, @RequestParam int stock) {
        Book book = bookService.getBookListByName(name).get(0);
        int currentStock = book.getStock();
        bookService.updateBook(name, name, book.getWriter(), book.getPrice(), currentStock + stock);
        return "redirect:";
    }
    
    @RequestMapping("/changeBook")
    public String alterBookInformation(@RequestParam String name,
                                       @RequestParam String writer,
                                       @RequestParam double price,
                                       @RequestParam int stock) {
        bookService.addBook(name, writer, price, stock);
        return "redirect:";
    }
}
