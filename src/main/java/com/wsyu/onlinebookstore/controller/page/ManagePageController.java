package com.wsyu.onlinebookstore.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manage")
public class ManagePageController {
    @RequestMapping("/bookAdd")
    public String bookAdd() {
        return "/manage/bookAdd";
    }
    
    @RequestMapping("/bookList")
    public String bookList() {
        return "/manage/bookList";
    }
    
    @RequestMapping("/orderList")
    public String orderList() {
        return "/manage/orderList";
    }
    
    @RequestMapping("/userEdit")
    public String userEdit() {
        return "/manage/userEdit";
    }
    
    @RequestMapping("/userList")
    public String userList() {
        return "/manage/userList";
    }
}
