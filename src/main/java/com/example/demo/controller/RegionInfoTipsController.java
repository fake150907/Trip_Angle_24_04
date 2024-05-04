package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.RegionInfoTipsService;
import com.example.demo.service.RegionService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Region;
import com.example.demo.vo.Rq;
import com.example.demo.vo.RegionInfoTips;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class RegionInfoTipsController {
	
	@Autowired
	private RegionInfoTipsService regionInfoTipsService;
	@Autowired
	private RegionService regionService;

	@RequestMapping("/usr/regionInfoTips/infoTips")
	public String showinformation(HttpServletRequest req, Model model, @RequestParam(defaultValue = "0") int regionId) {
		 Rq rq = (Rq) req.getAttribute("rq");

		RegionInfoTips RegionInfoTips = regionInfoTipsService.getRegionInfoTipsId(regionId);
		Region region = regionService.getRegionById(regionId);
		
		if(Ut.isEmpty(region)) {
			return rq.historyBackOnView("존재하지 않는 도시번호입니다..");
		}
		
		model.addAttribute("RegionInfoTips", RegionInfoTips);
		model.addAttribute("region", region);

		return "/usr/regionInfoTips/infoTips";
	}
}