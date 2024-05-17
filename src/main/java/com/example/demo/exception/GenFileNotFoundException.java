package com.example.demo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

// HTTP 상태 코드 404인 NOT_FOUND를 응답으로 설정하고, 이유(reason)를 "genFile not found"로 설정합니다.
@ResponseStatus(code = HttpStatus.NOT_FOUND, reason = "genFile not found")
public class GenFileNotFoundException extends RuntimeException {
} 
