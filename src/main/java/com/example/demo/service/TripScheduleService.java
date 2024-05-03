package com.example.demo.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.TripScheduleRepository;
import com.example.demo.vo.TripSchedule;
import com.example.demo.vo.regionInfoTips;

@Service
public class TripScheduleService {

	@Autowired
	private TripScheduleRepository tripScheduleRepository;

	public TripScheduleService(TripScheduleRepository tripScheduleRepository) {
		this.tripScheduleRepository = tripScheduleRepository;
		
	}
	
	public TripSchedule getTripScheduleById(int travleScheduleId) {

		return tripScheduleRepository.getTripScheduleById(travleScheduleId);
	}

	public void insertTripSchedule(String title, String content, String checkInDate, String checkOutDate,
			int loginedMemberId, int regionId) {

		tripScheduleRepository.insertTripSchedule(title, content, checkInDate, checkOutDate,
				loginedMemberId, regionId);
	}
}
