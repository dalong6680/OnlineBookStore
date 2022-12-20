package com.wsyu.onlinebookstore.mapper;

import com.wsyu.onlinebookstore.entity.Book;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BookMapper {
    @Select("SELECT * FROM book")
    List<Book> selectAllBookList();
    
    @Insert("INSERT INTO book (name, writer, price, stock) values (#{name}, #{writer}, #{price}, #{stock});")
    void insert(@Param("name") String name,
                @Param("writer") String writer,
                @Param("price") double price,
                @Param("stock") int stock);
    
    @Select("SELECT * FROM book WHERE name LIKE CONCAT('%',#{name},'%')")
    List<Book> selectBookListByName(@Param("name") String name);
    
    @Select("SELECT * FROM book WHERE book_id = #{book_id}")
    Book selectBookByBookId(@Param("book_id") int book_id);
    
    @Update("UPDATE book SET stock = stock - #{count} WHERE book_id = #{book_id}")
    void updateBookByBookId(@Param("count") int count, @Param("book_id") int book_id);
}
