package com.wsyu.onlinebookstore.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Cart {
    String cart_id;
    int serial_no;
    String user_id;
    String book_id;
    int count;
}
