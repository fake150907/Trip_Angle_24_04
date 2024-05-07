package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.WeatherRepository;
import com.example.demo.vo.Weather;

@Service
public class WeatherService {
	@Autowired
	private WeatherRepository weatherRepository;

	public WeatherService(WeatherRepository weatherRepository) {
		this.weatherRepository = weatherRepository;
	}


	public List<Weather> getWeathersFromScheduleId(int scheduleId) {
		// TODO Auto-generated method stub
		return weatherRepository.getWeathersFromScheduleId(scheduleId);
	}

}
