package com.wsyu.onlinebookstore.mapper;

import com.wsyu.onlinebookstore.entity.Book;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BookMapper {
    @Select("SELECT * FROM book")
    List<Book> selectList();
    
    @Insert("INSERT INTO book (name, writer, price, stock) values (#{name}, #{writer}, #{price}, #{stock});")
    void insert(@Param("name") String name,
                @Param("writer") String writer,
                @Param("price") double price,
                @Param("stock") int stock);
    
    @Select("SELECT * FROM book WHERE name LIKE CONCAT('%',#{name},'%')")
    List<Book> selectBookByName(@Param("name") String name);
    
    
}
