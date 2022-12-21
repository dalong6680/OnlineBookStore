package com.wsyu.onlinebookstore.mapper;

import com.wsyu.onlinebookstore.config.MainConfiguration;
import com.wsyu.onlinebookstore.config.MybatisConfiguration;
import com.wsyu.onlinebookstore.config.WebMvcConfiguration;
import com.wsyu.onlinebookstore.entity.CartDetail;
import com.wsyu.onlinebookstore.initializer.MvcInitializer;
import com.wsyu.onlinebookstore.service.CartService;
import lombok.AllArgsConstructor;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@SpringJUnitWebConfig(MvcInitializer.class)
@ContextConfiguration(classes = {WebMvcConfiguration.class, MybatisConfiguration.class, MainConfiguration.class})
public class CartMapperTest {
    @Autowired
    CartService cartService;
    @Test
    public void selectFullCartListByUserId() {
        List<CartDetail> fullCartListByUsername = cartService.getFullCartListByUsername("admin");
        fullCartListByUsername.forEach(x -> x.toString());
    }
}