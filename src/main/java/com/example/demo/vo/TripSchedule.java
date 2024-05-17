package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TripSchedule {
	private int id; // 여행 일정의 ID
	private String regDate; // 등록일
	private String updateDate; // 수정일
	private String title; // 여행 일정의 제목
	private String content; // 여행 일정의 내용
	private String startDate; // 여행 시작일
	private String endDate; // 여행 종료일
	private Integer step; // 여행 일정의 단계
	private int memberId; // 회원 ID
	private int regionId; // 지역 ID
	
	// 추가 정보
	private String extra__contryName; // 국가 이름
	private String extra__regionName; // 지역 이름
	private String extra__regionImageUrl; // 지역 이미지 URL
	private String extra__regionEnglishName; // 지역 영문 이름
}
