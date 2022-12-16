package com.wsyu.onlinebookstore.controller.api;

import com.wsyu.onlinebookstore.entity.Book;
import com.wsyu.onlinebookstore.service.BookService;
import com.wsyu.onlinebookstore.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/api")
public class LoginController {
    @Resource
    UserService userService;
    @Resource
    BookService bookService;
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        HttpSession session) {
        session.removeAttribute("errorMessage");
        try {
            boolean res = userService.login(username, password);
            boolean isAdmin;
            if (res) {
                isAdmin = userService.isAdmin(username);
                session.setAttribute("admin", isAdmin ? "1" : "0");
                session.setAttribute("username", username);
                List<Book> allBooks = bookService.getAllBooks();
                session.setAttribute("bookList", allBooks);
                return "redirect:/store";
            } else {
                throw new RuntimeException("用户名或密码错误");
            }
        } catch (RuntimeException e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "用户名或密码错误");
            return "redirect:/login";
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "服务器内部错误，请稍后再试！");
            return "redirect:/login";
        }
    }
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("errorMessage");
        session.removeAttribute("username");
        return "redirect:/login";
    }
}
