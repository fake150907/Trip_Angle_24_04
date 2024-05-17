package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Article;

@Mapper
public interface ArticleRepository {

    // 게시글 작성 메서드
    @Insert("""
            INSERT INTO
            article SET
            regDate = NOW(),
            updateDate = NOW(),
            memberId = #{memberId},
            boardId = #{boardId},
            title = #{title}, `body` = #{body}
            """)
    public void writeArticle(int memberId, String title, String body, int boardId);

    // 최근 삽입된 게시글의 ID 가져오는 메서드
    @Select("SELECT LAST_INSERT_ID()")
    public int getLastInsertId();

    // 게시글 조회 메서드
    @Select("""
            SELECT *
            FROM article
            WHERE id = #{id}
            """)
    public Article getArticle(int id);

    // 게시글 조회 메서드(작성자 정보 포함)
    @Select("""
            <script>
                SELECT A.*, M.nickname AS extra__writer
                FROM article AS A
                INNER JOIN `member` AS M
                ON A.memberId = M.id
                WHERE A.id = #{id}
                GROUP BY A.id
            </script>
            """)
    public Article getForPrintArticle(int id);

    // 게시글 삭제 메서드
    @Delete("DELETE FROM article WHERE id = #{id}")
    public void deleteArticle(int id);

    // 게시글 수정 메서드
    @Update("""
            <script>
            UPDATE article
                <set>
                    <if test="title != null and title != ''">title = #{title},</if>
                    <if test="body != null and body != ''">`body` = #{body},</if>
                    updateDate = NOW()
                </set>
            WHERE id = #{id}
            </script>
            """)
    public void modifyArticle(int id, String title, String body);

    // 모든 게시글 목록 조회 메서드
    @Select("""
            SELECT A.*, M.nickname AS extra__writer
            FROM article AS A
            INNER JOIN `member` AS M
            ON A.memberId = M.id
            ORDER BY A.id DESC
            """)
    public List<Article> getArticles();

    // 게시글 수 조회 메서드
    @Select("""
            <script>
            SELECT COUNT(*) AS cnt
            FROM article AS A
            WHERE 1
            <if test="boardId != 0">
                AND boardId = #{boardId}
            </if>
            <if test="searchKeyword != ''">
                <choose>
                    <when test="searchKeywordTypeCode == 'title'">
                        AND A.title LIKE CONCAT('%',#{searchKeyword},'%')
                    </when>
                    <when test="searchKeywordTypeCode == 'body'">
                        AND A.body LIKE CONCAT('%',#{searchKeyword},'%')
                    </when>
                    <otherwise>
                        AND A.title LIKE CONCAT('%',#{searchKeyword},'%')
                        OR A.body LIKE CONCAT('%',#{searchKeyword},'%')
                    </otherwise>
                </choose>
            </if>
            ORDER BY id DESC
            </script>
            """)
    public int getArticlesCount(int boardId, String searchKeywordTypeCode, String searchKeyword);

    // 게시글 조회수 증가 메서드
    @Update("""
            UPDATE article
            SET hitCount = hitCount + 1
            WHERE id = #{id}
            """)
    public int increaseHitCount(int id);

    // 게시글 조회수 조회 메서드
    @Select("""
            SELECT hitCount
            FROM article
            WHERE id = #{id}
            """)
    public int getArticleHitCount(int id);

    // 게시글 목록 조회 메서드(페이징 및 검색 기능 포함)
    @Select("""
            <script>
            SELECT A.*, M.nickname AS extra__writer, IFNULL(COUNT(R.id),0) AS extra__repliesCnt
            FROM article AS A
            INNER JOIN `member` AS M
            ON A.memberId = M.id
            LEFT JOIN `reply` AS R
            ON A.id = R.relId
            WHERE 1
            <if test="boardId != 0">
                AND A.boardId = #{boardId}
            </if>
            <if test="searchKeyword != ''">
                <choose>
                    <when test="searchKeywordTypeCode == 'title'">
                        AND A.title LIKE CONCAT('%',#{searchKeyword},'%')
                    </when>
                    <when test="searchKeywordTypeCode == 'body'">
                        AND A.body LIKE CONCAT('%',#{searchKeyword},'%')
                    </when>
                    <otherwise>
                        AND A.title LIKE CONCAT('%',#{searchKeyword},'%')
                        OR A.body LIKE CONCAT('%',#{searchKeyword},'%')
                    </otherwise>
                </choose>
            </if>
            GROUP BY A.id
            ORDER BY A.id DESC
            <if test="limitFrom >= 0 ">
                LIMIT #{limitFrom}, #{limitTake}
            </if>
            </script>
            """)
    public List<Article> getForPrintArticles(int boardId, int limitFrom, int limitTake, String searchKeywordTypeCode,
            String searchKeyword);

    // 좋아요 수 증가 메서드
    @Update("""
            UPDATE article
            SET goodReactionPoint = goodReactionPoint + 1
            WHERE id = #{relId}
            """)
    public int increaseGoodReactionPoint(int relId);

    // 좋아요 수 감소 메서드
    @Update("""
            UPDATE article
            SET goodReactionPoint = goodReactionPoint - 1
            WHERE id = #{relId}
            """)
    public int decreaseGoodReactionPoint(int relId);

    // 싫어요 수 증가 메서드
    @Update("""
            UPDATE article
            SET badReactionPoint = badReactionPoint + 1
            WHERE id = #{relId}
            """)
    public int increaseBadReactionPoint(int relId);

    // 싫어요 수 감소 메서드
    @Update("""
            UPDATE article
            SET badReactionPoint = badReactionPoint - 1
            WHERE id = #{relId}
            """)
    public int decreaseBadReactionPoint(int relId);

    // 좋아요 수 조회 메서드
    @Select("""
            SELECT goodReactionPoint
            FROM article
            WHERE id = #{relId}
            """)
    public int getGoodRP(int relId);

    // 싫어요 수 조회 메서드
    @Select("""
            SELECT badReactionPoint
            FROM article
            WHERE id = #{relId}
            """)
    public int getBadRP(int relId);

    // 다음 게시글 ID 조회 메서드
    @Select("""
            SELECT MAX(id) + 1
            FROM article
            """)
    public int getCurrentArticleId();

    // 게시글 목록 조회 메서드(게시판별)
    @Select("""
            <script>
            SELECT A.*, M.nickname AS extra__writer, IFNULL(COUNT(R.id),0) AS extra__repliesCnt
            FROM article AS A
            INNER JOIN `member` AS M
            ON A.memberId = M.id
            LEFT JOIN `reply` AS R
            ON A.id = R.relId
            WHERE 1
            <if test="boardId != 0">
                AND A.boardId = #{boardId}
            </if>
            GROUP BY A.id
            ORDER BY A.id DESC
            <if test="limitFrom >= 0 ">
                LIMIT #{limitFrom}, #{limitTake}
            </if>
            </script>
            """)
    public List<Article> getForPrintTripReviewList(int boardId, int limitFrom, int limitTake);

    // 게시글 수 조회 메서드(게시판별)
    @Select("""
            SELECT COUNT(*) AS cnt
            FROM article AS A
            WHERE 1
            AND boardId = #{boardId}
            """)
    public int getReviewCount(int boardId);

}