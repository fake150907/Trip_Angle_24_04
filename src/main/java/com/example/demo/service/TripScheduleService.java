package com.example.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.TripScheduleRepository;
import com.example.demo.vo.CalendarData;
import com.example.demo.vo.TripSchedule;

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
		
		Map<String, Object> map = new HashMap<>();
		
		tripScheduleRepository.insertTripSchedule(title, content, checkInDate, checkOutDate, loginedMemberId, regionId, map);
	
	}

	public void addCalendarData(CalendarData calendarData, int loginedMemberId) {
		tripScheduleRepository.addCalendarData(calendarData, loginedMemberId);
	}

	public void deleteEvent(Integer calendarDataId, int loginedMemberId) {
		tripScheduleRepository.deleteEvent(calendarDataId, loginedMemberId);
	}

	public List<CalendarData> getCalendarDatas(int loginedMemberId) {

		return tripScheduleRepository.getCalendarDatas(loginedMemberId);
	}

	public List<TripSchedule> getForPrintTripSchedules(int memberId) {
		
		return tripScheduleRepository.getForPrintTripSchedules(memberId);
	}
}
