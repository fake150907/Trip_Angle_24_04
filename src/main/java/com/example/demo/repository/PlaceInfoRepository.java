package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.crawling.PlaceInfoDto;

@Mapper
public interface PlaceInfoRepository {

	@Select("""
			SELECT * FROM `recommendSpot`
			WHERE tabId = #{tabId}
			AND regionId = #{regionId}
			ORDER BY id;
			""")
	public List<PlaceInfoDto> getplaceInfoList(int tabId, int regionId);

}
