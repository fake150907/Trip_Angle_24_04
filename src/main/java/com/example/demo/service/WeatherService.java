package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.WeatherRepository;
import com.example.demo.vo.Weather;

@Service
public class WeatherService {
	
	@Autowired
	private WeatherRepository weatherRepository; // WeatherRepository 객체 주입

	// 생성자를 통한 의존성 주입
	public WeatherService(WeatherRepository weatherRepository) {
		this.weatherRepository = weatherRepository;
	}

	// 일정 ID를 기반으로 해당 일정의 날씨 목록을 가져오는 메서드
	public List<Weather> getWeathersFromScheduleId(int scheduleId) {
		// WeatherRepository를 통해 일정 ID를 기반으로 날씨 목록을 조회하고 반환
		return weatherRepository.getWeathersFromScheduleId(scheduleId);
	}

}
