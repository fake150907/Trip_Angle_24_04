package com.example.demo.crawling;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // Lombok을 사용하여 getter, setter, toString 등의 메서드 자동 생성
@AllArgsConstructor // 모든 필드를 매개변수로 받는 생성자 자동 생성
@NoArgsConstructor // 기본 생성자 자동 생성

// 장소 정보를 담는 DTO(Data Transfer Object) 클래스
public class PlaceInfoDto {
	
	// 필드 선언
	private int id; // ID
	private String regDate; // 등록일시
	private String updateDate; // 수정일시
	private String name; // 이름
	private String address; // 주소
	private String grade; // 등급
	private String facilities; // 시설
	private String phoneNumber; // 전화번호
	private String reviewCount; // 리뷰 수
	private String price; // 가격
	private String imageUrl1; // 이미지 URL 1
	private String imageUrl2; // 이미지 URL 2
	private String imageUrl3; // 이미지 URL 3
	private String imageUrl4; // 이미지 URL 4
	private String imageUrl5; // 이미지 URL 5
	private String naverSpotCord; // 네이버 스팟 코드
	private int tabId; // 탭 ID
	private int regionId; // 지역 ID

	// 생성자 선언
	// 장소 정보를 생성하는 데 필요한 매개변수를 모두 받는 생성자
	public PlaceInfoDto(String name, String address, String phoneNum, String facilities, String grade, String imgUrl1,
			String imgUrl2, String imgUrl3, String imgUrl4, String imgUrl5, String reviewCount, String price) {
		super();
		this.name = name;
		this.address = address;
		this.facilities = facilities;
		this.phoneNumber = phoneNum;
		this.grade = grade;
		this.imageUrl1 = imgUrl1;
		this.imageUrl2 = imgUrl2;
		this.imageUrl3 = imgUrl3;
		this.imageUrl4 = imgUrl4;
		this.imageUrl5 = imgUrl5;
		this.reviewCount = reviewCount;
		this.price = price;
	}

	// 네이버 스팟 코드와 탭 ID, 지역 ID를 받는 생성자
	public PlaceInfoDto(String naverSpotCord, int tabId, int regionId) {
		super();
		this.naverSpotCord = naverSpotCord;
		this.tabId = tabId;
		this.regionId = regionId;
	}

}
