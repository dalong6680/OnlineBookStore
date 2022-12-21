package com.wsyu.onlinebookstore.service.impl;

import com.wsyu.onlinebookstore.entity.MessageDetail;
import com.wsyu.onlinebookstore.mapper.MessageMapper;
import com.wsyu.onlinebookstore.mapper.UserMapper;
import com.wsyu.onlinebookstore.service.MessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {
    @Resource
    MessageMapper messageMapper;
    @Resource
    UserMapper userMapper;
    
    @Override
    public void addMessage(String username, String content) {
        messageMapper.insert(userMapper.selectUserByUsername(username).getUser_id(), content, new Date());
    }
    
    @Override
    public List<MessageDetail> getAllMessageList() {
        return messageMapper.selectAllMessageList();
    }
    
    @Override
    public List<MessageDetail> getMessageListByUsername(String username) {
        return messageMapper.selectMessageByUsername(username);
    }
    
    @Override
    public void replyMessage(String reply, int message_id) {
        messageMapper.updateMessageReplyByMessageId(reply, message_id);
    }
}
