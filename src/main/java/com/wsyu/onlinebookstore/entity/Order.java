package com.wsyu.onlinebookstore.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Date;

@Data
@AllArgsConstructor
public class Order {
    int order_id;
    int user_id;
    int book_id;
    int count;
    Date order_date;
}
