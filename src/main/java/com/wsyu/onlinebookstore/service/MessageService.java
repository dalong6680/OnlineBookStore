package com.wsyu.onlinebookstore.service;

import com.wsyu.onlinebookstore.entity.Message;

import java.util.List;

public interface MessageService {
    void addMessage(String username, String content);
    List<Message> getAllMessageList();
    List<Message> getMessageListByUsername(String username);
    void replyMessage(String reply, int message_id);
    
}
