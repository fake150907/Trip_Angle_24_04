package com.example.demo.crawling;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PlaceInfoDto {
	private int id;
	private String regDate;
	private String updateDate;
	private String name;
	private String address;
	private String grade;
	private String facilities;
	private String operatingTime;
	private String phoneNum;
	private String reviewCount;
	private String price;

	private String imgUrl1;
	private String imgUrl2;
	private String imgUrl3;
	private String imgUrl4;
	private String imgUrl5;

	private String naverSpotCord;
	private int tabId;
	private int regionId;

	public PlaceInfoDto(String name, String address, String phoneNum, String facilities, String operatingTime,
			String grade, String imgUrl1, String imgUrl2, String imgUrl3, String imgUrl4, String imgUrl5,
			String reviewCount, String price) {
		super();
		this.name = name;
		this.address = address;
		this.facilities = facilities;
		this.phoneNum = phoneNum;
		this.operatingTime = operatingTime;
		this.grade = grade;
		this.imgUrl1 = imgUrl1;
		this.imgUrl2 = imgUrl2;
		this.imgUrl3 = imgUrl3;
		this.imgUrl4 = imgUrl4;
		this.imgUrl5 = imgUrl5;
		this.reviewCount = reviewCount;
		this.price = price;
	}

	public PlaceInfoDto(String naverSpotCord, int tabId, int regionId) {
		super();
		this.naverSpotCord = naverSpotCord;
		this.tabId = tabId;
		this.regionId = regionId;
	}

}