package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.crawling.PlaceInfoDto;

@Mapper
public interface PlaceInfoRepository {

	@Select("""
			SELECT id,regDate,updateDate,name,grade,price,reviewCount,facilities,address,phoneNumber,imageUrl1,imageUrl2,imageUrl3,imageUrl4,imageUrl5, REPLACE(naverSpotCord, '/', '') AS naverSpotCord,tabId,regionId
			FROM `recommendSpot`
			WHERE tabId = #{tabId}
			AND regionId = #{regionId}
			ORDER BY id;
			""")
	public List<PlaceInfoDto> getplaceInfoList(int tabId, int regionId);

	@Select("""
			SELECT id,regDate,updateDate,name,grade,price,reviewCount,facilities,address,phoneNumber,imageUrl1,imageUrl2,imageUrl3,imageUrl4,imageUrl5, REPLACE(naverSpotCord, '/', '') AS naverSpotCord,tabId,regionId
			FROM `recommendSpot`
			WHERE id = #{id}
			""")
	public PlaceInfoDto getPlaceInfo(int id);

}
