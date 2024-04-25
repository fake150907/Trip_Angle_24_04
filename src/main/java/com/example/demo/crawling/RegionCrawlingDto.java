package com.example.demo.crawling;

import lombok.Data;

@Data
public class RegionCrawlingDto {
	String countryName;
	String naverRegionCord;
	String regionName;
	String imageUrl;
	String englishName;
	int regionId;
	
	public RegionCrawlingDto(String countryName, String naverRegionCord, String regionName) {
		super();
		this.countryName = countryName;
		this.naverRegionCord = naverRegionCord;
		this.regionName = regionName;
	}
	
	
	
}
