package com.example.demo.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.RegionInfoTips;

//도시 정보 테이블 데이터 입출력을 위한 매퍼 인터페이스  
@Mapper
public interface RegionInfoTipsRepository {

	/*
	 * 특정 도시 id에 해당하는 도시 정보 객체를 반환하는 매퍼 인터페이스
	 * @param: regionId 도시 id
	 * @return 도시 정보 객체
	 */
	@Select("""
			SELECT * FROM regionInfoTips
			WHERE regionId = #{regionId}
			""")
	public RegionInfoTips getRegionInfoTipsId(int regionId);

}
