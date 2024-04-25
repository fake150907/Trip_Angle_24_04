package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TravelSchedule {
	private int id;
	private String regDate;
	private String updateDate;
	private String name;
	private String description;
	private String startDate;
	private String endDate;
	private Integer step;
	private int memberId;
	private int regionId;
	
	private String extra__contryName;
	private String extra__regionName;
	private String extra__regionImageUrl;
	private String extra__regionEnglishName;
}