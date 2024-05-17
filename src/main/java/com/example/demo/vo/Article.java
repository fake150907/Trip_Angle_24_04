package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 값 객체(VO) 클래스를 정의
@Data // Lombok을 사용해서 Getter, Setter 등을 자동으로 생성
@AllArgsConstructor // 모든 필드를 매개변수로 받는 생성자를 자동으로 생성
@NoArgsConstructor // 파라미터가 없는 생성자를 자동으로 생성
public class Article {
    // 게시물의 고유한 ID를 저장하는 변수
    private int id;
    // 게시물의 등록일을 저장하는 변수
    private String regDate;
    // 게시물의 수정일을 저장하는 변수
    private String updateDate;
    // 게시물을 작성한 회원의 ID를 저장하는 변수
    private int memberId;
    // 게시물의 제목을 저장하는 변수
    private String title;
    // 게시물의 내용을 저장하는 변수
    private String body;
    // 게시물의 조회수를 저장하는 변수
    private int hitCount;
    // 게시물의 좋아요 반응 포인트를 저장하는 변수
    private int goodReactionPoint;
    // 게시물의 싫어요 반응 포인트를 저장하는 변수
    private int badReactionPoint;

    // 게시물의 댓글 수를 저장하는 변수
    private int extra__repliesCnt;
    // 게시물을 작성한 회원의 이름을 저장하는 변수
    private String extra__writer;

    // 현재 사용자가 게시물을 수정할 수 있는지 여부를 저장하는 변수
    private boolean userCanModify;
    // 현재 사용자가 게시물을 삭제할 수 있는지 여부를 저장하는 변수
    private boolean userCanDelete;
}
