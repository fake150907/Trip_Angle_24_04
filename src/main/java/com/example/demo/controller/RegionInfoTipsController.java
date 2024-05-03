package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.RegionInfoTipsService;
import com.example.demo.vo.RegionInfoTips;

@Controller
public class RegionInfoTipsController {
	
	@Autowired
	private RegionInfoTipsService regionInfoTipsService;

	@RequestMapping("/usr/regionInfoTips/infoTips")
	public String showinformation(Model model, @RequestParam(defaultValue = "0") int regionId) {

		RegionInfoTips RegionInfoTips = regionInfoTipsService.getRegionInfoTipsId(regionId);
		
		model.addAttribute("RegionInfoTips", RegionInfoTips);

		return "/usr/regionInfoTips/infoTips";
	}
}