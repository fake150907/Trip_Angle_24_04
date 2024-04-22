package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TipInfoController {

	@RequestMapping("/usr/tipInfo/information")
	public String showinformation() {

		return "/usr/tipInfo/information";
	}
	@RequestMapping("/usr/tipInfo/honeyTips")
	public String showHoneyTips() {
		
		return "/usr/tipInfo/honeyTips";
	}
}