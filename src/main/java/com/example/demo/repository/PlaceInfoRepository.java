package com.example.demo.repository;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.crawling.PlaceInfoDto;

@Mapper
public interface PlaceInfoRepository {

	// 여행 지역의 탭 id와 지역에 해당하는 관광지 정보 목록 가져오기
	@Select("""
			SELECT id,regDate,updateDate,name,grade,price,reviewCount,facilities,address,phoneNumber,imageUrl1,imageUrl2,imageUrl3,imageUrl4,imageUrl5, REPLACE(naverSpotCord, '/', '') AS naverSpotCord,tabId,regionId
			FROM `recommendSpot`
			WHERE tabId = #{tabId}
			AND regionId = #{regionId}
			ORDER BY id;
			""")
	public List<PlaceInfoDto> getplaceInfoList(int tabId, int regionId);

	// id를 기반으로 특정 관광지의 정보 가져오기
	@Select("""
			SELECT id,regDate,updateDate,name,grade,price,reviewCount,facilities,address,phoneNumber,imageUrl1,imageUrl2,imageUrl3,imageUrl4,imageUrl5, REPLACE(naverSpotCord, '/', '') AS naverSpotCord,tabId,regionId
			FROM `recommendSpot`
			WHERE id = #{id}
			""")
	public PlaceInfoDto getPlaceInfo(int id);

}