package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



/**
 * 도시 엔티티
 * id : 아이디
 * regDate : 작성일
 * updateDate : 갱신일
 * name : 도시명
 * naverRegionCord : 네이버 사이트에서 여행 도시 별로 지정된 코드
 * countryId : 국가 테이블의 id
 * imageUrl : 도시 대표 이미지
 * englishName : 도시의 영문명
 * extra__countryName: 국가 테이블의 국가명
 */
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