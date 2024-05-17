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


//여행지 스타일링 추천 페이지와 관련된 처리를 담당하는 컨트롤러
@Controller
public class TripStyleRecommendedController {
	@Autowired
	private Rq rq;

	@Autowired
	private TripScheduleService tripScheduleService;
	
	@Autowired
	private TripStyleRecommendedService tripStyleRecommendedService;


	//스케쥴Id를 파라미터로 받아서, 스케쥴 객체와 스케쥴 Id를 스타일링 페이지에 전달하기 위한 메서드
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
		
		//이미 생성이 완료된 데이터 라면 디테일 페이지로 이동한다
		if (tripSchedule.getStep() == 0) {
			tripScheduleService.updateStepById(id);
		}
		
		//이미 생성이 완료된 일정이 라면 디테일 페이지로 이동한다
		if (tripSchedule.getStep() == 2) {
			return "redirect:/usr/myPlan/myPlanDetail?id="+id+"&regionId="+tripSchedule.getRegionId();
		}
		
		
		System.err.println(tripSchedule);


		model.addAttribute("tripSchedule", tripSchedule);
		model.addAttribute("id", id);

		return "usr/styleRecommended/create";
	}
	

	//스케쥴Id와 날씨 추천 받은 패션 데이터, 추천 받은 쇼핑리스트 데이터를 파라미터로 받아서, 해당 데이터들을 db에 저장하는 컨트롤러
	@PostMapping("/usr/styleRecommended/doCreate")
	public String styleRecommendedDoCreate(String weatherDatas, String fashionDatas, String shoppingListDatas, @RequestParam(defaultValue = "0") Integer id, HttpServletRequest req) {
		
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
		

		
		
		if (tripSchedule.getMemberId() != rq.getLoginedMemberId()) {
			return rq.historyBackOnView("일정의 작성자만 접근할 수 있습니다.");
		}
		
		//스타일링 추천 페이지를 거치지 않고 넘어온 경우 스타일링 추천 페이지로 전이한다.
		if (tripSchedule.getStep() == 0) {
			return "redirect:/usr/styleRecommended/create?id="+id;
		}
		
		//이미 생성이 완료된 일정이 라면 디테일 페이지로 이동한다
		if (tripSchedule.getStep() == 2) {
			return "redirect:/usr/myPlan/myPlanDetail?id="+id+"&regionId="+tripSchedule.getRegionId();
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
        

		//정상적인 순서로 실행되어 메서드에 들어온 경우 step을 1 증가시킨다.
		if (tripSchedule.getStep() == 1) {
			tripScheduleService.updateStepById(id);
		}


        
        tripStyleRecommendedService.writeStyleRecommendedDatas(weathers, fashions, shoppingLists);
        

		return "redirect:/usr/myPlan/myPlanDetail?id="+id+"&regionId="+tripSchedule.getRegionId();
	}

	

}
