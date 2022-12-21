package com.wsyu.onlinebookstore.service;

import com.wsyu.onlinebookstore.entity.MessageDetail;

import java.util.List;

public interface MessageService {
    void addMessage(String username, String content);
    
    List<MessageDetail> getAllMessageList();
    
    List<MessageDetail> getMessageListByUsername(String username);
    
    void replyMessage(String reply, int message_id);
    
}
