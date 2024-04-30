package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class travelScheduleConteroller {

	@RequestMapping("/usr/schedule/travelSchedule")
	public String showMyPlanList() {

		return "/usr/schedule/travelSchedule";
	}

}