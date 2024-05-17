package com.example.demo.crawling;

import lombok.Data; // Lombok을 사용하여 getter, setter, toString 등의 메서드 자동 생성

@Data // Lombok을 사용하여 getter, setter, toString 등의 메서드 자동 생성

// 지역 크롤링 정보를 담는 DTO(Data Transfer Object) 클래스
public class RegionCrawlingDto {
	
	// 필드 선언
	 String countryName; // 국가 이름
	 String naverRegionCord; // 네이버 지역 코드
	 String regionName; // 지역 이름
	 String imageUrl; // 이미지 URL
	 String englishName; // 영어 이름
	 int regionId; // 지역 ID
	
	// 생성자 선언
	// 국가 이름, 네이버 지역 코드, 지역 이름을 받는 생성자
	public RegionCrawlingDto(String countryName, String naverRegionCord, String regionName) {
		super();
		this.countryName = countryName;
		this.naverRegionCord = naverRegionCord;
		this.regionName = regionName;
	}
}
