package com.example.demo.controller;

import java.math.BigInteger;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.crawling.PlaceInfoDto;
import com.example.demo.service.FashionService;
import com.example.demo.service.PlaceInfoService;
import com.example.demo.service.RegionInfoTipsService;
import com.example.demo.service.ShoppingListService;
import com.example.demo.service.TripScheduleService;
import com.example.demo.service.WeatherService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.CalendarData;
import com.example.demo.vo.Fashion;
import com.example.demo.vo.RegionInfoTips;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;
import com.example.demo.vo.ShoppingList;
import com.example.demo.vo.TripSchedule;
import com.example.demo.vo.Weather;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MyPlanController {

	@Autowired
	private Rq rq;
	@Autowired
	private TripScheduleService tripScheduleService;

	@Autowired
	private RegionInfoTipsService regionInfoTipsService;

	@Autowired
	private PlaceInfoService placeInfoService;

	@Autowired
	private WeatherService weatherService;

	@Autowired
	private FashionService fashionService;

	@Autowired
	private ShoppingListService shoppingListService;

	@RequestMapping("/usr/myPlan/myPlanList")
	public String showMyPlanList(HttpServletRequest req, Model model) {

		Rq rq = (Rq) req.getAttribute("rq");

		int memberId = rq.getLoginedMemberId();

		List<TripSchedule> tripSchedules = tripScheduleService.getForPrintTripSchedules(memberId);

		model.addAttribute("tripSchedules", tripSchedules);

		return "/usr/myPlan/myPlanList";
	}

	@RequestMapping("/usr/myPlan/placeDetail")
	public String showPlaceDetail(HttpServletRequest req, Model model, int id) {
		Rq rq = (Rq) req.getAttribute("rq");

		PlaceInfoDto placeInfoDto = placeInfoService.getPlaceInfo(id);

		System.err.println("getPhoneNumber : " + placeInfoDto.getPhoneNumber().length());

		model.addAttribute("place", placeInfoDto);

		return "/usr/myPlan/placeDetail";
	}

	@RequestMapping("/usr/myPlan/myPlanDetail")
	public String showPlanDetail(HttpServletRequest req, Model model, int id, int regionId) {
		Rq rq = (Rq) req.getAttribute("rq");

		TripSchedule tripSchedule = tripScheduleService.getTripScheduleById(id);

		if (tripSchedule == null) {
			return rq.historyBackOnView("존재하지 않는 일정 입니다.");
		}

		if (tripSchedule.getMemberId() != rq.getLoginedMemberId()) {
			return rq.historyBackOnView("일정의 작성자만 접근할 수 있습니다.");
		}

		if (tripSchedule.getStep() == 0) {
			model.addAttribute("id", id);
			model.addAttribute("tripSchedule", tripSchedule);

			return "/usr/schedule/ticketing";
		}

		if (tripSchedule.getStep() == 1) {
			return "redirect:/usr/styleRecommended/create?id=" + id;
		}

		RegionInfoTips regionInfoTips = regionInfoTipsService.getRegionInfoTipsId(regionId);

		int tabId1 = 1; // 관광tabId
		int tabId2 = 2; // 맛집tabId
		int tabId3 = 3; // 쇼핑tabId

		List<PlaceInfoDto> placeInfoList1 = placeInfoService.getplaceInfoList(tabId1, regionId); // 관광placeList
		List<PlaceInfoDto> placeInfoList2 = placeInfoService.getplaceInfoList(tabId2, regionId); // 맛집placeList
		List<PlaceInfoDto> placeInfoList3 = placeInfoService.getplaceInfoList(tabId3, regionId); // 쇼핑placeList

		List<Weather> weathers = weatherService.getWeathersFromScheduleId(id);
		List<Fashion> fashions = fashionService.getFashionsFromScheduleId(id);
		List<ShoppingList> shoppingLists = shoppingListService.getShoppingListsFromScheduleId(id);

		for (PlaceInfoDto placeInfoDto : placeInfoList1) {
			System.err.println("ImgUrl1" + placeInfoDto.getImageUrl1());
		}

		tripScheduleService.updateStepById(id);

		model.addAttribute("tripSchedule", tripSchedule);
		model.addAttribute("regionInfoTips", regionInfoTips);

		model.addAttribute("placeInfoList1", placeInfoList1);
		model.addAttribute("placeInfoList2", placeInfoList2);
		model.addAttribute("placeInfoList3", placeInfoList3);

		model.addAttribute("weathers", weathers);
		model.addAttribute("fashions", fashions);
		model.addAttribute("shoppingLists", shoppingLists);

		System.out.println(regionInfoTips);

		return "/usr/myPlan/myPlanDetail";
	}

	// 로그인 체크 -> 유무 체크 -> 권한 체크 -> 삭제
	@RequestMapping("/usr/myPlan/doDelete")
	@ResponseBody
	public String doDelete(HttpServletRequest req, int id) {
		Rq rq = (Rq) req.getAttribute("rq");

		TripSchedule tripSchedule = tripScheduleService.getTripScheduleById(id);

		if (tripSchedule == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 일정은 존재하지 않습니다", id));
		}

		if (tripSchedule.getMemberId() != rq.getLoginedMemberId()) {
			return Ut.jsHistoryBack("F-2", "일정의 작성자만 접근할 수 있습니다");
		}

		tripScheduleService.deleteMyPlanDetail(id);

		return Ut.jsReplace("S-1", "일정이 삭제되었습니다.", "/usr/myPlan/myPlanList");
	}

	@RequestMapping("/usr/myPlan/myPlanCalendar")
	public String showCalendar(HttpServletRequest req, Model model) {
		Rq rq = (Rq) req.getAttribute("rq");

		List<CalendarData> calendarDatas = tripScheduleService.getCalendarDatas(rq.getLoginedMemberId());

		model.addAttribute("calendarDatas", calendarDatas);

		return "/usr/myPlan/myPlanCalendar";
	}

	@RequestMapping("/usr/myPlan/saveCalendarData")
	@ResponseBody
	public String saveCalendarData(HttpServletRequest req, @RequestBody CalendarData calendarData) {
		Rq rq = (Rq) req.getAttribute("rq");

		try {
			tripScheduleService.addCalendarData(calendarData, rq.getLoginedMemberId());
			return "success";
		} catch (Exception e) {
			return "error";
		}
	}

	@RequestMapping("/usr/myPlan/deleteCalendarData")
	@ResponseBody
	public String deleteCalendarData(HttpServletRequest req, Integer calendarId) {
		Rq rq = (Rq) req.getAttribute("rq");

		try {
			tripScheduleService.deleteEvent(calendarId, rq.getLoginedMemberId());
			return "success";
		} catch (Exception e) {
			return "error";
		}
	}

}