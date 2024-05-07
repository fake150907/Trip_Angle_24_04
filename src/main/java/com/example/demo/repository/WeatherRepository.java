package com.example.demo.repository;

import java.util.List;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Weather;


@Mapper
public interface WeatherRepository {
	
	@Insert({
	    "<script>",
	    "INSERT INTO Weather (regDate, updateDate, day, minTemp, maxTemp, humidity, icon, scheduleId) VALUES ",
	    "<foreach collection='weathers' item='weather' separator=','>",
	    "(NOW(), NOW(), #{weather.day}, #{weather.minTemp}, #{weather.maxTemp}, #{weather.humidity}, #{weather.icon}, #{weather.scheduleId})",
	    "</foreach>",
	    "</script>"
	})
	public void writeWeatherList(List<Weather> weathers);


	@Select(
			"""
			SELECT * FROM Weather WHERE scheduleId = ${scheduleId}	
			""")
	public List<Weather> getWeathersFromScheduleId(int scheduleId);
}
