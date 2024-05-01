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
	private WeatherRepository weatherRepository;
	
	@Autowired
	private FashionRepository fashionRepository;
	
	@Autowired
	private ShoppingListRepository shoppingListRepsitory;

	public TripStyleRecommendedService(WeatherRepository weatherRepository, FashionRepository fashionRepository,
			ShoppingListRepository shoppingListRepsitory) {
		this.weatherRepository = weatherRepository;
		this.fashionRepository = fashionRepository;
		this.shoppingListRepsitory = shoppingListRepsitory;
	}
	


	public void writeStyleRecommendedDatas(List<Weather> weathers, List<Fashion> fashions,
			List<ShoppingList> shoppingLists) {
		weatherRepository.writeWeatherList(weathers);
		fashionRepository.writeFashionList(fashions);
		shoppingListRepsitory.writeShoppingListList(shoppingLists);
		
	}
	
}
