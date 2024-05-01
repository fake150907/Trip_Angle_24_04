package com.example.demo.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Weather {
	private int id;
	private String regDate;
	private String updateDate;
	private String day;
	private int minTemp;
	private int maxTemp;
	private int humidity;
	private String icon;
	private int scheduleId;
	
	public Weather(String day, int minTemp, int maxTemp, int humidity,
			String icon, int scheduleId) {
		this.day = day;
		this.minTemp = minTemp;
		this.maxTemp = maxTemp;
		this.humidity = humidity;
		this.icon = icon;
		this.scheduleId = scheduleId;
	}
	
	
}