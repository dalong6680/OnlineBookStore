package com.wsyu.onlinebookstore.service.impl;

import com.wsyu.onlinebookstore.entity.Cart;
import com.wsyu.onlinebookstore.entity.CartDetail;
import com.wsyu.onlinebookstore.mapper.BookMapper;
import com.wsyu.onlinebookstore.mapper.CartMapper;
import com.wsyu.onlinebookstore.mapper.UserMapper;
import com.wsyu.onlinebookstore.service.CartService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service
public class CartServiceImpl implements CartService {
    @Resource
    CartMapper cartMapper;
    @Resource
    BookMapper bookMapper;
    @Resource
    UserMapper userMapper;
    
    @Override
    public void add(String bookName, int count, String username) {
        Integer maxSerialNo = cartMapper.selectMaxSerialNo();
        int serial_no = maxSerialNo == null ? 0 : maxSerialNo;
        cartMapper.insert(
                ++serial_no,
                userMapper.selectUserByUsername(username).getUser_id(),
                bookMapper.selectBookListByName(bookName).get(0).getBook_id(),
                count);
    }
    
    @Override
    public void addBatch(HashMap<String, Integer> bookAndCountMap, String username) {
        Integer maxSerialNo = cartMapper.selectMaxSerialNo();
        int serial_no = maxSerialNo == null ? 0 : maxSerialNo;
        for (String key : bookAndCountMap.keySet()) {
            cartMapper.insert(
                    ++serial_no,
                    userMapper.selectUserByUsername(username).getUser_id(),
                    bookMapper.selectBookListByName(key).get(0).getBook_id(),
                    bookAndCountMap.get(key));
        }
    }
    
    public List<Cart> getCartListByUsername(String username) {
        return cartMapper.selectCartListByUserId(userMapper.selectUserByUsername(username).getUser_id());
    }
    
    @Override
    public List<CartDetail> getFullCartListByUsername(String username) {
        return cartMapper.selectFullCartListByUserId(userMapper.selectUserByUsername(username).getUser_id());
    }
    
    @Override
    public void removeCartByCartId(int cart_id) {
        cartMapper.deleteCartByCartId(cart_id);
    }
    
    @Override
    public void updateCartByCartIdAndCount(int cart_id, int newCount) {
        cartMapper.updateCartByCartIdAndCount(cart_id, newCount);
    }
}
