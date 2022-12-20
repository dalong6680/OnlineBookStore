package com.wsyu.onlinebookstore.mapper;

import com.wsyu.onlinebookstore.entity.Order;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.Date;
import java.util.List;

@Mapper
public interface OrderMapper {
    @Insert("INSERT INTO `order` (user_id, book_id, count, order_date ) VALUES (#{user_id}, #{book_id}, #{count}, #{order_date})")
    void insert(@Param("user_id") int user_id,
                @Param("book_id") int book_id,
                @Param("count") int count,
                @Param("order_date") Date order_date);
    
    @Select("SELECT * FROM `order` WHERE user_id = #{user_id}")
    List<Order> selectOrderListByUserId(@Param("user_id") int user_id);
}
