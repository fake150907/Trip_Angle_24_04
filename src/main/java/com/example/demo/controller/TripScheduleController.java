package com.example.demo.controller;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.TripScheduleService;
import com.example.demo.vo.Rq;
import com.example.demo.vo.TripSchedule;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class TripScheduleController {

	@Autowired
	private TripScheduleService tripScheduleService;

	@RequestMapping("/usr/schedule/tripSchedule")
	public String showMyPlanList() {

		return "/usr/schedule/tripSchedule";
	}

	@RequestMapping("/usr/schedule/ticketing")
	// 파라미터로 도시 id 받아야함
	public String tripSchedule(HttpServletRequest req, String title, String content, String checkInDate, String checkOutDate, @RequestParam(defaultValue = "1") int regionId, Model model) {

		Rq rq = (Rq) req.getAttribute("rq");
		Map<String, Object> map = new HashMap<>();

		tripScheduleService.insertTripSchedule(title, content, checkInDate,
				checkOutDate, rq.getLoginedMemberId(), regionId, map);
		
		Integer id = ((BigInteger)map.get("id")).intValue();
		model.addAttribute("id", id);
		
		TripSchedule tripSchedule = tripScheduleService.getTripScheduleById(id);
		model.addAttribute("tripSchedule", tripSchedule);
		

		return "/usr/schedule/ticketing";
	}
}