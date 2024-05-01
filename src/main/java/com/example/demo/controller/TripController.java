package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TripController {

	@RequestMapping("/usr/trip/reviewList")
	public String showList() {

		return "/usr/trip/reviewList";
	}
}