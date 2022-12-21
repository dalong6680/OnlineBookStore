package com.wsyu.onlinebookstore.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CartDetail {
    int cart_id;
    int serial_no;
    String name;
    String writer;
    double price;
    int count;
}
