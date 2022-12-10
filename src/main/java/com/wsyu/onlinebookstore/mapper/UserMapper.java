package com.wsyu.onlinebookstore.mapper;

import com.wsyu.onlinebookstore.entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserMapper {
    @Select("SELECT * FROM user")
    List<User> selectList();
    
    @Insert("INSERT INTO user (`user_id`, `username`, `password`, `is_admin`) VALUES (#{user_id}, #{username}, #{password}, #{is_admin},)")
    void register(@Param("user_id") String user_id,
                  @Param("username") String username,
                  @Param("password") String password,
                  @Param("is_admin") String is_admin);
    
    @Select("SELECT `password` FROM user WHERE username = #{username}")
    String getPasswordByUsername(String username);
}
