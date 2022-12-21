package com.wsyu.onlinebookstore.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Date;
@Data
@AllArgsConstructor
public class MessageDetail {
    int message_id;
    String username;
    String content;
    String reply;
    Date message_date;
}
