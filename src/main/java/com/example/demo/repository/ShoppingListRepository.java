package com.example.demo.repository;

import java.util.List;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.Fashion;
import com.example.demo.vo.ShoppingList;
import com.example.demo.vo.Weather;


@Mapper
public interface ShoppingListRepository {

	@Insert({
	    "<script>",
	    "INSERT INTO ShoppingList (regDate, updateDate, `name`, description, imageUrl, scheduleId) VALUES ",
	    "<foreach collection='shoppingLists' item='shoppingItem' separator=','>",
	    "(NOW(), NOW(), #{shoppingItem.name}, #{shoppingItem.description}, #{shoppingItem.imageUrl}, #{shoppingItem.scheduleId})",
	    "</foreach>",
	    "</script>"
	})
	public void writeShoppingListList(List<ShoppingList> shoppingLists);
}
