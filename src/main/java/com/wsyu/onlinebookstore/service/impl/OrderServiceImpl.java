package com.wsyu.onlinebookstore.service.impl;

import com.wsyu.onlinebookstore.entity.Cart;
import com.wsyu.onlinebookstore.entity.Order;
import com.wsyu.onlinebookstore.entity.OrderDetail;
import com.wsyu.onlinebookstore.entity.User;
import com.wsyu.onlinebookstore.mapper.BookMapper;
import com.wsyu.onlinebookstore.mapper.CartMapper;
import com.wsyu.onlinebookstore.mapper.OrderMapper;
import com.wsyu.onlinebookstore.mapper.UserMapper;
import com.wsyu.onlinebookstore.service.CartService;
import com.wsyu.onlinebookstore.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Resource
    OrderMapper orderMapper;
    @Resource
    BookMapper bookMapper;
    @Resource
    UserMapper userMapper;
    @Resource
    CartMapper cartMapper;
    @Resource
    CartService cartService;
    
    @Override
    public void addOrder(String username) {
        User user = userMapper.selectUserByUsername(username);
        List<Cart> cartList = cartMapper.selectCartListByUserId(user.getUser_id());
        for (Cart cart : cartList) {
            if (bookMapper.selectBookByBookId(cart.getBook_id()).getStock() > cart.getCount()) {
                bookMapper.updateBookByBookIdAndCount(cart.getCount(), cart.getBook_id());
            } else {
                throw new RuntimeException(bookMapper.selectBookByBookId(cart.getBook_id()).getName() + "库存不足，购买失败！");
            }
            cartService.removeCartByCartId(cart.getCart_id());
            orderMapper.insert(user.getUser_id(), cart.getBook_id(), cart.getCount(), new Date());
        }
    }
    
    @Override
    public List<OrderDetail> getOrderListByUsername(String username) {
        return orderMapper.selectFullOrderListByUsername(username);
    }
    
    @Override
    public List<OrderDetail> getAllOrderList() {
        return  orderMapper.selectFullOrderList();
    }
}
