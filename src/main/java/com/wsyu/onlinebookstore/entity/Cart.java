package com.wsyu.onlinebookstore.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Cart {
    int cart_id;
    int serial_no;
    int user_id;
    int book_id;
    int count;
}
