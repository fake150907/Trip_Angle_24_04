package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Reply;

@Mapper
public interface ReplyRepository {

    // 특정 유형(relTypeCode) 및 ID(relId)에 대한 댓글 목록 조회 메서드
    @Select("""
            SELECT R.*, M.nickname AS extra__writer
            FROM reply AS R
            INNER JOIN `member` AS M
            ON R.memberId = M.id
            WHERE relTypeCode = #{relTypeCode}
            AND relId = #{relId}
            ORDER BY R.id ASC;
            """)
    List<Reply> getForPrintReplies(int loginedMemberId, String relTypeCode, int relId);

    // member의 ID로 댓글을 작성
    @Insert("""
            INSERT INTO reply
            SET regDate = NOW(),
            updateDate = NOW(),
            memberId = #{loginedMemberId},
            relTypeCode = #{relTypeCode},
            relId = #{relId},
            `body` = #{body}
            """)
    void writeReply(int loginedMemberId, String relTypeCode, int relId, String body);

    // 최근 삽입된 댓글의 ID 조회 메서드
    @Select("SELECT LAST_INSERT_ID()")
    public int getLastInsertId();

    // 특정 댓글 ID에 해당하는 댓글 조회 메서드
    @Select("""
            SELECT R.*
            FROM reply AS R
            WHERE R.id = #{id}
            """)
    Reply getReply(int id);

    // 댓글 삭제 메서드
    @Delete("""
            DELETE FROM reply
            WHERE id = #{id}
            """)
    void deleteReply(int id);

    // 댓글 수정 메서드
    @Update("""
            UPDATE reply
            SET `body` = #{body},
            updateDate = NOW()
            WHERE id = #{id}
            """)
    public void modifyReply(int id, String body);

}