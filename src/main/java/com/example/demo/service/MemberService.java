package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.example.demo.repository.MemberRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;

@Service
public class MemberService {

	// application.properties에서 설정한 값들을 가져오는 변수들
	@Value("${custom.siteMainUri}")
	private String siteMainUri;
	@Value("${custom.siteName}")
	private String siteName;

	// MemberRepository와 MailService를 주입받음
	@Autowired
	private MemberRepository memberRepository;
	@Autowired
	private MailService mailService;

	// 생성자를 통해 의존성 주입
	public MemberService(MailService mailService, MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
		this.mailService = mailService;
	}

	// 회원가입을 처리하는 메서드
	public ResultData<Integer> join(String loginId, String loginPw, String name, String nickname, String cellphoneNum,
			String email) {

		// 이미 사용중인 아이디인지 체크
		Member existsMember = getMemberByLoginId(loginId);
		if (existsMember != null) {
			return ResultData.from("F-7", Ut.f("이미 사용중인 아이디(%s)입니다", loginId));
		}

		// 이미 사용중인 이름과 이메일인지 체크
		existsMember = getMemberByNameAndEmail(name, email);
		if (existsMember != null) {
			return ResultData.from("F-8", Ut.f("이미 사용중인 이름(%s)과 이메일(%s)입니다", name, email));
		}

		// 비밀번호 암호화
		loginPw = Ut.sha256(loginPw);

		// 회원가입 진행
		memberRepository.join(loginId, loginPw, name, nickname, cellphoneNum, email);
		// 가입된 회원의 id를 가져옴
		int id = memberRepository.getLastInsertId();

		// 회원가입 완료 메시지와 회원 id 반환
		return ResultData.from("S-1", "회원가입이 완료되었습니다.", "id", id);

	}

	// 이름과 이메일로 회원을 조회하는 메서드
	public Member getMemberByNameAndEmail(String name, String email) {
		return memberRepository.getMemberByNameAndEmail(name, email);
	}

	// 아이디로 회원을 조회하는 메서드
	public Member getMemberByLoginId(String loginId) {
		return memberRepository.getMemberByLoginId(loginId);
	}

	// id로 회원을 조회하는 메서드
	public Member getMember(int id) {
		return memberRepository.getMember(id);
	}

	// 회원정보 수정하는 메서드
	public ResultData modify(int loginedMemberId, String loginPw, String name, String nickname, String cellphoneNum,
			String email) {

		// 비밀번호 암호화
		loginPw = Ut.sha256(loginPw);

		// 회원정보 수정 진행
		memberRepository.modify(loginedMemberId, loginPw, name, nickname, cellphoneNum, email);
		// 회원정보 수정 완료 메시지 반환
		return ResultData.from("S-1", "회원정보 수정 완료");
	}

	// 비밀번호 변경없이 회원정보 수정하는 메서드
	public ResultData modifyWithoutPw(int loginedMemberId, String name, String nickname, String cellphoneNum,
			String email) {
		// 회원정보 수정 진행
		memberRepository.modifyWithoutPw(loginedMemberId, name, nickname, cellphoneNum, email);
		// 회원정보 수정 완료 메시지 반환
		return ResultData.from("S-1", "회원정보 수정 완료");
	}

	// 임시 비밀번호를 이메일로 발송하는 메서드
	public ResultData notifyTempLoginPwByEmail(Member actor) {
		// 메일 제목 설정
		String title = "[" + siteName + "] 임시 패스워드 발송";
		// 임시 비밀번호 생성
		String tempPassword = Ut.getTempPassword(6);
		// 메일 본문 설정
		String body = "<h1>임시 패스워드 : " + tempPassword + "</h1>";
		body += "<a href=\"" + siteMainUri + "/usr/member/login\" target=\"_blank\">로그인 하러가기</a>";

		// 메일 발송 결과 받음
		ResultData sendResultData = mailService.send(actor.getEmail(), title, body);

		// 메일 발송 실패 시 결과 반환
		if (sendResultData.isFail()) {
			return sendResultData;
		}

		// 임시 비밀번호를 회원의 비밀번호		//로 설정하고 암호화하여 저장
		setTempPassword(actor, tempPassword);

		// 이메일 발송 성공 및 임시 비밀번호 설정 완료 메시지 반환
		return ResultData.from("S-1", "계정의 이메일주소로 임시 패스워드가 발송되었습니다.");
	}

	// 회원의 비밀번호를 임시 비밀번호로 변경하는 메서드
	private void setTempPassword(Member actor, String tempPassword) {
		// 회원의 id를 이용하여 임시 비밀번호로 변경
		memberRepository.modify(actor.getId(), Ut.sha256(tempPassword), null, null, null, null);
	}

	// 회원 탈퇴하는 메서드
	public void deleteId(String loginId) {
		// 회원 아이디를 이용하여 회원 삭제
		memberRepository.deleteId(loginId);
	}

}

