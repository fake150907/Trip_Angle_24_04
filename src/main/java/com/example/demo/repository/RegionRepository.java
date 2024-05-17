package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Article;
import com.example.demo.vo.Region;

// 도시 테이블 데이터 입출력을 위한 매퍼 인터페이스  
@Mapper
public interface RegionRepository {

	/*
	 * 모든 도시 테이블의 항목과, 연결된 국가 테이블의 국가명 리스트를 반환하는 메소드   
	 * @return 도시 객체 목록
	 */
	@Select("SELECT RE.*, CO.NAME AS extra__countryName FROM REGION RE INNER JOIN COUNTRY CO ON RE.COUNTRYID = CO.ID")
	public List<Region> getRegionList();
	
	/*
	 * 특정 id의 도시 테이블 항목과, 연결된 국가 테이블의 국가명을 반환하는 메소드   
	 * @param 도시 id
	 * @return 도시 객체
	 */
	@Select("SELECT RE.*, CO.NAME AS extra__countryName FROM REGION RE INNER JOIN COUNTRY CO ON RE.COUNTRYID = CO.ID WHERE RE.ID=#{regionId}")
	public Region getRegionById(int regionId);

}