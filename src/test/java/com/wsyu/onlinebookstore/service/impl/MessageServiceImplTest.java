package com.wsyu.onlinebookstore.service.impl;

import com.wsyu.onlinebookstore.config.MainConfiguration;
import com.wsyu.onlinebookstore.config.MybatisConfiguration;
import com.wsyu.onlinebookstore.config.WebMvcConfiguration;
import com.wsyu.onlinebookstore.initializer.MvcInitializer;
import com.wsyu.onlinebookstore.mapper.UserMapper;
import com.wsyu.onlinebookstore.service.MessageService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@SpringJUnitWebConfig(MvcInitializer.class)
@ContextConfiguration(classes = {WebMvcConfiguration.class, MybatisConfiguration.class, MainConfiguration.class})
public class MessageServiceImplTest {
    @Autowired
    MessageService messageService;
    @Test
    public void addMessage() {
        messageService.addMessage("123", "测试信息0");
    }
    
    @Test
    public void getAllMessageList() {
        messageService.getAllMessageList().forEach(x -> System.out.println(x));
    }
    
    @Test
    public void getMessageListByUsername() {
        messageService.getMessageListByUsername("123").forEach(x -> System.out.println(x));
    }
    
    @Test
    public void replyMessage() {
        int message_id = messageService.getAllMessageList().get(1).getMessage_id();
        messageService.replyMessage("测试回复", message_id);
    }
}