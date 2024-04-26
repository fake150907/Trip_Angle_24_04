package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.util.crawlTest;

@Controller
public class UsrHomeController {

	@RequestMapping("/usr/home/main")
	public String showMain() {

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
