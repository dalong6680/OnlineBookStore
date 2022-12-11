package com.wsyu.onlinebookstore.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Date;

@Data
@AllArgsConstructor
public class Message {
    String message_id;
    String user_id;
    String content;
    String status;
    Date message_date;
}
