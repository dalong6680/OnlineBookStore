package com.wsyu.onlinebookstore.service;

import com.wsyu.onlinebookstore.entity.Cart;
import com.wsyu.onlinebookstore.entity.CartDetail;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public interface CartService {
    void add(String bookName, int count, String username);
    void addBatch(HashMap<String, Integer> bookCountMap, String username);
    
    List<Cart> getCartListByUsername(String username);
    List<CartDetail> getFullCartListByUsername(String username);
    void removeCartByCartId(int cart_id);
    void updateCartByCartIdAndCount(int cart_id, int newCount);
}
