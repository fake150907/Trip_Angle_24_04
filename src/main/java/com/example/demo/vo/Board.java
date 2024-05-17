package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 값 객체(VO) 클래스를 정의
@Data // Lombok을 사용해서 Getter, Setter 등을 자동으로 생성
@AllArgsConstructor // 모든 필드를 매개변수로 받는 생성자를 자동으로 생성
@NoArgsConstructor // 파라미터가 없는 생성자를 자동으로 생성
public class Board {
    // 게시판의 고유한 ID를 저장하는 변수
    private int id;
    // 게시판의 등록일을 저장하는 변수
    private String regDate;
    // 게시판의 수정일을 저장하는 변수
    private String updateDate;
    // 게시판의 코드를 저장하는 변수
    private String code;
    // 게시판의 이름을 저장하는 변수
    private String name;
    // 게시판의 삭제 상태를 저장하는 변수 (삭제되었는지 여부를 나타내는 boolean 값)
    private boolean delStatus;
    // 게시판의 삭제일을 저장하는 변수
    private String delDate;
}
