package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

// 사용자 관련 요청을 처리하는 컨트롤러 클래스
@Controller
public class UsrMemberController {

	// Rq 객체 자동 주입
	@Autowired
	private Rq rq;

	// MemberService 객체 자동 주입
	@Autowired
	private MemberService memberService;

	// 회원 탈퇴 요청을 처리하는 메서드
	@RequestMapping("/usr/member/doDeleteId")
	@ResponseBody
	public String doDeleteId(HttpServletRequest req, @RequestParam(defaultValue = "/") String afterLogoutUri) {
		// 요청 속성에서 Rq 객체를 가져옴
		Rq rq = (Rq) req.getAttribute("rq");

		// 로그인된 회원의 아이디를 로그에 출력
		System.err.println("rq.loginedId: " + rq.getLoginedMember().getLoginId());

		// 로그인 여부 확인
		if (!rq.isLogined()) {
			return Ut.jsHistoryBack("F-A", "로그인 후 이용해주세요");
		}

		// 로그인된 회원의 아이디로 회원 탈퇴 처리
		memberService.deleteId(rq.getLoginedMember().getLoginId());
		// 로그아웃 처리
		rq.logout();

		// 탈퇴 완료 메시지와 함께 지정된 URI로 리다이렉트
		return Ut.jsReplace("S-1", "탈퇴가 완료되었습니다", afterLogoutUri);
	}

	// 로그인 아이디 중복 확인 요청을 처리하는 메서드
	@RequestMapping("/usr/member/getLoginIdDup")
	@ResponseBody
	public ResultData getLoginIdDup(String loginId) {
		// 로그인 아이디가 비어 있는지 확인
		if (Ut.isEmpty(loginId)) {
			return ResultData.from("F-1", "아이디를 입력해주세요");
		}

		// 해당 로그인 아이디를 가진 회원이 존재하는지 확인
		Member existsMember = memberService.getMemberByLoginId(loginId);

		// 회원이 존재하면 중복 메시지 반환
		if (existsMember != null) {
			return ResultData.from("F-2", "해당 아이디는 이미 사용중입니다.", "loginId", loginId);
		}

		// 사용 가능한 아이디임을 알리는 메시지 반환
		return ResultData.from("S-1", "사용 가능합니다.", "loginId", loginId);
	}

	// 로그아웃 요청을 처리하는 메서드
	@RequestMapping("/usr/member/doLogout")
	@ResponseBody
	public String doLogout(HttpServletRequest req, @RequestParam(defaultValue = "/") String afterLogoutUri) {
		// 요청 속성에서 Rq 객체를 가져옴
		Rq rq = (Rq) req.getAttribute("rq");

		// 로그인이 안 되어 있으면, 이미 로그아웃 상태라는 메시지 반환
		if (!rq.isLogined()) {
			return Ut.jsHistoryBack("F-A", "이미 로그아웃 상태입니다");
		}

		// 로그아웃 처리
		rq.logout();

		// 로그아웃 완료 메시지와 함께 지정된 URI로 리다이렉트
		return Ut.jsReplace("S-1", "로그아웃 되었습니다", afterLogoutUri);
	}

	// 로그인 페이지 표시 요청을 처리하는 메서드
	@RequestMapping("/usr/member/login")
	public String showLogin(HttpServletRequest req) {
		// 요청 속성에서 Rq 객체를 가져옴
		Rq rq = (Rq) req.getAttribute("rq");

		// 로그인이 되어 있으면, 이미 로그인되었다는 메시지 반환
		if (rq.isLogined()) {
			return Ut.jsHistoryBack("F-A", "이미 로그인 했습니다.");
		}
		// 로그인 페이지 반환
		return "usr/member/login";
	}

	// 로그인 요청을 처리하는 메서드
	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public String doLogin(HttpServletRequest req, String loginId, String loginPw,
			@RequestParam(defaultValue = "/") String afterLoginUri) {
		// 요청 속성에서 Rq 객체를 가져옴
		Rq rq = (Rq) req.getAttribute("rq");

		// 로그인이 되어 있으면, 이미 로그인되었다는 메시지 반환
		if (rq.isLogined()) {
			return Ut.jsHistoryBack("F-A", "이미 로그인 상태입니다.");
		}

		// 로그인 아이디가 비어 있는지 확인
		if (Ut.isNullOrEmpty(loginId)) {
			return Ut.jsHistoryBack("F-1", "아이디를 입력해주세요");
		}
		// 로그인 비밀번호가 비어 있는지 확인
		if (Ut.isNullOrEmpty(loginPw)) {
			return Ut.jsHistoryBack("F-2", "비밀번호를 입력해주세요");
		}

		// 로그인 아이디로 회원을 조회
		Member member = memberService.getMemberByLoginId(loginId);

		// 회원이 존재하지 않으면, 아이디가 없다는 메시지 반환
		if (member == null) {
			return Ut.jsHistoryBack("F-3", Ut.f("%s(은)는 존재하지 않는 아이디입니다", loginId));
		}

		// 비밀번호를 SHA-256으로 해싱한 값을 로그에 출력
		System.out.println(Ut.sha256(loginPw));

		// 비밀번호가 일치하지 않으면, 비밀번호가 다르다는 메시지 반환
		if (!member.getLoginPw().equals(Ut.sha256(loginPw))) {
			return Ut.jsHistoryBack("F-4", "비밀번호가 일치하지 않습니다");
		}

		// 회원의 삭제 상태가 0(삭제되지 않음)인지 확인
		if (member.getDelStatus() == 0) {
			rq.login(member); // 로그인 처리
		} else {
			return Ut.jsHistoryBack("F-5", Ut.f("%s(은)는 탈퇴한 회원입니다", loginId));
		}

		// 로그인 처리
		rq.login(member);

		// 로그인 후 리다이렉트할 URI가 비어 있지 않으면 해당 URI로 리다이렉트
		if (afterLoginUri.length() > 0) {
			return Ut.jsReplace("S-1", Ut.f("%s님 환영합니다", member.getNickname()), afterLoginUri);
		}

		// 기본적으로 루트 경로로 리다이렉트
		return Ut.jsReplace("S-1", Ut.f("%s님 환영합니다", member.getNickname()), "/");
	}

	// 회원가입 페이지 표시 요청을 처리하는 메서드
	@RequestMapping("/usr/member/join")
	public String showJoin(HttpServletRequest req) {
		return "usr/member/join"; // 회원가입 페이지 반환
	}

	// 회원가입 요청을 처리하는 메서드
	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public String doJoin(HttpServletRequest req, String loginId, String loginPw, String name, String nickname,
			String cellphoneNum, String email) {
		// 요청 속성에서 Rq 객체를 가져옴
		Rq rq = (Rq) req.getAttribute("rq");

		// 로그인이 되어 있으면, 이미 로그인 상태라는 메시지 반환
		if (rq.isLogined()) {
			return Ut.jsHistoryBack("F-A", "이미 로그인 상태입니다");
		}

		// 입력 필드의 유효성을 검사
		if (Ut.isNullOrEmpty(loginId)) {
			return Ut.jsHistoryBack("F-1", "아이디를 입력해주세요");
		}
		if (Ut.isNullOrEmpty(loginPw)) {
			return Ut.jsHistoryBack("F-2", "비밀번호를 입력해주세요");
		}
		if (Ut.isNullOrEmpty(name)) {
			return Ut.jsHistoryBack("F-3", "이름을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(nickname)) {
			return Ut.jsHistoryBack("F-4", "닉네임을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(cellphoneNum)) {
			return Ut.jsHistoryBack("F-5", "전화번호를 입력해주세요");
		}
		if (Ut.isNullOrEmpty(email)) {
			return Ut.jsHistoryBack("F-6", "이메일을 입력해주세요");
		}

		// 새 회원 가입 시도
		ResultData<Integer> joinRd = memberService.join(loginId, loginPw, name, nickname, cellphoneNum, email);

		// 가입에 실패하면 실패 메시지 반환
		if (joinRd.isFail()) {
			return Ut.jsHistoryBack(joinRd.getResultCode(), joinRd.getMsg());
		}

		// 새로 생성된 회원 조회
		Member member = memberService.getMember(joinRd.getData1());

		// 가입 성공 메시지와 함께 로그인 페이지로 리다이렉트
		return Ut.jsReplace(joinRd.getResultCode(), joinRd.getMsg(), "../member/login");
	}

	// 마이페이지 표시 요청을 처리하는 메서드
	@RequestMapping("/usr/member/myPage")
	public String showMyPage() {
		return "usr/member/myPage"; // 마이페이지 반환
	}

	// 비밀번호 확인 페이지 표시 요청을 처리하는 메서드
	@RequestMapping("/usr/member/checkPw")
	public String showCheckPw() {
		return "usr/member/checkPw"; // 비밀번호 확인 페이지 반환
	}

	// 비밀번호 확인 요청을 처리하는 메서드
	@RequestMapping("/usr/member/doCheckPw")
	public String doCheckPw(String loginPw) {
		// 비밀번호가 비어 있는지 확인
		if (Ut.isNullOrEmpty(loginPw)) {
			return rq.historyBackOnView("비밀번호를 입력해주세요");
		}

		// 로그인된 회원의 비밀번호가 일치하지 않으면, 비밀번호가 다르다는 메시지 반환
		if (!rq.getLoginedMember().getLoginPw().equals(Ut.sha256(loginPw))) {
			return rq.historyBackOnView("비밀번호가 틀렸습니다.");
		}

		// 비밀번호가 일치하면 수정 페이지 반환
		return "usr/member/modify";
	}

	// 회원 정보 수정 요청을 처리하는 메서드
	@RequestMapping("/usr/member/doModify")
	@ResponseBody
	public String doModify(HttpServletRequest req, String loginPw, String name, String nickname, String cellphoneNum,
			String email) {
		// 요청 속성에서 Rq 객체를 가져옴
		Rq rq = (Rq) req.getAttribute("rq");

		// 입력 필드의 유효성을 검사
		if (Ut.isNullOrEmpty(name)) {
			return Ut.jsHistoryBack("F-3", "이름을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(nickname)) {
			return Ut.jsHistoryBack("F-4", "닉네임을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(cellphoneNum)) {
			return Ut.jsHistoryBack("F-5", "전화번호를 입력해주세요");
		}
		if (Ut.isNullOrEmpty(email)) {
			return Ut.jsHistoryBack("F-6", "이메일을 입력해주세요");
		}

		// 회원 정보를 수정, 비밀번호는 선택사항
		ResultData modifyRd;
		if (Ut.isNullOrEmpty(loginPw)) {
			modifyRd = memberService.modifyWithoutPw(rq.getLoginedMemberId(), name, nickname, cellphoneNum, email);
		} else {
			modifyRd = memberService.modify(rq.getLoginedMemberId(), loginPw, name, nickname, cellphoneNum, email);
		}

		// 수정 완료 메시지와 함께 마이페이지로 리다이렉트
		return Ut.jsReplace(modifyRd.getResultCode(), modifyRd.getMsg(), "../member/myPage");
	}

	// 로그인 아이디 찾기 페이지 표시 요청을 처리하는 메서드
	@RequestMapping("/usr/member/findLoginId")
	public String showFindLoginId() {
		return "usr/member/findLoginId"; // 로그인 아이디 찾기 페이지 반환
	}

	// 로그인 아이디 찾기 요청을 처리하는 메서드
	@RequestMapping("/usr/member/doFindLoginId")
	@ResponseBody
	public String doFindLoginId(@RequestParam(defaultValue = "/") String afterFindLoginIdUri, String name,
			String email) {
		// 이름과 이메일로 회원 조회
		Member member = memberService.getMemberByNameAndEmail(name, email);

		// 회원이 존재하지 않으면, 해당 회원이 없다는 메시지 반환
		if (member == null) {
			return Ut.jsHistoryBack("F-1", "존재하지 않는 회원입니다.");
		}

		// 회원의 로그인 아이디 반환하고, 지정된 URI로 리다이렉트
		return Ut.jsReplace("S-1", Ut.f("당신의 아이디는 [ %s ]입니다.", member.getLoginId()), afterFindLoginIdUri);
	}

	// 로그인 비밀번호 찾기 페이지 표시 요청을 처리하는 메서드
	@RequestMapping("/usr/member/findLoginPw")
	public String showFindLoginPw() {
		return "usr/member/findLoginPw"; // 로그인 비밀번호 찾기 페이지 반환
	}

	// 로그인 비밀번호 찾기 요청을 처리하는 메서드
	@RequestMapping("/usr/member/doFindLoginPw")
	@ResponseBody
	public String doFindLoginPw(@RequestParam(defaultValue = "/") String afterFindLoginPwUri, String loginId,
			String email) {
		// 로그인 아이디로 회원 조회
		Member member = memberService.getMemberByLoginId(loginId);

		// 회원이 존재하지 않으면, 아이디가 없다는 메시지 반환
		if (member == null) {
			return Ut.jsHistoryBack("F-1", "존재하지 않는 회원입니다.");
		}

		// 이메일이 일치하지 않으면, 이메일이 다르다는 메시지 반환
		if (!member.getEmail().equals(email)) {
			return Ut.jsHistoryBack("F-2", "일치하는 이메일이 없습니다.");
		}

		// 임시 비밀번호 이메일 발송 요청
		ResultData notifyTempLoginPwByEmailRd = memberService.notifyTempLoginPwByEmail(member);

		// 임시 비밀번호 발송 결과 메시지 반환하고, 지정된 URI로 리다이렉트
		return Ut.jsReplace(notifyTempLoginPwByEmailRd.getResultCode(), notifyTempLoginPwByEmailRd.getMsg(),
				afterFindLoginPwUri);
	}
}
