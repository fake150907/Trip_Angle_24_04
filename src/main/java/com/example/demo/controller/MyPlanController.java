package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPlanController {

	@RequestMapping("/usr/myPlan/myPlanList")
	public String showMyPlanList() {

		return "/usr/myPlan/myPlanList";
	}
	
	
	@RequestMapping("/usr/myPlan/placeDetail")
	public String showPlaceDetail() {

		return "/usr/myPlan/placeDetail";
	}
	
	
	@RequestMapping("/usr/myPlan/myPlanDetail")
	public String showDetail() {

		return "/usr/myPlan/myPlanDetail";
	}
	@RequestMapping("/usr/myPlan/myPlanCalendar")
	public String showCalendar() {
		
		return "/usr/myPlan/myPlanCalendar";
	}
	
	

}