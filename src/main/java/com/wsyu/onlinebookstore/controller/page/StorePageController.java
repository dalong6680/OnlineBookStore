package com.wsyu.onlinebookstore.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StorePageController {
    @RequestMapping("/store")
    public String store() {
        return "store";
    }
}
