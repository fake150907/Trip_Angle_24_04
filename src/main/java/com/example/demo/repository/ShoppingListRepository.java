package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.ShoppingList;

@Mapper
public interface ShoppingListRepository {

    // 쇼핑 목록을 일괄 등록하는 메서드
    @Insert({
        "<script>",
        "INSERT INTO ShoppingList (regDate, updateDate, `name`, description, imageUrl, scheduleId) VALUES ",
        "<foreach collection='shoppingLists' item='shoppingItem' separator=','>",
        "(NOW(), NOW(), #{shoppingItem.name}, #{shoppingItem.description}, #{shoppingItem.imageUrl}, #{shoppingItem.scheduleId})",
        "</foreach>",
        "</script>"
    })
    public void writeShoppingListList(List<ShoppingList> shoppingLists);

    // 특정 일정(scheduleId)에 속하는 쇼핑 목록을 조회하는 메서드
    @Select(
            """
            SELECT * FROM ShoppingList WHERE scheduleId = ${scheduleId}    
            """)
    public List<ShoppingList> getShoppingListsFromScheduleId(int scheduleId);
}