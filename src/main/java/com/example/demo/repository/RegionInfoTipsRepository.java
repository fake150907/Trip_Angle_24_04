package com.example.demo.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.regionInfoTips;

@Mapper
public interface RegionInfoTipsRepository {

	@Select("""
			SELECT * FROM regionInfoTips
			WHERE regionId = #{regionId}
			""")
	public regionInfoTips getRegionInfoTipsId(int regionId);

}
