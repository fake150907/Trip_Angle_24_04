package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.TripScheduleService;
import com.example.demo.service.TripStyleRecommendedService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Fashion;
import com.example.demo.vo.Rq;
import com.example.demo.vo.ShoppingList;
import com.example.demo.vo.TripSchedule;
import com.example.demo.vo.Weather;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class TripStyleRecommendedController {
	@Autowired
	private Rq rq;

	@Autowired
	private TripScheduleService tripScheduleService;
	
	@Autowired
	private TripStyleRecommendedService tripStyleRecommendedService;

	// 액션 메서드
	
	@GetMapping("/usr/styleRecommended/create")
	public String styleRecommended(HttpServletRequest req, Model model, @RequestParam(defaultValue = "0") Integer id) {

		Rq rq = (Rq) req.getAttribute("rq");
		
		if(id==0) {
			return rq.historyBackOnView("id를 입력해주세요");    	
		}
		
		TripSchedule tripSchedule = tripScheduleService.getTripScheduleById(id);
		

		if (tripSchedule == null) {
			return rq.historyBackOnView("존재하지 않는 일정 입니다.");
		}
		
		if (tripSchedule.getMemberId() != rq.getLoginedMemberId()) {
			return rq.historyBackOnView("일정의 작성자만 접근할 수 있습니다.");
		}
		
		if (tripSchedule.getStep() != 0) {
			return rq.historyBackOnView("잘못된 접근 입니다. 일정의 진행사항과 요청이 일치하지 않습니다.");
		}
		
		tripScheduleService.updateStepById(id);
		
//		if(rq.getLoginedMemberId() != tripSchedule.getMemberId()) {
//			return rq.historyBackOnView("로그인한 사용자가 일정 작성자가 아닙니다.");
//		}
		System.err.println(tripSchedule);


		model.addAttribute("tripSchedule", tripSchedule);
		model.addAttribute("id", id);

		return "usr/styleRecommended/create";
	}
	
	
	@PostMapping("/usr/styleRecommended/doCreate")
	public String styleRecommendedDoCreate(String weatherDatas, String fashionDatas, String shoppingListDatas, @RequestParam(defaultValue = "0") Integer id, HttpServletRequest req) {
		//todo 일정id가 일치하는지 확인 로직 추가 필요. (로그인기능 문제 없는거 확인 후 추가할 것)
		
		ObjectMapper mapper = new ObjectMapper();
		List<Weather> weathers = null;
		List<Fashion> fashions = null;
		List<ShoppingList> shoppingLists = null;
		
		TripSchedule tripSchedule = tripScheduleService.getTripScheduleById(id);
		
		if(id==0) {
			return rq.historyBackOnView("잘못된 접근입니다. 여행 일정 Id가 없습니다.");    	
		}
		
		if (tripSchedule == null) {
			return rq.historyBackOnView("존재하지 않는 일정 입니다.");
		}
		
		
		
		
		if (tripSchedule.getStep() != 1) {
			return rq.historyBackOnView("잘못된 접근 입니다. 일정의 진행사항과 요청이 일치하지 않습니다.");
		}
		
		if (tripSchedule.getMemberId() != rq.getLoginedMemberId()) {
			return rq.historyBackOnView("일정의 작성자만 접근할 수 있습니다.");
		}
		
		
        try {
        	 weathers = mapper.readValue(weatherDatas, new TypeReference<List<Weather>>(){});
        	 for(Weather weather: weathers) {
        		 weather.setScheduleId(id);
        	 }
             
        } catch (Exception e) {
        	e.printStackTrace();
        	return rq.historyBackOnView("잘못된 날씨 데이터 형식입니다.");
        	
        	
        }
        
        try {
        	fashions = mapper.readValue(fashionDatas, new TypeReference<List<Fashion>>(){});
	       	 for(Fashion fashion: fashions) {
	       		fashion.setScheduleId(id);
	    	 }  
        } catch (Exception e) {
        	e.printStackTrace();
        	return rq.historyBackOnView("잘못된 패션 데이터 형식입니다.");
        	
        }   
        
        try {
        	shoppingLists = mapper.readValue(shoppingListDatas, new TypeReference<List<ShoppingList>>(){});
	       	 for(ShoppingList shoppingItem: shoppingLists) {
	       		shoppingItem.setScheduleId(id);
	    	 }  
        } catch (Exception e) {
        	e.printStackTrace();
        	return rq.historyBackOnView("잘못된 쇼핑리스트 데이터 형식입니다.");
        	
        }
        
		
        
        
        tripStyleRecommendedService.writeStyleRecommendedDatas(weathers, fashions, shoppingLists);
        
        tripScheduleService.updateStepById(id);


        
        //추후 상세 정보 보기로 넘겨주기.
//		return Ut.jsReplace(loginedMemberCanModifyRd.getResultCode(), loginedMemberCanModifyRd.getMsg(),
//				"../article/detail?id=" + id);

		return "redirect:/usr/myPlan/myPlanDetail?id="+id+"&regionId="+tripSchedule.getRegionId();
	}

	

}
