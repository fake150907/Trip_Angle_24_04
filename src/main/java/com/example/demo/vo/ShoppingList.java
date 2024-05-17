package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShoppingList {
	private int id; // 쇼핑 목록의 ID
	private String regDate; // 등록일
	private String updateDate; // 수정일
	private String name; // 쇼핑 목록의 이름
	private String description; // 쇼핑 목록의 설명
	private String imageUrl; // 쇼핑 목록의 이미지 URL
	private int scheduleId; // 일정 ID

	// 생성자
	public ShoppingList(String name, String description, String imageUrl, int scheduleId) {
		this.name = name;
		this.description = description;
		this.imageUrl = imageUrl;
		this.scheduleId = scheduleId;
	}
}
