package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 값 객체(VO) 클래스를 정의
@Data // Lombok을 사용해서 Getter, Setter 등을 자동으로 생성
@AllArgsConstructor // 모든 필드를 매개변수로 받는 생성자를 자동으로 생성
@NoArgsConstructor // 파라미터가 없는 생성자를 자동으로 생성
public class Member {
    // 회원의 고유한 ID를 저장하는 변수
    private int id;
    // 회원의 등록일을 저장하는 변수
    private String regDate;
    // 회원의 수정일을 저장하는 변수
    private String updateDate;
    // 회원의 로그인 ID를 저장하는 변수
    private String loginId;
    // 회원의 로그인 비밀번호를 저장하는 변수
    private String loginPw;
    // 회원의 권한 레벨을 저장하는 변수
    private int authLevel;
    // 회원의 이름을 저장하는 변수
    private String name;
    // 회원의 닉네임을 저장하는 변수
    private String nickname;
    // 회원의 휴대폰 번호를 저장하는 변수
    private String cellphoneNum;
    // 회원의 이메일 주소를 저장하는 변수
    private String email;
    // 회원의 삭제 여부를 저장하는 변수
    private int delStatus;
    // 회원의 삭제일을 저장하는 변수
    private String delDate;
}
