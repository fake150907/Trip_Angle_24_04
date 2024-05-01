package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Article;
import com.example.demo.vo.TravelSchedule;

@Mapper
public interface TravelScheduleRepository {


	@Select("""
				SELECT TR.*, RE.name AS 'extra__regionName', RE.imageUrl AS 'extra__regionImageUrl', RE.englishName AS 'extra__regionEnglishName', CO.name AS 'extra__contryName' 
				FROM TRAVELSCHEDULE TR INNER JOIN REGION RE ON TR.regionId = RE.id 
				INNER JOIN COUNTRY CO ON RE.countryId = CO.id
				WHERE TR.id = #{id}
			""")
	public TravelSchedule getTravelScheduleById(int id);

}
