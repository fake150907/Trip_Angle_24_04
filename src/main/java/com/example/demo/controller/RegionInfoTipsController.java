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

//여행지 기본 정보 및 꿀팁 화면 전이를 담당하는 컨트롤러 
@Controller
public class RegionInfoTipsController {
	
	// RegionInfoTipsService의 인스턴스를 자동으로 주입
	@Autowired
	private RegionInfoTipsService regionInfoTipsService;
	
	// RegionService의 인스턴스를 자동으로 주입
	@Autowired
	private RegionService regionService;

	// 도시의 id를 파라미터로 받아, 도시의 상세 정보를 반환하는 메서드
	@RequestMapping("/usr/regionInfoTips/infoTips")
	public String showinformation(HttpServletRequest req, Model model, @RequestParam(defaultValue = "0") int regionId) {
		
		// 요청 속성에서 Rq 객체를 가져옴
		Rq rq = (Rq) req.getAttribute("rq");

		// 주어진 regionId에 대한 RegionInfoTips 객체를 가져옴
		RegionInfoTips RegionInfoTips = regionInfoTipsService.getRegionInfoTipsId(regionId);
		
		// 주어진 regionId에 대한 Region 객체를 가져옴
		Region region = regionService.getRegionById(regionId);
		
		// 지역이 비어 있거나 null인지 확인
		if(Ut.isEmpty(region)) {
			// 지역이 존재하지 않으면, 메세지 출력
			return rq.historyBackOnView("존재하지 않는 도시번호입니다..");
		}
		
		// RegionInfoTips 객체를 모델에 추가
		model.addAttribute("RegionInfoTips", RegionInfoTips);
		
		// Region 객체를 모델에 추가
		model.addAttribute("region", region);

		return "/usr/regionInfoTips/infoTips";
	}
}