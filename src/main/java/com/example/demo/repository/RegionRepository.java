package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Article;
import com.example.demo.vo.Region;

@Mapper
public interface RegionRepository {

	@Select("SELECT RE.*, CO.NAME AS extra__countryName FROM REGION RE INNER JOIN COUNTRY CO ON RE.COUNTRYID = CO.ID")
	public List<Region> getRegionList();
	
	@Select("SELECT RE.*, CO.NAME AS extra__countryName FROM REGION RE INNER JOIN COUNTRY CO ON RE.COUNTRYID = CO.ID WHERE RE.ID=#{regionId}")
	public Region getRegionById(int regionId);

}