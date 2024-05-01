package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShoppingList {
	private int id;
	private String regDate;
	private String updateDate;
	private String name;
	private String description;
	private String imageUrl;
	private int scheduleId;
	public ShoppingList(String name, String description, String imageUrl, int scheduleId) {
		this.name = name;
		this.description = description;
		this.imageUrl = imageUrl;
		this.scheduleId = scheduleId;
	}
	
	
	
	
	

	
	
}