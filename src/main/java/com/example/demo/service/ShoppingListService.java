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
	private ShoppingListRepository shoppingListnRepository; // ShoppingListRepository 객체 주입

	// scheduleId를 기준으로 쇼핑 목록을 가져오는 메서드
	public List<ShoppingList> getShoppingListsFromScheduleId(int scheduleId) {
		// ShoppingListRepository를 통해 scheduleId를 기준으로 쇼핑 목록 조회
		return shoppingListnRepository.getShoppingListsFromScheduleId(scheduleId);
	}

}
