package com.wsyu.onlinebookstore.mapper;

import com.wsyu.onlinebookstore.entity.MessageDetail;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.Date;
import java.util.List;

public interface MessageMapper {
    @Select("SELECT t0.message_id, t1.username, t0.content, t0.reply, t0.message_date\n" +
            "FROM message AS t0\n" +
            "LEFT OUTER JOIN user AS t1\n" +
            "ON (t1.user_id = t0.user_id)")
    List<MessageDetail> selectAllMessageList();
    
    @Insert("INSERT INTO message(user_id, content, reply, message_date) VALUES (#{user_id}, #{content}, '待处理', #{message_date})")
    void insert(@Param("user_id") int user_id,
                @Param("content") String content,
                @Param("message_date") Date message_date);
    
    @Select("SELECT t0.message_id, t1.username, t0.content, t0.reply, t0.message_date\n" +
            "FROM message AS t0\n" +
            "LEFT OUTER JOIN user AS t1\n" +
            "ON (t1.user_id = t0.user_id)\n" +
            "WHERE (t1.username = #{username})")
    List<MessageDetail> selectMessageByUsername(@Param("username") String username);
    
    @Update("UPDATE message SET reply = #{reply} WHERE message_id = #{message_id}")
    void updateMessageReplyByMessageId(@Param("reply") String reply, @Param("message_id") int message_id);
}
