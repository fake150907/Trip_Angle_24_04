package com.example.demo.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.RegionInfoTips;

@Mapper
public interface RegionInfoTipsRepository {

	@Select("""
			SELECT * FROM regionInfoTips
			WHERE regionId = #{regionId}
			""")
	public RegionInfoTips getRegionInfoTipsId(int regionId);

}
