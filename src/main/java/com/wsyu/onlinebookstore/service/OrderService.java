package com.wsyu.onlinebookstore.service;

import com.wsyu.onlinebookstore.entity.Order;
import com.wsyu.onlinebookstore.entity.OrderDetail;

import java.util.List;

public interface OrderService {
    void addOrder(String username);
    
    List<OrderDetail> getOrderListByUsername(String username);
    List<OrderDetail> getAllOrderList();
}
