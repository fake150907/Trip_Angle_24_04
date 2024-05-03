package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.RegionInfoTipsService;
import com.example.demo.service.TripScheduleService;
import com.example.demo.vo.RegionInfoTips;
import com.example.demo.vo.TripSchedule;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MyPlanController {

	@Autowired
	private TripScheduleService tripScheduleService;
	
	@Autowired
	private RegionInfoTipsService regionInfoTipsService;

	@RequestMapping("/usr/myPlan/myPlanList")
	public String showMyPlanList() {

		return "/usr/myPlan/myPlanList";
	}

	@RequestMapping("/usr/myPlan/placeDetail")
	public String showPlaceDetail() {

		return "/usr/myPlan/placeDetail";
	}

	@RequestMapping("/usr/myPlan/myPlanDetail")
	public String showPlanDetail(HttpServletRequest req, Model model, int id, int regionId) {
		
		TripSchedule tripSchedule = tripScheduleService.getTripScheduleById(id);
		
		RegionInfoTips regionInfoTips = regionInfoTipsService.getRegionInfoTipsId(regionId);
		
		model.addAttribute("tripSchedule", tripSchedule);
		model.addAttribute("regionInfoTips", regionInfoTips);
		
		System.out.println(regionInfoTips);

		return "/usr/myPlan/myPlanDetail";
	}

	@RequestMapping("/usr/myPlan/myPlanCalendar")
	public String showCalendar() {

		return "/usr/myPlan/myPlanCalendar";
	}

}