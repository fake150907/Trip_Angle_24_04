package com.example.demo.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.TravelSchedule;
import com.example.demo.vo.regionInfoTips;

@Mapper
public interface TravelScheduleRepository {


	@Select("""
				SELECT TR.*, RE.name AS 'extra__regionName', RE.imageUrl AS 'extra__regionImageUrl', RE.englishName AS 'extra__regionEnglishName', CO.name AS 'extra__contryName' 
				FROM TRAVELSCHEDULE TR INNER JOIN REGION RE ON TR.regionId = RE.id 
				INNER JOIN COUNTRY CO ON RE.countryId = CO.id
				WHERE TR.id = #{id}
			""")
	public TravelSchedule getTravelScheduleById(int id);

	@Insert("""
				INSERT INTO travelSchedule
				SET regDate = NOW(),
				updateDate = NOW(),
				`name` = #{title},
				`description` = #{content},
				startDate = #{checkInDate},
				endDate = #{checkOutDate},
				regionId = #{regionId},
				memberId = #{loginedMemberId}
		""")
	public void insertTravelSchedule(String title, String content, String checkInDate, String checkOutDate,
			int loginedMemberId, int regionId);

}
