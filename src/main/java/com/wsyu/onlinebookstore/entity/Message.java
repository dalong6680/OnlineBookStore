package com.wsyu.onlinebookstore.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Date;

@Data
@AllArgsConstructor
public class Message {
    int message_id;
    int user_id;
    String content;
    String reply;
    Date message_date;
}
