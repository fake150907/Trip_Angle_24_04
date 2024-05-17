package com.example.demo.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Member;

@Mapper
public interface MemberRepository {
	
	// 로그인 아이디로 회원 정보 가져오기
	@Select("""
			SELECT *
			FROM `member`
			WHERE loginId = #{loginId}
			""")
	public Member getMemberByLoginId(String loginId);

	// 이름과 이메일로 회원 정보 가져오기
	@Select("""
			SELECT *
			FROM `member`
			WHERE name = #{name}
			AND email = #{email}
			""")
	public Member getMemberByNameAndEmail(String name, String email);

	// 회원 가입
	@Insert("""
			INSERT INTO
			`member` SET
			regDate = NOW(),
			updateDate = NOW(),
			loginId = #{loginId},
			loginPw = #{loginPw},
			`name` = #{name},
			nickname = #{nickname},
			cellphoneNum = #{cellphoneNum},
			email = #{email}
			""")
	public void join(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email);

	// 최근 삽입된 회원의 ID 가져오기
	@Select("SELECT LAST_INSERT_ID()")
	public int getLastInsertId();

	// ID를 기반으로 회원 정보 가져오기
	@Select("SELECT * FROM `member` WHERE id = #{id}")
	public Member getMember(int id);

	// 회원 정보 수정(비밀번호 포함)
	@Update("""
			<script>
			UPDATE `member`
			<set>
				<if test="loginPw != null">
					loginPw = #{loginPw},
				</if>
				<if test="name != null">
					name = #{name},
				</if>
				<if test="nickname != null">
					nickname = #{nickname},
				</if>
				<if test="cellphoneNum != null">
					cellphoneNum = #{cellphoneNum},
				</if>
				<if test="email != null">
					email = #{email},
				</if>
				updateDate= NOW()
			</set>
			WHERE id = #{loginedMemberId}
			</script>
			""")
	public void modify(int loginedMemberId, String loginPw, String name, String nickname, String cellphoneNum,
			String email);

	// 회원 정보 수정(비밀번호 제외)
	@Update("""
			<script>
			UPDATE `member`
			<set>
				<if test="name != null">
					name = #{name},
				</if>
				<if test="nickname != null">
					nickname = #{nickname},
				</if>
				<if test="cellphoneNum != null">
					cellphoneNum = #{cellphoneNum},
				</if>
				<if test="email != null">
					email = #{email},
				</if>
				updateDate= NOW()
			</set>
			WHERE id = #{loginedMemberId}
			</script>
			""")
	public void modifyWithoutPw(int loginedMemberId, String name, String nickname, String cellphoneNum, String email);
	
	// 회원 삭제
	@Update("""
			UPDATE `member`
			SET delStatus = 1,
			delDate = NOW()
			WHERE loginId = #{loginId}
			""")
	public void deleteId(String loginId);

}