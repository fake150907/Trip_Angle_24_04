package com.example.demo.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.TravelScheduleRepository;
import com.example.demo.vo.TravelSchedule;

@Service
public class TravelScheduleService {

	@Autowired
	private TravelScheduleRepository travelScheduleRepository;

	public TravelScheduleService(TravelScheduleRepository travelScheduleRepository) {
		this.travelScheduleRepository = travelScheduleRepository;
		
	}
	
	public TravelSchedule getTravelScheduleById(int travleScheduleId) {

		return travelScheduleRepository.getTravelScheduleById(travleScheduleId);
	}

}
