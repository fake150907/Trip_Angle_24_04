package com.example.demo.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.TripSchedule;
import com.example.demo.vo.RegionInfoTips;

@Mapper
public interface TripScheduleRepository {


	@Select("""
				SELECT TR.*, RE.name AS 'extra__regionName', RE.imageUrl AS 'extra__regionImageUrl', RE.englishName AS 'extra__regionEnglishName', CO.name AS 'extra__contryName' 
				FROM TRIPSCHEDULE TR INNER JOIN REGION RE ON TR.regionId = RE.id 
				INNER JOIN COUNTRY CO ON RE.countryId = CO.id
				WHERE TR.id = #{id}
			""")
	public TripSchedule getTripScheduleById(int id);
	

	@Insert("""
				INSERT INTO tripSchedule
				SET regDate = NOW(),
				updateDate = NOW(),
				`title` = #{title},
				`content` = #{content},
				startDate = #{checkInDate},
				endDate = #{checkOutDate},
				regionId = #{regionId},
				memberId = #{loginedMemberId}
		""")
	public void insertTripSchedule(String title, String content, String checkInDate, String checkOutDate,
			int loginedMemberId, int regionId);

}
