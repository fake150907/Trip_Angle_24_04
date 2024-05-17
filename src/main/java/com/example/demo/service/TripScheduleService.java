package com.example.demo.service;

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

	// TripScheduleRepository를 주입하는 생성자
	public TripScheduleService(TripScheduleRepository tripScheduleRepository) {
		this.tripScheduleRepository = tripScheduleRepository;
	}

	// ID로 TripSchedule을 가져오는 메서드
	public TripSchedule getTripScheduleById(int id) {
		return tripScheduleRepository.getTripScheduleById(id);
	}

	// 여행 일정을 추가하는 메서드
	public void insertTripSchedule(String title, String content, String checkInDate, String checkOutDate,
			int loginedMemberId, int regionId, Map<String, Object> map) {
		tripScheduleRepository.insertTripSchedule(title, content, checkInDate, checkOutDate, loginedMemberId, regionId, map);
	}

	// 캘린더 데이터를 추가하는 메서드
	public void addCalendarData(CalendarData calendarData, int loginedMemberId) {
		tripScheduleRepository.addCalendarData(calendarData, loginedMemberId);
	}

	// 이벤트를 삭제하는 메서드
	public void deleteEvent(Integer calendarDataId, int loginedMemberId) {
		tripScheduleRepository.deleteEvent(calendarDataId, loginedMemberId);
	}

	// 캘린더 데이터 리스트를 가져오는 메서드
	public List<CalendarData> getCalendarDatas(int loginedMemberId) {
		return tripScheduleRepository.getCalendarDatas(loginedMemberId);
	}

	// 회원별 여행 일정 리스트를 가져오는 메서드
	public List<TripSchedule> getForPrintTripSchedules(int memberId) {
		return tripScheduleRepository.getForPrintTripSchedules(memberId);
	}

	// ID로 여행 일정의 step을 업데이트하는 메서드
	public void updateStepById(int id) {
		tripScheduleRepository.updateStepById(id);
	}

	// 여행 일정 상세를 삭제하는 메서드
	public void deleteMyPlanDetail(int id) {
		tripScheduleRepository.deleteMyPlanDetail(id);
	}

}