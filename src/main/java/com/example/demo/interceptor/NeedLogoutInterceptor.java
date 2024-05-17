package com.example.demo.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class NeedLogoutInterceptor implements HandlerInterceptor {
    // Rq 객체 주입
    @Autowired
    private Rq rq;

    // 요청 처리 전에 실행되는 메서드
    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
        // 요청 객체에서 Rq 객체 가져오기
        Rq rq = (Rq) req.getAttribute("rq");

        // 로그인되어 있는 경우
        if (rq.isLogined()) {
            System.out.println("==============로그아웃 하고 써============");
            // 이전 페이지로 이동하며 메시지 출력
            rq.printHistoryBack("로그아웃 하고 써라");

            // 요청 처리 중단
            return false;
        }

        // 다음 인터셉터 또는 핸들러로 진행
        return HandlerInterceptor.super.preHandle(req, resp, handler);
    }
}