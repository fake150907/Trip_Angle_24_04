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
	// private String operatingTime;
	private String phoneNumber;
	private String reviewCount;
	private String price;

	private String imageUrl1;
	private String imageUrl2;
	private String imageUrl3;
	private String imageUrl4;
	private String imageUrl5;

	private String naverSpotCord;
	private int tabId;
	private int regionId;

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

	public PlaceInfoDto(String naverSpotCord, int tabId, int regionId) {
		super();
		this.naverSpotCord = naverSpotCord;
		this.tabId = tabId;
		this.regionId = regionId;
	}

}