package com.wsyu.onlinebookstore.mapper;

import com.wsyu.onlinebookstore.entity.Cart;
import com.wsyu.onlinebookstore.entity.CartDetail;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface CartMapper {
    @Insert("INSERT INTO cart(serial_no, user_id, book_id, count) VALUES (#{serial_no}, #{user_id}, #{book_id}, #{count})")
    void insert(@Param("serial_no") int serial_no,
                @Param("user_id") int user_id,
                @Param("book_id") int book_id,
                @Param("count") int count);
    
    @Select("SELECT * FROM cart WHERE user_id = #{user_id}")
    List<Cart> selectCartListByUserId(@Param("user_id") int user_id);
    
    @Select("SELECT t0.cart_id, t0.serial_no, t1.name, t1.writer, t1.price, t0.count\n" +
            "FROM cart AS t0\n" +
            "LEFT OUTER JOIN book AS t1\n" +
            "ON (t1.book_id = t0.book_id)\n" +
            "WHERE (t0.user_id = #{user_id})\n")
    List<CartDetail> selectFullCartListByUserId(@Param("user_id") int user_id);
    
    @Update("UPDATE cart SET count = #{newCount} WHERE cart_id = #{cart_id}")
    void updateCartByCartIdAndCount(@Param("cart_id") int cart_id, @Param("newCount") int newCount);
    
    @Select("SELECT MAX(serial_no) FROM cart")
    Integer selectMaxSerialNo();
    
    @Delete("DELETE FROM cart WHERE cart_id = #{cart_id}")
    void deleteCartByCartId(@Param("cart_id") int cart_id);
}
