package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.RegionService;
import com.example.demo.vo.Region;
import com.google.gson.Gson;

@Controller
public class UsrHomeController {
    // RegionService 의존성 주입
    @Autowired
    RegionService regionService;

    // 생성자를 통한 의존성 주입
    public UsrHomeController(RegionService regionService) {
        this.regionService = regionService;
    }

    // 메인 페이지 요청 처리
    @RequestMapping("/usr/home/main")
    public String showMain(Model model) {
        // 지역 목록 조회
        List<Region> regions = regionService.getRegionList();
        
        // 지역 목록을 JSON 형태로 변환
        String regionsJson = new Gson().toJson(regions);
        
        // 모델에 지역 목록과 JSON 데이터 추가
        model.addAttribute("regions", regionService.getRegionList());
        model.addAttribute("regionsJson", regionsJson);

        // 메인 페이지로 이동
        return "/usr/home/main";
    }

    // 루트 페이지 요청 처리
    @RequestMapping("/")
    public String showRoot() {
        // 루트 페이지를 메인 페이지로 리다이렉트
        return "redirect:/usr/home/main";
    }
    
    // 윤린에게 이메일 쓰기 페이지 요청 처리
    @RequestMapping("/usr/home/writeEmailToYunlin")
    public String writeEmailToYunlin() {
        // 윤린에게 이메일 쓰기 페이지로 이동
        return "/usr/home/writeEmailToYunlin";
    }
    
    // 가연에게 이메일 쓰기 페이지 요청 처리
    @RequestMapping("/usr/home/writeEmailToGayeon")
    public String writeEmailToGayeon() {
        // 가연에게 이메일 쓰기 페이지로 이동
        return "/usr/home/writeEmailToGayeon";
    }
    
    // 규섭에게 이메일 쓰기 페이지 요청 처리
    @RequestMapping("/usr/home/writeEmailToGyusub")
    public String writeEmailToGyusub() {
        // 규섭에게 이메일 쓰기 페이지로 이동
        return "/usr/home/writeEmailToGyusub";
    }
    
    // 명원에게 이메일 쓰기 페이지 요청 처리
    @RequestMapping("/usr/home/writeEmailToMyeongwon")
    public String writeEmailToMyeongwon() {
        // 명원에게 이메일 쓰기 페이지로 이동
        return "/usr/home/writeEmailToMyeongwon";
    }   
}
