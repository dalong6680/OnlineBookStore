package com.wsyu.onlinebookstore.service;

import com.wsyu.onlinebookstore.entity.Cart;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public interface CartService {
    void add(String bookName, int count, String username);
    void addBatch(HashMap<String, Integer> bookCountMap, String username);
    
    List<Cart> getCartByUsername(String username);
    void removeCartByCartId(int cart_id);
}
