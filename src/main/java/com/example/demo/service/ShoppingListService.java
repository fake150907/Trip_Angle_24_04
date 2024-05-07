package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.FashionRepository;
import com.example.demo.repository.ShoppingListRepository;
import com.example.demo.vo.ShoppingList;

@Service
public class ShoppingListService {
	
	@Autowired
	private ShoppingListRepository shoppingListnRepository;
	
	public List<ShoppingList> getShoppingListsFromScheduleId(int scheduleId) {
		// TODO Auto-generated method stub
		return shoppingListnRepository.getShoppingListsFromScheduleId(scheduleId);
	}

}
