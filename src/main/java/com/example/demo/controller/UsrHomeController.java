package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.RegionService;
import com.example.demo.util.crawlTest;

@Controller
public class UsrHomeController {
	@Autowired
	RegionService regionService;
	
	

	public UsrHomeController(RegionService regionService) {
		this.regionService = regionService;
	}

	@RequestMapping("/usr/home/main")
	public String showMain(Model model) {
		model.addAttribute("regions", regionService.getRegionList());

		return "/usr/home/main";
	}

	@RequestMapping("/")
	public String showRoot() {

		return "redirect:/usr/home/main";
	}

	@RequestMapping("/usr/crawl")
	public String doCrawl() {

		crawlTest.crawl();

		return "redirect:/usr/home/main";
	}
	
	
	@RequestMapping("/usr/home/writeEmailToYunlin")
	public String writeEmailToYunlin() {

		return "/usr/home/writeEmailToYunlin";
	}
	
	@RequestMapping("/usr/home/writeEmailToGayeon")
	public String writeEmailToGayeon() {

		return "/usr/home/writeEmailToGayeon";
	}
	
	@RequestMapping("/usr/home/writeEmailToGyusub")
	public String writeEmailToGyusub() {

		return "/usr/home/writeEmailToGyusub";
	}
	
	@RequestMapping("/usr/home/writeEmailToMyeongwon")
	public String writeEmailToMyeongwon() {

		return "/usr/home/writeEmailToMyeongwon";
	}
	
	
}
