package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.FashionRepository;
import com.example.demo.repository.WeatherRepository;
import com.example.demo.vo.Fashion;
import com.example.demo.vo.Weather;

@Service
public class FashionService {
	@Autowired
	private FashionRepository fashionRepository;

	public FashionService(FashionRepository fashionRepository) {
		this.fashionRepository = fashionRepository;
	}

	public List<Fashion> getFashionsFromScheduleId(int scheduleId) {
		// TODO Auto-generated method stub
		return fashionRepository.getFashionsFromScheduleId(scheduleId);
	}

}
