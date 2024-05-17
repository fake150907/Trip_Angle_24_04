package com.example.demo.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ReactionPointRepository {

    // 회원이 특정 유형(relTypeCode)의 특정 ID(relId)에 대한 반응 포인트 합계 조회 메서드
    @Select("""
            SELECT IFNULL(SUM(RP.point),0)
            FROM reactionPoint AS RP
            WHERE RP.relTypeCode = #{relTypeCode}
            AND RP.relId = #{relId}
            AND RP.memberId = #{memberId}
            """)
    public int getSumReactionPoint(int memberId, String relTypeCode, int relId);

    // 회원이 특정 유형(relTypeCode)의 특정 ID(relId)에 좋아요 반응 포인트 추가하는 메서드
    @Insert("""
            INSERT INTO reactionPoint
            SET regDate = NOW(),
            updateDate = NOW(),
            relTypeCode = #{relTypeCode},
            relId = #{relId},
            memberId = #{memberId},
            `point` = 1
            """)
    public int addGoodReactionPoint(int memberId, String relTypeCode, int relId);

    // 회원이 특정 유형(relTypeCode)의 특정 ID(relId)에 싫어요 반응 포인트 추가하는 메서드
    @Insert("""
            INSERT INTO reactionPoint
            SET regDate = NOW(),
            updateDate = NOW(),
            relTypeCode = #{relTypeCode},
            relId = #{relId},
            memberId = #{memberId},
            `point` = -1
            """)
    public int addBadReactionPoint(int memberId, String relTypeCode, int relId);

    // 회원이 특정 유형(relTypeCode)의 특정 ID(relId)에 대한 반응 포인트 삭제하는 메서드
    @Delete("""
            DELETE FROM reactionPoint
            WHERE memberId = #{memberId}
            AND relTypeCode = #{relTypeCode}
            AND relId = #{relId}
            """)
    public void deleteReactionPoint(int memberId, String relTypeCode, int relId);
}