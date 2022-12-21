package com.wsyu.onlinebookstore.mapper;

import com.wsyu.onlinebookstore.entity.OrderDetail;
import org.apache.ibatis.annotations.*;

import java.util.Date;
import java.util.List;

@Mapper
public interface OrderMapper {
    @Insert("INSERT INTO `order` (user_id, book_id, count, order_date ) VALUES (#{user_id}, #{book_id}, #{count}, #{order_date})")
    void insert(@Param("user_id") int user_id,
                @Param("book_id") int book_id,
                @Param("count") int count,
                @Param("order_date") Date order_date);
    
    @Results({
            @Result(id = true, column = "order_id", property = "order_id"),
            @Result(column = "name", property = "name"),
            @Result(column = "writer", property = "writer"),
            @Result(column = "price", property = "price"),
            @Result(column = "count", property = "count"),
            @Result(column = "order_date", property = "order_date"),
    })
    @Select("SELECT t0.order_id, t0.order_date, t2.name, t2.price, t2.writer, t0.count\n" +
            "FROM `order` AS t0\n" +
            "LEFT OUTER JOIN user AS t1\n" +
            "ON (t1.user_id = t0.user_id)\n" +
            "LEFT OUTER JOIN book AS t2\n" +
            "ON (t2.book_id = t0.book_id)\n" +
            "WHERE (t1.username = #{username})")
    List<OrderDetail> selectFullOrderListByUsername(@Param("username") String username);
    
    @Results({
            @Result(id = true, column = "order_id", property = "order_id"),
            @Result(column = "order_date", property = "order_date"),
            @Result(column = "username", property = "username"),
            @Result(column = "name", property = "name"),
            @Result(column = "price", property = "price"),
            @Result(column = "writer", property = "writer"),
            @Result(column = "count", property = "count"),
        
    })
    @Select("SELECT t0.order_id, t0.order_date, t1.username, t2.name, t2.price, t2.writer, t0.count\n" +
            "FROM `order` AS t0\n" +
            "LEFT OUTER JOIN user AS t1\n" +
            "ON (t1.user_id = t0.user_id)\n" +
            "LEFT OUTER JOIN book AS t2\n" +
            "ON (t2.book_id = t0.book_id)\n")
    List<OrderDetail> selectFullOrderList();
}
