package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

// 이 어노테이션은 Spring Boot 애플리케이션의 주 진입점이 되는 클래스
@SpringBootApplication
public class DemoApplication {

	// main 메서드는 Java 애플리케이션의 시작점
	public static void main(String[] args) {
		// SpringApplication 클래스의 run 메서드를 호출하여 Spring Boot 애플리케이션을 실행
		SpringApplication.run(DemoApplication.class, args);
	}

}
