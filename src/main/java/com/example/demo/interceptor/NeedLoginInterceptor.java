package com.example.demo.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.example.demo.util.Ut;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class NeedLoginInterceptor implements HandlerInterceptor {
    // Rq 객체 주입
    @Autowired
    private Rq rq;

    // 요청 처리 전에 실행되는 메서드
    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
        // 요청 객체에서 Rq 객체 가져오기
        Rq rq = (Rq) req.getAttribute("rq");

        // 로그인되어 있지 않은 경우
        if (!rq.isLogined()) {
            System.out.println("==============로그인 하고 이용해주세요============");
            // 현재 URI를 인코딩하여 로그인 후 이동할 URI 생성
            String afterLoginUri = rq.getEncodedCurrentUri();
            // 로그인 페이지로 이동하고 로그인 후 이동할 URI를 파라미터로 전달
            rq.jsprintReplace("F-A", "로그인 후 이용해주세요", "../member/login?afterLoginUri=" + afterLoginUri);

            // 요청 처리 중단
            return false;
        }
        
        // 다음 인터셉터 또는 핸들러로 진행
        return HandlerInterceptor.super.preHandle(req, resp, handler);
    }
}