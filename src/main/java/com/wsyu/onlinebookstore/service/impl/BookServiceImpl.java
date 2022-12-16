package com.wsyu.onlinebookstore.service.impl;

import com.wsyu.onlinebookstore.entity.Book;
import com.wsyu.onlinebookstore.mapper.BookMapper;
import com.wsyu.onlinebookstore.service.BookService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    @Resource
    BookMapper bookMapper;
    
    @Override
    public void addBook(String name, String writer, double price, int stock) {
        bookMapper.insert(name, writer, price, stock);
    }
    
    @Override
    public List<Book> getAllBooks() {
        return bookMapper.selectList();
    }
    
    @Override
    public List<Book> getBookByName(String name) {
        return bookMapper.selectBookByName(name);
    }
}
