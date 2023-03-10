package com.wsyu.onlinebookstore.service;

import com.wsyu.onlinebookstore.entity.Book;

import java.util.List;

public interface BookService {
    void addBook(String name, String writer, double price, int stock);
    
    List<Book> getAllBookList();
    
    void updateBook(int bookId, String name, String writer, double price, int stock);
    
    List<Book> getBookListByName(String name);
}
