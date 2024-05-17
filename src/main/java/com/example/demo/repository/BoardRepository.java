package com.example.demo.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Board;

@Mapper
public interface BoardRepository {

    // boardId에 해당하는 게시글을 모두 조회하는 메서드
    @Select("""
            SELECT *
            FROM board
            WHERE id = #{boardId}
            AND delStatus = 0;
            """)
    public Board getBoardById(int boardId);

}