package com.example.demo.controller;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.RegionService;
import com.example.demo.service.TripScheduleService;
import com.example.demo.vo.Region;
import com.example.demo.vo.Rq;
import com.example.demo.vo.TripSchedule;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class TripScheduleController {

	@Autowired
	private TripScheduleService tripScheduleService;
	
	@Autowired
	private RegionService regionService;

	@RequestMapping("/usr/schedule/tripSchedule")
	public String showMyPlanList(Model model, HttpServletRequest req, @RequestParam(defaultValue = "0") int regionId) {
		
		// 요청 객체에서 Rq 속성을 가져온다.
		Rq rq = (Rq) req.getAttribute("rq");
		
		// regionId가 0이면 오류 메시지를 반환.
		if(regionId == 0) {
			return rq.historyBackOnView("잘못된 접근입니다. 도시 ID가 누락되었습니다.");   	
		}
		
		// regionId로부터 Region 객체를 가져온다.
		Region region = regionService.getRegionById(regionId);
		// 만약 region이 null이면 오류 메시지를 반환.
		if(region == null) {
			return rq.historyBackOnView("유효하지 않은 도시 ID입니다.");
		}
		
		// 모델에 regionId와 region 객체를 추가.
		model.addAttribute("regionId", regionId);
		model.addAttribute("region", region);
		
		return "/usr/schedule/tripSchedule";
	}

	// 여행 일정 티켓 예매를 처리.
	@RequestMapping("/usr/schedule/ticketing")
	public String tripSchedule(HttpServletRequest req, String title, String content, String checkInDate, String checkOutDate, @RequestParam(defaultValue = "0") int regionId, Model model) {

		Rq rq = (Rq) req.getAttribute("rq");
		
		// TripSchedule ID를 저장할 Map을 생성.
		Map<String, Object> map = new HashMap<>();
		
		// regionId가 0이면 잘못된 접근으로 간주하고 이전 페이지로 돌아감.
		if(regionId == 0) {
			return rq.historyBackOnView("잘못된 접근입니다. 도시 ID가 누락되었습니다.");    	
		}
		
		// regionId로부터 Region 객체를 가져옴.
		Region region = regionService.getRegionById(regionId);
		
		// 만약 region이 null이면 오류 메시지를 반환하고 이전 페이지로 이동.
		if(region == null) {
			return rq.historyBackOnView("유효하지 않은 도시 ID입니다.");
		}

		// TripSchedule 데이터를 삽입.
		tripScheduleService.insertTripSchedule(title, content, checkInDate,
				checkOutDate, rq.getLoginedMemberId(), regionId, map);
		
		// TripSchedule의 ID를 가져옴.
		Integer id = ((BigInteger) map.get("id")).intValue();
		model.addAttribute("id", id);
		
		// ID로 TripSchedule 객체를 가져옴.
		TripSchedule tripSchedule = tripScheduleService.getTripScheduleById(id);
		model.addAttribute("tripSchedule", tripSchedule);

		return "/usr/schedule/ticketing";
	}
}