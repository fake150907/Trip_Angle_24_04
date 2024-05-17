package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.FashionRepository;
import com.example.demo.repository.ShoppingListRepository;
import com.example.demo.repository.WeatherRepository;
import com.example.demo.vo.Fashion;
import com.example.demo.vo.ShoppingList;
import com.example.demo.vo.Weather;

@Service
public class TripStyleRecommendedService {
	
	@Autowired
	private WeatherRepository weatherRepository; // WeatherRepository 객체 주입
	
	@Autowired
	private FashionRepository fashionRepository; // FashionRepository 객체 주입
	
	@Autowired
	private ShoppingListRepository shoppingListRepsitory; // ShoppingListRepository 객체 주입

	// 생성자를 통한 의존성 주입
	public TripStyleRecommendedService(WeatherRepository weatherRepository, FashionRepository fashionRepository,
			ShoppingListRepository shoppingListRepsitory) {
		this.weatherRepository = weatherRepository;
		this.fashionRepository = fashionRepository;
		this.shoppingListRepsitory = shoppingListRepsitory;
	}

	// 날씨, 패션, 쇼핑 목록 데이터를 저장하는 메서드
	public void writeStyleRecommendedDatas(List<Weather> weathers, List<Fashion> fashions,
			List<ShoppingList> shoppingLists) {
		// 날씨 데이터를 저장하는 메서드 호출
		weatherRepository.writeWeatherList(weathers);
		// 패션 데이터를 저장하는 메서드 호출
		fashionRepository.writeFashionList(fashions);
		// 쇼핑 목록 데이터를 저장하는 메서드 호출
		shoppingListRepsitory.writeShoppingListList(shoppingLists);
	}
}
