package com.wsyu.onlinebookstore.controller.api;

import com.wsyu.onlinebookstore.entity.Book;
import com.wsyu.onlinebookstore.service.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/api/store")
public class StoreController {
    @Resource
    BookService bookService;
    
    @RequestMapping("/findBook")
    public String findBook(@RequestParam String bookName, HttpSession session) {
        List<Book> bookListByName = bookService.getBookListByName(bookName);
        session.setAttribute("bookList", bookListByName);
        return "redirect:/user/store?flushBookList=0";
    }
}
