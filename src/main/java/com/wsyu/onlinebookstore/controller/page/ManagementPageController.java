package com.wsyu.onlinebookstore.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manage")
public class ManagementPageController {
    @RequestMapping("/user")
    public String user() {
        return "/manage/user";
    }
    @RequestMapping("/stock")
    public String stock() {
        return "/manage/stock";
    }
    @RequestMapping("/statistics")
    public String statistics() {
        return "/manage/statistics";
    }
}
