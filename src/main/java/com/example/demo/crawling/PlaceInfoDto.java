package com.example.demo.crawling;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PlaceInfoDto {
	// 추천장소 id
	private int id;
	// 추천장소 정보 생성날짜
	private String regDate;
	// 추천장소 정보 수정날짜
	private String updateDate;
	// 추천장소 이름
	private String name;
	// 추천장소 주소
	private String address;
	// 추천장소 평점
	private String grade;
	// 추천장소 시설 정보
	private String facilities;
	// private String operatingTime;
	// 추천장소 전화번호
	private String phoneNumber;
	// 추천장소 리뷰수
	private String reviewCount;
	// 추천장소 가격
	private String price;

	// 추천장소 사진 imageUrl
	private String imageUrl1;
	private String imageUrl2;
	private String imageUrl3;
	private String imageUrl4;
	private String imageUrl5;

	// 추천장소 네이버코드
	private String naverSpotCord;
	// 추천장소 카테고리 id
	private int tabId;
	// 추천장소 지역 id
	private int regionId;

	// 생성자
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

	// 생성자
	public PlaceInfoDto(String naverSpotCord, int tabId, int regionId) {
		super();
		this.naverSpotCord = naverSpotCord;
		this.tabId = tabId;
		this.regionId = regionId;
	}

}