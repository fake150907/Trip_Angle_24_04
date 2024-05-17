package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ReactionPointService;
import com.example.demo.service.ReplyService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Reply;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrReplyController {

    @Autowired
    private Rq rq; // 로그인된 회원의 정보를 관리하는 객체

    @Autowired
    private ReplyService replyService; // 댓글 관련 서비스

    @Autowired
    private ReactionPointService reactionPointService; // 반응 포인트 관련 서비스

    // 댓글 작성 처리 메서드
    @RequestMapping("/usr/reply/doWrite")
    @ResponseBody
    public String doWrite(HttpServletRequest req, String relTypeCode, int relId, String body) {

        Rq rq = (Rq) req.getAttribute("rq"); // 요청에서 Rq 객체를 가져온다

        // relTypeCode가 비어있는지 확인
        if (Ut.isNullOrEmpty(relTypeCode)) {
            return Ut.jsHistoryBack("F-1", "relTypeCode을 입력해주세요");
        }
        // relId가 비어있는지 확인
        if (Ut.isEmpty(relId)) {
            return Ut.jsHistoryBack("F-2", "relId을 입력해주세요");
        }
        // body가 비어있는지 확인
        if (Ut.isNullOrEmpty(body)) {
            return Ut.jsHistoryBack("F-3", "내용을 입력해주세요");
        }

        // 댓글 작성 서비스 호출
        ResultData<Integer> writeReplyRd = replyService.writeReply(rq.getLoginedMemberId(), relTypeCode, relId, body);

        // 작성된 댓글의 ID 가져오기
        int id = (int) writeReplyRd.getData1();

        // 작성 완료 후 해당 게시물로 리다이렉트
        return Ut.jsReplace(writeReplyRd.getResultCode(), writeReplyRd.getMsg(), "../article/detail?id=" + relId);
    }

    // 댓글 삭제 처리 메서드
    @RequestMapping("/usr/reply/doDelete")
    @ResponseBody
    public String doDelete(HttpServletRequest req, int id, String replaceUri) {
        Rq rq = (Rq) req.getAttribute("rq"); // 요청에서 Rq 객체를 가져온다

        // 삭제할 댓글 가져오기
        Reply reply = replyService.getReply(id);

        // 댓글이 존재하지 않는 경우
        if (reply == null) {
            return Ut.jsHistoryBack("F-1", Ut.f("%d번 댓글은 존재하지 않습니다", id));
        }

        // 로그인한 사용자가 댓글을 삭제할 수 있는지 확인
        ResultData loginedMemberCanDeleteRd = replyService.userCanDelete(rq.getLoginedMemberId(), reply);

        // 삭제 권한이 있는 경우 댓글 삭제
        if (loginedMemberCanDeleteRd.isSuccess()) {
            replyService.deleteReply(id);
        }

        // 리다이렉트할 URL이 비어있는 경우 기본 URL 설정
        if (Ut.isNullOrEmpty(replaceUri)) {
            switch (reply.getRelTypeCode()) {
            case "article":
                replaceUri = Ut.f("../article/detail?id=%d", reply.getRelId());
                break;
            }
        }

        // 삭제 완료 후 리다이렉트
        return Ut.jsReplace(loginedMemberCanDeleteRd.getResultCode(), loginedMemberCanDeleteRd.getMsg(), replaceUri);
    }

    // 댓글 수정 처리 메서드
    @RequestMapping("/usr/reply/doModify")
    @ResponseBody
    public String doModify(HttpServletRequest req, int id, String body) {
        System.err.println(id);
        System.err.println(body);
        Rq rq = (Rq) req.getAttribute("rq"); // 요청에서 Rq 객체를 가져온다

        // 수정할 댓글 가져오기
        Reply reply = replyService.getReply(id);

        // 댓글이 존재하지 않는 경우
        if (reply == null) {
            return Ut.jsHistoryBack("F-1", Ut.f("%d번 댓글은 존재하지 않습니다", id));
        }

        // 로그인한 사용자가 댓글을 수정할 수 있는지 확인
        ResultData loginedMemberCanModifyRd = replyService.userCanModify(rq.getLoginedMemberId(), reply);

        // 수정 권한이 있는 경우 댓글 수정
        if (loginedMemberCanModifyRd.isSuccess()) {
            replyService.modifyReply(id, body);
        }

        // 수정된 댓글 다시 가져오기
        reply = replyService.getReply(id);

        // 수정된 댓글 내용 반환
        return reply.getBody();
    }
}