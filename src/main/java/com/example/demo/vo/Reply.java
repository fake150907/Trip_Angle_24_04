package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// Reply 클래스를 정의
@Data // Lombok을 사용해서 Getter, Setter 등을 자동으로 생성
@AllArgsConstructor // 모든 필드를 매개변수로 받는 생성자를 자동으로 생성
@NoArgsConstructor // 파라미터가 없는 생성자를 자동으로 생성
public class Reply {
    // 댓글의 id를 저장하는 변수
    private int id;
    
    // 댓글의 작성일시를 저장하는 변수
    private String regDate;
    
    // 댓글의 수정일시를 저장하는 변수
    private String updateDate;
    
    // 댓글 작성자의 회원 id를 저장하는 변수
    private int memberId;
    
    // 댓글이 속한 게시물의 유형 코드를 저장하는 변수
    private String relTypeCode;
    
    // 댓글이 속한 게시물의 id를 저장하는 변수
    private int relId;
    
    // 댓글의 내용을 저장하는 변수
    private String body;
    
    // 댓글에 대한 좋아요 수를 저장하는 변수
    private int goodReactionPoint;
    
    // 댓글에 대한 싫어요 수를 저장하는 변수
    private int badReactionPoint;

    // 추가 정보로 작성자의 이름을 저장하는 변수
    private String extra__writer;

    // 현재 사용자가 댓글을 수정할 수 있는지 여부를 저장하는 변수
    private boolean userCanModify;
    
    // 현재 사용자가 댓글을 삭제할 수 있는지 여부를 저장하는 변수
    private boolean userCanDelete;
}
