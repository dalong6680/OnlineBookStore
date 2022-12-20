package com.wsyu.onlinebookstore.service.impl;

import com.wsyu.onlinebookstore.config.MainConfiguration;
import com.wsyu.onlinebookstore.config.MybatisConfiguration;
import com.wsyu.onlinebookstore.config.WebMvcConfiguration;
import com.wsyu.onlinebookstore.entity.Cart;
import com.wsyu.onlinebookstore.initializer.MvcInitializer;
import com.wsyu.onlinebookstore.service.CartService;
import com.wsyu.onlinebookstore.service.OrderService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringJUnitWebConfig(MvcInitializer.class)
@ContextConfiguration(classes = {WebMvcConfiguration.class, MybatisConfiguration.class, MainConfiguration.class})
public class OrderServiceImplTest {
    @Autowired
    OrderService orderService;
    
    @Autowired
    CartService cartService;
    
    @Test
    public void addOrder() {
        List<Cart> cartByUsername = cartService.getCartByUsername("admin");
        List<Integer> serial_no_list = new ArrayList<>();
        for (Cart cart : cartByUsername) {
            serial_no_list.add(cart.getSerial_no());
        }
//        serial_no_list.add(1);
//        serial_no_list.add(2);
//        serial_no_list.add(3);
//        serial_no_list.add(4);
        orderService.addOrder("admin");
    }
    
    @Test
    public void getOrderByUsername() {
        orderService.getOrderListByUsername("admin").forEach(x -> System.out.println(x));
    }
}
