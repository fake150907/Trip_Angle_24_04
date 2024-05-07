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
		
		Rq rq = (Rq) req.getAttribute("rq");
		
		
		if(regionId==0) {
			return rq.historyBackOnView("잘못된 접근입니다. 도시Id가 없습니다.");   	
		}
		
		Region region = regionService.getRegionById(regionId);
		if(region == null) {
			return rq.historyBackOnView("존재하지 않는 도시Id입니다.");
		}
		
		model.addAttribute("regionId", regionId);
		model.addAttribute("region", region);
		
		return "/usr/schedule/tripSchedule";
	}

	@RequestMapping("/usr/schedule/ticketing")
	public String tripSchedule(HttpServletRequest req, String title, String content, String checkInDate, String checkOutDate, @RequestParam(defaultValue = "0") int regionId, Model model) {
		


		Rq rq = (Rq) req.getAttribute("rq");
		
		Map<String, Object> map = new HashMap<>();
		
		if(regionId==0) {
			return rq.historyBackOnView("잘못된 접근입니다. 도시Id가 없습니다.");    	
		}
		Region region = regionService.getRegionById(regionId);
		if(region == null) {
			return rq.historyBackOnView("존재하지 않는 도시Id입니다.");
		}

		tripScheduleService.insertTripSchedule(title, content, checkInDate,
				checkOutDate, rq.getLoginedMemberId(), regionId, map);
		
		Integer id = ((BigInteger)map.get("id")).intValue();
		model.addAttribute("id", id);
		
		TripSchedule tripSchedule = tripScheduleService.getTripScheduleById(id);
		model.addAttribute("tripSchedule", tripSchedule);
		

		return "/usr/schedule/ticketing";
	}
}