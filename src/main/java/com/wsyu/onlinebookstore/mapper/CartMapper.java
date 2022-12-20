package com.wsyu.onlinebookstore.mapper;

import com.wsyu.onlinebookstore.entity.Cart;
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
    
    @Select("SELECT MAX(serial_no) FROM cart")
    Integer selectMaxSerialNo();
    
    @Delete("DELETE FROM cart WHERE cart_id = #{cart_id}")
    void deleteCartByCartId(@Param("cart_id") int cart_id);
}
