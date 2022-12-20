package com.wsyu.onlinebookstore.controller.page;

import com.wsyu.onlinebookstore.entity.Book;
import com.wsyu.onlinebookstore.entity.Message;
import com.wsyu.onlinebookstore.service.BookService;
import com.wsyu.onlinebookstore.service.MessageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class StorePageController {
    @Resource
    BookService bookService;
    @Resource
    MessageService messageService;
    
    @RequestMapping("/store")
    public String store(HttpSession httpSession) {
        String username = (String) httpSession.getAttribute("username");
        List<Message> messageListByUsername = messageService.getMessageListByUsername(username);
        List<Book> allBookList = bookService.getAllBookList();
        httpSession.setAttribute("messageList", messageListByUsername);
        httpSession.setAttribute("bookList", allBookList);
        return "store";
    }
}
