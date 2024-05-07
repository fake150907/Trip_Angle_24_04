package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping("/usr/myPlan/myPlanList")
	public String showMyPlanList(HttpServletRequest req, Model model) {


		Rq rq = (Rq) req.getAttribute("rq");

		int memberId = rq.getLoginedMemberId();

		List<TripSchedule> tripSchedules = tripScheduleService.getForPrintTripSchedules(memberId);


		model.addAttribute("tripSchedules", tripSchedules);

		return "/usr/myPlan/myPlanList";
	}

	@RequestMapping("/usr/myPlan/myPlanDetail")
	public String showPlanDetail(HttpServletRequest req, Model model, int id, int regionId) {

		TripSchedule tripSchedule = tripScheduleService.getTripScheduleById(id);

		RegionInfoTips regionInfoTips = regionInfoTipsService.getRegionInfoTipsId(regionId);

		model.addAttribute("tripSchedule", tripSchedule);
		model.addAttribute("regionInfoTips", regionInfoTips);

		System.out.println(regionInfoTips);

		return "/usr/myPlan/myPlanDetail";
	}

	@RequestMapping("/usr/myPlan/placeDetail")
	public String showPlaceDetail() {

		return "/usr/myPlan/placeDetail";
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