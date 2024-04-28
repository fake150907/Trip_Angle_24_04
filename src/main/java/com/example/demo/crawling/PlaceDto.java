package com.example.demo.crawling;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PlaceDto {
	private int id;
	private String regDate;
	private String updateDate;
	private String name;
	private String address;
	private String businessHours;
	private String phoneNum;
	
//	private String imgUrl1;
//	private String imgUrl2;
//	private String imgUrl3;
//	private String imgUrl4;
//	private String imgUrl5;
	

}