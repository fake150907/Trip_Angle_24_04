package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Fashion;

@Mapper
public interface FashionRepository {

    // 패션 리스트를 일괄 등록하는 메서드
    @Insert({
        "<script>",
        "INSERT INTO Fashion (regDate, updateDate, `name`, brand, description, imageUrl, gender, scheduleId) VALUES ",
        "<foreach collection='fashions' item='fashion' separator=','>",
        "(NOW(), NOW(), #{fashion.name}, #{fashion.brand}, #{fashion.description}, #{fashion.imageUrl}, #{fashion.gender}, #{fashion.scheduleId})",
        "</foreach>",
        "</script>"
    })
    public void writeFashionList(List<Fashion> fashions);

    // 특정 일정(scheduleId)에 속하는 패션 리스트를 조회하는 메서드
    @Select(
            """
            SELECT * FROM Fashion WHERE scheduleId = ${scheduleId}    
            """)
    public List<Fashion> getFashionsFromScheduleId(int scheduleId);
}