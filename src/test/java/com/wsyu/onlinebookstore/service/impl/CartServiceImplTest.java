package com.wsyu.onlinebookstore.service.impl;

import com.wsyu.onlinebookstore.config.MainConfiguration;
import com.wsyu.onlinebookstore.config.MybatisConfiguration;
import com.wsyu.onlinebookstore.config.WebMvcConfiguration;
import com.wsyu.onlinebookstore.initializer.MvcInitializer;
import com.wsyu.onlinebookstore.service.CartService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import javax.annotation.Resource;
import java.util.HashMap;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringJUnitWebConfig(MvcInitializer.class)
@ContextConfiguration(classes = {WebMvcConfiguration.class, MybatisConfiguration.class, MainConfiguration.class})
class CartServiceImplTest {
    
    @Resource
    CartService cartService;
    
    @Test
    void addBatch() {
        HashMap<String, Integer> map = new HashMap<>();
        map.put("彷徨", 1);
        map.put("呐喊", 1);
        map.put("1984", 2);
        cartService.addBatch(map, "admin");
    }
    
    @Test
    void getCartByUsername() {
    }
}