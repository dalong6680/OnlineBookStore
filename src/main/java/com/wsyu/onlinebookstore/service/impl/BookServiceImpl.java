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
    public List<Book> getAllBookList() {
        return bookMapper.selectAllBookList();
    }
    
    @Override
    public List<Book> getBookListByName(String name) {
        return bookMapper.selectBookListByName(name);
    }
}
