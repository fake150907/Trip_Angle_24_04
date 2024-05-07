package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.crawling.PlaceInfoDto;
import com.example.demo.service.PlaceInfoService;
import com.example.demo.service.RegionInfoTipsService;
import com.example.demo.service.TripScheduleService;
import com.example.demo.vo.CalendarData;
import com.example.demo.vo.RegionInfoTips;
import com.example.demo.vo.Rq;
import com.example.demo.vo.TripSchedule;

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

		model.addAttribute("place", placeInfoDto);

		return "/usr/myPlan/placeDetail";
	}

	@RequestMapping("/usr/myPlan/myPlanDetail")
	public String showPlanDetail(HttpServletRequest req, Model model, int id, int regionId) {
		Rq rq = (Rq) req.getAttribute("rq");

		TripSchedule tripSchedule = tripScheduleService.getTripScheduleById(id);

		RegionInfoTips regionInfoTips = regionInfoTipsService.getRegionInfoTipsId(regionId);

		int tabId1 = 1; // 관광tabId
		int tabId2 = 2; // 맛집tabId
		int tabId3 = 3; // 쇼핑tabId

		List<PlaceInfoDto> placeInfoList1 = placeInfoService.getplaceInfoList(tabId1, regionId); // 관광placeList
		List<PlaceInfoDto> placeInfoList2 = placeInfoService.getplaceInfoList(tabId2, regionId); // 맛집placeList
		List<PlaceInfoDto> placeInfoList3 = placeInfoService.getplaceInfoList(tabId3, regionId); // 쇼핑placeList

		for (PlaceInfoDto placeInfoDto : placeInfoList1) {
			System.err.println("ImgUrl1" + placeInfoDto.getImageUrl1());
		}

		model.addAttribute("tripSchedule", tripSchedule);
		model.addAttribute("regionInfoTips", regionInfoTips);

		model.addAttribute("placeInfoList1", placeInfoList1);
		model.addAttribute("placeInfoList2", placeInfoList2);
		model.addAttribute("placeInfoList3", placeInfoList3);

		System.out.println(regionInfoTips);

		return "/usr/myPlan/myPlanDetail";
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