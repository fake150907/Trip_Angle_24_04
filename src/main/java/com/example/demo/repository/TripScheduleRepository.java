package com.example.demo.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.example.demo.vo.CalendarData;
import com.example.demo.vo.TripSchedule;

@Mapper
public interface TripScheduleRepository {

    // ID에 해당하는 여행 일정을 가져오는 메서드
    @Select("""
            SELECT TR.*, RE.name AS 'extra__regionName', RE.imageUrl AS 'extra__regionImageUrl', RE.englishName AS 'extra__regionEnglishName', CO.name AS 'extra__contryName'
            FROM TRIPSCHEDULE TR INNER JOIN REGION RE ON TR.regionId = RE.id
            INNER JOIN COUNTRY CO ON RE.countryId = CO.id
            WHERE TR.id = #{id}
        """)
    public TripSchedule getTripScheduleById(int id);

    // 회원 ID에 해당하는 여행 일정 목록을 가져오는 메서드
    @Select("""
            SELECT TS.id, TS.regDate, R.imageUrl AS 'extra__regionImageUrl',TS.title, TS.content, TS.regionId, R.name AS 'extra__regionName', TS.startDate, TS.endDate, TS.memberId, R.englishName AS 'extra__regionEnglishName', C.name AS 'extra__contryName'
            FROM tripSchedule AS TS
            INNER JOIN region AS R ON TS.regionId = R.id
            INNER JOIN country AS C ON R.countryId = C.id
            WHERE TS.memberId = #{memberId}
            GROUP BY TS.id
            ORDER BY TS.startDate;
        """)
    public List<TripSchedule> getForPrintTripSchedules(int memberId);

    // 여행 일정을 추가하는 메서드
    @Insert("""
                INSERT INTO tripSchedule
                SET regDate = NOW(),
                updateDate = NOW(),
                `title` = #{title},
                `content` = #{content},
                startDate = #{checkInDate},
                endDate = #{checkOutDate},
                regionId = #{regionId},
                memberId = #{loginedMemberId},
                step = 0
        """)
    @Options(useGeneratedKeys = true, keyProperty = "map.id")
    public void insertTripSchedule(String title, String content, String checkInDate, String checkOutDate,
            int loginedMemberId, int regionId, Map<String, Object> map);

    // 캘린더 데이터를 추가하는 메서드
    @Insert("""
            INSERT INTO calendarData
            SET regDate = NOW(),
            updateDate = NOW(),
            `memberId` = #{loginedMemberId},
            `title` = #{calendarData.title},
            `start` = #{calendarData.start},
            `end` = #{calendarData.end},
            `allDay` = #{calendarData.allDay}
        """)
    public void addCalendarData(CalendarData calendarData, int loginedMemberId);

    // 이벤트를 삭제하는 메서드
    @Delete("""
            DELETE FROM `calendarData`
            WHERE id = #{calendarDataId}
            AND `memberId` = #{loginedMemberId}
        """)
    public void deleteEvent(Integer calendarDataId, int loginedMemberId);

    // 회원 ID에 해당하는 캘린더 데이터 목록을 가져오는 메서드
    @Select("""
            SELECT * FROM `calendarData`
            WHERE `memberId` = #{loginedMemberId}
        """)
    public List<CalendarData> getCalendarDatas(int loginedMemberId);

    // 여행 일정의 진행 상태를 업데이트하는 메서드
    @Update("""
                UPDATE  TRIPSCHEDULE SET STEP=STEP+1, UPDATEDATE=NOW() WHERE id = #{id}
        """)
    public void updateStepById(int id);

    // 여행 일정 상세를 삭제하는 메서드
    @Delete("DELETE FROM tripSchedule WHERE id = #{id}")
    public void deleteMyPlanDetail(int id);

}