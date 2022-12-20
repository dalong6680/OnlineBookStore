package com.wsyu.onlinebookstore.mapper;

import com.wsyu.onlinebookstore.entity.Message;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.Date;
import java.util.List;

public interface MessageMapper {
    @Select("SELECT * FROM message")
    List<Message> selectAllMessageList();
    
    @Insert("INSERT INTO message(user_id, content, reply, message_date) VALUES (#{user_id}, #{content}, '待处理', #{message_date})")
    void insert(@Param("user_id") int user_id,
                @Param("content") String content,
                @Param("message_date") Date message_date);
    
    @Select("SELECT * From message WHERE user_id = #{user_id}")
    List<Message> selectMessageByUserId(@Param("user_id") int user_id);
    
    @Update("UPDATE message SET reply = #{reply} WHERE message_id = #{message_id}")
    void updateMessageReplyByMessageId(@Param("reply") String reply, @Param("message_id") int message_id);
}
