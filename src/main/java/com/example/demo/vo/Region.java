package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Region {
	private int id;
	private String regDate;
	private String updateDate;
	private String name;
	private String naverRegionCord;
	private int countryId;
	private String imageUrl;
	private String englishName;

	private String extra__countryName;
}