package com.example.demo.repository;

import java.util.List;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Fashion;
import com.example.demo.vo.Weather;


@Mapper
public interface FashionRepository {

	@Insert({
	    "<script>",
	    "INSERT INTO Fashion (regDate, updateDate, `name`, brand, description, imageUrl, gender, scheduleId) VALUES ",
	    "<foreach collection='fashions' item='fashion' separator=','>",
	    "(NOW(), NOW(), #{fashion.name}, #{fashion.brand}, #{fashion.description}, #{fashion.imageUrl}, #{fashion.gender}, #{fashion.scheduleId})",
	    "</foreach>",
	    "</script>"
	})
	public void writeFashionList(List<Fashion> fashions);


	@Select(
			"""
			SELECT * FROM Fashion WHERE scheduleId = ${scheduleId}	
			""")
	public List<Fashion> getFashionsFromScheduleId(int scheduleId);
}
