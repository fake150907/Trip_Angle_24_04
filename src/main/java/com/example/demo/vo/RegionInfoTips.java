package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RegionInfoTips {
	private int id;
	private String information;
	private String voltage;
	private String language;
	private String climate;
	private String rate;
	private String tips;
	private int regionId;
	private String timeDifference;
}