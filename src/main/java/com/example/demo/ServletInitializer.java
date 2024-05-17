package com.example.demo;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

// SpringBootServletInitializer 클래스를 상속하여 ServletInitializer 클래스를 정의
public class ServletInitializer extends SpringBootServletInitializer {

	// configure 메서드를 오버라이드하여 SpringApplicationBuilder를 사용하여 애플리케이션을 설정
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		// SpringApplicationBuilder의 sources 메서드를 사용하여 애플리케이션 클래스(DemoApplication)를 등록
		return application.sources(DemoApplication.class);
	}

}
