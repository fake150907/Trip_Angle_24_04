package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.TravelScheduleService;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class TravelScheduleController {

	@Autowired
	private TravelScheduleService travelScheduleService;

	@RequestMapping("/usr/schedule/travelSchedule")
	public String showMyPlanList() {

		return "/usr/schedule/travelSchedule";
	}

	@RequestMapping("/usr/schedule/ticketing")
	// 파라미터로 도시 id 받아야함
	public String travelSchedule(HttpServletRequest req, String title, String content, String checkInDate, String checkOutDate, @RequestParam(defaultValue = "1") int regionId) {

		Rq rq = (Rq) req.getAttribute("rq");

		travelScheduleService.insertTravelSchedule(title, content, checkInDate,
				checkOutDate, rq.getLoginedMemberId(), regionId);

		return "/usr/schedule/ticketing";
	}
}