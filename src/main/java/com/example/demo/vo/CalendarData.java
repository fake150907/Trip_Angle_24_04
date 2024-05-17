package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 값 객체(VO) 클래스를 정의
@Data // Lombok을 사용해서 Getter, Setter 등을 자동으로 생성
@AllArgsConstructor // 모든 필드를 매개변수로 받는 생성자를 자동으로 생성
@NoArgsConstructor // 파라미터가 없는 생성자를 자동으로 생성
public class CalendarData {
    // 캘린더 데이터의 고유한 ID를 저장하는 변수
    private int id;
    // 캘린더 데이터의 등록일을 저장하는 변수
    private String regDate;
    // 캘린더 데이터의 수정일을 저장하는 변수
    private String updateDate;
    // 캘린더 데이터의 제목을 저장하는 변수
    private String title;
    // 캘린더 데이터의 시작 일시를 저장하는 변수
    private String start;
    // 캘린더 데이터의 종료 일시를 저장하는 변수
    private String end;
    // 캘린더 데이터가 종일 일정인지 여부를 저장하는 변수
    private boolean allDay;
}
