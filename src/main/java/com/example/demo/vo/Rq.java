package com.example.demo.vo;

import java.io.IOException;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

import com.example.demo.service.MemberService;
import com.example.demo.util.Ut;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.Getter;

// Rq 클래스를 정의해
@Component // Spring Bean으로 등록
@Scope(value = "request", proxyMode = ScopedProxyMode.TARGET_CLASS) // request 스코프로 지정해
public class Rq {
	@Getter // Getter를 자동으로 생성
	private boolean isLogined;
	@Getter // Getter를 자동으로 생성
	private int loginedMemberId;
	@Getter // Getter를 자동으로 생성
	private Member loginedMember;

	private HttpSession session;

	private HttpServletRequest req;
	private HttpServletResponse resp;

	// 생성자를 정의
	public Rq(HttpServletRequest req, HttpServletResponse resp, MemberService memberService) {
		this.req = req;
		this.resp = resp;
		this.session = req.getSession();

		HttpSession httpSession = req.getSession();

		if (httpSession.getAttribute("loginedMemberId") != null) {
			isLogined = true;
			loginedMemberId = (int) httpSession.getAttribute("loginedMemberId");
			loginedMember = memberService.getMember(loginedMemberId);
		}

		this.req.setAttribute("rq", this);
	}

	// 뒤로가기 기능을 구현
	public void printHistoryBack(String msg) throws IOException {
		resp.setContentType("text/html; charset=UTF-8");
		println("<script>");
		if (!Ut.isEmpty(msg)) {
			System.err.println("alert('" + msg + "');");
			println("alert('" + msg + "');");
		}
		println("history.back();");
		println("</script>");
	}

	private void println(String str) {
		print(str + "\n");
	}

	private void print(String str) {
		try {
			resp.getWriter().append(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 로그아웃 기능을 구현
	public void logout() {
		session.removeAttribute("loginedMemberId");
		session.removeAttribute("loginedMember");
	}

	// 로그인 기능을 구현
	public void login(Member member) {
		session.setAttribute("loginedMemberId", member.getId());
		session.setAttribute("loginedMember", member);
	}

	// 필요한 전처리를 수행하는 메서드를 구현
	public void initBeforeActionInterceptor() {

	}

	// 메시지와 함께 뒤로가기 기능을 수행하고 싶을 때 호출하는 메서드를 구현
	public String historyBackOnView(String msg) {
		req.setAttribute("msg", msg);
		req.setAttribute("historyBack", true);
		return "usr/common/js";
	}

	// 현재 URI를 가져오는 메서드를 구현
	public String getCurrentUri() {
		String currentUri = req.getRequestURI();
		String queryString = req.getQueryString();

		System.err.println(currentUri);
		System.err.println(queryString);

		if (currentUri != null && queryString != null) {
			currentUri += "?" + queryString;
		}

		System.out.println(currentUri);

		return currentUri;
	}

	// JavaScript로 대체하는 메서드를 구현
	public void jsprintReplace(String resultCode, String msg, String replaceUri) {
		resp.setContentType("text/html; charset=UTF-8");
		print(Ut.jsReplace(resultCode, msg, replaceUri));

	}

	// 로그인 URI를 가져오는 메서드를 구현
	public String getLoginUri() {
		return "../member/login?afterLoginUri=" + getAfterLoginUri();
	}

	private String getAfterLoginUri() {
		return getEncodedCurrentUri();
	}

	// 로그아웃 URI를 가져오는 메서드를 구현
	public String getLogoutUri() {
		return "../member/doLogout?afterLogoutUri=" + getAfterLogoutUri();
	}

	private String getAfterLogoutUri() {

		String requestUri = req.getRequestURI();

		return getEncodedCurrentUri();
	}

	// 이미지 URI를 가져오는 메서드를 구현
	public String getImgUri(int id, String relTypeCode) {
		return "/common/genFile/file/" + relTypeCode + "/" + id + "/extra/Img/1";
	}

	// 프로필 기본 이미지 URI를 가져오는 메서드를 구현
	public String getProfileFallbackImgUri() {
		return "https://via.placeholder.com/150/?text=*^_^*";
	}

	// 이미지 로딩 실패 시 대체할 HTML을 가져오는 메서드를 구현
	public String getProfileFallbackImgOnErrorHtml() {
		return "this.src = '" + getProfileFallbackImgUri() + "'";
	}

	// 아이디 찾기 URI를 가져오는 메서드를 구현
	public String getFindLoginIdUri() {
		return "../member/findLoginId?afterFindLoginIdUri=" + getAfterFindLoginIdUri();
	}

	private String getAfterFindLoginIdUri() {
		return getEncodedCurrentUri();
	}

	// 비밀번호 찾기 URI를 가져오는 메서드를 구현
	public String getFindLoginPwUri() {
		return "../member/findLoginPw?afterFindLoginPwUri=" + getAfterFindLoginPwUri();
	}

	private String getAfterFindLoginPwUri() {
		return getEncodedCurrentUri();
	}

	// 현재 URI를 인코딩하는 메서드를 구현
	public String getEncodedCurrentUri() {
		return Ut.getEncodedCurrentUri(getCurrentUri());
	}

}
