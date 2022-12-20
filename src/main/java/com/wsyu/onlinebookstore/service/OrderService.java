package com.wsyu.onlinebookstore.service;

import com.wsyu.onlinebookstore.entity.Order;

import java.util.List;

public interface OrderService {
    void addOrder(String username);
    
    List<Order> getOrderListByUsername(String username);
}
