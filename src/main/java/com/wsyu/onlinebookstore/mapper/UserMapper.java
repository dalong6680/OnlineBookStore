package com.wsyu.onlinebookstore.mapper;

import com.wsyu.onlinebookstore.entity.User;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserMapper {
    @Select("SELECT * FROM user")
    List<User> selectList();
    
    @Insert("INSERT INTO user (username, password, is_admin) VALUES (#{username}, #{password}, #{is_admin})")
    void insert(@Param("username") String username,
                @Param("password") String password,
                @Param("is_admin") int is_admin);
    
    @Select("SELECT * FROM user WHERE user_id = #{user_id}")
    String selectUserByUserId(@Param("user_id") int user_id);
    
    @Select("SELECT * FROM user WHERE username = #{username}")
    User selectUserByUsername(@Param("username") String username);
    
    @Update("UPDATE user SET password = #{password} WHERE username = #{username}")
    void updateUserByUsername(@Param("username") String username, @Param("password") String password);
}
