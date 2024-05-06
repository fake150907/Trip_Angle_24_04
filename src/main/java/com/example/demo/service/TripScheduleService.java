package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.TripScheduleRepository;
import com.example.demo.vo.TripSchedule;
import com.example.demo.vo.CalendarData;
import com.example.demo.vo.Member;
import com.example.demo.vo.RegionInfoTips;

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

		tripScheduleRepository.insertTripSchedule(title, content, checkInDate, checkOutDate, loginedMemberId, regionId);
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
}
