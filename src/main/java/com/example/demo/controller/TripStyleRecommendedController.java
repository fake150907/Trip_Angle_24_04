package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.TripScheduleService;
import com.example.demo.service.TripStyleRecommendedService;
import com.example.demo.vo.Fashion;
import com.example.demo.vo.Rq;
import com.example.demo.vo.ShoppingList;
import com.example.demo.vo.TripSchedule;
import com.example.demo.vo.Weather;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;

// 여행지 스타일링 추천 페이지와 관련된 처리를 담당하는 컨트롤러
@Controller
public class TripStyleRecommendedController {
    @Autowired
    private Rq rq;

    @Autowired
    private TripScheduleService tripScheduleService;

    @Autowired
    private TripStyleRecommendedService tripStyleRecommendedService;

    // 스케쥴Id를 파라미터로 받아서, 스케쥴 객체와 스케쥴 Id를 스타일링 페이지에 전달하기 위한 메서드
    @GetMapping("/usr/styleRecommended/create")
    public String styleRecommended(HttpServletRequest req, Model model, @RequestParam(defaultValue = "0") Integer id) {
        Rq rq = (Rq) req.getAttribute("rq");

        // 스케쥴 Id가 0인 경우, 적절한 메시지와 함께 이전 페이지로 이동
        if (id == 0) {
            return rq.historyBackOnView("일정 Id를 입력해주세요");
        }

        // 입력받은 스케쥴 Id로 여행 일정 정보를 조회
        TripSchedule tripSchedule = tripScheduleService.getTripScheduleById(id);

        // 조회된 여행 일정이 없는 경우, 적절한 메시지와 함께 이전 페이지로 이동
        if (tripSchedule == null) {
            return rq.historyBackOnView("존재하지 않는 일정입니다.");
        }

        // 현재 로그인한 회원과 일정의 작성자가 다른 경우, 적절한 메시지와 함께 이전 페이지로 이동
        if (tripSchedule.getMemberId() != rq.getLoginedMemberId()) {
            return rq.historyBackOnView("일정의 작성자만 접근할 수 있습니다.");
        }

        // 이미 생성이 완료된 데이터인 경우, 일정의 step을 증가시키고 디테일 페이지로 이동
        if (tripSchedule.getStep() == 0) {
            tripScheduleService.updateStepById(id);
        } else if (tripSchedule.getStep() == 2) {
            return "redirect:/usr/myPlan/myPlanDetail?id=" + id + "&regionId=" + tripSchedule.getRegionId();
        }

        // 여행 일정과 스케쥴 Id를 뷰에 전달
        model.addAttribute("tripSchedule", tripSchedule);
        model.addAttribute("id", id);

        // 여행지 스타일링 추천 페이지로 이동
        return "usr/styleRecommended/create";
    }

    // 스케쥴Id와 날씨 추천 받은 패션 데이터, 추천 받은 쇼핑리스트 데이터를 파라미터로 받아서, 해당 데이터들을 db에 저장하는 컨트롤러
    @PostMapping("/usr/styleRecommended/doCreate")
    public String styleRecommendedDoCreate(String weatherDatas, String fashionDatas, String shoppingListDatas,
            @RequestParam(defaultValue = "0") Integer id, HttpServletRequest req) {

        // JSON 데이터를 객체로 변환하기 위한 ObjectMapper 생성
        ObjectMapper mapper = new ObjectMapper();
        List<Weather> weathers = null;
        List<Fashion> fashions = null;
        List<ShoppingList> shoppingLists = null;

        // 입력받은 스케쥴 Id로 여행 일정 정보를 조회
        TripSchedule tripSchedule = tripScheduleService.getTripScheduleById(id);

        // 스케쥴 Id가 0인 경우, 적절한 메시지와 함께 이전 페이지로 이동
        if (id == 0) {
            return rq.historyBackOnView("잘못된 접근입니다. 여행 일정 Id가 없습니다.");
        }

        // 조회된 여행 일정이 없는 경우, 적절한 메시지와 함께 이전 페이지로 이동
        if (tripSchedule == null) {
            return rq.historyBackOnView("존재하지 않는 일정입니다.");
        }

        // 현재 로그인한 회원과 일정의 작성자가 다른 경우, 적절한 메시지와 함께 이전 페이지로 이동
        if (tripSchedule.getMemberId() != rq.getLoginedMemberId()) {
            return rq.historyBackOnView("일정의 작성자만 접근할 수 있습니다.");
        }

        // 스타일링 추천 페이지를 거치지 않고 넘어온 경우, 스타일링 추천 페이지로 전이
        if (tripSchedule.getStep() == 0) {
            return "redirect:/usr/styleRecommended/create?id=" + id;
        }

        // 이미 생성이 완료된 일정인 경우, 디테일 페이지로 이동
        if (tripSchedule.getStep() == 2) {
            return "redirect:/usr/myPlan/myPlanDetail?id=" + id + "&regionId=" + tripSchedule.getRegionId();
        }

        try {
            // JSON 데이터를 객체로 변환하여 리스트에 저장
            weathers = mapper.readValue(weatherDatas, new TypeReference<List<Weather>>() {});
            for (Weather weather : weathers) {
                weather.setScheduleId(id);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return rq.historyBackOnView("잘못된 날씨 데이터 형식입니다.");
        }

        try {
            fashions = mapper.readValue(fashionDatas, new TypeReference<List<Fashion>>() {});
            for (Fashion fashion : fashions) {
                fashion.setScheduleId(id);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return rq.historyBackOnView("잘못된 패션 데이터 형식입니다.");
        }

        try {
            shoppingLists = mapper.readValue(shoppingListDatas, new TypeReference<List<ShoppingList>>() {});
            for (ShoppingList shoppingItem : shoppingLists) {
                shoppingItem.setScheduleId(id);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return rq.historyBackOnView("잘못된 쇼핑리스트 데이터 형식입니다.");
        }

        // 정상적인 순서로 실행되어 메서드에 들어온 경우 step을 1 증가시킨다.
        if (tripSchedule.getStep() == 1) {
            tripScheduleService.updateStepById(id);
        }

        // 스타일링 추천 데이터를 DB에 저장
        tripStyleRecommendedService.writeStyleRecommendedDatas(weathers, fashions, shoppingLists);

        // 생성된 여행 일정의 디테일 페이지로 이동
        return "redirect:/usr/myPlan/myPlanDetail?id=" + id + "&regionId=" + tripSchedule.getRegionId();
    }

}
