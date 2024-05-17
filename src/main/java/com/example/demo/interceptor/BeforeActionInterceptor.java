package com.example.demo.interceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class BeforeActionInterceptor implements HandlerInterceptor {
    // Rq 객체 주입
    @Autowired
    private Rq rq;
    
    // 요청 처리 전에 실행되는 메서드
    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
        // BeforeActionInterceptor 초기화 메서드 호출
        rq.initBeforeActionInterceptor();

        // 다음 인터셉터 또는 핸들러로 진행
        return HandlerInterceptor.super.preHandle(req, resp, handler);
    }
}