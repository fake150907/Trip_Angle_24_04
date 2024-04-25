package com.example.demo.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Fashion {
	private int id;
	private String regDate;
	private String updateDate;
	private String name;
	private String brand;
	private String imageUrl;
	private int gender;
	private String description;
	private int scheduleId;
	public Fashion(String name, String brand, String imageUrl, int gender, int scheduleId) {
		super();
		this.name = name;
		this.brand = brand;
		this.imageUrl = imageUrl;
		this.gender = gender;
		this.scheduleId = scheduleId;
	}
	
	
	

	
	
}