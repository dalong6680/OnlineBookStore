package com.wsyu.onlinebookstore.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class User {
    int user_id;
    String username;
    String password;
    int is_admin;
}
