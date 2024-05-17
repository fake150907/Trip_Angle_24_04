package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ArticleService;
import com.example.demo.service.ReactionPointService;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

@Controller
public class UsrReactionPointController {

    @Autowired
    private Rq rq; // 로그인된 회원의 정보를 관리하는 객체

    @Autowired
    private ArticleService articleService; // 게시물 관련 서비스

    @Autowired
    private ReactionPointService reactionPointService; // 반응 포인트 관련 서비스

    // 좋아요 반응 처리 메서드
    @RequestMapping("/usr/reactionPoint/doGoodReaction")
    @ResponseBody
    public ResultData doGoodReaction(String relTypeCode, int relId, String replaceUri) {

        // 사용자가 이미 반응한 상태 확인
        ResultData usersReactionRd = reactionPointService.usersReaction(rq.getLoginedMemberId(), relTypeCode, relId);
        int usersReaction = (int) usersReactionRd.getData1();

        // 사용자가 이미 좋아요를 눌렀을 경우, 좋아요 취소
        if (usersReaction == 1) {
            reactionPointService.deleteGoodReactionPoint(rq.getLoginedMemberId(), relTypeCode, relId);
            int goodRP = articleService.getGoodRP(relId);
            int badRP = articleService.getBadRP(relId);
            return ResultData.from("S-1", "좋아요 취소", "goodRP", goodRP, "badRP", badRP);
        }
        // 사용자가 싫어요를 눌렀을 경우, 싫어요 취소하고 좋아요 추가
        else if (usersReaction == -1) {
            reactionPointService.deleteBadReactionPoint(rq.getLoginedMemberId(), relTypeCode, relId);
            reactionPointService.addGoodReactionPoint(rq.getLoginedMemberId(), relTypeCode, relId);
            int goodRP = articleService.getGoodRP(relId);
            int badRP = articleService.getBadRP(relId);
            return ResultData.from("S-2", "싫어요 취소 후 좋아요 추가", "goodRP", goodRP, "badRP", badRP);
        }

        // 반응 추가가 실패한 경우 처리
        ResultData reactionRd = reactionPointService.addGoodReactionPoint(rq.getLoginedMemberId(), relTypeCode, relId);
        if (reactionRd.isFail()) {
            return ResultData.from(reactionRd.getResultCode(), reactionRd.getMsg());
        }

        // 성공 시 반응 포인트 반환
        int goodRP = articleService.getGoodRP(relId);
        int badRP = articleService.getBadRP(relId);
        return ResultData.from(reactionRd.getResultCode(), reactionRd.getMsg(), "goodRP", goodRP, "badRP", badRP);
    }

    // 싫어요 반응 처리 메서드
    @RequestMapping("/usr/reactionPoint/doBadReaction")
    @ResponseBody
    public ResultData doBadReaction(String relTypeCode, int relId, String replaceUri) {

        // 사용자가 이미 반응한 상태 확인
        ResultData usersReactionRd = reactionPointService.usersReaction(rq.getLoginedMemberId(), relTypeCode, relId);
        int usersReaction = (int) usersReactionRd.getData1();

        // 사용자가 이미 싫어요를 눌렀을 경우, 싫어요 취소
        if (usersReaction == -1) {
            reactionPointService.deleteBadReactionPoint(rq.getLoginedMemberId(), relTypeCode, relId);
            int goodRP = articleService.getGoodRP(relId);
            int badRP = articleService.getBadRP(relId);
            return ResultData.from("S-1", "싫어요 취소", "goodRP", goodRP, "badRP", badRP);
        }
        // 사용자가 좋아요를 눌렀을 경우, 좋아요 취소하고 싫어요 추가
        else if (usersReaction == 1) {
            reactionPointService.deleteGoodReactionPoint(rq.getLoginedMemberId(), relTypeCode, relId);
            reactionPointService.addBadReactionPoint(rq.getLoginedMemberId(), relTypeCode, relId);
            int goodRP = articleService.getGoodRP(relId);
            int badRP = articleService.getBadRP(relId);
            return ResultData.from("S-2", "좋아요 취소 후 싫어요 추가", "goodRP", goodRP, "badRP", badRP);
        }

        // 반응 추가가 실패한 경우 처리
        ResultData reactionRd = reactionPointService.addBadReactionPoint(rq.getLoginedMemberId(), relTypeCode, relId);
        if (reactionRd.isFail()) {
            return ResultData.from(reactionRd.getResultCode(), reactionRd.getMsg());
        }

        // 성공 시 반응 포인트 반환
        int goodRP = articleService.getGoodRP(relId);
        int badRP = articleService.getBadRP(relId);
        return ResultData.from(reactionRd.getResultCode(), reactionRd.getMsg(), "goodRP", goodRP, "badRP", badRP);
    }
}